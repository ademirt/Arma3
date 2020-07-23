disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlCheck = param [0,controlNull,[controlNull]];
private _ctrlState = param [1,0,[0,configNull]];

if (_ctrlState isEqualType 0) then {	// State changed
	[_ctrlState == 1] call EVOR_fnc_mark3D;
} else {	// Init
	_ctrlCheck ctrlEnable (EVOR_var_Mark3DAllowed and isMultiplayer);
	_ctrlCheck cbSetChecked (EVOR_var_Mark3DAllowed and isMultiplayer and (!isNil "EVOR_var_Mark3DEH"));
};