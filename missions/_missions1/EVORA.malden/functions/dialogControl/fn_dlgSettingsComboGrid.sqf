disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlCombo = param [0,controlNull,[controlNull]];
private _index = param [1,0,[0,configNull]];

private _dlgSettings = "EVOR_dlg_settings";
private _cfgSettings = missionConfigFile >> _dlgSettings;

if (_index isEqualType 0) then {	// Selection changed
    setTerrainGrid (_ctrlCombo lbValue _index); 
} else {	// Init
	{
		_ctrlCombo lbAdd _x;
		_ctrlCombo lbSetValue [_forEachIndex,50*0.5^_forEachIndex];
	} forEach getArray (_cfgSettings >> "visTerrainValues");
};