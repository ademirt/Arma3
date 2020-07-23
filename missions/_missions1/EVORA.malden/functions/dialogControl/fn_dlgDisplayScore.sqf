disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrl = param [0,controlNull,[controlNull]];

if (isMultiplayer) then {
	while {!isNull _ctrl} do {
		_ctrl ctrlSetStructuredText parseText format ["<t align = 'right'>FUNDS: %1 </t>",score player];
		uiSleep 0.5;
	};
} else {
	_ctrl ctrlSetStructuredText parseText format ["<t align = 'right'>FUNDS: %1 </t>","INF"];
};