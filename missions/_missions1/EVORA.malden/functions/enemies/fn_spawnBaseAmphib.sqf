scriptName "EVOR_fnc_spawnBaseAmphib";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objDiff	= _objActive select 4;
private _nAmphibGrp	= param [1,0,[0]];
private _nAmphibVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nAmphibGrp isEqualTo 0) or {_nAmphibVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf	= _objUnits select 0;
private _classesVeh	= _objUnits select 8;

if ((_classesInf isEqualTo []) or {_classesVeh isEqualTo []}) exitWith {[_allUnits,_allVehs];};

private _mainBaseMarker = EVOR_list_BaseCore select 0 select 0;
private ["_group","_spawnPos","_veh","_WP"];
for "_i" from 1 to _nAmphibGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_mainBaseMarker,[1250,1500],[45,135],2] call EVOR_fnc_findRandPos;
	for "_i" from 1 to _nAmphibVeh do {
		_veh = createVehicle [selectRandom _classesVeh,_spawnPos,[],30,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		_allUnits append ([_veh,_group,_classesInf,1] call EVOR_fnc_createVehicleCargo);
		_veh setUnloadInCombat [true,true];
		
		sleep 0.5;
	};
	
	_group selectLeader (units _group select {driver vehicle _x != _x} select 0);
	
	// Add waypoints to make group do something (In this case patrol loop around random positions)
	{deleteWaypoint _x;} forEach waypoints _group;
	_WP = _group addWayPoint [[_mainBaseMarker,50,200,10] call EVOR_fnc_findClosestWater,20];
	_WP setWaypointFormation "LINE";
	_WP setWaypointBehaviour "COMBAT";
	_WP setWaypointCombatMode "RED";
	_WP setWaypointSpeed "FULL";
	_WP setWaypointCompletionRadius 50;
	_WP setWayPointType "UNLOAD";
	
	_WP = _group addWayPoint [[waypointPosition _WP,50] call EVOR_fnc_findRandPos,0];
	_WP setWaypointFormation "DIAMOND";
	_WP setWaypointBehaviour "UNCHANGED";
	_WP setWaypointCombatMode "NO CHANGE";
	_WP setWaypointSpeed "UNCHANGED";
	_WP setWaypointCompletionRadius 30;
	_WP setWayPointType "HOLD";
	
	sleep 0.5;
};

[[EVOR_var_SideFriendly,"HQ"],format ["The enemy is mounting an amphibious attack on our MOB; prepare to fend them off!",markerText _mainBaseMarker]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];