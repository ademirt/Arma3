/*
Author: SENSEI

Last modified: 9/29/2015

Description: repair patrol vehicles

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_vehArray","_size","_pos","_town","_veh","_grp","_check","_alive"];

_taskID = "repair";
_taskText = "Repair Patrol";
_taskDescription = "";
_vehArray = [];

if (GET_FOBDEPLOYED) then {
	_name = "FOB Pirelli";
	_size = getmarkersize "SEN_fob_border_mrk";
	_pos = [getmarkerpos "SEN_fob_mrk", (_size select 0) + 100, (_size select 0) + 400, 1, 0, 0.6, 0, [],[getmarkerpos "SEN_fob_mrk",getmarkerpos "SEN_fob_mrk"]] call BIS_fnc_findSafePos;
	SET_FOBLOCK
	_taskDescription = format ["Intel shows that enemy forces plan to attack %1 in the coming days. In response, Command has increased the frequency of patrols in the area. A friendly unit scouting around %1 is in need of repair supplies. Make sure our soldiers are in top shape. Gather the necessary supplies and repair the patrol vehicles.",_name];
} else {
	_town = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
	_name = text _town;
	_pos = getpos _town;
	_size = size _town;
	_pos = [_pos, (_size select 0) + 100, (_size select 0) + 400, 1, 0, 0.6, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
	_taskDescription = format ["Intel shows that another local settlement will be occupied in the coming days. Command has increased the frequency of patrols in several key areas. A friendly unit scouting near %1 is in need of repair supplies. Make sure our soldiers are in top shape. Gather the necessary supplies and repair the patrol vehicles.",_name];
};

_pos set [2,0];
_vehSelect = [];
// TODO: remove check once RG33 is ACE repair compatible
{
	if !(_x select [0,11] isEqualTo "rhsusf_rg33") then {_vehSelect pushBack _x};
} forEach SEN_vehPoolWest;
if (_vehSelect isEqualTo []) then {
	_vehSelect = ["B_mrap_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];
};

for "_i" from 0 to 1 do {
	_veh = (_vehSelect select floor (random (count _vehSelect))) createVehicle ([_pos, 0, 30, 6, 0, 0.6, 0,[],[_pos,_pos]] call BIS_fnc_findSafePos);
	_veh setVectorUp [0,0,1];
	_veh setDir (random 360);
	[_veh] call SEN_fnc_setVehDamaged;
	_vehArray pushback _veh;
};

_grp = [_pos,0,6,WEST] call SEN_fnc_spawnGroup;

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_pos,"Support")

[{
	params ["_args","_id"];
	_args params ["_taskID","_vehArray","_grp","_pos"];

	if !(([_pos,GET_MAXDIST] call SEN_fnc_getNearPlayers) isEqualTo []) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		if (random 1 < 0.50) then {
			[_pos,SEN_enemySide] spawn SEN_fnc_spawnReinforcements;
		} else {
			private "_grp";
			_grp = [[_pos,400,500] call SEN_fnc_findRandomPos,0,GET_STRENGTH(8,16)] call SEN_fnc_spawnGroup;
			SET_SAD(_grp,_pos)
		};
		[{
			params ["_args","_id"];
			_args params ["_taskID","_vehArray","_grp","_pos"];

			_alive = true;
			_check = true;

			for "_i" from 0 to ((count _vehArray) - 1) do {
				if (!alive (_vehArray select _i)) exitWith {
					_alive = false;
				};
				if ({_x isEqualTo 1} count ((getAllHitPointsDamage (_vehArray select _i)) select 2) > 0) exitWith {
					_check = false;
				};
			};
			if !(_alive) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				_vehArray call SEN_fnc_cleanup;
				(units _grp) call SEN_fnc_cleanup;
				[_pos,50] call SEN_fnc_removeParticle;
				SET_FOBUNLOCK
				call SEN_fnc_setTask;
			};
			if (_check) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				_vehArray call SEN_fnc_cleanup;
				(units _grp) call SEN_fnc_cleanup;
				SET_FOBUNLOCK
				call SEN_fnc_setTask;
			};
		}, 10, [_taskID,_vehArray,_grp,_pos]] call CBA_fnc_addPerFrameHandler;
	};
}, 10, [_taskID,_vehArray,_grp,_pos]] call CBA_fnc_addPerFrameHandler;