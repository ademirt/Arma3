scriptName _fnc_scriptName;
if (hasInterface and {!isServer}) exitWith {};

private _group		= param [0,grpNull,[grpNull]];
private _mortars	= ((units _group) apply {vehicle _x}) select {_x isKindOf "StaticMortar"};
private _target		= ([EVOR_var_SideFriendly,false] call BIS_fnc_getRespawnMarkers) param [0,"",[""]];
private _count		= 2;

_mortars = _mortars arrayIntersect _mortars;

// Create marker around mean position of mortars
private _posMean = [0,0,0];
{_posMean = _posMean vectorAdd getPos _x;} forEach _mortars;
_posMean = _posMean vectorMultiply (1/count _mortars);

private _markerPos = _posMean getPos [100+random 100,random 360];
private _markerType = ["o_arty","b_art","n_art"] param [EVOR_var_SideEnemy call BIS_fnc_sideID,"",[""]];
private _marker = createMarker ["markerArty_"+str _group,_markerPos];
_marker setMarkerShape "ICON";
_marker setMarkerType _markerType;
_marker setMarkerText "Artillery";

// Keep firing until all mortars are dead
while {!(_mortars isEqualTo [])} do {
	sleep random [20,25,30];
	_mortars = _mortars select {alive gunner _x};
	{
		_x setVehicleAmmoDef 1;
		sleep (1+random 1);
		(gunner _x) doArtilleryFire [[_target,[50,100],360,-1] call EVOR_fnc_findRandPos,(magazines _x) select 0,_count];
	} forEach _mortars;
};

// Delete marker
deleteMarker _marker;