scriptName _fnc_scriptName;

private _veh = param [0,objNull,[objNull]];
private _forced = param [1,false,[false]];

// Determine HKP ammo count
private _cfgDPUP = missionConfigFile >> "DPUP";
private _cfgDPUPVeh = _cfgDPUP >> "CfgVehicles" >> typeOf _veh;

if (!isClass _cfgDPUPVeh) exitWith {};

private _ammoDefault = [_cfgDPUPVeh,"hkpAmmo",getNumber (_cfgDPUP >> "hkpAmmo")] call BIS_fnc_returnConfigEntry;
private _ammoCurrent = _veh getVariable "DPUP_var_HkpAmmo";

// Add HKP ammo
if (_forced or {isNil "_ammoCurrent"}) then {_veh setVariable ["DPUP_var_HkpAmmo",_ammoDefault,true];};