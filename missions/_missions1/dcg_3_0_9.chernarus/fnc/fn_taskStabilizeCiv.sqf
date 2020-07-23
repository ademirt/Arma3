/*
Author: SENSEI

Last modified: 9/19/2015

Description: stabilize injured civilians and transport to medical station

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_town","_pos","_taskID","_taskText","_taskDescription","_ambush","_wreckArray","_vehType","_roads","_vehPos","_veh","_fx","_unit","_tempGrp","_vest","_weapon","_mags","_grp","_y","_wp","_unconsciousTime","_part","_time","_bonus"];

_town = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
_pos = [getpos _town,1000,10] call SEN_fnc_findRuralFlatPos;

if (_pos isEqualTo []) exitWith {
	EXIT_TASKCIV
};

_taskID = format["%1_stabilize_civ",SEN_taskCounterCiv];
_taskText = "Stabilize Civilian";
_taskDescription = format["Aerial reconnaissance shows a civilian was attacked by enemy sympathizers at grid (%1) near %2. Local officials request that we provide immediate medical attention and transport the civilian to Dodge Medical Center. This is an important task that will get the local population on our side.",mapGridPosition _pos, text _town];

_ambush = false;
_wreckArray = ["Land_Wreck_Truck_dropside_F","Land_Wreck_Truck_F","Land_Wreck_UAZ_F","Land_Wreck_Ural_F","Land_Wreck_Van_F","Land_Wreck_Skodovka_F","Land_Wreck_CarDismantled_F","Land_Wreck_Car3_F","Land_Wreck_Car_F"];
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
_unit setBehaviour "CARELESS";
_unit setDir random 360;
_unit setPosATL _pos;
_unit setUnitPos "DOWN";

if (random 1 < 0.7) then {
	_ambush = true;
	_tempGrp = [[0,0,0],0,1] call Sen_fnc_spawnGroup;
	_vest = vest (leader _tempGrp);
	_weapon = currentWeapon (leader _tempGrp);
	_mags = magazines (leader _tempGrp);
	deleteVehicle (leader _tempGrp);

	_grp = [([_pos,300,400] call SEN_fnc_findRandomPos),0,GET_STRENGTH(8,16),CIVILIAN] call SEN_fnc_spawnGroup;
	_grp = [units _grp] call SEN_fnc_setSide;
	{
		_y = _x;
		_y addVest _vest;
		_y addWeapon _weapon;
		{_y addMagazine _x} forEach _mags;
	} forEach units _grp;
};

_pos = getpos _unit;

SET_TASKWPOS(_taskID,_taskDescription,_taskText,_vehPos,"C")

[{
	params ["_args","_id"];
	_args params ["_taskID","_taskDescription","_pos","_grp","_unit","_veh","_ambush"];

	if !(([_pos,GET_MAXDIST] call SEN_fnc_getNearPlayers) isEqualTo []) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		if (_ambush) then {
			SET_SAD(_grp,_pos)
		} else {
			[_pos,SEN_enemySide] spawn SEN_fnc_spawnReinforcements;
		};
		[_unit] call SEN_fnc_setUnitDamaged;
		[{
			params ["_args","_id"];
			_args params ["_taskID","_taskDescription","_pos","_grp","_unit","_veh"];

			if (!alive _unit || {_unit distance2D _pos > GET_MINDIST}) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				if (alive _unit) then {
					_taskText = "Escort Civilian";

					[_taskID,[_taskDescription,_taskText,""]] call BIS_fnc_taskSetDescription;
					[_taskID,getmarkerpos "SEN_med_mrk"] call BIS_fnc_taskSetDestination;

					[{
						params ["_args","_id"];
						_args params ["_taskID","_pos","_grp","_unit","_veh"];

						if (!alive _unit || {_unit distance (getmarkerpos "SEN_med_mrk") < GET_MAXDIST && [_unit] call ace_common_fnc_isAwake && ((_unit getVariable ["ace_medical_pain", 0]) isEqualTo 0)}) exitWith {
							[_id] call CBA_fnc_removePerFrameHandler;
							if (!alive _unit) then {
								[_taskID, "FAILED"] call BIS_fnc_taskSetState;
								[_pos,55] call SEN_fnc_removeParticle;
								[_unit,_veh] call SEN_fnc_cleanup;
								call SEN_fnc_setTaskCiv;
							} else {
								[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
								_bonus = round (35 + random 20);
								SEN_approvalCiv = SEN_approvalCiv + _bonus;
								publicVariable "SEN_approvalCiv";
								["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
								[_pos,55] call SEN_fnc_removeParticle;
								[_unit,_veh] call SEN_fnc_cleanup;
								call SEN_fnc_setTaskCiv;
							};
						};
					}, 5, [_taskID,_pos,_grp,_unit,_veh]] call CBA_fnc_addPerFrameHandler;
				} else {
					[_taskID, "FAILED"] call BIS_fnc_taskSetState;
					[_pos,55] call SEN_fnc_removeParticle;
					[_unit,_veh] call SEN_fnc_cleanup;
					call SEN_fnc_setTaskCiv;
				};
			};
		}, 5, [_taskID,_taskDescription,_pos,_grp,_unit,_veh]] call CBA_fnc_addPerFrameHandler;
	};
}, 10, [_taskID,_taskDescription,_pos,_grp,_unit,_veh,_ambush]] call CBA_fnc_addPerFrameHandler;