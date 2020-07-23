disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlCombo = param [0,controlNull,[controlNull]];

private _dlgFunds		= "EVOR_dlg_funds";
private _cfgFunds		= missionConfigFile >> _dlgFunds;

{
	_ctrlCombo lbAdd str _x;
	_ctrlCombo lbSetValue [_forEachIndex,_x];
} forEach getArray (_cfgFunds >> "transferScoreValues");