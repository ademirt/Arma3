/*
Author: SENSEI

Last modified: 10/2/2015

Description: assigns acre radio

Return: nothing
__________________________________________________________________*/
private ["_backpack","_role","_supportRadioName","_commandRadioName","_squadRadioName","_radioInInv"];

_radioInInv = [];
_backpack = "B_Kitbag_cbr";
_role = roleDescription player;
_supportRadioName = [configFile >> "cfgWeapons" >> SEN_ACRE_SUPR] call BIS_fnc_displayName;
_commandRadioName = [configFile >> "cfgWeapons" >> SEN_ACRE_CR] call BIS_fnc_displayName;
_squadRadioName = [configFile >> "cfgWeapons" >> SEN_ACRE_SR] call BIS_fnc_displayName;

{player removeItem _x} forEach (call acre_api_fnc_getCurrentRadioList);

call {
	if (player getvariable ["SEN_commNet",""] isEqualTo "command") exitWith {
		if (player canAdd SEN_ACRE_SR) then {
			player addItem SEN_ACRE_SR;
		} else {
			if ((backpack player) isEqualTo "") then {
				player addBackpack _backpack;
				player addItem SEN_ACRE_SR;
			};
		};

		if (player canAdd SEN_ACRE_CR) then {
			player addItem SEN_ACRE_CR;
		} else {
			if ((backpack player) isEqualTo "") then {
				player addBackpack _backpack;
				player addItem SEN_ACRE_CR;
			};
		};

		waitUntil {sleep 0.1; [] call acre_api_fnc_isInitialized};

		call {
			{_radioInInv pushBack ([_x] call acre_api_fnc_getBaseRadio)} forEach ([] call acre_api_fnc_getCurrentRadioList);

			if (_radioInInv isEqualTo []) exitWith {hintSilent "Cannot add ACRE2 radios to inventory\nComm Net Access: NONE"};
			if (SEN_ACRE_SR in _radioInInv && {SEN_ACRE_CR in _radioInInv}) exitWith {hintSilent format ["%3:\nRadios in inventory: %1\n%2\nComm Net Access: COMMAND, SQUAD",_commandRadioName,_squadRadioName,_role];};
			if (SEN_ACRE_SR in _radioInInv && {!(SEN_ACRE_CR in _radioInInv)}) exitWith {hintSilent format ["%2:\nRadios in inventory: %1\nComm Net Access: SQUAD",_squadRadioName,_role];};
			if (!(SEN_ACRE_SR in _radioInInv) && {SEN_ACRE_CR in _radioInInv}) exitWith {hintSilent format ["%2:\nRadios in inventory: %1\nComm Net Access: COMMAND",_commandRadioName,_role];};
		};
	};

	if (player getvariable ["SEN_commNet",""] isEqualTo "support") exitWith {
		if (player canAdd SEN_ACRE_SR) then {
			player addItem SEN_ACRE_SR;
		} else {
			if ((backpack player) isEqualTo "") then {
				player addBackpack _backpack;
				player addItem SEN_ACRE_SR;
			};
		};

		if (player canAddItemToBackpack SEN_ACRE_SUPR) then {
			player addItemToBackpack SEN_ACRE_SUPR;
		} else {
			if ((backpack player) isEqualTo "") then {
				player addBackpack _backpack;
				player addItemToBackpack SEN_ACRE_SUPR;
			};
		};

		waitUntil {sleep 0.1; [] call acre_api_fnc_isInitialized};

		call {
			{_radioInInv pushBack ([_x] call acre_api_fnc_getBaseRadio)} forEach ([] call acre_api_fnc_getCurrentRadioList);

			if (_radioInInv isEqualTo []) exitWith {hintSilent "Cannot add ACRE2 radios to inventory\nComm Net Access: NONE"};
			if (SEN_ACRE_SR in _radioInInv && {SEN_ACRE_SUPR in _radioInInv}) exitWith {hintSilent format ["%3:\nRadios in inventory: %1\n%2\nComm Net Access: SUPPORT, SQUAD",_supportRadioName,_squadRadioName,_role];};
			if (SEN_ACRE_SR in _radioInInv && {!(SEN_ACRE_SUPR in _radioInInv)}) exitWith {hintSilent format ["%2:\nRadios in inventory: %1\nComm Net Access: SQUAD",_squadRadioName,_role];};
			if (!(SEN_ACRE_SR in _radioInInv) && {SEN_ACRE_SUPR in _radioInInv}) exitWith {hintSilent format ["%2:\nRadios in inventory: %1\nComm Net Access: SUPPORT",_supportRadioName,_role];};
		};
	};

	if (player getvariable ["SEN_commNet",""] isEqualTo "squad") exitWith {
		if (player canAdd SEN_ACRE_SR) then {
			player addItem SEN_ACRE_SR;
		} else {
			if ((backpack player) isEqualTo "") then {
				player addBackpack _backpack;
				player addItem SEN_ACRE_SR;
			};
		};

		waitUntil {sleep 0.1; [] call acre_api_fnc_isInitialized};

		call {
			{_radioInInv pushBack ([_x] call acre_api_fnc_getBaseRadio)} forEach ([] call acre_api_fnc_getCurrentRadioList);

			if (_radioInInv isEqualTo []) exitWith {hintSilent "Cannot add ACRE2 radios to inventory\nComm Net Access: NONE"};
			hintSilent format ["%2:\nRadios in inventory: %1\nComm Net Access: SQUAD",_squadRadioName,_role];
		};
	};
};

// set channels
if (player getvariable ["SEN_commNet",""] isEqualTo "command" && {SEN_ACRE_CR in _radioInInv}) then {
	[([SEN_ACRE_CR] call acre_api_fnc_getRadioByType), 1] call acre_api_fnc_setRadioChannel;
};
if (player getvariable ["SEN_commNet",""] isEqualTo "support" && {SEN_ACRE_SUPR in _radioInInv}) then {
	[([SEN_ACRE_SUPR] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel;
};
if (player getvariable ["SEN_team",""] isEqualTo "plt" && {SEN_ACRE_SR in _radioInInv}) exitWith {
	[([SEN_ACRE_SR] call acre_api_fnc_getRadioByType), 1] call acre_api_fnc_setRadioChannel;
};
if (player getvariable ["SEN_team",""] isEqualTo "a" || {player getvariable ["SEN_team",""] isEqualTo "a1"} || {player getvariable ["SEN_team",""] isEqualTo "a2"}) exitWith {
	if (SEN_ACRE_SR in _radioInInv) then {
		[([SEN_ACRE_SR] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel;
	};
};
if (player getvariable ["SEN_team",""] isEqualTo "b" || {player getvariable ["SEN_team",""] isEqualTo "b1"} || {player getvariable ["SEN_team",""] isEqualTo "b2"}) exitWith {
	if (SEN_ACRE_SR in _radioInInv) then {
		[([SEN_ACRE_SR] call acre_api_fnc_getRadioByType), 3] call acre_api_fnc_setRadioChannel;
	};
};
if (player getvariable ["SEN_team",""] isEqualTo "rh1") exitWith {
	if (SEN_ACRE_SR in _radioInInv) then {
		[([SEN_ACRE_SR] call acre_api_fnc_getRadioByType), 4] call acre_api_fnc_setRadioChannel;
	};
};
if (player getvariable ["SEN_team",""] isEqualTo "r") exitWith {
	if (SEN_ACRE_SR in _radioInInv) then {
		[([SEN_ACRE_SR] call acre_api_fnc_getRadioByType), 5] call acre_api_fnc_setRadioChannel;
	};
};