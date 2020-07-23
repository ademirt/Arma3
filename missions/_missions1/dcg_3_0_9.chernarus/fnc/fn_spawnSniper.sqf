/*
Author: SENSEI

Last modified: 8/19/2015

Description: spawn sniper

Return: array
__________________________________________________________________*/
#include "..\data\define.hpp"

private ["_pos","_count","_min","_max","_side","_uncache","_return","_sniper","_spotter","_overwatch","_ref1","_ref2","_overwatchHeight","_overwatchASL","_grp","_unit","_mrk"];

_pos = param [0,[0,0,0],[[]]];
_count = param [1,1,[0]];
_min = param [2,100,[0]];
_max = param [3,1100,[0]];
_side = param [4,SEN_enemySide];
_uncache = param [5,false];
_return = [];

call {
	if (_side isEqualTo EAST) exitWith {_sniper = (SEN_sniperPool select floor (random (count SEN_sniperPool)))};
	if (_side isEqualTo WEST) exitWith {_sniper = (SEN_sniperPoolWest select floor (random (count SEN_sniperPoolWest)))};
	_sniper = (SEN_sniperPool select floor (random (count SEN_sniperPool)));
};

for "_i" from 1 to _count do {
	_overwatch = [_pos,_min,_max] call SEN_fnc_findOverwatchPos;
	if !(_overwatch isEqualTo []) then {
		_grp = createGroup _side;
		_overwatch set [2,0];
		_unit = _grp createUnit [_sniper, _overwatch, [], 0, "NONE"];
		_unit setUnitPos "DOWN";
		_unit setskill ["spotDistance",0.97];
		units _grp doWatch _pos;
		_return pushBack _grp;
		_grp setBehaviour "COMBAT";

		if (_uncache) then {_grp setVariable ["zbe_cacheDisabled", true, true]};

		if(GET_DEBUG) then {
			_mrk = createMarker [format["SEN_sniper_%1_%2",_grp,_i],getposATL leader _grp];
			_mrk setMarkerType "mil_dot";
			_mrk setMarkerColor "ColorEAST";
			_mrk setMarkerText "SNIPER";
		};
	};
};

if !(count _return isEqualTo _count) then {["Snipers did not reach count."] call SEN_fnc_log};

_return