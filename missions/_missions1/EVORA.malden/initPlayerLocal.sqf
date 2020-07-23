if (!hasInterface) exitWith {};

// Initialize data
[] call (compileFinal preprocessFileLineNumbers "data\CfgVariables.sqf");
EVOR_list_ShopGear	= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopGear.sqf");
EVOR_list_ShopVeh	= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopVeh.sqf");
EVOR_list_ShopUnit	= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopUnit.sqf");
[] call EVOR_fnc_listChange;	// Changes data lists (Casual + ACE)

waitUntil {!isNull player};

player enableFatigue false;
player setCustomAimCoef 0.4;
player setUnitRecoilCoefficient 0.5;

#include "bon_recruit_units\addrecruit.sqf";

[player,profileNamespace getVariable ["EVOR_var_HashClient",""]] remoteExec ["EVOR_fnc_sessionHashServer",2,false];

waitUntil {(time > 0) and {!isNil "EVOR_var_SessionJoinedBefore"}};

// Cinematic intro
private _handleIntro = if (isMultiplayer and {!EVOR_var_SessionJoinedBefore}) then {[EVOR_var_IntroMusic] spawn EVOR_fnc_cinematicIntro;} else {scriptNull;};

// Environment
enableEnvironment [false,true];
setViewDistance 3800;
setObjectViewDistance [2800,50];

// Start scripts
["InitializePlayer",[player]] call BIS_fnc_dynamicGroups;
[] call EVOR_fnc_initGear;
[] call EVOR_fnc_unlockUnit;
[] call EVOR_fnc_detectArsenal;
[] call EVOR_fnc_detectTeamKill;
[] call EVOR_fnc_detectVehEnter;
[] call EVOR_fnc_mark3D;
[] spawn EVOR_fnc_earplugs;
[] spawn EVOR_fnc_holster;
[] spawn EVOR_fnc_markMap;

// Initialize actions
if (playerSide isEqualTo EVOR_var_SideFriendly) then {[player] call EVOR_fnc_actNetwork;};
[player] call EVOR_fnc_actFlip;
[player] call EVOR_fnc_actPush;
[player] call EVOR_fnc_actServiceField;
[player] call EVOR_fnc_actHealOther;
[player] call EVOR_fnc_actHealSelf;

// Player traits
player setUnitTrait ["explosiveSpecialist",true];
player setUnitTrait ["UAVHacker",true];
player enableStamina EVOR_var_EnableStamina;
player setVehicleReceiveRemoteTargets true;
player setVehicleReportOwnPosition true;
player setVehicleReportRemoteTargets true;

// ACE traits
if (EVOR_var_EnabledAceMedic) then {player setVariable ["ACE_medical_medicClass",2,true];};
if (EVOR_var_EnabledAceRepair) then {player setVariable ["ACE_IsEngineer",0];};

waitUntil {scriptDone _handleIntro};

if (isMultiplayer and {!EVOR_var_SessionJoinedBefore}) then {[objNull,player] call EVOR_fnc_dlgMenuOpen;};