disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlButton = param [0,controlNull,[controlNull]];
private _display = ctrlParent _ctrlButton;
private _displayMain = displayParent _display;

private _cfgTransportCtrls = missionconfigfile >> "EVOR_dlg_transport" >> "controls";
private _ctrlListNBox = _display displayCtrl getNumber (_cfgTransportCtrls >> "list" >> "idc");
private _lnbData = _ctrlListNBox lnbData [lnbCurSelRow _ctrlListNBox,0];

[_lnbData] spawn EVOR_fnc_teleport;

_display closeDisplay 0;
_displayMain closeDisplay 0;