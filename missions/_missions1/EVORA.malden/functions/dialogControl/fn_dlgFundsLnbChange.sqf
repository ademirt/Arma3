disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlListNBox = param [0,controlNull,[controlNull]];
private _display = ctrlParent _ctrlListNBox;

private _dlgFunds		= "EVOR_dlg_funds";
private _cfgFunds		= missionConfigFile >> _dlgFunds;
private _cfgFundsCtrls	= _cfgFunds >> "controls";
private _ctrlButton		= _display displayCtrl getNumber (_cfgFundsCtrls >> "buttonTransfer" >> "idc");

_ctrlButton ctrlEnable true;