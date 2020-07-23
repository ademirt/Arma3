/*
Author: SENSEI

Last modified: 9/27/2015

Description: defuse bomb before time expires

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_bombTown","_townName","_townPos","_townSize","_avgTownSize","_radius","_radius2","_pos1","_pos2","_taskID","_taskText","_taskDescription","_centerCheck","_platform1","_platform2","_pos","_houseArray","_grpArray","_vehArray","_grp","_detID","_mrkDet","_mrkDefuse","_mrkDebug1","_mrkDebug2","_nearPlayers"];

SEN_defused = false;
SEN_armed = false;
SEN_timer = 3600;
SEN_codeInput = [];
publicVariable "SEN_codeInput";
SEN_codeDefuse = [(round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9)), (round(random 9))];
publicVariable "SEN_codeDefuse";
SEN_wireDefuse = ["BLUE", "WHITE", "YELLOW", "GREEN"] select floor (random (count ["BLUE", "WHITE", "YELLOW", "GREEN"]));
publicVariable "SEN_wireDefuse";
_bombTown = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
_townName = text _bombTown;
_townPos = getpos _bombTown;
_townPos set [2,0];
_townSize = size _bombTown;
_avgTownSize = (((_townSize select 0) + (_townSize select 1))/2);
_radius = _avgTownSize*.80;
_radius2 = ((_avgTownSize*.25) max 65) min 95;
_pos1 = [];
_pos2 = [];

_taskID = "defuse";
_taskText = "Defuse Explosives";
_taskDescription = format["Intel obtained from the enemy officer details several explosive devices planted througout %1 (%2). If the detonator triggers, innocent civilians will die; we cannot allow this.<br/><br/>Find the defusal code on a laptop located in the settlement and disarm the detonator.",_townName,mapGridPosition _townPos];

// A2 map compatibility
_centerCheck = isClass (configfile >> "CfgWorlds" >> worldName >> "Names" >> ("ACityC_" + _townName));
if (_centerCheck) then {_townPos = getArray (configfile >> "CfgWorlds" >> worldName >> "Names" >> ("ACityC_" + _townName) >> "position")};

["Defuse Explosives: Town is %1.",_townName] call SEN_fnc_log;

_platform1 = "Land_MetalBarrel_F" createVehicle [0,0,0];
_platform2 = "Land_MetalBarrel_F" createVehicle [0,0,0];
_det = "Land_SatellitePhone_F" createVehicle [0,0,0];
_laptop = "Land_Laptop_device_F" createVehicle [0,0,0];

if ((toUpper worldName) isEqualTo "CHERNARUS" || {(toUpper worldName) isEqualTo "CHERNARUS_SUMMER"}) then {
	_pos = [_townPos,_radius,_radius*0.4,2,false,"Land_MetalBarrel_F"] call SEN_fnc_findPosArray;
	if (_pos isEqualTo []) exitWith {};
	_pos1 = (_pos select 0);
	_pos2 = (_pos select 1);
	_platform1 setPosATL _pos1;
	_platform1 setVectorUp (surfacenormal (getPosATL _platform1));
	_platform2 setPosATL _pos2;
	_platform2 setVectorUp (surfacenormal (getPosATL _platform2));
} else {
	_houseArray = [_townPos,_radius] call SEN_fnc_findHousePos;
	if ((_houseArray select 1) isEqualTo []) exitWith {};
	_pos1 = _houseArray select 1;
	_platform1 setPosATL _pos1;
	_platform1 setVectorUp [0,0,1];
	_houseArray = [_townPos,_radius] call SEN_fnc_findHousePos;
	if ((_houseArray select 1) isEqualTo []) exitWith {};
	_pos2 = _houseArray select 1;
	_platform2 setPosATL _pos2;
	_platform2 setVectorUp [0,0,1];
};

if (_pos1 isEqualTo [] || _pos2 isEqualTo []) exitWith {
	EXIT_TASK(_taskID)
};
_laptop setposATL [((getposATL _platform1) select 0), ((getposATL _platform1) select 1), ((getposatl _platform1) select 2) + 0.825];
_laptop setVectorUp [0,0,1];
_laptop attachTo [_platform1];
_det setposATL [((getposATL _platform2) select 0), ((getposATL _platform2) select 1), ((getposatl _platform2) select 2) + 0.825];
_det setVectorUp [0,0,1];
_det attachTo [_platform2];
_platform1 allowdamage false;
_platform2 allowdamage false;
_det allowDamage false;
_laptop allowDamage false;
_grpArray = [_townPos,SEN_enemySide,12,.50] call SEN_fnc_spawnSquad;
_vehArray = _grpArray select 1;
_grp = _grpArray select 2;
[_grp] call SEN_fnc_setPatrolGroup;
if !(_vehArray isEqualTo []) then {
	[_vehArray select 0,500] call SEN_fnc_setPatrolVeh;
};

_detID = [[_det],{
	_action = ["SEN_Det","Disarm Detonator","",{createDialog 'KeypadDefuse'},{true}] call ace_interact_menu_fnc_createAction;
	[(_this select 0), 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["BIS_fnc_call", west, true];

_codeID = [[_laptop],{
	_action = ["SEN_Code","Get Disarm Code","",{
		[
			10,
			[],
			{
				SEN_taskSuccess = 1;
				publicVariableServer "SEN_taskSuccess";
			},
			{

			},
			"Decrypting Code..."
		] call ace_common_fnc_progressBar;
	},{true}] call ace_interact_menu_fnc_createAction;
	[(_this select 0), 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
}] remoteExecCall ["BIS_fnc_call", west, true];

_mrkDet = createMarker ["SEN_defuse1_mrk",([getPosATL _det,0,_radius2] call SEN_fnc_findRandomPos)];
_mrkDet setMarkerColor "ColorRED";
_mrkDet setMarkerShape "ELLIPSE";
_mrkDet setMarkerAlpha 0.7;
_mrkDet setMarkerSize [_radius2,_radius2];
_mrkDefuse = createMarker ["SEN_defuse2_mrk",([getPosATL _laptop,0,_radius2] call SEN_fnc_findRandomPos)];
_mrkDefuse setMarkerColor "ColorRED";
_mrkDefuse setMarkerShape "ELLIPSE";
_mrkDefuse setMarkerAlpha 0.7;
_mrkDefuse setMarkerSize [_radius2,_radius2];
if (GET_DEBUG) then {
	_mrkDebug1 = createMarker ["SEN_defuse3_mrk",(getposATL _det)];
	_mrkDebug1 setMarkerType "mil_dot";
	_mrkDebug1 setMarkerText "DET";
	_mrkDebug1 setMarkerColor "ColorEAST";
	_mrkDebug2 = createMarker ["SEN_defuse4_mrk",(getposATL _laptop)];
	_mrkDebug2 setMarkerType "mil_dot";
	_mrkDebug2 setMarkerText "CODE";
	_mrkDebug2 setMarkerColor "ColorEAST";
};

SET_TASK(_taskID,_taskDescription,_taskText,"Search")

[{
 	params ["_args","_id"];
    _args params ["_houses","_det","_hintInterval"];

	if (SEN_defused) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	if (SEN_timer < 1 || {SEN_armed}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		SEN_armed = true;
		"Bo_GBU12_LGB_MI10" createVehicle (getposATL _det); // create explosion at detonator
		[_houses] spawn {
			for "_i" from 0 to ((ceil(count (_this select 0))*0.5) min 15) do { // create explosions at various buildings
				_building = (_this select 0) select floor (random (count (_this select 0)));
				"Bo_GBU12_LGB_MI10" createVehicle (getposATL _building);
				uiSleep (0.5 + random 1.25);
			};
		};
	};
	if ((SEN_timer/_hintInterval) mod 1 isEqualTo 0) then {
		(format ["%1 %2 %3","Explosive detonation in",([SEN_timer] call SEN_fnc_setTime),"minutes."]) remoteExecCall ["hintSilent", allPlayers, false];
	};
	SEN_timer = SEN_timer - 1;
}, 1, [nearestObjects [_townPos, ["house"], 100], _det,60]] call CBA_fnc_addPerFrameHandler;

[{
 	params ["_args","_id"];
    _args params ["_timeToWait"];

	if (SEN_defused || {SEN_timer < 1} || {SEN_armed}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};

	"Explosive detonation in " + (format ["%1:00",(SEN_timer/60) - ((SEN_timer/60) mod 1)]) + " minutes." remoteExecCall ["hintSilent", allPlayers, false];
	SEN_timer = SEN_timer - _timeToWait;
}, 60, [60]] call CBA_fnc_addPerFrameHandler;

[{
	params ["_args","_id"];
	_args params ["_taskID","_bombTown","_platform1","_platform2","_mrkDefuse","_mrkDet","_laptop","_det","_detID","_codeID"];

	if (SEN_taskSuccess isEqualTo 1) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		deleteVehicle _laptop;
		_nearPlayers = [getposATL _laptop,5] call SEN_fnc_getNearPlayers;
		[[], {[format["<t size='0.6'>Code: %1</t>", SEN_codeDefuse]] spawn bis_fnc_dynamicText;}] remoteExec ["BIS_fnc_call", _nearPlayers, false];
		[{
			params ["_args","_id"];
			_args params ["_taskID","_bombTown","_platform1","_platform2","_mrkDefuse","_mrkDet","_laptop","_det","_detID","_codeID"];

			if (SEN_armed) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "FAILED"] call BIS_fnc_taskSetState;
				SEN_whitelistLocation = SEN_whitelistLocation - [_bombTown];
				remoteExecCall ["", _detID];
				remoteExecCall ["", _codeID];
				deleteVehicle _laptop;
				deleteVehicle _det;
				[_platform1,_platform2] call SEN_fnc_cleanup;
				[_mrkDefuse,_mrkDet] call SEN_fnc_cleanup;
				call SEN_fnc_setTask;
			};
			if (SEN_defused) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
				remoteExecCall ["", _detID];
				remoteExecCall ["", _codeID];
				deleteVehicle _laptop;
				deleteVehicle _det;
				[_platform1,_platform2] call SEN_fnc_cleanup;
				[_mrkDefuse,_mrkDet] call SEN_fnc_cleanup;
				call SEN_fnc_setTask;
			};
		}, 1, [_taskID,_bombTown,_platform1,_platform2,_mrkDefuse,_mrkDet,_laptop,_det,_detID,_codeID]] call CBA_fnc_addPerFrameHandler;
	};

	if (SEN_armed) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "FAILED"] call BIS_fnc_taskSetState;
		SEN_whitelistLocation = SEN_whitelistLocation - [_bombTown];
		remoteExecCall ["", _detID];
		remoteExecCall ["", _codeID];
		deleteVehicle _laptop;
		deleteVehicle _det;
		[_platform1,_platform2] call SEN_fnc_cleanup;
		[_mrkDefuse,_mrkDet] call SEN_fnc_cleanup;
		call SEN_fnc_setTask;
	};
	if (SEN_defused) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		remoteExecCall ["", _detID];
		remoteExecCall ["", _codeID];
		deleteVehicle _laptop;
		deleteVehicle _det;
		[_platform1,_platform2] call SEN_fnc_cleanup;
		[_mrkDefuse,_mrkDet] call SEN_fnc_cleanup;
		call SEN_fnc_setTask;
	};
}, 5, [_taskID,_bombTown,_platform1,_platform2,_mrkDefuse,_mrkDet,_laptop,_det,_detID,_codeID]] call CBA_fnc_addPerFrameHandler;