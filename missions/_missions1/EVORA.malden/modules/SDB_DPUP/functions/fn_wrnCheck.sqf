scriptName _fnc_scriptName;

private _veh = param [0,objNull,[objNull]];
private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cfgDPUP = missionConfigFile >> "DPUP";
private _cfgDPUPVeh = _cfgDPUP >> "CfgVehicles" >> typeOf _veh;
private _wrnOverride = [_cfgDPUPVeh,"wrnOverride",getNumber (_cfgDPUP >> "wrnOverride")] call BIS_fnc_returnConfigEntry;

if (_wrnOverride == 0) then {
	// If a RWR sensor is present, give "Missile Warning"
	private _cfgSensors = _cfgVeh >> "Components" >> "SensorsManagerComponent" >> "Components";
	private _sensorPassive = ["PassiveRadarSensorComponent","PassiveRadarComponent"] findIf {isClass (_cfgSensors >> _x)} >= 0;
	private _sensorActive = ["ActiveRadarSensorComponent","ActiveRadarComponent"] findIf {isClass (_cfgSensors >> _x)} >= 0;
	
	if (_sensorPassive or _sensorActive) then {
		_wrnOverride = 3;
	} else {
		// Else if a thermal turret is present, give "Launch Warning"
		private _cfgTurrets = _veh call BIS_fnc_getTurrets;
		private _thermalCond = "'ti' in ((getArray (_x >> 'VisionMode')) apply {toLower _x})";
		private _thermalPilot = count (_thermalCond configClasses (_cfgVeh >> "pilotCamera" >> "OpticsIn")) > 0;
		private _thermalOptics = _cfgTurrets findIf {count (_thermalCond configClasses (_x >> "OpticsIn")) > 0} >= 0;
		private _thermalTurrets = _cfgTurrets findIf {"ti" in ((getArray (_x >> "ViewOptics" >> "VisionMode")) apply {toLower _x})} >= 0;
		
		if (_thermalPilot or _thermalOptics or _thermalTurrets) then {
			_wrnOverride = 2;
		} else {
			// Else if it is a military vehicle, give "Basic Warning"
			private _military = getNumber (_cfgVeh >> "Side") != 3;
			
			if (_military) then {_wrnOverride = 1;};
		};
	};
};

private _result = switch (_wrnOverride) do {
	case 1: {"_this call DPUP_fnc_wrnBasic;"};
	case 2: {"_this call DPUP_fnc_wrnLaunch;"};
	case 3: {"_this call DPUP_fnc_wrnMissile;"};
	default {nil};
};

_result;