/*
Author: SENSEI

Last modified: 10/3/2015

Description: finds an interior house position outside a town

Return: array
__________________________________________________________________*/
#include "..\data\define.hpp"

private ["_center","_range","_counter","_s","_return","_startPos","_houseArray"];

_center = _this select 0;
_range = _this select 1;
_counter = 200;

for "_s" from 0 to _counter do {
	_return = [0,0,0];
	_startPos = [_center,0,_range] call SEN_fnc_findRandomPos;
	{
		if (_startPos distance _x < GET_SPAWNDIST) exitWith {_return = [];};
	} count (SEN_occupiedLocation + SEN_whitelistLocation);

	if !(_return isEqualTo []) then {
		_houseArray = [_startPos,500] call SEN_fnc_findHousePos;
		if ((_houseArray select 1) isEqualTo []) exitWith {_return = [];};
		if ((_houseArray select 1) distance2D (getMarkerPos "SEN_safezone_mrk") <= ((getMarkerSize "SEN_safezone_mrk") select 0)) exitWith {_return = [];};
		_return = _houseArray;
	};

	if (count _return isEqualTo 2) exitWith {};
	if (_s isEqualTo _counter) exitWith {
		["Cannot find a suitable rural house position."] call SEN_fnc_log;
		_return = [objNull,[]];
	};
};

_return