/*
Author: SENSEI

Last modified: 8/17/2015

Description: spawns tower

Return: array
__________________________________________________________________*/
private ["_pos","_range","_count","_side","_unitArray","_posArray","_type","_tower","_unit"];

_pos = param [0,[0,0,0],[[]]];
_range = param [1,100,[0]];
_count = param [2,1,[0]];
_side = param [3,SEN_enemySide];

_unitArray  = [];
_posArray = [];

call {
	if (_side isEqualTo WEST) exitWith {
		_type = SEN_unitPoolWest select floor (random (count SEN_unitPoolWest));
	};
	if (_side isEqualTo CIVILIAN) exitWith {
		_type = SEN_unitPoolCiv select floor (random (count SEN_unitPoolCiv));
	};
	_type = SEN_unitPool select floor (random (count SEN_unitPool));
};

_posArray = [_pos,_range,(_range*0.3),_count,false,"Land_Cargo_Patrol_V1_F"] call SEN_fnc_findPosArray;

if !(_posArray isEqualTo []) then {
	{
		_tower = "Land_Cargo_Patrol_V1_F" createVehicle [0,0,0];
		_tower setdir random 360;
		_tower setPosATL _x;
		_tower setvectorup [0,0,1];
		_unit = (createGroup _side) createUnit [_type, [0,0,0], [], 0, "NONE"];
		_unit allowfleeing 0;
		_unit setFormDir (getDir _tower);
		_unit setDir (getDir _tower);
		_unit setPosATL (_tower buildingpos 1);
		_unit setUnitPos "UP";
		_unit setSkill ["spotDistance",0.90];
		//_unit disableAI "MOVE";
		_unitArray pushBack _unit;
	 } forEach _posArray;
};

_unitArray