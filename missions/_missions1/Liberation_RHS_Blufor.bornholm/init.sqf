enableSaving [ false, false ];
enableSentences false;
enableRadio false;

["Preload"] call BIS_fnc_arsenal;

[] execVM "bon_recruit_units\init.sqf";
[] execVM "dun.sqf";
null=[]execVM"CRS\init.sqf";

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil {alive player};	
	#include "bon_recruit_units\addrecruit.sqf";
	if (debug_source != name player) then {debug_source = name player};
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1700;
};