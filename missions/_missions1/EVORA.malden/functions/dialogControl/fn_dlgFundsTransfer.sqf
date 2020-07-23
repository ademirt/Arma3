disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlButton = param [0,controlNull,[controlNull]];
private _display = ctrlParent _ctrlButton;

private _dlgFunds		= "EVOR_dlg_funds";
private _cfgFunds		= missionConfigFile >> _dlgFunds;
private _cfgFundsCtrls	= _cfgFunds >> "controls";
private _ctrlCombo		= _display displayCtrl getNumber (_cfgFundsCtrls >> "combo" >> "idc");
private _ctrlListNBox	= _display displayCtrl getNumber (_cfgFundsCtrls >> "listNBox" >> "idc");

private _transferScore	= _ctrlCombo lbValue lbCurSel _ctrlCombo;
private _transferName	= _ctrlListNBox lnbText [lnbCurSelRow _ctrlListNBox,0];

private _targets = allPlayers - [player];
private _index = _targets findIf {_transferName == name _x};
if ((score player < _transferScore) or {_index < 0}) exitWith {};

[_transferScore,_targets select _index,player] remoteExecCall ["EVOR_fnc_scoreTransfer",2,false];