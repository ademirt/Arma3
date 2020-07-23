disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlListNBox = param [0,controlNull,[controlNull]];

// Check if HALO is available
if (EVOR_var_SquadHalo >= 0) then {
	private _basesAirfields = EVOR_list_BaseCore apply {_x select 3 select 4};
	private _airfActive = {((_x isEqualType objNull) and {!isNull _x}) or {(_x isEqualType []) and {{!isNull _x} count _x > 0}}} count _basesAirfields > 0;
	if (_airfActive or {EVOR_var_SquadHalo == 1}) then {_ctrlListNBox lnbSetData [[_ctrlListNBox lnbAddRow ["Squad-leader HALO"],0],"halo"];};
};

// Add base teleport flags to list
private _basesWithFlag = EVOR_list_BaseCore select {!isNull (_x select 2)};
private _basesMarkers = _basesWithFlag apply {_x select 0};
{
	_ctrlListNBox lnbSetData [[_ctrlListNBox lnbAddRow [markerText _x],0],_x];
} forEach _basesMarkers;