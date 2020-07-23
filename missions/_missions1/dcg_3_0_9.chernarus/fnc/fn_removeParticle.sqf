/*
Author: SENSEI

Last modified: 9/27/2015

Description: removes particles around position

Return: nothing
__________________________________________________________________*/
params ["_pos",["_range",5]];

[[_pos,_range], {
	{
		if (typeOf _x isEqualTo "#particlesource") then {
			deleteVehicle _x;
			["Removing particle %1 at %2.",_x,(_this select 0)] call SEN_fnc_log;
		};
	} forEach ((_this select 0) nearObjects (_this select 1));
}] remoteExecCall ["BIS_fnc_call"];