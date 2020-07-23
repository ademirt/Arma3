disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrl = param [0,controlNull,[controlNull]];

while {!isNull _ctrl} do {
	_ctrl ctrlSetStructuredText parseText format ["<t align = 'right'>FPS: %1 </t>",floor diag_fps];
	uiSleep 1;
};