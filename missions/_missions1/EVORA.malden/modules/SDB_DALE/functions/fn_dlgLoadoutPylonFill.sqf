disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrl = param [0,controlNull,[controlNull]];
private _index = param [1,0,[0]];
private _display = ctrlParent _ctrl;
private _veh = _display getVariable ["DALE_var_LoadoutVehicle",objNull];

private _cfgMagazines = configFile >> "CfgMagazines";
private _pylonMagsCompatible = _veh getCompatiblePylonMagazines (1+_index);
private _pylonMagsCurrent = getPylonMagazines _veh;

// Fill combobox with compatible magazines
_ctrl lbSetData [_ctrl lbAdd "<empty>",""];
{
	_ctrl lbSetData [_ctrl lbAdd getText (_cfgMagazines >> _x >> "displayName"),_x];
} forEach _pylonMagsCompatible;

// Select current magazine
for "_i" from 0 to (-1+lbSize _ctrl) do {
	if ((_ctrl lbData _i) == (_pylonMagsCurrent select _index)) exitWith {_ctrl lbSetCurSel _i;};
};