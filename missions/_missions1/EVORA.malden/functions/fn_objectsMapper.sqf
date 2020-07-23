/*
	File: fn_objectMapper.sqf
	Author: Joris-Jan van 't Land (Edited by Sgt. Dennenboom)

	Description:
	Takes an array of data about a dynamic object template and creates the objects.

	Parameter(s):
	_this select 0: position of the template - Array [X,Y,Z]
	_this select 1: azimuth of the template in degrees - Number 
	_this select 2: objects for the template - Array / path of script that generates object array - String

	Returns:
	Created objects (Array)
*/

scriptName "EVOR_fnc_objectsMapper";

private _pos = AGLToASL param [0,[0,0],[[]]];
private _azi = param [1,0,[0]];
private _objs = param [2,[],[[],""]];

if (_objs isEqualType "") then {_objs = call (compile preprocessFileLineNumbers _objs);};

if ((isNil "_objs") or {_objs isEqualTo []}) exitWith {};

//Function to multiply a [2,2] matrix by a [2,1] matrix
private _multiplyMatrixFunc = {
	private _array1 = _this select 0;
	private _array2 = _this select 1;
	private _result = [
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];

	_result
};

_objs apply {
	private _type		= _x param [0,"",[""]];
	private _relPos		= _x param [1,[0,0,0],[[]],3];
	private _azimuth	= _x param [2,0,[0]];
	private _name		= _x param [3,"",[""]];
	private _simple		= _x param [4,false,[true]];
	private _damage		= _x param [5,true,[true]];
	private _surface	= _x param [6,false,[true]];
	
	// Calculate the rotated relative position using a rotation matrix
	private _rotMatrix = [[cos _azi,sin _azi],[-(sin _azi),cos _azi]];
	private _newRelPos = [_rotMatrix,_relPos] call _multiplyMatrixFunc;
	private _newPos = [(_pos select 0)+(_newRelPos select 0),(_pos select 1)+(_newRelPos select 1),_relPos select 2];
	
	// Create the object and make sure it's in the correct location
	private _newObj = if (_simple) then {
		createSimpleObject [_type,[0,0,0]];
	} else {
		createVehicle [_type,[0,0,0],[],0,"NONE"];
	};
	_newObj setDir (_azi + _azimuth);
	_newObj setPosWorld (_newPos vectorAdd [0,0,getTerrainHeightASL _newPos]);
	if (!_damage) then {_newObj allowDamage false;};
	if (_surface) then {_newObj setVectorUp surfaceNormal _newPos;};
	
	if (_name != "") then {missionNamespace setVariable [_name,_newObj,false];};
	
	_newObj;
};