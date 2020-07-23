disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlCombo = param [0,controlNull,[controlNull]];
private _index = param [1,0,[0,configNull]];

private _dlgSettings = "EVOR_dlg_settings";
private _cfgSettings = missionConfigFile >> _dlgSettings;

if (_index isEqualType 0) then {	// Selection changed
	missionNamespace setVariable ["EVOR_var_Mark3DRange",_ctrlCombo lbValue _index,false];
} else {	// Init
	private _range = missionNamespace getVariable ["EVOR_var_Mark3DRange",2000];
	
	{
		_ctrlCombo lbAdd str _x;
		_ctrlCombo lbSetValue [_forEachIndex,_x];
		if (_x == _range) then {_ctrlCombo lbSetCurSel _forEachIndex;};
	} forEach getArray (_cfgSettings >> "mark3DRangeValues");
};