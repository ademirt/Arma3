/*
Author: SENSEI

Last modified: 9/22/2015

Description: finds random position from center

Return: array
__________________________________________________________________*/
private ["_center","_min","_max","_dirArray","_emptyCheck","_dir","_dMin","_dMax","_range","_pos"];

_center = param [0,[],[[]]];
_min = param [1,0,[0]];
_max = param [2,100,[0]];
_dirArray = param [3,[],[[]]];
_emptyCheck = param [4,""];

if (_dirArray isEqualTo []) then {
	_dir = random 360
} else {
	_dMin = _dirArray select 1;
	_dMax = _dirArray select 2;
	_dir = (_dMin + random _dMax) min _dMax;
};

_range = floor (random ((_max - _min) + 1)) + _min;
_pos = [(_center select 0) + (sin _dir) * _range, (_center select 1) + (cos _dir) * _range, 0];

if !(_emptyCheck isEqualTo "") then {
	_pos = _pos findEmptyPosition [0,20,_emptyCheck];
};

_pos