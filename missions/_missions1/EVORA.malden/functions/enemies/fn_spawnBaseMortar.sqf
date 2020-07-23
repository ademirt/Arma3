scriptName "EVOR_fnc_spawnBaseMortar";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objDiff	= _objActive select 4;
private _nMortGrp	= param [1,0,[0]];
private _nMortVeh	= param [2,0,[0]];
private _nMortMort	= param [3,0,[0]];
private _nMortUnit	= param [4,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nMortGrp isEqualTo 0) or {_nMortMort isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf	= _objUnits select 0;
private _classesTur = (_objUnits select 1) select {_x isKindOf "StaticMortar"};
private _classesVeh	= _objUnits select 2;

if ((_classesInf isEqualTo []) or {(_classesTur isEqualTo []) or {_classesVeh isEqualTo []}}) exitWith {[_allUnits,_allVehs];};

private _mainBaseMarker = EVOR_list_BaseCore select 0 select 0;
private ["_group","_spawnPos","_veh","_unit"];
for "_i" from 1 to _nMortGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_mainBaseMarker,[800,2500],[130,360],0,10] call EVOR_fnc_findRandPos;
	
	for "_i" from 1 to _nMortVeh do {
		_veh = createVehicle [selectRandom _classesVeh,_spawnPos,[],10,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		
		sleep 0.5;
	};
	
	for "_i" from 1 to _nMortMort do {
		_veh = createVehicle [selectRandom _classesTur,_spawnPos,[],20,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		
		sleep 0.5;
	};
	
	for "_i" from 1 to (round random ([2/3,1,3/2] vectorMultiply _nMortUnit)) do {
		_unit = _group createUnit [selectRandom _classesInf,[0,0,0],[],0,"NONE"];
		_allUnits pushBack _unit;
		_unit setPos _spawnPos;
		
		sleep 0.5;
	};
	
	// Add waypoints to group (hold at leader pos)
	{deleteWaypoint _x;} forEach waypoints _group;
	(_group addWayPoint [getPos leader _group,0]) setWayPointType "HOLD";
	
	// Make mortars fire at base
	[_group] spawn EVOR_fnc_attackBaseMortar;
	
	sleep 0.5;
};

[[EVOR_var_SideFriendly,"HQ"],format ["Enemy forces are setting up mortars near %1; take out that position!",markerText _mainBaseMarker]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];