scriptName "EVOR_fnc_spawnObjTur";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.4,0.7] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nTurGrp	= param [1,0,[0]];
private _nTurVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nTurGrp isEqualTo 0) or {_nTurVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesTur	= _objUnits select 1;

if (_classesTur isEqualTo []) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_veh"];
for "_i" from 1 to _nTurGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_objPos,_ptrlRadius,[360*(_i-1)/_nTurGrp,360*_i/_nTurGrp],0,5] call EVOR_fnc_findRandPos;
	for "_i" from 1 to _nTurVeh do {
		_veh = createVehicle [selectRandom _classesTur,_spawnPos,[],5,"NONE"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_veh setDir (_objPos getDir _veh);
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		
		sleep 0.5;
	};
	
	sleep 0.5;
};

[_allUnits,3] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];