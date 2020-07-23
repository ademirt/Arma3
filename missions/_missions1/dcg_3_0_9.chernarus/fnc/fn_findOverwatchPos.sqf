/*
Author: SENSEI

Last modified: 8/19/2015

Description: find overwatch position

Note: _pos must be positionASL

Return: array
__________________________________________________________________*/
private ["_pos","_min","_max","_height","_counter","_check","_overwatch"];

_pos = param [0,[0,0,0],[[]]];
_min = param [1,200,[0]];
_max = param [2,1000,[0]];
_height = param [3,70,[0]];
_counter = 1000;

for "_i" from 1 to _counter do {
	_check = false;
	_overwatch = [_pos,_min,_max,[],"B_Soldier_F"] call SEN_fnc_findRandomPos;
	if !(_overwatch isEqualTo []) then {
		_overwatch = ATLToASL _overwatch;
		if ((_overwatch select 2) - (_pos select 2) >= _height) then {
			if !(terrainIntersectASL [_overwatch, _pos]) then {_check = true};
		};
	};
	if (_check) exitWith {};
	if (_i isEqualTo _counter) exitWith {_overwatch = []};
};

_overwatch