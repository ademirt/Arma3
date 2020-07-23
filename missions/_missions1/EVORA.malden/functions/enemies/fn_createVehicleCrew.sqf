scriptName "EVOR_fnc_createVehicleCrew";
if (hasInterface and {!isServer}) exitWith {};

private _veh	= param [0,objNull,[objNull]];
private _group	= param [1,sideUnknown,[sideUnknown,grpNull]];

if (_group isEqualType sideUnknown) then {
	if (_group isEqualTo sideUnknown) then {_group = [_veh,true] call BIS_fnc_objectSide;};
	_group = createGroup [_group,true];
};

createVehicleCrew _veh;
private _crew = crew _veh;
_crew joinSilent _group;
_group addVehicle _veh;

_crew;