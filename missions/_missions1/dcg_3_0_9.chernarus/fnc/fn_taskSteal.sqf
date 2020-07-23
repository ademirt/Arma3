/*
Author: SENSEI

Last modified: 9/19/2015

Description: steal intel from device

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_radius","_pos","_grpArray","_baseArray","_vehArray","_grp","_mrk"];

_taskID = "steal";
_taskText = "Steal Intel";
_taskDescription = "The enemey have created a highly advanced weapons device. We cannot allow the opposition to gain the upper hand. Find the device and retrieve intel from its onboard computer.";

_radius = 1200;
_pos = [SEN_centerPos,SEN_range,140] call SEN_fnc_findRuralFlatPos;

if (_pos isEqualTo []) exitWith {
	EXIT_TASK(_taskID)
};

_grpArray = [_pos,SEN_enemySide,15,.80,2] call SEN_fnc_spawnSquad;
_baseArray = _grpArray select 0;
_vehArray = _grpArray select 1;
_grp = _grpArray select 2;
_device = (nearestObjects [_pos, ["Land_Device_assembled_F"], 100]) select 0;
[_grp,150] call SEN_fnc_setPatrolGroup;
if !(_vehArray isEqualTo []) then {
	[_vehArray select 0,500] call SEN_fnc_setPatrolVeh;
};

_deviceID = [[_device],{
	_action = ["SEN_Device","Retrieve Device Intel","",{
		[
			20,
			[],
			{
				SEN_taskSuccess = 1;
				publicVariableServer "SEN_taskSuccess";
				hintSilent "You've copied the device data.";
			},
			{

			},
			"Searching Onboard Computer..."
		] call ace_common_fnc_progressBar;
	},{true}] call ace_interact_menu_fnc_createAction;
	[(_this select 0), 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["BIS_fnc_call", west, true];

_mrk = createMarker ["SEN_steal_AO",([_pos,0,_radius] call SEN_fnc_findRandomPos)];
_mrk setMarkerColor "ColorRED";
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerAlpha 0.7;
_mrk setMarkerSize [_radius,_radius];

SET_TASK(_taskID,_taskDescription,_taskText,"Search")

if(GET_DEBUG) then {
	[_taskID,getPosATL _device] call BIS_fnc_taskSetDestination;
};

[{
	params ["_args","_id"];
	_args params ["_taskID","_pos","_baseArray","_mrk","_deviceID"];

	if (SEN_taskSuccess isEqualTo 1) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		[_pos,SEN_enemySide,0] spawn SEN_fnc_spawnReinforcements;
		remoteExecCall ["", _deviceID];
		_baseArray call SEN_fnc_cleanup;
		_mrk call SEN_fnc_cleanup;
		call SEN_fnc_setTask;
	};
}, 5, [_taskID,_pos,_baseArray,_mrk,_deviceID]] call CBA_fnc_addPerFrameHandler;