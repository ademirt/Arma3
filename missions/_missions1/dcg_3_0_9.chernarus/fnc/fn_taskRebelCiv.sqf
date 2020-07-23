/*
Author: SENSEI

Last modified: 9/24/2015

Description: spawns rebel force on player or FOB
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription","_tempGrp","_vest","_weapon","_mags","_targetPos","_spawnPos","_rebelGrp","_y","_mrkPatrol","_wp","_bonus","_playerArray","_tar"];

_taskID = format["%1_rebel_civ",SEN_taskCounterCiv];
_taskText = "";
_taskDescription = "";

_tempGrp = [[0,0,0],0,1] call Sen_fnc_spawnGroup;
_vest = vest (leader _tempGrp);
_weapon = currentWeapon (leader _tempGrp);
_mags = magazines (leader _tempGrp);
deleteVehicle (leader _tempGrp);

if (!(GET_APPROVAL(1)) || {count (call SEN_fnc_getPlayers) < 1}) exitWith {
	["Rebel task skipped."] call SEN_fnc_log;
	SET_TASKCIVREBEL
};

if (GET_FOBDEPLOYED && random 1 < 0.5) then {
	_taskText = "Rebel Attack (FOB)";
	_taskDescription = "Aerial reconnaissance shows several hostile civilians advancing towards FOB Pirelli. Defend the FOB against the rebel attack!";
	_targetPos = getPosATL SEN_flagFOB;
	_spawnPos = [_targetPos,300,400] call SEN_fnc_findRandomPos;



	if (_spawnPos distance2D (getMarkerPos "SEN_safezone_mrk") <= ((getMarkerSize "SEN_safezone_mrk") select 0)) exitWith {
		["Rebel spawn or target position in safezone."] call SEN_fnc_log;
		SET_TASKCIVREBEL
	};

	_rebelGrp = [_spawnPos,0,GET_STRENGTH(8,16),CIVILIAN] call SEN_fnc_spawnGroup;
	_rebelGrp = [units _rebelGrp] call SEN_fnc_setSide;
	{
		_y = _x;
		_y addVest _vest;
		_y addWeapon _weapon;
		{_y addMagazine _x} forEach _mags;
	} forEach units _rebelGrp;

	if(GET_DEBUG) then {
		_mrkPatrol = createMarker [format["SEN_rebel_%1",time],getposATL leader _rebelGrp];
		_mrkPatrol setMarkerType "o_unknown";
		_mrkPatrol setMarkerColor "ColorCIV";
		_mrkPatrol setMarkerText "rebel";
	};

	SET_SAD(_rebelGrp,_targetPos)

	["Rebel target: FOB Pirelli: POSITION: %1",_targetPos] call SEN_fnc_log;

	SET_TASKWPOS(_taskID,_taskDescription,_taskText,_targetPos,"C")

	[{
		params ["_args","_id"];
		_args params ["_taskID","_targetPos","_rebelGrp"];

		if ({alive _x} count (units _rebelGrp) isEqualTo 0) exitWith {
			[_id] call CBA_fnc_removePerFrameHandler;
			[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			_bonus = 20;
			SEN_approvalCiv = SEN_approvalCiv + _bonus;
			publicVariable "SEN_approvalCiv";
			["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
			SET_TASKCIVREBEL
		};
		if ((leader _rebelGrp) distance _targetPos < GET_MINDIST) exitWith {
			[_id] call CBA_fnc_removePerFrameHandler;
			createVehicle ["R_TBG32V_F", _targetPos,[],0,"CAN_COLLIDE"];
			{
				if (random 1 > 0.5) then {createVehicle ["R_TBG32V_F", getposATL _x,[],0,"CAN_COLLIDE"]};
				_x setDamage 1;
			} foreach (curatorEditableObjects SEN_curatorFOB);
			call SEN_fnc_fobDelete;
			[_taskID, "FAILED"] call BIS_fnc_taskSetState;
			(units _rebelGrp) call SEN_fnc_cleanup;
			SET_TASKCIVREBEL
		};
	}, 5, [_taskID,_targetPos,_rebelGrp]] call CBA_fnc_addPerFrameHandler;
} else {
	_taskText = "Rebel Attack";
	_taskDescription = "Aerial reconnaissance shows several hostile civilians advancing towards your position. Defend yourself against the rebel attack!";

	_playerArray = [];
	{if (alive _x) then {_playerArray pushBack _x}} forEach (call SEN_fnc_getPlayers);

	if (_playerArray isEqualTo []) exitWith {
		["Rebel target array is empty."] call SEN_fnc_log;
		SET_TASKCIVREBEL
	};

	_tar = _playerArray select floor (random (count _playerArray));

	if (isNull _tar || {(getposATL _tar select 2) > 5}) exitWith {
		["Rebel target is unsuitable."] call SEN_fnc_log;
		SET_TASKCIVREBEL
	};
	_targetPos = getPosATL _tar;
	_spawnPos = [_targetPos,300,400] call SEN_fnc_findRandomPos;

	if (_spawnPos distance2D (getMarkerPos "SEN_safezone_mrk") <= ((getMarkerSize "SEN_safezone_mrk") select 0) || {_targetPos distance2D (getMarkerPos "SEN_safezone_mrk") <= ((getMarkerSize "SEN_safezone_mrk") select 0)}) exitWith {
		["Rebel spawn or target position in safezone."] call SEN_fnc_log;
		SET_TASKCIVREBEL
	};

	_rebelGrp = [_spawnPos,0,GET_STRENGTH(8,16),CIVILIAN] call SEN_fnc_spawnGroup;
	_rebelGrp = [units _rebelGrp] call SEN_fnc_setSide;
	{
		_y = _x;
		_y addVest _vest;
		_y addWeapon _weapon;
		{_y addMagazine _x} forEach _mags;
	} forEach units _rebelGrp;

	if(GET_DEBUG) then {
		_mrkPatrol = createMarker [format["SEN_rebel_%1",time],getposATL leader _rebelGrp];
		_mrkPatrol setMarkerType "o_unknown";
		_mrkPatrol setMarkerColor "ColorCIV";
		_mrkPatrol setMarkerText "rebel";
	};

	SET_SAD(_rebelGrp,_tar)

	["Rebel target: %1",name _tar] call SEN_fnc_log;

	SET_TASKWPOS(_taskID,_taskDescription,_taskText,_targetPos,"C")

	[{
		params ["_args","_id"];
		_args params ["_taskID","_tar","_rebelGrp"];

		if (isNull _tar || {(getposATL _tar distance getposATL (leader _rebelGrp) > 1000) && !(isPlayer((leader _rebelGrp) findNearestEnemy (leader _rebelGrp)))}) exitWith {
			[_id] call CBA_fnc_removePerFrameHandler;
			[_taskID, "CANCELED"] call BIS_fnc_taskSetState;
			(units _rebelGrp) call SEN_fnc_cleanup;
			SET_TASKCIVREBEL
		};

		if ({alive _x} count (units _rebelGrp) isEqualTo 0) exitWith {
			[_id] call CBA_fnc_removePerFrameHandler;
			[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
			_bonus = 20;
			SEN_approvalCiv = SEN_approvalCiv + _bonus;
			publicVariable "SEN_approvalCiv";
			["SEN_approvalBonus",[_bonus,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
			SET_TASKCIVREBEL
		};
	}, 5, [_taskID,_tar,_rebelGrp]] call CBA_fnc_addPerFrameHandler;
};