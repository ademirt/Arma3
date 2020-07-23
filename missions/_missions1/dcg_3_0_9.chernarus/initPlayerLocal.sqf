/*
Author: SENSEI

Last modified: 9/14/2015

Note: init order not guaranteed
__________________________________________________________________*/
if !(hasInterface) exitWith {}; // headless client exit

#include "data\define.hpp"

startLoadingScreen ["Loading DCG"];

waitUntil {sleep 0.1; SEN_complete > 0};

// compile parameters
{call compileFinal _x} forEach SEN_PVArray;

// setup debug
if (GET_DEBUG) then {
	player setVariable ["ace_medical_allowDamage", false];
	player addEventHandler ["handleDamage",{false}];
};

// setup comm net
// _role refers to player's role/slot - ex. "plt_co" is Platoon Commander
// _prefix refers to player's team - ex. "plt" is Platoon fireteam

// more comm net settings in files listed below
	// scripts\SEN_TFAR.sqf
	// fnc\fn_setRadioTFAR.sqf
	// scripts\SEN_ACRE2.sqf
	// fnc\fn_setRadioACRE.sqf

_commandNet = ["plt_co","a_sl","b_sl"]; // players allowed on command net, all other players are on squad specific net
_supportNet = ["plt_sgt","r","rh1"]; // players allowed on support net, all other players are on squad specific net

// set prefix variable
private "_prefix";

_role = str player;

for "_i" from 1 to (count _role) do { // move through unit name until underscore found. Anything preceeding underscore is _prefix
	if ((_role select [_i,1]) isEqualTo "_") exitWith {
		_prefix = _role select [0,_i];
	};
};

player setVariable ["SEN_team",_prefix];

// set comm net variable
call {
	if (_role in _commandNet || {_prefix in _commandNet}) exitWith {player setVariable ["SEN_commNet","command"]};
	if (_role in _supportNet || {_prefix in _supportNet}) exitWith {player setVariable ["SEN_commNet","support"]};
	player setVariable ["SEN_commNet","squad"];
};

// setup PFH
call compile preprocessFileLineNumbers "scripts\VehicleHud\hud_teamlist.sqf";

if (SEN_disableCamera isEqualTo 1) then {
	[{
		if (cameraOn isEqualTo player && {cameraView isEqualTo "EXTERNAL"}) then {
			hintSilent "Third person camera is disabled.";
			player switchCamera "INTERNAL";
		};
	}, 1, []] call CBA_fnc_addPerFrameHandler;
};

if !(GET_DEBUG) then {
	player setVariable ["SEN_inSafezone",0];
	[{
	    if (player distance (getMarkerPos "SEN_safezone_mrk") < (getMarkerSize "SEN_safezone_mrk") select 0) then {
	        if ((player getVariable ["SEN_inSafezone",0]) isEqualTo 0) then {
	        	player setVariable ["SEN_inSafezone",1];
	        	player setVariable ["ace_medical_allowDamage", false];
	            player allowDamage false;
	            if !(currentWeapon player in (player getVariable ["ace_safemode_safedweapons",[]])) then {
	            	[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
	            };
	        };
	    } else {
	        if ((player getVariable ["SEN_inSafezone",0]) isEqualTo 1) then {
	        	player setVariable ["SEN_inSafezone",0];
	        	player setVariable ["ace_medical_allowDamage", true];
	            player allowDamage true;
	            if (currentWeapon player in (player getVariable ["ace_safemode_safedweapons",[]])) then {
	            	[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
	            };
	        };
	    };
	}, 5, []] call CBA_fnc_addPerFrameHandler;
};

endLoadingScreen;

waitUntil {sleep 0.1; !isNull (findDisplay 46)};

// setup radios
SEN_acreEnabled = isClass (configfile >> "CfgPatches" >> "acre_main");
SEN_tfarEnabled = isClass (configfile >> "CfgPatches" >> "task_force_radio");

// workaround for acre, if inventory full and can't add radio, acre throws rpt error: (Warning: Radio ID ACRE_PRC343_ID_1 was returned for a non-existent baseclass...)
if ((backpack player) isEqualTo "") then {player addBackpack "B_Kitbag_cbr"};
[] spawn {
	sleep 5;
	if (SEN_tfarEnabled) then {
		execVM "scripts\SEN_TFAR.sqf";
	};
	if (SEN_acreEnabled) then {
		execVM "scripts\SEN_ACRE2.sqf";
	};
};

// setup ACE3
// must run after radio setup
execVM "scripts\SEN_ACE3Actions.sqf";
if (ACE_medical_level isEqualTo 1) then { // if basic medical is used set all players as medic
	player setVariable ["ACE_medical_medicClass", 1];
};

// misc settings
// must run after radio setup
player addRating 99999999;
SEN_civQuestioned = [];
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

player addEventHandler ["respawn",{
	deleteVehicle (_this select 1);
	[(_this select 0), currentWeapon (_this select 0), currentMuzzle (_this select 0)] call ace_safemode_fnc_lockSafety;
	(_this select 0) setVariable ["SEN_inSafezone",0];
	
	if (SEN_acreEnabled) then {
		[] spawn {
			call SEN_fnc_setRadioACRE;
		};
	};
}];

#include "bon_recruit_units\addrecruit.sqf"
player enableFatigue false;
player enableStamina false;
player setCustomAimCoef 0.3;
player setUnitRecoilCoefficient 0.4;

/* player addEventHandler ["respawn",{
	player enableFatigue false;
	player enableStamina false;
	player setCustomAimCoef 0.3;
    player setUnitRecoilCoefficient 0.4;
	[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;
}]; */

// setup briefing
[] spawn {
	// _fixMenu = "<execute expression ='[] call compile preprocessFileLineNumbers ""\z\ace\addons\interact_menu\XEH_clientInit.sqf"";'>Force Load ACE Interaction Menu<execute/>"; // doesn't work
	_openFM = "<execute expression ='[] spawn {openMap [false, false]; (findDisplay 46) createDisplay ""RscDisplayFieldManual""}'>Open Field Manual<execute/>";

	player createDiaryRecord ["Diary", ["Special Thanks", "<br/>
			Bohemia Interactive<br/><br/>
			Tier1Ops<br/><br/>
			CAVE Gaming Community<br/><br/>
			Casual Arma Players<br/><br/>
			ACE3"]
	];
	player createDiaryRecord ["Diary", ["External Content", "<br/>
			ACE3 by ACE3 Dev Team<br/><br/>
			VVS by Tonic<br/><br/>
			ZBE Caching by Zorrobyte<br/><br/>
			Vehicle HUD script by Tier1ops<br/><br/>
			X-Cam by Siloa<br/><br/>
			Defuse the bomb by cobra4v320"]
	];
	player createDiaryRecord ["Diary", ["DCG Mission Info", format ["<br/>
		Author: SENSEI<br/><br/>
		Version: 3.0.9<br/><br/>
		Known Issues:<br/>
		ACE_server.pbo overwrites ACE variables set by DCG. Recommend not to use ACE_server.pbo<br/>
		ACE interaction menu may not initialize at mission start, ACE3 Github issue #1171<br/><br/>
		License:<br/>
		Copyright 2015 Nicholas Clark (SENSEI). All rights reserved.<br/>
		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.<br/>
		To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.<br/><br/>
		%1<br/>
		",_openFM]]
	];
	sleep 2;
	closeDialog 0;
	_ret = [
		parseText "<img size='3' valign='top' align='center' image='media\SEN_imgLogo.paa'/><br/><br/><t align='center'>Please refer to the Field Manual in your ACE interaction menu for mission details.</t><br/><br/><t align='center'>Installed Version: 3.0.9</t><br/><t align='center'><a color='#FFCC66' href='https://www.dropbox.com/sh/k1ykwhw8wgvfmir/AADfOghkU3jLi0G9IWj8VGCva?dl=0'>Click Here for Download Archive</a></t>",
		"Welcome to Dynamic Combat Generator",
		"Field Manual",
		"Continue"
	] call bis_fnc_GUImessage;
	if (_ret) then {(findDisplay 46) createDisplay "RscDisplayFieldManual"};
};
/*sleep 10;
[{
	hintSilent "DCG 3.0.9 RC3\nRELEASE CANDIDATE FOR PRIVATE USE ONLY!";
}, 600, []] call CBA_fnc_addPerFrameHandler;*/