if (!isServer) exitWith {};

// Initialize data
[] call (compileFinal preprocessFileLineNumbers "data\CfgVariables.sqf");
EVOR_list_BaseCore			= [] call (compileFinal preprocessFileLineNumbers "data\list_BaseCore.sqf");
EVOR_list_BaseService		= [] call (compileFinal preprocessFileLineNumbers "data\list_BaseService.sqf");
EVOR_list_BaseNames			= [] call (compileFinal preprocessFileLineNumbers "data\list_BaseNames.sqf");
EVOR_list_ObjectiveUnits	= [] call (compileFinal preprocessFileLineNumbers "data\list_ObjectiveUnits.sqf");
EVOR_list_ObjectiveQueue	= [EVOR_var_ObjNumber,EVOR_var_ObjAirfChance] call EVOR_fnc_objQueue;
publicVariable "EVOR_list_BaseCore";
publicVariable "EVOR_list_BaseService";
if (!hasInterface) then {
	EVOR_list_ShopGear		= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopGear.sqf");
	EVOR_list_ShopVeh		= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopVeh.sqf");
	EVOR_list_ShopUnit		= [] call (compileFinal preprocessFileLineNumbers "data\list_ShopUnit.sqf");
	[] call EVOR_fnc_listChange;	// Changes data lists (Casual + ACE)
};

waitUntil {time > 0};

// Environment
enableEnvironment [false,true];
private _startTime = ["param1",dayTime] call BIS_fnc_getParamValue;
_startTime = [_startTime,floor random 24] select (_startTime < 0);
skipTime (_startTime - dayTime);
setTimeMultiplier (["param2",1] call BIS_fnc_getParamValue);
60 setFog 0;

// ACE logistics
if (EVOR_var_EnabledAceMedic) then {
	private _cfgVehicles = configFile >> "CfgVehicles";
	{
		if (1 == getNumber (_cfgVehicles >> typeOf _x >> "attendant")) then {
			_x setVariable ["ace_medical_isMedicalFacility",1,true];
		};
	} forEach allMissionObjects "Building";
};

// Start cleanup and respawn scripts
[] spawn EVOR_fnc_manageRespawn;
[] spawn EVOR_fnc_manageCleanup;

// Kill disconnected units
addMissionEventHandler ["HandleDisconnect",{deleteVehicle (_this select 0);}];

// Start scripts
["Initialize"] call BIS_fnc_dynamicGroups;
[] spawn EVOR_fnc_scoreTicker;
[] call EVOR_fnc_objCreate;