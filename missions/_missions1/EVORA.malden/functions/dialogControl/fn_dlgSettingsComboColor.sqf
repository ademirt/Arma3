disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlCombo = param [0,controlNull,[controlNull]];
private _index = param [1,0,[0,configNull]];

private _dlgSettings = "EVOR_dlg_settings";
private _cfgSettings = missionConfigFile >> _dlgSettings;

if (_index isEqualType 0) then {	// Selection changed
	missionNamespace setVariable ["EVOR_var_Mark3DColor",_ctrlCombo lbColor _index,false];
} else {	// Init
	{
		_ctrlCombo lbAdd (_x select 0);
		_ctrlCombo lbSetColor [_forEachIndex,(_x select 1) call BIS_fnc_parseNumber];
	} forEach getArray (_cfgSettings >> "mark3DColorValues");
};