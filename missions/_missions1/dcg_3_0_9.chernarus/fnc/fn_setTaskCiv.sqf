/*
Author: SENSEI

Last modified: 9/16/2015

Description: sets civilians task

Return: nothing
__________________________________________________________________*/
// TODO: Test running tasks in scheduled and non scheduled environment. Non scheduled seems to cause client lag

if !(isServer) exitWith {};

private ["_override","_task"];

_override = param [0,"",[""]];

SEN_taskSuccess = 0;
SEN_taskCounterCiv = SEN_taskCounterCiv + 1;

if !(_override isEqualTo "") exitWith {
	if (toLower _override isEqualTo "rebel") then {
		[{
			params ["_args","_id"];
			_args params ["_time"];

			if (diag_tickTime > _time) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				_task = "SEN_fnc_taskRebelCiv";
				[] spawn (missionNamespace getVariable [_task,{}]);
				["Calling task: %1.", _task] call SEN_fnc_log;
			};
		}, 1, [diag_tickTime + 1800]] call CBA_fnc_addPerFrameHandler;
	} else {
		_override = format ["SEN_fnc_task%1Civ",_override];
		[] spawn (missionNamespace getVariable [_override,{}]);
		["Calling task, override: %1.", _override] call SEN_fnc_log;
	};
};

[{
	params ["_args","_id"];
	_args params ["_time"];

	if (diag_tickTime > _time) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_task = SEN_taskListCiv select floor (random (count SEN_taskListCiv));
		_task = format ["SEN_fnc_task%1Civ",_task];
		[] spawn (missionNamespace getVariable [_task,{}]);
		["Calling task: %1.", _task] call SEN_fnc_log;
	};
}, 1, [diag_tickTime + SEN_taskSleepCiv]] call CBA_fnc_addPerFrameHandler;
