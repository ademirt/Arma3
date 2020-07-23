/*
Author: SENSEI

Last modified: 10/2/2015

Description: update waypoint position PFH

Return: nothing
__________________________________________________________________*/
params ["_grp","_wp","_target",["_interval",30]];

if (typeName _target isEqualTo "ARRAY") exitWith { // if _target is position exit with simple set position
	_wp setWaypointPosition [_target, 0];
};

[{
	params ["_args","_id"];
	_args params ["_grp","_wp","_target"];

	if (isNull _grp) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	_wp setWaypointPosition [getPosATL _target, 0];
}, _interval, [_grp,_wp,_target]] call CBA_fnc_addPerFrameHandler;