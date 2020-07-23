/*
Author: SENSEI

Last modified: 9/7/2015

Description: spawns group

Return: group or array
__________________________________________________________________*/
private ["_pos","_type","_count","_side","_uncache","_grp","_driverArray","_unitPool","_vehPool","_airPool","_veh","_unit"];

_pos = param [0,[0,0,0],[[]]];
_type = param [1,0,[0]];
_count = param [2,1,[0]];
_side = param [3,SEN_enemySide];
_uncache = param [4,false];

_grp = createGroup _side;
_grp allowfleeing 0;
_driverArray = [];

call {
	if (_side isEqualTo WEST) exitWith {
		_unitPool = SEN_unitPoolWest;
		_vehPool = SEN_vehPoolWest;
		_airPool = SEN_airPoolWest;
	};
	if (_side isEqualTo CIVILIAN) exitWith {
		_unitPool = SEN_unitPoolCiv;
		_vehPool = SEN_vehPoolCiv;
		_airPool = SEN_airPoolCiv
	};

	_unitPool = SEN_unitPool;
	_vehPool = SEN_vehPool;
	_airPool = SEN_airPool;
};

for "_j" from 0 to (_count - 1) do {
	call {
		if (_type isEqualTo 0) exitWith {
			(_unitPool select floor (random (count _unitPool))) createUnit [_pos, _grp];
		};

		if (_type isEqualTo 2) then {
			_veh = createVehicle [(_airPool select floor (random (count _airPool))), _pos, [], 0, "FLY"];
		} else {
			_veh = (_vehPool select floor (random (count _vehPool))) createVehicle _pos;
		};

		_unit = _grp createUnit [(_unitPool select floor (random (count _unitPool))), _pos, [], 0, "NONE"];
		_unit moveInDriver _veh;
		_driverArray pushBack _unit;

		if !((_veh emptyPositions "gunner") isEqualTo 0) then {
			_unit = _grp createUnit [(_unitPool select floor (random (count _unitPool))), _pos, [], 0, "NONE"];
			_unit moveInGunner _veh;
		};

		if !((_veh emptyPositions "cargo") isEqualTo 0) then {
			for "_i" from 1 to ((_veh emptyPositions "cargo") min 4) do { // limit to five units in cargo for performance
				_unit = _grp createUnit [(_unitPool select floor (random (count _unitPool))), _pos, [], 0, "NONE"];
				_unit moveInCargo _veh;
			};
		};
	};
};

if (_uncache) then {_grp setVariable ["zbe_cacheDisabled", true, true]};
if (_type isEqualTo 0) exitWith {_grp};

_driverArray