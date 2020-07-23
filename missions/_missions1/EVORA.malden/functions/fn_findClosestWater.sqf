scriptName "EVOR_fnc_findClosestWater";
private _centre	= param [0,[0,0,0],["",objNull,[]],[2,3]];
private _lower	= param [1,1,[0]];
private _upper	= param [2,25,[0]];
private _step	= param [3,4,[0]];

_centre = switch (typeName _centre) do {
	case (typeName ""): {getMarkerPos _centre};
	case (typeName objNull): {getPos _centre};
	case (typeName []): {if (count _centre isEqualTo 2) then {_centre + [0]} else {_centre}};
};
_lower = _lower max 1;

private _water = [[0,0],0];
for "_i" from _lower to _upper step _step do {
	if (_water select 1 >= 2) exitWith {};
	_water = (selectBestPlaces [_centre,_i,"waterDepth+sea",1,1]) select 0;
};
if (_water select 1 < 2) exitWith {[]};

private _pos = _water select 0;
_pos pushBack 0;
_pos;