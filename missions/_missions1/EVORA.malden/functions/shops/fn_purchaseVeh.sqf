scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _shopIndex = param [0,0,[0]];
private _listIndex = param [1,0,[0]];

// Get purchase
private _shopList	= EVOR_list_ShopVeh select _shopIndex select {!(_x select 2)};
private _purchase	= _shopList select _listIndex;
private _class		= _purchase param [0,"",[""]];
private _price		= _purchase param [1,0,[0]];
private _text		= _purchase param [4,"%1",[""]];
_text				= format [_text,getText (configFile >> "CfgVehicles" >> _class >> "displayName")];

if (isMultiplayer and {score player < _price}) exitWith {hintSilent "Insufficient funds to purchase this!";};

private _baseIndex = EVOR_list_BaseCore findIf {player distance2D getMarkerPos (_x # 0) < (_x # 1)};
if (_baseIndex < 0) exitWith {};
private _baseShops = EVOR_list_BaseCore select _baseIndex select 3;
private _spawns = _baseShops select _shopIndex;
if (_spawns isEqualType objNull) then {_spawns = [_spawns];};

private ["_success","_spawnPos","_spawnDir","_spawnSize","_spawnHeight","_nearObjects"];
_success = false;
{
	_spawnPos = getPosASL _x;
	_spawnDir = getDir _x;
	_spawnSize = 7;
	
	_nearObjects = entities [["AllVehicles","ReammoBox_F"],[],false,false];
	_nearObjects = _nearObjects inAreaArray [_spawnPos,_spawnSize,_spawnSize,_spawnDir,true];
	
	if (_nearObjects isEqualTo []) exitWith {
		[player,_purchase,_spawnPos,_spawnDir] remoteExecCall ["EVOR_fnc_createObjectServer",2,false];
		hintSilent format ["%1 purchased for %2 funds!",_text,_price];
		playSound "scoreRemoved";
		_success = true;
	};
} forEach (_spawns select {!isNull _x});

if (!_success) then {hintSilent "Cannot purchase vehicle: space occupied!";};