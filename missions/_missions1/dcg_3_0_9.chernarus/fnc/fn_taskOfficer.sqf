/*
Author: SENSEI

Last modified: 9/29/2015

Description: officer task

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_town","_townPos","_officerID","_action"];

_taskID = "officer";
_taskText = "Locate Officer";
_taskDescription = "A high ranking enemy officer will be traveling to an occupied settlement today.<br/><br/>Find the officer and gather any relevant intel.";

_town = SEN_occupiedLocation select floor (random (count SEN_occupiedLocation));
_townPos = getpos _town;
SEN_officer = (createGroup SEN_enemySide) createUnit [SEN_officerPool select floor (random (count SEN_officerPool)),[_townPos, 0, 30, 2, 0, 1, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos, [], 0, "NONE"];
publicVariable "SEN_officer";
removeFromRemainsCollector [SEN_officer];

SEN_officer addEventHandler ["hit", {
	(_this select 0) removeAllEventHandlers "hit";
	if (alive (_this select 0)) then {
		[(_this select 0)] call SEN_fnc_setUnitSurrender;
	};
}];

[[],{
	_action = ["SEN_OfficerIntel","Search Officer for Intel","",{
		[
			10,
			[],
			{
				SEN_taskSuccess = 1;
				publicVariableServer "SEN_taskSuccess";
				hintSilent "You found valuable intel.";
			},
			{

			},
			"Searching Officer..."
		] call ace_common_fnc_progressBar;
	},{true}] call ace_interact_menu_fnc_createAction;
	[SEN_officer, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["BIS_fnc_call", west, true];

[group SEN_officer,70] call SEN_fnc_setPatrolGroup;

SET_TASK(_taskID,_taskDescription,_taskText,"Search")

if(GET_DEBUG) then {
	[_taskID,getPosATL SEN_officer] call BIS_fnc_taskSetDestination;
};

[{
	params ["_args","_id"];
	_args params ["_taskID"];

	if (SEN_taskSuccess isEqualTo 1) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		deleteVehicle SEN_officer;
		call SEN_fnc_setTask;
	};
}, 1, [_taskID]] call CBA_fnc_addPerFrameHandler;