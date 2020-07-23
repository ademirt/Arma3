scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

disableSerialization;

private _roleOld = param [0,[objNull,[]],[[]]];
private _roleNew = param [1,[] call DPUP_fnc_getTurretCamera,[[]]];
private _vehOld = _roleOld select 0;
private _vehNew = _roleNew select 0;

private _cfgVehNew = configFile >> "CfgVehicles" >> typeOf _vehNew;
private _cfgDPUPVehOld = missionConfigFile >> "DPUP" >> "CfgVehicles" >> typeOf _vehOld;
private _cfgDPUPVehNew = missionConfigFile >> "DPUP" >> "CfgVehicles" >> typeOf _vehNew;

if (((!isClass _cfgDPUPVehNew) and {!isClass _cfgDPUPVehOld}) or {_vehNew == player}) exitWith {};

private _display = _roleNew call DPUP_fnc_hkpDisplayCreate;
private _turretFixed = ([_cfgDPUPVehNew,"hkpTurret",getNumber (_cfgVehNew >> "smokeLauncherOnTurret")] call BIS_fnc_returnConfigEntry) == 1;

private _script = {
	disableSerialization;
	params ["_roleOld","_display","_turretFixed"];
	private _roleNew = [] call DPUP_fnc_getTurretCamera;
	
	if (_roleOld isEqualTo _roleNew) then {
		if ((cameraView == "GUNNER") and {!isTurnedOut ((_roleNew select 0) turretUnit (_roleNew select 1))}) then {
			[_display,"update",_roleNew select 0,_turretFixed] call DPUP_fnc_hkpDisplayAdjust;
		} else {
			[_display,"hide"] call DPUP_fnc_hkpDisplayAdjust;
		};
	} else {
		["DPUP_var_EHDisplay","onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		[_display,"delete"] call DPUP_fnc_hkpDisplayAdjust;
		[_roleOld,_roleNew] call DPUP_fnc_hkpDisplayInit;
	};
};

["DPUP_var_EHDisplay","onEachFrame",_script,[_roleNew,_display,_turretFixed]] call BIS_fnc_addStackedEventHandler;