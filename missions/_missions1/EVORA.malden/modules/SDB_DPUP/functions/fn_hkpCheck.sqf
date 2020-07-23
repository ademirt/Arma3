scriptName _fnc_scriptName;

private _veh = param [0,objNull,[objNull]];
private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cfgDPUP = missionConfigFile >> "DPUP";
private _cfgDPUPVeh = _cfgDPUP >> "CfgVehicles" >> typeOf _veh;
private _hkpOverride = [_cfgDPUPVeh,"hkpOverride",0 min getNumber (_cfgDPUP >> "hkpOverride")] call BIS_fnc_returnConfigEntry;

if (_hkpOverride == 0) then {
	// If vehicle is configured, give HKP
	private _configured = isClass _cfgDPUPVeh;

	if (_configured) then {_hkpOverride = 1;};
};

private _result = switch (_hkpOverride) do {
	case 1: {"if (local (_this select 1)) then {_this remoteExec ['DPUP_fnc_hkpTrigger',_this select 3,false];};"};
	default {nil};
};

_result;