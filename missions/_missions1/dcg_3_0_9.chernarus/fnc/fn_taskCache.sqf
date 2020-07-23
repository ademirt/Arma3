/*
Author: SENSEI

Last modified: 9/16/2015

Description: destroy ammo cache

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_pos","_cacheArray","_radius","_grpArray","_baseArray","_vehArray","_grp","_hq","_ammo","_posMrk","_mrk"];

_taskID = "cache";
_taskText = "Destroy Cache";
_taskDescription = "According to intel, a small enemy camp is housing an ammunitions cache that is critical to the opposition's efforts. Your team is tasked with destorying the cache.";

_pos = [];
_cacheArray = [];
_radius = 1000;

_pos = [SEN_centerPos,SEN_range,70] call SEN_fnc_findRuralFlatPos;
if (_pos isEqualTo []) exitWith {
	EXIT_TASK(_taskID)
};
_grpArray = [_pos,SEN_enemySide,12,.25,1] call SEN_fnc_spawnSquad;
_baseArray = _grpArray select 0;
_vehArray = _grpArray select 1;
_grp = _grpArray select 2;
_hq = nearestObjects [_pos, ["Land_Cargo_HQ_V3_F"], 100];
_hq = (_hq select floor (random (count _hq)));

for "_i" from 0 to 2 step 2 do {
	_ammo = "O_supplyCrate_F" createVehicle [0,0,0];
	_ammo setDir getDir _hq;
	_ammo setPosATL (_hq modelToWorld [4,1 + _i,-2.6]);
	_cacheArray pushBack _ammo;
	_ammo addEventHandler ["HandleDamage", {
		if ((_this select 4) isKindof "PipeBombBase" && {(_this select 2) > 0.6}) then {(_this select 0) setdamage 1};
	}];
};

[_grp] call SEN_fnc_setPatrolGroup;
if !(_vehArray isEqualTo []) then {
	[_vehArray select 0,300] call SEN_fnc_setPatrolVeh;
};

_posMrk = [_pos,100,_radius] call SEN_fnc_findRandomPos;
_mrk = createMarker ["SEN_cache_AO",_posMrk];
_mrk setMarkerColor "ColorRED";
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerAlpha 0.7;
_mrk setMarkerSize [_radius,_radius];

SET_TASK(_taskID,_taskDescription,_taskText,"Destroy")

if(GET_DEBUG) then {
	[_taskID,_pos] call BIS_fnc_taskSetDestination;
};

[{
	params ["_args","_id"];
	_args params ["_taskID","_cacheArray","_baseArray","_mrk"];

	if ({(damage _x) > 0.95} forEach _cacheArray) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		{deleteVehicle _x} forEach _cacheArray;
		_baseArray call SEN_fnc_cleanup;
		_mrk call SEN_fnc_cleanup;
		call SEN_fnc_setTask;
	};
}, 5, [_taskID,_cacheArray,_baseArray,_mrk]] call CBA_fnc_addPerFrameHandler;