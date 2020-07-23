/*
Author: SENSEI

Last modified: 9/29/2015

Description: starts task generation

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

SEN_taskSuccess = 0;
SEN_taskCounterCiv = 0;
SEN_taskSleepCiv = 1200; // time (sec) between civilian tasks

SEN_taskList = [
	"defend",
	"defuse",
	"vip",
	"cache",
	"arty",
	"repair",
	"steal"
];

SEN_taskListCiv = [
	"rescue",
	"deliver",
	"stabilize",
	"identify"
];

[{
	if (SEN_complete > 1.9) exitWith {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
		["Players present at task handler start: %1",call SEN_fnc_getPlayers] call SEN_fnc_log;
		call SEN_fnc_taskOfficer;
		[SEN_taskListCiv select floor (random (count SEN_taskListCiv))] call SEN_fnc_setTaskCiv;
		["rebel"] call SEN_fnc_setTaskCiv;
	};
}, 5, []] call CBA_fnc_addPerFrameHandler;