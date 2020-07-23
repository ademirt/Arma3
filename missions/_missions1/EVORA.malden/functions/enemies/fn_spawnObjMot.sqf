scriptName "EVOR_fnc_spawnObjVeh";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.2,0.8] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nMotGrp	= param [1,0,[0]];
private _nMotVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nMotGrp isEqualTo 0) or {_nMotVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesVeh	= (_objUnits select 2) + (_objUnits select 3);

if (_classesVeh isEqualTo []) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_veh","_WP"];
for "_i" from 1 to _nMotGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_objPos,_ptrlRadius,360,0,10] call EVOR_fnc_findRandPos;
	for "_i" from 1 to _nMotVeh do {
		_veh = createVehicle [selectRandom _classesVeh,_spawnPos,[],10,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		
		sleep 0.5;
	};
	
	// Add waypoints to group (random 3 point patrol loop)
	{deleteWaypoint _x;} forEach waypoints _group;
	for "_i" from 1 to 3 do {
		_WP = _group addWayPoint [[_objPos,_ptrlRadius,[120*(_i-1),120*_i]] call EVOR_fnc_findRandPos,0];
		_WP setWaypointFormation (["NO CHANGE","COLUMN"] select (_i isEqualTo 1));
		_WP setWaypointBehaviour (["UNCHANGED","AWARE"] select (_i isEqualTo 1));
		_WP setWaypointCombatMode (["NO CHANGE","RED"] select (_i isEqualTo 1));
		_WP setWaypointSpeed (["UNCHANGED","LIMITED"] select (_i isEqualTo 1));
		_WP setWaypointCompletionRadius 30;
		_WP setWaypointType "MOVE";
	};
	(_group addWayPoint [wayPointPosition [_group,0],0]) setWayPointType "CYCLE";
	
	sleep 0.5;
};

[_allUnits,3] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];