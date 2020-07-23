disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _caller = param [1,player,[objNull]];

// Check which base the player is
private _baseIndex = EVOR_list_BaseCore findIf {_caller distance2D getMarkerPos (_x # 0) < (_x # 1)};
if (_baseIndex < 0) exitWith {};
private _baseName = toUpper markerText (EVOR_list_BaseCore select _baseIndex select 0);
private _text = format ["<t align = 'left'>WELCOME TO %1</t><t align = 'right'>%2</t>",_baseName,profileName];

private _dlgMenu = "EVOR_dlg_menu";
createDialog _dlgMenu;
private _display = uiNamespace getVariable _dlgMenu;

if (isNull _display) exitWith {};

private _cfgMenu		= missionConfigFile >> _dlgMenu;
private _cfgMenuCtrls	= _cfgMenu >> "controls";
private _ctrlTitle		= _display displayCtrl getNumber (_cfgMenuCtrls >> "title" >> "idc");
private _ctrlScore		= _display displayCtrl getNumber (_cfgMenuCtrls >> "score" >> "idc");
private _ctrlNumber		= _display displayCtrl getNumber (_cfgMenuCtrls >> "valueStateNumber" >> "idc");
private _ctrlCurrent	= _display displayCtrl getNumber (_cfgMenuCtrls >> "valueStateCurrent" >> "idc");
private _ctrlTower		= _display displayCtrl getNumber (_cfgMenuCtrls >> "valueStateTower" >> "idc");

// Set headers
_ctrlTitle ctrlSetStructuredText parseText _text;
[_ctrlScore] spawn EVOR_fnc_dlgDisplayScore;

// Set mission progress
private _progress = missionNamespace getVariable ["EVOR_var_ObjState",[0,0,"",objNull]];

_ctrlNumber ctrlSetStructuredText parseText format ["<t align = 'left'>%1/%2</t>",_progress select 0,_progress select 1];
_ctrlCurrent ctrlSetStructuredText parseText format ["<t align = 'left'>%1</t>",_progress select 2];
_ctrlTower ctrlSetStructuredText parseText format ["<t align = 'left'>%1</t>",["Destroyed","Intact"] select alive (_progress select 3)];