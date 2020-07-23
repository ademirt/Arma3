/*
Author: SENSEI

Last modified: 8/5/2014

Description: transfers objects to a requested owner

Return: nothing
__________________________________________________________________*/
if (!isServer) exitWith {};

private ["_obj","_transferTo"];

_obj = _this select 0;
_transferTo = _this select 1;

if (typeName _obj isEqualTo "ARRAY") then {
	{
		_x setOwner _transferTo;
		["Transferring OBJECT: %1 to CLIENT: %2.",_x,_transferTo] call SEN_fnc_log;
	} count _obj;
} else {
	_obj setOwner _transferTo;
	["Transferring OBJECT: %1 to CLIENT: %2.",_obj,_transferTo] call SEN_fnc_log;
};