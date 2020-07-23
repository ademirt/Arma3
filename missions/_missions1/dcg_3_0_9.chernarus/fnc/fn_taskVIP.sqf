/*
Author: SENSEI

Last modified: 9/19/2015

Description: rescue vip

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_houseArray","_pos","_grp1","_unit","_grpArray","_vehArray","_grp2","_mrk"];

_taskID = "vip";
_taskText = "Rescue VIP";
_taskDescription = "We have intel that the son of a local elder has been taken hostage by enemy forces.<br/><br/>Locate the VIP and safely return him to headquarters at MOB Dodge.";

_houseArray = [];
_pos = [];

if (worldName isEqualTo "Chernarus" || {worldName isEqualTo "Chernarus_Summer"}) then {
	_pos = [SEN_centerPos,SEN_range,10] call SEN_fnc_findRuralFlatPos;
} else {
	_houseArray = [SEN_centerPos,SEN_range] call SEN_fnc_findRuralHousePos;
	_pos = (_houseArray select 1);
};

if (_pos isEqualTo []) exitWith {
	EXIT_TASK(_taskID)
};

_grp1 = [_pos,0,1,CIVILIAN] call SEN_fnc_spawnGroup;
_unit = leader _grp1;
_grpArray = [([_pos,5,30] call SEN_fnc_findRandomPos),SEN_enemySide,12,.25] call SEN_fnc_spawnSquad;
_vehArray = _grpArray select 1;
_grp2 = _grpArray select 2;
[_grp2] call SEN_fnc_setPatrolGroup;
if !(_vehArray isEqualTo []) then {
	[_vehArray select 0,500] call SEN_fnc_setPatrolVeh;
};

[_unit,"Acts_AidlPsitMstpSsurWnonDnon02",2] call ace_common_fnc_doAnimation;
_pos = getPos _unit;

_mrk = createMarker ["SEN_vip_mrk",([_pos,0,300] call SEN_fnc_findRandomPos)];
_mrk setMarkerColor "ColorCIV";
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerSize [350,350];
_mrk setMarkerAlpha 0.7;

SET_TASK(_taskID,_taskDescription,_taskText,"Search")

if(GET_DEBUG) then {
	[_taskID,getPosATL _unit] call BIS_fnc_taskSetDestination;
};

[{
	params ["_args","_id"];
	_args params ["_taskID","_taskDescription","_unit","_pos","_mrk"];

	if !(alive _unit) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "FAILED"] call BIS_fnc_taskSetState;
		_unit call SEN_fnc_cleanup;
		_mrk call SEN_fnc_cleanup;
		call SEN_fnc_setTask;
	};
	if (_unit distance2D _pos > GET_MINDIST) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_taskText = "Escort VIP";
		[_taskID,[_taskDescription,_taskText,""]] call BIS_fnc_taskSetDescription;
		[_taskID,getmarkerpos "SEN_hq_mrk"] call BIS_fnc_taskSetDestination;

		[{
			params ["_args","_id"];
			_args params ["_taskID","_unit","_mrk"];

			if !(alive _unit) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				_unit call SEN_fnc_cleanup;
				_mrk call SEN_fnc_cleanup;
				call SEN_fnc_setTask;
			};
			if (_unit distance (getmarkerpos "SEN_hq_mrk") < GET_MINDIST && {[_unit] call ace_common_fnc_isAwake}) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				_unit call SEN_fnc_cleanup;
				_mrk call SEN_fnc_cleanup;
				call SEN_fnc_setTask;
			};
		}, 5, [_taskID,_unit,_mrk]] call CBA_fnc_addPerFrameHandler;
	};
}, 5, [_taskID,_taskDescription,_unit,_pos,_mrk]] call CBA_fnc_addPerFrameHandler;