/*
Author: SENSEI

Last modified: 9/19/2015

Description: identify dead politician

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_pos","_vehArray","_radius","_grpArray","_baseArray","_grp","_med","_bonus","_body","_bodyArray"];

_taskID = format["%1_identify_civ",SEN_taskCounterCiv];
_taskText = "ID Politician";
_taskDescription = "Another local politician was executed live on television a few hours ago. In the aftermath of the event, the government publically blamed us, but we have intel on the actual culprits. Your orders are to infiltrate their camp and identify the deceased politician.";

_bodyArray = [];
_radius = 1000;

_pos = [SEN_centerPos,SEN_range,70] call SEN_fnc_findRuralFlatPos;
if (_pos isEqualTo []) exitWith {
	EXIT_TASKCIV
};
_grpArray = [_pos,SEN_enemySide,12,.25,1] call SEN_fnc_spawnSquad;
_baseArray = _grpArray select 0;
_vehArray = _grpArray select 1;
_grp = _grpArray select 2;
_med = ((nearestObjects [_pos, ["Land_Medevac_house_V1_F"], 100]) select 0);
_med setVariable["ace_medical_isMedicalFacility", true, true];
for "_i" from 1 to 2 do {
	_body = "ACE_bodyBagObject" createVehicle [0,0,0];
	_body setDir getDir _med;
	_body setPosATL (_med modelToWorld [0 - _i,1.2,.6]);
	[_body,false] call ace_dragging_fnc_setDraggable;
	_bodyArray pushBack _body;
};

_bodyIndex = round random ((count _bodyArray) - 1);
{
	if (_forEachIndex isEqualTo _bodyIndex) then {
		_x setVariable ["SEN_isPolitician",true,true];
	};
	[[_x],{
		_action = [format["SEN_IDBody%1",_forEachIndex],"Identify Body","",{
			_args = (_this select 2);
			[
				10,
				_args,
				{
					if (((_this select 0) select 0) getVariable ["SEN_isPolitician",false]) then {
						hintSilent "You found the local politician.";
						SEN_taskSuccess = 2;
						publicVariableServer "SEN_taskSuccess";
					} else {
						hintSilent "This isn't the local politician.";
					};
				},
				{

				},
				"Identifying Body..."
			] call ace_common_fnc_progressBar;
		},{true},{},[(_this select 0)]] call ace_interact_menu_fnc_createAction;
		[(_this select 0), 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	}] remoteExecCall ["BIS_fnc_call", west, true];
} forEach _bodyArray;

[_grp] call SEN_fnc_setPatrolGroup;
if !(_vehArray isEqualTo []) then {
	[_vehArray select 0,300] call SEN_fnc_setPatrolVeh;
};

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_pos,"C")

[{
	params ["_args","_id"];
	_args params ["_taskID","_baseArray","_bodyArray"];

	if (SEN_taskSuccess isEqualTo 2) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		_bonus = round (35 + random 20);
		SEN_approvalCiv = SEN_approvalCiv + _bonus;
		publicVariable "SEN_approvalCiv";
		["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
		_baseArray call SEN_fnc_cleanup;
		{deleteVehicle _x} forEach _bodyArray;
		call SEN_fnc_setTaskCiv;
	};
}, 5, [_taskID,_baseArray,_bodyArray]] call CBA_fnc_addPerFrameHandler;