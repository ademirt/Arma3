scriptName "EVOR_fnc_createVehicleCargo";
if (hasInterface and {!isServer}) exitWith {};

private _veh		= param [0,objNull,[objNull]];
private _group		= param [1,sideUnknown,[sideUnknown,grpNull]];
private _classes	= param [2,[],[[]]];
private _chance		= param [3,0.5,[0]];
private _unitsMax	= param [4,100,[0]];

if (_group isEqualType sideUnknown) then {
	if (_group isEqualTo sideUnknown) then {_group = [_veh,true] call BIS_fnc_objectSide;};
	_group = createGroup [_group,true];
};

private _cargo	= [];
private ["_unit"];
{	// Fill turret slots
	if ((random 1 < _chance) and {count _cargo < _unitsMax}) then {
		_unit = _group createUnit [selectRandom _classes,[0,0,0],[],10,"NONE"];
		_cargo pushBack _unit;
		_unit assignAsTurret [_veh,_x select 3];
		_unit moveInTurret [_veh,_x select 3];
	};
} forEach (fullCrew [_veh,"Turret",true] - fullCrew [_veh,"Turret",false]);

{	// Fill cargo slots
	if ((random 1 < _chance) and {count _cargo < _unitsMax}) then {
		_unit = _group createUnit [selectRandom _classes,[0,0,0],[],10,"NONE"];
		_cargo pushBack _unit;
		_unit assignAsCargoIndex [_veh,_x select 2];
		_unit moveInCargo [_veh,_x select 2];
	};
} forEach (fullCrew [_veh,"Cargo",true] - fullCrew [_veh,"Cargo",false]);

_cargo;