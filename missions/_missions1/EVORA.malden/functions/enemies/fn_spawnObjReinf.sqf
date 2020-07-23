scriptName "EVOR_fnc_SpawnObjReinf";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.4,0.7] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nReinfGrp	= param [1,0,[0]];
private _nReinfVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nReinfGrp isEqualTo 0) or {_nReinfVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf	= _objUnits select 0;
private _classesVeh	= (_objUnits select 2) + (_objUnits select 3) + (_objUnits select 4);

if ((_classesInf isEqualTo []) or {_classesVeh isEqualTo []}) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_veh","_WP"];
for "_i" from 1 to _nReinfGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_objPos,[2,3] apply {_x*(_objActive select 2)},360,0,15] call EVOR_fnc_findRandPos;
	for "_i" from 1 to _nReinfVeh do {
		_veh = createVehicle [selectRandom _classesVeh,_spawnPos,[],15,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		_allUnits append ([_veh,_group,_classesInf,0.7] call EVOR_fnc_createVehicleCargo);
		_veh setUnloadInCombat [true,true];
		
		sleep 0.5;
	};
	
	// Add waypoints to make group do something (In this case unload, then patrol loop around random positions)
	{deleteWaypoint _x;} forEach waypoints _group;
	_WP = _group addWaypoint [[_objPos,_ptrlRadius] call EVOR_fnc_findRandPos,0];
	_WP setWaypointFormation "COLUMN";
	_WP setWaypointBehaviour "COMBAT";
	_WP setWaypointCombatMode "RED";
	_WP setWaypointSpeed "LIMITED";
	_WP setWaypointCompletionRadius 30;
	_WP setWayPointType "UNLOAD";
	for "_i" from 1 to 3 do {
		_WP = _group addWayPoint [[_objPos,_ptrlRadius,[120*(_i-1),120*_i]] call EVOR_fnc_findRandPos,0];
		_WP setWaypointFormation (["NO CHANGE","COLUMN"] select (_i isEqualTo 1));
		_WP setWaypointBehaviour (["UNCHANGED","COMBAT"] select (_i isEqualTo 1));
		_WP setWaypointCombatMode (["NO CHANGE","RED"] select (_i isEqualTo 1));
		_WP setWaypointSpeed (["UNCHANGED","LIMITED"] select (_i isEqualTo 1));
		_WP setWaypointCompletionRadius 30;
		_WP setWaypointType "MOVE";
	};
	(_group addWayPoint [wayPointPosition [_group,1],0]) setWayPointType "CYCLE";
	
	sleep 0.5;
};

//[[EVOR_var_SideFriendly,"HQ"],"Reinforcements are heading to the objective!"] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits,_objDiff] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];