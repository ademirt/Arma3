disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {[controlNull,controlNull]};

private _dlgProgress = "EVOR_rsc_progress";
_dlgProgress cutRsc [_dlgProgress,"PLAIN"];
private _display = uiNamespace getVariable [_dlgProgress,displayNull];

if (isNull _display) exitWith {[controlNull,controlNull]};

private _cfgProgress =  missionConfigFile >> "RscTitles" >> _dlgProgress;
private _ctrlText = _display displayCtrl getNumber (_cfgProgress >> "text" >> "idc");
private _ctrlBar = _display displayCtrl getNumber (_cfgProgress >> "bar" >> "idc");

[_ctrlText,_ctrlBar];