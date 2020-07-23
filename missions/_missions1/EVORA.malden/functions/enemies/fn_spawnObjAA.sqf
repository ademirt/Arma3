scriptName "EVOR_fnc_spawnObjAA";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.6,0.95] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nAAGrp		= param [1,0,[0]];
private _nAAUnit	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if (_nAAGrp isEqualTo 0) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf = _objUnits select 0;
private _classesVeh	= _objUnits select 4;

if ((_classesInf isEqualTo []) or {_classesVeh isEqualTo []}) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_veh","_unit"];
for "_i" from 1 to _nAAGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_objPos,_ptrlRadius,[360*(_i-1)/_nAAGrp,360*_i/_nAAGrp],0,5] call EVOR_fnc_findRandPos;

	_veh = createVehicle [selectRandom _classesVeh,_spawnPos,[],0,"NONE"];
	[_veh] call EVOR_fnc_initVeh;
	_veh setDir (_objPos getDir _veh);
	_allVehs pushBack _veh;
	_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
	(driver _veh) disableAI "move";
	_veh engineOn true;
	
	sleep 0.5;
	
	for "_i" from 1 to (round random ([2/3,1,3/2] vectorMultiply _nAAUnit)) do {
		_unit = _group createUnit [selectRandom _classesInf,[0,0,0],[],0,"FORM"];
		_unit setPos _spawnPos;
		_allUnits pushBack _unit;
		
		sleep 0.5;
	};
	
	// Add waypoints to group (hold at leader pos)
	{deleteWaypoint _x;} forEach waypoints _group;
	(_group addWayPoint [getPos leader _group,0]) setWayPointType "HOLD";
	
	sleep 0.5;
};

[_allUnits,_objDiff] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];