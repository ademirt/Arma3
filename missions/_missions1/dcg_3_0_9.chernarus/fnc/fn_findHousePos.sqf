/*
Author: SENSEI

Last modified: 7/22/2015

Description: finds an interior house position

Return: array
__________________________________________________________________*/
private ["_center","_range","_pos","_return","_houseArray","_house","_housePosArray","_dummypad"];

_center = param [0,[0,0,0]];
_range = param [1,100,[0]];
_pos = [];
_return = [];

_houseArray = _center nearObjects ["House",_range];
if !(_houseArray isEqualTo []) then {
	_house = _houseArray select floor (random (count _houseArray));
	_housePosArray = [_house] call bis_fnc_buildingPositions;

	if !(count _housePosArray isEqualTo 0) then {
		{
			_dummypad = createVehicle ["Land_HelipadEmpty_F", _x, [], 0, "CAN_COLLIDE"];
			if !(count(lineIntersectsObjs [(getposASL _dummypad), [(getposASL _dummypad select 0),(getposASL _dummypad select 1),((getposASL _dummypad select 2) + 20)]]) isEqualTo 0) exitWith {
				_pos = _x;
				deleteVehicle _dummypad;
			};
			deleteVehicle _dummypad;
		} foreach _housePosArray;
	};
};

if !(_pos isEqualTo []) exitWith {
	_return = [_house,_pos];
	_return
};

["Cannot find a suitable house position."] call SEN_fnc_log;
_return = [objNull,[]];
_return