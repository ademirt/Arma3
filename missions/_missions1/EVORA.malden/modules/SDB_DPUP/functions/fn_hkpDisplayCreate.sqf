scriptName _fnc_scriptName;
if (!hasInterface) exitWith {displayNull;};

disableSerialization;

params ["_veh","_path"];

private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cfgDPUP =  missionConfigFile >> "DPUP";
private _cfgDPUPVeh = _cfgDPUP >> "CfgVehicles" >> typeOf _veh;

// Get RscIngame >> optics
private _cfgInfoType = _cfgVeh;
if (_path isEqualTo [-1]) then {
	_cfgInfoType = _cfgInfoType >> "driverWeaponsInfoType";
} else {
	{_cfgInfoType = (_cfgInfoType >> "turrets") select _x;} forEach _path;
	_cfgInfoType = _cfgInfoType >> "turretInfoType";
};
private _cfgOpticGroup = configFile >> "RscInGameUI" >> (getText _cfgInfoType) >> "CA_IGUI_elements_group";
private _cfgOpticTurret = _cfgOpticGroup >> "controls" >> "CA_turretIndicator";
private _cfgOpticHeading = _cfgOpticGroup >> "controls" >> "CA_Heading";

if ((!isClass _cfgOpticTurret) or {!isClass _cfgOpticHeading}) exitWith {displayNull;};

// Get display position & size
private _posGroup = ["x","y"] apply {getNumber (_cfgOpticGroup >> _x)};
private _posTurret = ["x","y"] apply {getNumber (_cfgOpticTurret >> _x)};
private _sizeTurret = ["w","h"] apply {getNumber (_cfgOpticTurret >> _x)};
_posTurret set [0,(_posTurret select 0) + (_posGroup select 0)];
_posTurret set [1,(_posTurret select 1) + (_posGroup select 1)];
_posTurret append _sizeTurret;

// Get display details
private _color = getArray (_cfgOpticHeading >> "colorText");
private _font = getText (_cfgOpticHeading >> "font");
private _sizeEx = getNumber (_cfgOpticHeading >> "sizeEx");

// Determine HKP-specific data
private _turret = ([_cfgDPUPVeh,"hkpTurret",getNumber (_cfgVeh >> "smokeLauncherOnTurret")] call BIS_fnc_returnConfigEntry) == 1;
private _angle = [_cfgDPUPVeh,"hkpAngle",getNumber (_cfgVeh >> "smokeLauncherAngle")] call BIS_fnc_returnConfigEntry;
private _angle = 15*floor(_angle/15);
private _iconSector = if ((15 <= _angle) and {_angle <= 360}) then {format ["\A3\Ui_f\data\IGUI\RscCustomInfo\Sensors\Sectors\sector%1_ca.paa",_angle]} else {""};
private _iconThreat = "\A3\Ui_f\data\IGUI\RscCustomInfo\Sensors\Threats\sector_ca.paa";

// Create display
"DPUP_RscHkpDisplay" cutRsc ["DPUP_RscHkpDisplay","PLAIN",-1,false];
private _disp = uiNamespace getVariable "DPUP_RscHkpDisplay";
private _ctrls = allControls _disp;

// Adjust sector control
private _ctrlSector = _ctrls select 0;
_ctrlSector ctrlSetPosition _posTurret;
_ctrlSector ctrlSetTextColor _color;
_ctrlSector ctrlSetText _iconSector;
_ctrlSector ctrlCommit 0;

// Adjust threat control
private _ctrlThreat = _ctrls select 1;
_ctrlThreat ctrlSetPosition _posTurret;
_ctrlThreat ctrlSetTextColor [1,0,0,1];
_ctrlThreat ctrlSetText _iconThreat;
_ctrlThreat ctrlShow false;
_ctrlThreat ctrlCommit 0;

// Adjust ammo control
private _ctrlAmmo = _ctrls select 2;
_ctrlAmmo ctrlSetPosition _posTurret;
_ctrlAmmo ctrlSetTextColor _color;
_ctrlAmmo ctrlSetFont _font;
_ctrlAmmo ctrlSetFontHeight _sizeEx;
_ctrlAmmo ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",0];
_ctrlAmmo ctrlCommit 0;

_disp;