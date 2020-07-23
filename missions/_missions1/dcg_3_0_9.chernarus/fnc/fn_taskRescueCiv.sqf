/*
Author: SENSEI

Last modified: 9/19/2015

Description: rescue civilians and escort to town safely

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_wreckArray","_vehPos","_pos","_houseArray","_tempGrp","_vest","_weapon","_mags","_returnTown","_returnPos","_taskID","_taskText","_taskDescription","_vehType","_roads","_veh","_fx","_unit","_grp","_y","_bonus"];

_wreckArray = ["Land_Wreck_Truck_dropside_F","Land_Wreck_Truck_F","Land_Wreck_UAZ_F","Land_Wreck_Ural_F","Land_Wreck_Van_F","Land_Wreck_Skodovka_F","Land_Wreck_CarDismantled_F","Land_Wreck_Car3_F","Land_Wreck_Car_F"];
_vehPos = [];
_pos = [];
_houseArray = [];

_tempGrp = [[0,0,0],0,1] call Sen_fnc_spawnGroup;
_vest = vest (leader _tempGrp);
_weapon = currentWeapon (leader _tempGrp);
_mags = magazines (leader _tempGrp);
deleteVehicle (leader _tempGrp);

_returnTown = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
_returnPos = getpos _returnTown;
_returnPos set [2,0];
if (worldName isEqualTo "Chernarus" || {worldName isEqualTo "Chernarus_Summer"}) then {
	_pos = [SEN_centerPos,SEN_range,10] call SEN_fnc_findRuralFlatPos;
} else {
	_houseArray = [SEN_centerPos,SEN_range] call SEN_fnc_findRuralHousePos;
	_pos = (_houseArray select 1);
};

if (_pos isEqualTo []) exitWith {
	EXIT_TASKCIV
};

_taskID = format["%1_rescue_civ",SEN_taskCounterCiv];
_taskText = "Rescue Hostage";
_taskDescription = format["We have intel that a civilian was taken hostage by enemy sympathizers at grid (%1). Local officials request that we rescue the civilian and escort him to %2. This is an important task that will get the local population on our side.",mapGridPosition _pos, text _returnTown];

_vehType = _wreckArray select floor (random (count _wreckArray));
_roads = _pos nearRoads 50;

if !(_roads isEqualTo []) then {
	_vehPos = getposATL (_roads select 0);
} else {
	_vehPos = [_pos,20,60,5,0,1,0,[],[_pos,_pos]] call BIS_fnc_findSafePos;
};

_veh = _vehType createVehicle _vehPos;
_veh setDir random 360;
_veh setVectorUp surfaceNormal position _veh;
_fx = "test_EmptyObjectForSmoke" createVehicle (getposATL _veh);
_fx attachTo [_veh,[0,0,0]];
_unit = (createGroup CIVILIAN) createUnit [SEN_unitPoolCiv select floor (random (count SEN_unitPoolCiv)),[0,0,0], [], 0, "NONE"];
_unit setDir random 360;
_unit setPosATL _pos;
_grp = [[_pos,5,30,3,0,0.5,0,[],[_pos,_pos]] call BIS_fnc_findSafePos,0,GET_STRENGTH(10,16),CIVILIAN] call SEN_fnc_spawnGroup;
_grp = [units _grp] call SEN_fnc_setSide;
{
	_y = _x;
	_y addVest _vest;
	_y addWeapon _weapon;
	{_y addMagazine _x} forEach _mags;
} forEach units _grp;
[_grp] call SEN_fnc_setPatrolGroup;
[_unit,"Acts_AidlPsitMstpSsurWnonDnon02",2] call ace_common_fnc_doAnimation;
_pos = getpos _unit;

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_vehPos,"C")

[{
	params ["_args","_id"];
	_args params ["_taskID","_taskDescription","_pos","_returnPos","_unit","_veh"];

	if (!alive _unit || {_unit distance2D _pos > GET_MINDIST}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		if (alive _unit) then {
			_taskText = "Escort Hostage";
			[_taskID,[_taskDescription,_taskText,""]] call BIS_fnc_taskSetDescription;
			[_taskID,_returnPos] call BIS_fnc_taskSetDestination;
			[{
				params ["_args","_id"];
				_args params ["_taskID","_returnPos","_unit","_veh"];

				if (!alive _unit || {((_unit distance _returnPos) <= GET_MINDIST) && ([_unit] call ace_common_fnc_isAwake)}) exitWith {
					[_id] call CBA_fnc_removePerFrameHandler;
					if !(alive _unit) then {
						[_taskID, "FAILED"] call BIS_fnc_taskSetState;
						[_pos,55] call SEN_fnc_removeParticle;
						_unit call SEN_fnc_cleanup;
						_veh call SEN_fnc_cleanup;
						call SEN_fnc_setTaskCiv;
					} else {
						[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
						_bonus = round (35 + random 20);
						SEN_approvalCiv = SEN_approvalCiv + _bonus;
						publicVariable "SEN_approvalCiv";
						["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
						[_pos,55] call SEN_fnc_removeParticle;
						_unit call SEN_fnc_cleanup;
						_veh call SEN_fnc_cleanup;
						call SEN_fnc_setTaskCiv;
					};
				};
			}, 5, [_taskID,_returnPos,_unit,_veh]] call CBA_fnc_addPerFrameHandler;
		} else {
			[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			[_pos,55] call SEN_fnc_removeParticle;
			_unit call SEN_fnc_cleanup;
			_veh call SEN_fnc_cleanup;
			call SEN_fnc_setTaskCiv;
		};
	};
}, 5, [_taskID,_taskDescription,_pos,_returnPos,_unit,_veh]] call CBA_fnc_addPerFrameHandler;