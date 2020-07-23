disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlListNBox = param [0,controlNull,[controlNull]];
private _row = param [1,0,[0]];
private _display = ctrlParent _ctrlListNBox;

private _cfgTransportCtrls = missionconfigfile >> "EVOR_dlg_transport" >> "controls";
private _ctrlMap = _display displayCtrl getNumber (_cfgTransportCtrls >> "map" >> "idc");
private _ctrlButton = _display displayCtrl getNumber (_cfgTransportCtrls >> "buttonTravel" >> "idc");

// Check if target is teleport flag or HALO
private _lnbData = _ctrlListNBox lnbData [_row,0];
private _basesMarkers = EVOR_list_BaseCore apply {_x select 0};
private _baseIndex = _basesMarkers findIf {_x == _lnbData};
private _target = if (_baseIndex >= 0) then {
	getMarkerPos (_basesMarkers select _baseIndex);
} else {
	leader player;
};

_ctrlButton ctrlEnable true;
_ctrlMap ctrlMapAnimAdd [2,0.05,_target];
ctrlMapAnimCommit _ctrlMap;