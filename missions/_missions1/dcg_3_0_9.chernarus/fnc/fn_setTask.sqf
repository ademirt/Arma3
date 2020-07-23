/*
Author: SENSEI

Last modified: 9/16/2015

Description: sets task

Return: nothing
__________________________________________________________________*/
// TODO: Test running tasks in scheduled and non scheduled environment. Non scheduled seems to cause client lag

if !(isServer) exitWith {};

private ["_override","_task"];

_override = param [0,"",[""]];

if (SEN_taskList isEqualTo []) exitWith {call SEN_fnc_taskDebriefing};

SEN_taskSuccess = 0;

if !(_override isEqualTo "") exitWith {
	_override = format ["SEN_fnc_task%1",_override];
	[] spawn (missionNamespace getVariable [_override,{}]);
	["Calling task, override: %1.", _override] call SEN_fnc_log;
};

_task = SEN_taskList select floor (random (count SEN_taskList));
SEN_taskList = SEN_taskList - [_task];
_task = format ["SEN_fnc_task%1",_task];
[] spawn (missionNamespace getVariable [_task,{}]);
["Calling task: %1.", _task] call SEN_fnc_log;