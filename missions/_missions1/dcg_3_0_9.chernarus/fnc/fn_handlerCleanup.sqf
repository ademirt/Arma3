/*
Author: SENSEI

Last modified: 9/20/2015

Description: handles cleanup

Return: nothing
__________________________________________________________________*/
if (!isServer && hasInterface) exitWith {};

#include "..\data\define.hpp"

SEN_markerCleanup = [];
SEN_objectCleanup = [];

[{
	// groups
	{
		if (local _x && {{alive _x} count (units _x) isEqualTo 0}) then { // only local groups can be deleted
			deleteGroup _x;
		};
	} forEach allGroups;
	// markers
	if !(SEN_markerCleanup isEqualTo []) then {
		for "_i" from (count SEN_markerCleanup - 1) to 0 step -1 do {
			deleteMarker (SEN_markerCleanup select _i);
			SEN_markerCleanup deleteAt _i;
		};
	};
	// objects
	if !(SEN_objectCleanup isEqualTo []) then {
		for "_i" from (count SEN_objectCleanup - 1) to 0 step -1 do {
			_obj = SEN_objectCleanup select _i;
			if (_obj isKindOf "LandVehicle" || {_obj isKindOf "Air"} || {_obj isKindOf "Ship"}) then {
				if ({isPlayer _x} count (crew _obj) isEqualTo 0) then {
					{deleteVehicle _x} forEach (crew _obj);
					deleteVehicle _obj;
					SEN_objectCleanup deleteAt _i;
				};
			} else {
				if (count ([getPosATL _obj,GET_SPAWNDIST*0.75] call SEN_fnc_getNearPlayers) isEqualTo 0) then {
					deleteVehicle _obj;
					SEN_objectCleanup deleteAt _i;
				};
			};
		};
	};
	["Cleanup."] call SEN_fnc_log;
}, 300, []] call CBA_fnc_addPerFrameHandler;