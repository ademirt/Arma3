enableSaving [ false, false ];
enableSentences false;
enableRadio false;

_lt = execVM "=BTC=_Logistic\=BTC=_logistic_init.sqf";
[] execVM "bon_recruit_units\init.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

if ( GRLIB_revive > 0 ) then {
	[] execVM "FAR_revive\FAR_revive_init.sqf";
};
[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
	fn_set_radio_tfar_freq = {
		if (isClass (configfile >> "CfgPatches" >> "task_force_radio")) then
		{			
			_s = [(call TFAR_fnc_activeSwRadio), 1, '66.6'] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_f1nc_activeSwRadio), _s] call TFAR_fnc_setSwSettings;
			
			_st = [(call TFAR_fnc_activeLrRadio),1, '77.7'] call TFAR_fnc_SetChannelFrequency;
			[(call TFAR_f1nc_activeSwRadio), _st] call TFAR_fnc_setSwSettings;
		};
	};
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
	#include "bon_recruit_units\addrecruit.sqf"	
	player addEventHandler ["InventoryOpened", {call fn_set_radio_tfar_freq;}];
} else {
	setViewDistance 1600;
};