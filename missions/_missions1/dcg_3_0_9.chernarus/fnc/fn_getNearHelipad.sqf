/*
Author: SENSEI

Last modified: 10/3/2015

Description: gets nearest helipad

Return: array
__________________________________________________________________*/
params ["_pos",["_range",100],["_size",10]];

_helipad = (nearestObjects [_pos, ["Land_HelipadCircle_F","Land_HelipadCivil_F","Land_HelipadEmpty_F","Land_HelipadRescue_F","Land_HelipadSquare_F","Land_JumpTarget_F"], _range]) select 0;

if !(isNil "_helipad") then {
	_isEmpty = (getPosATL _helipad) isFlatEmpty [_size, 0, 0.6, _size, 0, false, _helipad];
	if !(_isEmpty isEqualTo []) then {
		_pos = getPosATL _helipad;
	};
} else {
	_pos = [];
};

_pos