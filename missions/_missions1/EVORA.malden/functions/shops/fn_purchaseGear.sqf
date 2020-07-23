scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _shopIndex = param [0,0,[0]];
private _listIndex = param [1,0,[0]];

// Get purchase
private _shopList	= EVOR_list_ShopGear select _shopIndex select {!(_x select 2)};
private _purchase	= _shopList select _listIndex;
private _class		= _purchase param [0,"",[""]];
private _price		= _purchase param [1,0,[0]];
private _text		= _purchase param [4,"%1",[""]];

if (isMultiplayer and {score player < _price}) exitWith {hintSilent "Insufficient funds to purchase this!";};

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgBackpacks = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

// Set the item status to purchased and non-available in shops
_purchase set [2,true];

// Add purchased item to arsenal
private _arsenalCargo = missionNamespace getVariable ["bis_addVirtualWeaponCargo_cargo",[[],[],[],[]]];
switch (_shopIndex) do {
	case 0: {(_arsenalCargo select 1) pushBack configName (_cfgWeapons >> _class);};
	case 1: {(_arsenalCargo select 0) pushBack configName (_cfgWeapons >> _class);};
	case 2: {(_arsenalCargo select 0) pushBack configName (_cfgWeapons >> _class);};
	case 3: {(_arsenalCargo select 0) pushBack configName (_cfgGlasses >> _class);};
	case 4: {(_arsenalCargo select 3) pushBack configName (_cfgBackpacks >> _class);};
};
missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",_arsenalCargo,false];

// Save the new variable for purchased gear and detract score
if (isMultiplayer) then {
	profileNamespace setVariable [
		"EVOR_var_SavedPurchase",
		EVOR_list_ShopGear apply {(_x apply {[0,1] select (_x select 2)}) joinString ""}
	];
	[player,_purchase] remoteExecCall ["EVOR_fnc_detractScoreServer",2,false];
};
playSound "scoreRemoved";

// Unlock the mercenaries as given in the shopgear list
if (_shopIndex == 0) then {
	private _count = [_class] call EVOR_fnc_unlockUnit;
	if (_count > 0) then {hintSilent format ["%1 new mercenaries available",_count];};
};