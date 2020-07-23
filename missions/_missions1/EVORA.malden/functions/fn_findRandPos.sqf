/*
	Author: Sgt. Dennenboom

	Description:
		Finds a random position around a centre. Search volume is a cylinder

	Parameters:
		0: ARRAY/STRING/OBJECT (default: [0,0,0]) - centre position of search
		1: ARRAY/NUMBER (default [0,100]) - radius of cylinder from -/0 to -
		2: ARRAY/NUMBER (default [0,360]) - angle of cylinder from -/0 to -
		3: NUMBER (default 0) - random position and water interaction
			-1 > can be either
			0 > must be on land
			2 > must be on water
		4: NUMBER (default 0) - minimum distance from other objects (0 to ignore)
		5: NUMBER (default 200) - maximum number of attempts the function makes to find a valid position before returning centre (DONT MAKE TOO LARGE!)
		
	Returns:
		ARRAY - suitable random position

	Example:
		["marker",50,[10,15],-1,-1,3] call EVOR_fnc_findRandPos;
*/

scriptName "EVOR_fnc_findRandPos";
private _centre	= param [0,[0,0,0],["",objNull,[]],[2,3]];
private _radius	= param [1,[0,100],[0,[]],2];
private _angle	= param [2,[0,360],[0,[]],2];
private _water	= param [3,0,[0]];
private _bound	= param [4,0,[0]];
private _attempts = param [5,3000,[0]];

switch (typeName _centre) do {
	case (typeName ""): {_centre = getMarkerPos _centre};
	case (typeName objNull): {_centre = getPos _centre};
};
_radius	= if (_radius isEqualType []) then {_radius} else {[0,_radius]};
_angle	= if (_angle isEqualType []) then {_angle} else {[0,_angle]};
private _checkWater = _water in [0,2];
private _checkBound = _bound > 0;

private _radiusMin = _radius select 0;
private _radiusMax = _radius select 1;
private _radiusOff = (_radiusMin/_radiusMax)^2;
private _angleMin = _angle select 0;
private _angleMax = _angle select 1;

private _randPos = _centre;
private _success = false;

for "_i" from 0 to _attempts do {	
	_randPos = _centre getPos [_radiusMax * sqrt (_radiusOff + random (1-_radiusOff)),_angleMin + random (_angleMax - _angleMin)];
	_success = _randPos call {
		if (_checkWater and {(0 isEqualTo _water) isEqualTo (surfaceIsWater _randPos);}) exitWith {false};
		if (_checkBound and {!([] isEqualTo nearestTerrainObjects [_randPos,[],_bound,false,true])}) exitWith {false};
		if (_checkBound and {!(lineIntersectsSurfaces [AGLtoASL _this,AGLtoASL _this vectorAdd [0,0,50],objNull,objNull,false,1,"GEOM","NONE"] isEqualTo [])}) exitWith {false};
		true
	};
	
	if (_success) exitWith {};
};

[_centre,_randPos] select _success;