/*
Author: SENSEI

Last modified: 9/24/2015

Description: spawn static emplacements

Return: group
__________________________________________________________________*/
#include "..\data\define.hpp"

private ["_pos","_range","_count","_type","_side","_gunnerArray","_posArray","_counter","_unit","_static1","_static2","_static3","_random","_roads","_s","_road","_roadConnectedTo","_dir","_staticPos","_check","_static","_grp","_gunner","_bunker","_fort","_fortPos","_mrk"];

_pos = param [0,[0,0,0],[[]]];
_range = param [1,100,[0]];
_count = param [2,1,[0]];
_type = param [3,-1,[0]];
_side = param [4,SEN_enemySide];

_gunnerArray = [];
_posArray = [];
_counter = 50;

call {
	if (_side isEqualTo EAST) exitWith {
		_unit = SEN_unitPool select floor (random (count SEN_unitPool));
		_static1 = "O_GMG_01_high_F";
		_static2 = "O_HMG_01_high_F";
		_static3 = "O_Mortar_01_F";
	};
	if (_side isEqualTo WEST) exitWith {
		_unit = SEN_unitPoolWest select floor (random (count SEN_unitPoolWest));
		_static1 = "B_GMG_01_high_F";
		_static2 = "B_HMG_01_high_F";
		_static3 = "B_Mortar_01_F";
	};
	if (_side isEqualTo CIVILIAN) exitWith {
		_unit = SEN_unitPoolCiv select floor (random (count SEN_unitPoolCiv));
		_static1 = "B_GMG_01_high_F";
		_static2 = "B_HMG_01_high_F";
		_static3 = "B_Mortar_01_F";
	};
	_unit = SEN_unitPool select floor (random (count SEN_unitPool));
	_static1 = "I_GMG_01_high_F";
	_static2 = "I_HMG_01_high_F";
	_static3 = "I_Mortar_01_F";
};

_random = if (_type isEqualTo -1) then {true} else {false};

for "_s" from 0 to _counter do {
	call {
		if (_random) then {_type = ceil random 2};

		// disable open static, unit is near invincible while occupying weapon
/*		if (_type isEqualTo 1) exitWith { // open static
			_roads = _pos nearRoads _range;
			if (_roads isEqualTo []) exitWith {};
			_road = _roads select floor (random (count _roads));
			_roadConnectedTo = (roadsConnectedTo _road);
			if (_roadConnectedTo isEqualTo []) exitWith {};
			_roadConnectedTo = _roadConnectedTo select 0;
			_dir = [_road, _roadConnectedTo] call BIS_fnc_DirTo;
			_staticPos = _road modelToWorld [-8,0,0];
			_staticPos set [2,0];
			_check = _staticPos isFlatEmpty [2, 0, 0.4, 2, 0, false, objNull];

			if !(_posArray isEqualTo []) then { { if (_x distance _staticPos < 20) exitWith {_check = []}} forEach _posArray};
			if (_check isEqualTo [] || {isOnRoad _staticPos}) exitWith {};

			_posArray pushBack _staticPos;
			_static = _static1 createVehicle [0,0,0];
			_static setPos _staticPos;
			_static setVectorUp surfaceNormal position _static;

			if (count (lineIntersectsObjs [[(getposasl _static) select 0,(getposasl _static) select 1,((getposasl _static) select 2) + 0.5], ATLToASL(_static modelToWorld [0,30,0.5])]) > 0) exitWith {deleteVehicle _static};

			_grp = createGroup _side;
			_gunner = _grp createUnit [_unit, [0,0,0], [], 0, "NONE"];
			_gunner moveInGunner _static;
			_gunner setBehaviour "COMBAT";
			_gunner setFormDir _dir + 180;
			_gunner setDir _dir + 180;
			_gunnerArray pushBack _gunner;
		};*/
		if (_type isEqualTo 1) exitWith { // bunkered static
			_roads = _pos nearRoads _range;
			if (_roads isEqualTo []) exitWith {};
			_road = _roads select floor (random (count _roads));
			_roadConnectedTo = (roadsConnectedTo _road);
			if (_roadConnectedTo isEqualTo []) exitWith {};
			_roadConnectedTo = _roadConnectedTo select 0;
			_dir = [_road, _roadConnectedTo] call BIS_fnc_DirTo;
			_staticPos = _road modelToWorld [-11,0,0];
			_staticPos set [2,0];
			_check = _staticPos isFlatEmpty [2, 0, 0.4, 3, 0, false, objNull];

			if !(_posArray isEqualTo []) then { { if (_x distance _staticPos < 20) exitWith {_check = []}} forEach _posArray};
			if (_check isEqualTo [] || {isOnRoad _staticPos}) exitWith {};

			_staticPos set [2,-0.02];
			_posArray pushBack _staticPos;
			_bunker = "Land_BagBunker_Small_F" createVehicle _staticPos;
			_bunker setDir (_dir) + 180;
			_bunker setVectorUp surfaceNormal position _bunker;

			if (count (lineIntersectsObjs [[(getposasl _bunker) select 0,(getposasl _bunker) select 1,((getposasl _bunker) select 2) + 1], ATLToASL(_bunker modelToWorld [0,30,1])]) > 0) exitWith {deleteVehicle _bunker};

			_static = createVehicle [_static2,[0,0,0], [], 0, "CAN COLLIDE"];
			_static setPosATL (_bunker modelToWorld [0,0,-0.8]);

			_grp = createGroup _side;
			_gunner = _grp createUnit [_unit, [0,0,0], [], 0, "NONE"];
			_gunner moveInGunner _static;
			_gunner setBehaviour "COMBAT";
			_gunner doWatch (_bunker modelToWorld [0,-40,1]);
			_gunnerArray pushBack _gunner;
		};
		 // mortar
		_staticPos = [_pos,0,_range,[],_static1] call SEN_fnc_findRandomPos;
		if (_staticPos isEqualTo []) exitWith {};
		if !(_posArray isEqualTo []) then { { if (_x distance _staticPos < 20) exitWith {_check = []}} forEach _posArray};
		if (isOnRoad _staticPos) exitWith {};
		_posArray pushBack _staticPos;
		_static = _static3 createVehicle _staticPos;

		_fort = "Land_BagFence_Round_F" createVehicle [0,0,0];
		_fortPos = (_static modelToWorld [0,2.3,0]);
		_fortPos set [2,0];
		_fort setPosATL _fortPos;
		_fort setDir ([_fort, _static] call BIS_fnc_DirTo);
		_fort setVectorUp surfaceNormal position _fort;
		_fort = "Land_BagFence_Round_F" createVehicle [0,0,0];
		_fortPos = (_static modelToWorld [0,-2.3,0]);
		_fortPos set [2,0];
		_fort setPosATL _fortPos;
		_fort setDir ([_fort, _static] call BIS_fnc_DirTo);
		_fort setVectorUp surfaceNormal position _fort;
		_fort = "Land_BagFence_Round_F" createVehicle [0,0,0];
		_fortPos = (_static modelToWorld [-2.3,0,0]);
		_fortPos set [2,0];
		_fort setPosATL _fortPos;
		_fort setDir ([_fort, _static] call BIS_fnc_DirTo);
		_fort setVectorUp surfaceNormal position _fort;

		_grp = createGroup _side;
		_gunner = _grp createUnit [_unit, [0,0,0], [], 0, "NONE"];
		_gunner moveInGunner _static;
		_gunner setBehaviour "COMBAT";
		_gunnerArray pushBack _gunner;
	};

	if (count _gunnerArray isEqualTo _count) exitWith {};
};

if !(count _gunnerArray isEqualTo _count) then {["Static array does not equal passed count."] call SEN_fnc_log};

if(GET_DEBUG && {!(_gunnerArray isEqualTo [])}) then {
	{
		_mrk = createMarker [format["SEN_static_%1_%2",_x,getposATL _x],getposATL _x];
		_mrk setMarkerType "mil_dot";
		_mrk setMarkerColor "ColorEAST";
		_mrk setMarkerText "STATIC";
	} forEach _gunnerArray;
};

_gunnerArray