/*
Author: SENSEI

Last modified: 10/3/2015

Description: handles transport functionality

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

_package = _this select 0;
_requestor = _package select 0;
_type = _package select 1;
_size = 8 max (ceil(sizeOf _type));
_dirArray = [];
_spawnPos = [0,0,0];
_coPilot = objNull;

if !(GET_TRANSPORTREADY) exitWith {
	"Transport is not available." remoteExecCall ["hintSilent", owner _requestor, false];
};
missionNamespace setVariable ["SEN_transportResponse", nil];
SET_TRANSPORTNOTREADY

// requestor select HLZ
[_type,_size] remoteExecCall ["SEN_fnc_transportResponse", owner _requestor, false];

waitUntil {uiSleep 1; !isNil "SEN_transportResponse"};

_pos = missionnamespace getVariable ["SEN_transportResponse", []];
if (_pos isEqualTo []) exitWith {
	SET_TRANSPORTREADY
};

// check if near FOB and has helipad
if (GET_FOBDEPLOYED) then {
	if (_pos distance2D getMarkerPos "sen_fob_mrk" < 100) then {
		_helipadPos = [_lz] call SEN_fnc_getNearHelipad;
		if !(_helipadPos isEqualTo []) then {
			_pos = _helipadPos;
		};
	};
};

// find position away from an occupied location
{
	_dir = ([_pos, getpos _x] call BIS_fnc_dirTo) + 180;
	_dirArray pushBack [_forEachIndex,(_dir - 30),(_dir + 30)];
} forEach SEN_occupiedLocation;

for "_s" from 1 to 20 do {
	_sel = (_dirArray select floor (random (count _dirArray))) select 0;
	_spawnPos = [_pos,5000,6000,_dirArray select _sel] call SEN_fnc_findRandomPos;
	{if (_spawnPos distance (getpos _x) < (SEN_range*0.2 max 2500)) exitWith {_spawnPos = [0,0,0]}} forEach SEN_occupiedLocation;
	if !(_spawnPos isEqualTo [0,0,0]) exitWith {};
	uiSleep 0.1;
};
if (_spawnPos isEqualTo [0,0,0]) then {
	["fn_transportHandler: Finding random position."] call SEN_fnc_log;
	_spawnPos = [_pos,5000,6000] call SEN_fnc_findRandomPos;
};

// spawn transport
_transport = createVehicle [_type,_spawnPos,[],0,"FLY"];
_transport setVariable ["SEN_vehCacheDisable", true];
_pilot = createGroup WEST createUnit ["B_Helipilot_F",_spawnPos, [], 0, "NONE"];
_pilot moveInDriver _transport;
_pilot allowfleeing 0;
_pilot setBehaviour "CARELESS";
_pilot disableAI "FSM";
_transport enableCopilot false;
_transport flyInHeight 100;

_hlz = createMarker [format["%1_hlz",_transport],_pos];
_hlz setMarkerType "mil_dot";
_hlz setMarkerColor "ColorWEST";
_hlz setMarkerText "TRANSPORT HLZ";
_hlz setmarkerAlpha 1;
_mrk = createMarker [format["%1_mrk",_transport],[0,0,0]];
_mrk setMarkerType "b_air";
_mrk setMarkerColor "ColorWEST";
//_mrk setMarkerAlpha 0;

// send transport and watch if destroyed
_helipad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
"SEN_transportAcknowledged" remoteExecCall ["playSound", units (group _requestor), false];
_transport doMove _pos;

// disable and marker position PFH
[{
	params ["_args","_id"];
	_args params ["_transport","_requestor","_pilot","_mrk","_hlz","_helipad"];

	if !((missionNameSpace getVariable ["SEN_transportReady",0]) isEqualTo 0) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	if (!alive _pilot || {vehicle _pilot isEqualTo _pilot} || {isTouchingGround _transport && (!(canMove _transport) || (fuel _transport isEqualTo 0))}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		if (!isNull _helipad) then {deletevehicle _helipad};
		deleteMarker _mrk;
		deleteMarker _hlz;
		_pilot call SEN_fnc_cleanup;
		_transport call SEN_fnc_cleanup;
		"SEN_transportDestroyed" remoteExecCall ["playSound", units (group _requestor), false];
		[{
			params ["_args","_id"];
			_args params ["_time"];

			if (diag_tickTime >= _time) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				SET_TRANSPORTREADY
			};
		}, 1, [diag_tickTime + 300]] call CBA_fnc_addPerFrameHandler;
	};

	_mrk setMarkerPos (getposATL _transport);
}, 1, [_transport,_requestor,_pilot,_mrk,_hlz,_helipad]] call CBA_fnc_addPerFrameHandler;

waitUntil {uiSleep 1; (unitReady _pilot)};

uiSleep 1;
_transport land "LAND";

waitUntil {uiSleep 1; (isTouchingGround _transport)};

// wait _t until any player in copilot
_t = time;
_transport engineOn true;
deleteVehicle _helipad;

waitUntil {uiSleep 1; (isPlayer (_transport turretUnit [0]) || time > (_t + 180))};

if !(isPlayer (_transport turretUnit [0])) exitWith {
	"Transport HLZ not selected. Transport returning to base." remoteExecCall ["hintSilent", crew _transport, false];
	{if (isPlayer _x) then {moveOut _x}} forEach (crew _transport);
	_transport doMove [0,0,0];

	waitUntil {uiSleep 10; (count ([getposATL _transport,1000] call SEN_fnc_getNearPlayers) isEqualTo 0 || (_transport distance [0,0,100] < 500))};

	deleteMarker _hlz;
	deleteMarker _mrk;
	missionNameSpace setVariable ["SEN_transportReady", -1];
	uiSleep 5;
	deleteVehicle _pilot;
	deleteVehicle _transport;
	uiSleep 300;
	SET_TRANSPORTREADY
};

_coPilot = _transport turretUnit [0];
missionNamespace setVariable ["SEN_transportResponse", nil];
[_type,_size] remoteExecCall ["SEN_fnc_transportResponse", owner _coPilot, false];

waitUntil {uiSleep 1; !isNil "SEN_transportResponse"};

_pos = missionnamespace getVariable ["SEN_transportResponse", []];

if (_pos isEqualTo []) exitWith {
	"Transport HLZ not selected. Transport returning to base." remoteExecCall ["hintSilent", crew _transport, false];
	{if (isPlayer _x) then {moveOut _x}} forEach (crew _transport);
	_transport doMove [0,0,0];

	waitUntil {uiSleep 10; (count ([getposATL _transport,1000] call SEN_fnc_getNearPlayers) isEqualTo 0 || (_transport distance [0,0,100] < 500))};

	deleteMarker _hlz;
	deleteMarker _mrk;
	missionNameSpace setVariable ["SEN_transportReady", -1];
	uiSleep 5;
	deleteVehicle _pilot;
	deleteVehicle _transport;
	uiSleep 300;
	SET_TRANSPORTREADY
};

// check if near FOB and has helipad
if (GET_FOBDEPLOYED) then {
	if (_pos distance2D getMarkerPos "sen_fob_mrk" < 100) then {
		_helipadPos = [_lz] call SEN_fnc_getNearHelipad;
		if !(_helipadPos isEqualTo []) then {
			_pos = _helipadPos;
		};
	};
};

"SEN_transportWelcome" remoteExecCall ["playSound", crew _transport, false];
_hlz setMarkerPos _pos;
_transport doMove _pos;
_helipad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];

waitUntil {uiSleep 1; (unitReady _pilot)};

uiSleep 1;
_transport land "LAND";

waitUntil {uiSleep 1; (isTouchingGround _transport)};

_t = time;
deleteVehicle _helipad;
"SEN_transportAccomplished" remoteExecCall ["playSound", crew _transport, false];

waitUntil {uiSleep 1; ({isPlayer _x} count (crew _transport) isEqualTo 0 || time > _t + 10)};

uiSleep 2;
{if (isPlayer _x) then {moveOut _x}} forEach (crew _transport);
_transport doMove [0,0,0];

waitUntil {uiSleep 10; (count ([getposATL _transport,1000] call SEN_fnc_getNearPlayers) isEqualTo 0 || (_transport distance [0,0,100] < 500))};

deleteMarker _hlz;
deleteMarker _mrk;
missionNameSpace setVariable ["SEN_transportReady", -1];
uiSleep 5;
{deleteVehicle _x} forEach (crew _transport);
deleteVehicle _transport;
uiSleep 300;
SET_TRANSPORTREADY