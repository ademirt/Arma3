/*
Author: SENSEI

Last modified: 9/20/2015

Description: spawns civilians

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_vehArray","_driverArray","_vehgrp","_roads","_veh","_unit","_grp","_unitArray","_targets"];

params ["_pos","_unitCount","_vehCount","_townName","_dist"];

missionNamespace setVariable [format["SEN_%1_civ",_townName],true];
_vehArray = [];
_driverArray = [];
_unitArray = [];
_vehgrp = createGroup CIVILIAN;
_grp = createGroup CIVILIAN;
_roads = _pos nearRoads 50;

[{
	params ["_args","_id"];
	_args params ["_pos","_grp","_unitCount","_unitArray"];

	if (count _unitArray isEqualTo _unitCount) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_grp] call SEN_fnc_setPatrolGroup;
	};
	_unit = _grp createUnit [(SEN_unitPoolCiv select floor (random (count SEN_unitPoolCiv))), _pos, [], 0, "NONE"];
	_unit disableAI "TARGET";
	_unit disableAI "FSM";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "AIMINGERROR";
	_unit disableAI "SUPPRESSION";
	_unit setBehaviour "SAFE";
	_unitArray pushBack _unit;
}, 2, [_pos,_grp,_unitCount,_unitArray]] call CBA_fnc_addPerFrameHandler;

[{
	params ["_args","_id"];
	_args params ["_pos","_roads","_vehgrp","_dist","_vehCount","_vehArray","_driverArray"];

	if (count _driverArray isEqualTo _vehCount) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	private "_vehPos";
	if !(_roads isEqualTo []) then {
		_vehPos = getposATL (_roads select floor (random (count _roads)));
	} else {
		_vehPos = _pos;
	};
	_veh = (SEN_vehPoolCiv select floor (random (count SEN_vehPoolCiv))) createVehicle _vehPos;
	_unit = _vehgrp createUnit [(SEN_unitPoolCiv select floor (random (count SEN_unitPoolCiv))), _vehPos, [], 0, "NONE"];
	_unit moveInDriver _veh;
	_unit disableAI "TARGET";
	_unit disableAI "FSM";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "AIMINGERROR";
	_unit disableAI "SUPPRESSION";
	_unit setBehaviour "SAFE";
	_vehArray pushBack _veh;
	_driverArray pushBack _unit;
	[_unit,_dist*1.5] call SEN_fnc_setPatrolVeh;
}, 2, [_pos,_roads,_vehgrp,_dist,_vehCount,_vehArray,_driverArray]] call CBA_fnc_addPerFrameHandler;

[{

	params ["_args","_id"];
	_args params ["_dist","_unitCount","_vehCount","_unitArray","_driverArray"];

	if (count _unitArray isEqualTo _unitCount && {count _driverArray isEqualTo _vehCount}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		if (GET_APPROVAL(0)) then {
			_unit = ((_unitArray + _driverArray) select floor (random (count (_unitArray + _driverArray))));
			_targets = [getPosATL _unit,_dist+50] call SEN_fnc_getNearPlayers;
			if !(_targets isEqualTo []) then {
				_unit setVariable ["SEN_patrol_exit",true];
				_unit = [[_unit]] call SEN_fnc_setSide;
				_unit = leader _unit;
				[_unit,_targets select floor (random (count _targets)),15] call SEN_fnc_setSuicideBomber;
			};
		};
	};
}, 0.1, [_dist,_unitCount,_vehCount,_unitArray,_driverArray]] call CBA_fnc_addPerFrameHandler;

[{
	params ["_args","_id"];
	_args params ["_pos","_townName","_dist","_unitArray","_vehArray","_driverArray"];

	if ({_x distance _pos < _dist} count allPlayers isEqualTo 0) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		missionNamespace setVariable [format["SEN_%1_civ",_townName],false];
		_unitArray call SEN_fnc_cleanup;
		_vehArray call SEN_fnc_cleanup;
		_driverArray call SEN_fnc_cleanup;
	};
}, 30, [_pos,_townName,_dist,_unitArray,_vehArray,_driverArray]] call CBA_fnc_addPerFrameHandler;