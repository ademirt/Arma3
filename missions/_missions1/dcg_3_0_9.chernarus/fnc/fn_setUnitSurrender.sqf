/*
Author: SENSEI

Last modified: 9/27/2015

Description: set unit in surrender stance

Return: nothing
__________________________________________________________________*/
private ["_obj","_driver"];

_obj = param [0,objNull,[objNull]];

if (typeOf _obj isKindOf "Air") exitWith {["Object is type AIR. Can't surrender."] call SEN_fnc_log;};

if (typeOf _obj isKindOf "LandVehicle" || {typeOf _obj isKindOf "Ship"}) exitWith {
	if (typeOf _obj isKindOf "StaticWeapon") then {
		{
			moveOut _x;
			[_x,true] call ace_captives_fnc_setSurrendered;
			["%1 surrenders.",typeOf _x] call SEN_fnc_log;
		} forEach (crew _obj);
	} else {
		_driver = driver _obj;
		_driver setVariable ["SEN_patrol_exit",true];
		_obj limitSpeed 0;
		group _driver leaveVehicle _obj;
		{
			doStop _x;
			[_x,true] call ace_captives_fnc_setSurrendered;
			["%1 surrenders.",typeOf _x] call SEN_fnc_log;
		} forEach units (group _driver);
	};
};

_obj setVariable ["SEN_patrol_exit",true];
doStop _obj;
[_obj,true] call ace_captives_fnc_setSurrendered;
["%1 surrenders.",typeOf _obj] call SEN_fnc_log;