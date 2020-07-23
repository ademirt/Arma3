scriptName _fnc_scriptName;
if (!isServer) exitWith {};

private _buyer		= param [0,objNull,[objNull]];
private _purchase	= param [1,[],[[]]];
private _spawnPos	= param [2,[0,0,0],[[],objNull]];
private _spawnDir	= param [3,0,[0]];

private _class		= _purchase param [0,"",[""]];
private _price		= _purchase param [1,0,[0]];
private _params		= _purchase param [3,[],[[]]];

if ((isNull _buyer) or {!isClass (configFile >> "CfgVehicles" >> _class)}) exitWith {};

private _group = group _buyer;

// Create object
private ["_object"];
if (_class isKindOf "Man") then {
	_object = _group createUnit [_class,[0,0,0],[],0,"NONE"];
	[_object,{EVOR_list_PurchasedUnits pushBack _this;}] remoteExecCall ["call",_buyer,false];
} else {
	_object = createVehicle [_class,[0,0,0],[],0,"NONE"];
	if (unitIsUAV _object) then {[_object,side _group] call EVOR_fnc_createVehicleCrew;};
	_object setVariable ["EVOR_var_VehOwner",name _buyer,true];
	[_object,_params] remoteExecCall ["EVOR_fnc_initVeh",0,_object];
};

// Position object
if (_spawnPos isEqualType objNull) then {_spawnPos = getPosASL _spawnPos;};
_spawnPos = _spawnPos vectorAdd [0,0,0.2];
private _spawnUp = if (getTerrainHeightASL _spawnPos < 1) then {[0,0,1]} else {surfaceNormal _spawnPos};

_object allowDamage false;
_object setDir _spawnDir;
_object setPosASL _spawnPos;
_object setVectorUp _spawnUp;
_object allowDamage true;

// Detract score from buyer
if (isMultiplayer) then {[_buyer,_purchase] call EVOR_fnc_detractScoreServer;};

_object;