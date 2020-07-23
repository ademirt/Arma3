/*
Author: SENSEI

Last modified: 6/27/2015

Description: setup acre2 presets

Note: created with ACRE2 2.1.0.811 / TS 3.0.16
__________________________________________________________________*/
waitUntil {sleep 0.1; [] call acre_api_fnc_isInitialized};

SEN_ACRE_CR = "ACRE_PRC152"; // you can use "ACRE_PRC148" or "ACRE_PRC152"
SEN_ACRE_SR = "ACRE_PRC343"; // don't change
SEN_ACRE_SUPR = "ACRE_PRC117F"; // don't change

[SEN_ACRE_CR, "default", "SEN_preset"] call acre_api_fnc_copyPreset;
[SEN_ACRE_SR, "default", "SEN_preset"] call acre_api_fnc_copyPreset;
[SEN_ACRE_SUPR, "default", "SEN_preset"] call acre_api_fnc_copyPreset;

// setup labels
call {
	if (SEN_ACRE_CR isEqualTo "ACRE_PRC148") exitWith {
		[SEN_ACRE_CR, "SEN_preset", 1, "label", "COMMAND"] call acre_api_fnc_setPresetChannelField;
		[SEN_ACRE_CR, "SEN_preset", 2, "label", "SUPPORT"] call acre_api_fnc_setPresetChannelField;
	};
	if (SEN_ACRE_CR isEqualTo "ACRE_PRC152") exitWith {
		[SEN_ACRE_CR, "SEN_preset", 1, "description", "COMMAND"] call acre_api_fnc_setPresetChannelField;
		[SEN_ACRE_CR, "SEN_preset", 2, "description", "SUPPORT"] call acre_api_fnc_setPresetChannelField;
	};
	["Incorrect channel data for SEN_ACRE_CR."] call SEN_fnc_log;
};

[SEN_ACRE_SUPR, "SEN_preset", 1, "name", "COMMAND"] call acre_api_fnc_setPresetChannelField;
[SEN_ACRE_SUPR, "SEN_preset", 2, "name", "SUPPORT"] call acre_api_fnc_setPresetChannelField;

[SEN_ACRE_SR, "SEN_preset"] call acre_api_fnc_setPreset;
[SEN_ACRE_CR, "SEN_preset"] call acre_api_fnc_setPreset;
[SEN_ACRE_SUPR, "SEN_preset"] call acre_api_fnc_setPreset;

call SEN_fnc_setRadioACRE;