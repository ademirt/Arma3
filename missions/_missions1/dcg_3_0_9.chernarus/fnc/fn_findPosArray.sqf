/*
Author: SENSEI

Last modified: 10/4/2015

Description: finds array of positions that are a minimum distance away from eachother
			 if the specified amount of positions are not found within a certain number of iterations, an empty array is returned

Note: this function works best in low density areas

Return: position
__________________________________________________________________*/
private ["_center","_range","_minDist","_count","_ifRoad","_posArray","_counter","_check","_roads","_pos","_posCheck"];

_center = param [0,[],[[]]];
_range = param [1,100,[0]];
_minDist = param [2,0,[0]];
_count = param [3,1,[0]];
_ifRoad = param [4,false];
_posCheck = param [5,"B_Soldier_F",[""]];

_posArray = [];
_counter = 300;

if (_minDist >= _range) then {_minDist = ((_range*0.25)/(_count*2))};

for "_s" from 0 to _counter do {
	_check = true;

	if (_ifRoad) then {
		_range = _range min 1000;
		_roads = _center nearRoads _range;
		_pos = getposATL (_roads select floor (random (count _roads)));

		if !(_posArray isEqualTo []) then {
			{if (_x distance _pos < _minDist) exitWith { _check = false; }} forEach _posArray;
		};
	} else {
		_pos = [_center,0,_range,[],_posCheck] call SEN_fnc_findRandomPos;
		if !(_pos isEqualTo []) then {
			if !((_pos nearRoads 12) isEqualTo []) exitWith { _check = false };
			if !(_posArray isEqualTo []) then {
				{if (_x distance _pos < _minDist) exitWith { _check = false; }} forEach _posArray;
			};
		} else {
			_check = false;
		};
	};

	if (_check) then {_posArray pushBack _pos};
	if (count _posArray isEqualTo _count) exitWith {};

	if (_s isEqualTo _counter) then {
		_posArray = [];
		["Cannot find position array. Consider decreasing minimum distance or count arguments."] call SEN_fnc_log;
	};
};

_posArray