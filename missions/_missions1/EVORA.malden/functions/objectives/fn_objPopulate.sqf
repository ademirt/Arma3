scriptName "EVOR_fnc_objPopulate";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objRT		= param [1,objNull,[objNull]];
private _objFlags	= _objActive param [3,0,[0]];
private _objDiff	= _objActive param [4,0,[0]];

// These equations determine how full the objective will be initially
private _nFriendlyUnit		= EVOR_var_SideFriendly countSide allPlayers;
private _nFriendlyUnitMax	= 1 max playableSlotsNumber EVOR_var_SideFriendly;
private _nEnemyUnitMax		= EVOR_var_EnemyUnitMin + (EVOR_var_EnemyUnitMax-EVOR_var_EnemyUnitMin)*_nFriendlyUnit/_nFriendlyUnitMax;
private _nAAGrp				= [3,4] select (_objDiff > 1);
private _nTurGrp			= [2,5] select (_objDiff > 1);
private _nMotGrp			= [4+_objDiff,0] select ([_objFlags,2+4] call BIS_fnc_bitflagsCheck);
private _nBoatGrp			= [0,2] select ([_objFlags,2] call BIS_fnc_bitflagsCheck);
private _nInfGrp			= (round ((_nEnemyUnitMax-_nTurGrp-3*_nMotGrp-6*_nBoatGrp-6*_nAAGrp)/6)) max 2;
private _nMineField			= 6+2*_objDiff;

// Populate the objective with groups
[_objActive,_nAAGrp,4] call EVOR_fnc_spawnObjAA;
[_objActive,_nTurGrp,1] call EVOR_fnc_spawnObjTur;
[_objActive,_nMotGrp,1] call EVOR_fnc_spawnObjMot;
[_objActive,_nBoatGrp,2] call EVOR_fnc_spawnObjBoat;
[_objActive,_nInfGrp,6] call EVOR_fnc_spawnObjInf;
[_objActive,_nMineField,10] call EVOR_fnc_spawnObjMines;

// Reinforcement loop
sleep random EVOR_var_EnemyReinfSleep;
private _unitsBaseAttack = [];
private _unitsBaseMortar = [];
private ["_cases","_nEnemyUnit","_nEnemyAir","_nEnemyAirMax"];
while {alive _objRT} do {
	_cases = [];
	_nFriendlyUnit		= EVOR_var_SideFriendly countSide allPlayers;
	_nFriendlyUnitMax	= 1 max playableSlotsNumber EVOR_var_SideFriendly;
	_nEnemyUnit			= EVOR_var_SideEnemy countSide allUnits;
	_nEnemyUnitMax		= EVOR_var_EnemyUnitMin + (EVOR_var_EnemyUnitMax-EVOR_var_EnemyUnitMin)*_nFriendlyUnit/_nFriendlyUnitMax;
	_nEnemyAir			= EVOR_var_SideEnemy countSide (entities "Air");
	_nEnemyAirMax		= ceil (EVOR_var_EnemyCapPP*_nFriendlyUnit);
	
	// Select which kinds of reinforcements are available
	private _base		= EVOR_list_BaseCore select 0;
	private _basePos	= getMarkerPos (_base param [0,"",[""]]);
	private _baseRadius	= _base param [1,0,[0]];
	private _baseFlags	= _base param [4,0,[0]];
	if ((_nEnemyAir < _nEnemyAirMax) and {random 1 < EVOR_var_EnemyCapChance}) then {_cases append ["CAP","CAP"];};
	if (_nEnemyUnit < _nEnemyUnitMax) then {
		// Objective Reinforcements
		_cases append ["ObjPara","ObjPara"];
		if (!([_objFlags,6] call BIS_fnc_bitflagsCheck)) then {_cases append ["ObjReinf","ObjReinf"];};
		if ([_objFlags,2] call BIS_fnc_bitflagsCheck) then {_cases pushBack "ObjBoat";};
		
		// Base attacks
		if (_unitsBaseMortar findIf {(alive _x) and {(vehicle _x) isKindOf "StaticMortar"}} < 0) then {
			if ([_baseFlags,1] call BIS_fnc_bitflagsCheck) then {_cases pushBack "BaseMort";};
		};
		if (_unitsBaseAttack findIf {(alive _x) and {_x distance _basePos < 10*_baseRadius}} < 0) then {
			if ([_baseFlags,2] call BIS_fnc_bitflagsCheck) then {_cases pushBack "BaseInf";};
			if ([_baseFlags,4] call BIS_fnc_bitflagsCheck) then {_cases pushBack "BaseVeh";};
			if ([_baseFlags,8] call BIS_fnc_bitflagsCheck) then {_cases pushBack "BaseBoat";};
		};
	};
	
	// Create reinforcements
	if (!(_cases isEqualTo [])) then {
		switch (selectRandom _cases) do {
			case "CAP":			{[_objActive,1,1] call EVOR_fnc_spawnAirpatrol;};
			case "ObjReinf":	{[_objActive,1,3] call EVOR_fnc_spawnObjReinf;};
			case "ObjBoat":		{[_objActive,1,2] call EVOR_fnc_spawnObjBoat;};
			case "ObjPara":		{[_objActive,1,1] call EVOR_fnc_spawnObjPara;};
			case "BaseVeh":		{_unitsBaseAttack = ([_objActive,1,3] call EVOR_fnc_spawnBaseVeh) select 0;};
			case "BaseInf":		{_unitsBaseAttack = ([_objActive,4,6] call EVOR_fnc_spawnBaseInf) select 0;};
			case "BaseBoat":	{_unitsBaseAttack = ([_objActive,3,1] call EVOR_fnc_spawnBaseAmphib) select 0;};
			case "BaseMort":	{_unitsBaseMortar = ([_objActive,1,2,3,6] call EVOR_fnc_spawnBaseMortar) select 0;};
			default {};
		};
	};
	
	sleep random EVOR_var_EnemyReinfSleep;
};