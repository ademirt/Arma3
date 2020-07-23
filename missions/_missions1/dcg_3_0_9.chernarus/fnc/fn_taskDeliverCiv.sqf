/*
Author: SENSEI

Last modified: 9/24/2015

Description: deliver supplies to town

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_targetTown","_taskID","_taskText","_taskDescription","_count","_aidArray","_pos","_aid","_halfway","_posAid","_iedPos","_type","_grp","_wp","_veh","_hitpoints","_fx","_bonus"];

_targetTown = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));

_taskID = format["%1_deliver_civ",SEN_taskCounterCiv];
_taskText = "Deliver Supplies";
_taskDescription = format["The enemy occupation has left the locals in distress. The townspeople of %1 (%2) desparately need medical supplies.<br/><br/>Collect the supplies from the MOB Depot and deliver them to %1.",text _targetTown,mapGridPosition (getpos _targetTown)];

_count = 3;
_aidArray = [];
_pos = [getpos _targetTown,0,50] call SEN_fnc_findRandomPos;

for "_i" from 1 to _count do {
	_aid = "ACE_medicalSupplyCrate_advanced" createVehicle (getMarkerPos "SEN_depotSpawn_mrk");
	_aid setObjectTextureGlobal [1, "#(rgb,8,8,3)color(0.9,0.05,0.05,1)"];
	_aid setVariable ["SEN_noClean", true, true];
	_aidArray pushBack _aid;
};
_halfway = ((_aidArray select 0) distance2D _pos)/2;

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_pos,"C")

[{
	params ["_args","_id"];
	_args params ["_taskID","_pos","_halfway","_aidArray","_count"];

	if ({!alive _x} count _aidArray > 0) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "FAILED"] call BIS_fnc_taskSetState;
		_aidArray call SEN_fnc_cleanup;
		call SEN_fnc_setTaskCiv;
	};
	if ((_aidArray select 0) distance2D _pos < _halfway) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_posAid = getPosATL (_aidArray select 0);
		_posAid set [2,0];
		if (random 1 < 0.25) then {
			private "_veh";
			{
				if ((_aidArray select 0) in ((vehicle _x) getVariable ["ace_cargo_loaded",[]])) exitWith {
					_veh = vehicle _x;
				};
			} forEach allPlayers;

			if !(isNil "_veh") then {
				[_veh] call SEN_fnc_setVehDamaged;
				_grp = [[_posAid,250,300] call SEN_fnc_findRandomPos,0,GET_STRENGTH(8,15)] call SEN_fnc_spawnGroup;
				SET_SAD(_grp,(_aidArray select 0))
			};
		};
		[{
			params ["_args","_id"];
			_args params ["_taskID","_pos","_aidArray","_count"];

			if ({!alive _x} count _aidArray > 0) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				_aidArray call SEN_fnc_cleanup;
				call SEN_fnc_setTaskCiv;
			};
			if ({(getPosATL _x) distance _pos < GET_MINDIST} count _aidArray isEqualTo _count) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				if (random 1 < 0.70) then {[_pos,SEN_enemySide] call SEN_fnc_spawnReinforcements};
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				_bonus = round (35 + random 20);
				SEN_approvalCiv = SEN_approvalCiv + _bonus;
				publicVariable "SEN_approvalCiv";
				["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
				_aidArray call SEN_fnc_cleanup;
				call SEN_fnc_setTaskCiv;
			};
		}, 5, [_taskID,_pos,_aidArray,_count]] call CBA_fnc_addPerFrameHandler;
	};
}, 5, [_taskID,_pos,_halfway,_aidArray,_count]] call CBA_fnc_addPerFrameHandler;