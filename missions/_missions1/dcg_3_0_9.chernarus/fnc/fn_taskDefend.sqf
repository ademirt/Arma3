/*
Author: SENSEI

Last modified: 9/17/2015

Description: defend supply cache

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_townName","_townPos","_townSize","_avgTownSize","_defendTown","_posCache","_roads","_cacheArray","_vehArray","_cache","_pos","_dir","_transport","_grpWest","_posEnemy","_squad","_wp"];

_taskID = "defend";
_taskText = "Defend Cache";
_taskDescription = "";

if (GET_FOBDEPLOYED) then {
	_townName = "FOB Pirelli";
	_townPos = [getmarkerpos "SEN_fob_mrk",10,25] call SEN_fnc_findRandomPos;
	_townSize = getmarkersize "SEN_fob_border_mrk";
	_avgTownSize = (((_townSize select 0) + (_townSize select 1))/2);
	SET_FOBLOCK
	_taskDescription = format ["A few hours ago, Command dispatched a convoy to %1. Upon arrival, the convoy was attacked by enemy forces. We have intel that our soldiers are holding out, but we're sending your team in to assist. Protect the supply cache and minimize friendly casualties.",_townName];
} else {
	_defendTown = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
	_townName = text _defendTown;
	_townPos = getpos _defendTown;
	_townSize = size _defendTown;
	_avgTownSize = ((_townSize select 0) + (_townSize select 1))/2;
	_taskDescription = format ["Yesterday, FOB Falken sent in a request for supplies. A few hours ago, Command dispatched a convoy enroute to Falken. Somewhere in %1, the convoy was attacked by enemy forces. We have intel that our soldiers are holding out, but we're sending your team in to assist. Protect the supply cache and minimize friendly casualties.",_townName];
};

SEN_waveGrp = grpNull;
SEN_waveThreshold = 0;
SEN_waveCount = 0;
SEN_cacheKilled = false;

_townPos set [2,0];
_posCache = [_townPos, 0, _avgTownSize/2, 2, 0, 0.4, 0, [], [_townPos,_townPos]] call BIS_fnc_findSafePos;
_roads = _posCache nearRoads 50;
_cacheArray = [];
_vehArray = [];

for "_c" from 0 to 1 do {
	_cache = "Box_NATO_AmmoVeh_F" createVehicle _posCache;
	_cache allowDamage false;
	_cache setVectorUp [0,0,1];
	_cacheArray pushBack _cache;
	_dir = random 360;
	_pos = [_posCache, 0, 30, 6, 0, 0.6, 0,[],[_posCache,_posCache]] call BIS_fnc_findSafePos;
	_pos set [2,0];
	_transport = (SEN_vehPoolWest select floor (random (count SEN_vehPoolWest))) createVehicle [0,0,0];
	_transport setDir _dir;
	_transport setPosATL _pos;
	_transport setVectorUp [0,0,1];
	_vehArray pushBack _transport;
};

_grpWest = [_posCache,0,4,WEST] call SEN_fnc_spawnGroup;
[_grpWest] call SEN_fnc_setPatrolGroup;

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_posCache,"Defend")

[{
	params ["_args","_id"];
	_args params ["_taskID","_posCache","_grpWest","_cacheArray","_vehArray"];

	if !(([_posCache,GET_MAXDIST] call SEN_fnc_getNearPlayers) isEqualTo []) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[{
			params ["_args","_id"];
			_args params ["_taskID","_posCache","_grpWest","_cacheArray","_vehArray"];

			if (SEN_waveCount >= 3 && {count (units SEN_waveGrp) <= SEN_waveThreshold}) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				SET_FOBUNLOCK
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				_cacheArray call SEN_fnc_cleanup;
				_vehArray call SEN_fnc_cleanup;
				(units _grpWest) call SEN_fnc_cleanup;
				(units SEN_waveGrp) call SEN_fnc_cleanup;
				SEN_waveGrp = nil;
				SEN_waveThreshold = nil;
				SEN_waveCount = nil;
				call SEN_fnc_setTask;
			};
			if (count (units SEN_waveGrp) <= SEN_waveThreshold && {SEN_waveCount < 3}) then {
				SEN_waveCount = SEN_waveCount + 1;
				_squad = [[_posCache,400,450] call SEN_fnc_findRandomPos,SEN_enemySide,10,0.33] call SEN_fnc_spawnSquad;
				SEN_waveGrp = _squad select 2;
				SEN_waveThreshold = ceil ((count (units SEN_waveGrp))*0.30) max 1;
				SET_SAD(SEN_waveGrp,_posCache)

				if !((_squad select 1) isEqualTo []) then {
					_wp = group ((_squad select 1) select 0) addWaypoint [_posCache, 0];
					_wp setWaypointType "MOVE";
					_wp setWaypointCombatMode "RED";
					vehicle ((_squad select 1) select 0) forceSpeed (vehicle ((_squad select 1) select 0) getSpeed "SLOW");
				};
				["Defend Supply Cache: Group count: %1, Wave count: %2, Wave threshold: %3", count (units SEN_waveGrp), SEN_waveCount, SEN_waveThreshold] call SEN_fnc_log;
			};
		}, 30, [_taskID,_posCache,_grpWest,_cacheArray,_vehArray]] call CBA_fnc_addPerFrameHandler;
	};
}, 10, [_taskID,_posCache,_grpWest,_cacheArray,_vehArray]] call CBA_fnc_addPerFrameHandler;