scriptName "EVOR_fnc_initGear";
if (!hasInterface) exitWith {};

// Create or get variable for purchased gear, set the shopgear list accordingly and give player saved loadout
if (EVOR_var_SessionJoinedBefore and {!isNil {profileNamespace getVariable "EVOR_var_SavedPurchase"}}) then {
	{
		private _listIndex = _forEachIndex;
		{
			(EVOR_list_ShopGear # _listIndex # _forEachIndex) set [2,_x == "1"];
		} forEach (_x splitString "");
	} forEach (profileNamespace getVariable "EVOR_var_SavedPurchase");
	player setUnitLoadout [profileNamespace getVariable ["EVOR_var_SavedLoadout",[[],[],[],[],[],[],"","",[],["","","","","",""]]],true];
} else {
	removeGoggles player;
	if (isMultiplayer) then {
		profileNamespace setVariable [
			"EVOR_var_SavedPurchase",
			EVOR_list_ShopGear apply {(_x apply {[0,1] select (_x # 2)}) joinString ""}
		];
		profileNamespace setVariable ["EVOR_var_SavedLoadout",getUnitLoadout player];
		saveProfileNamespace;
	};
};

private _cfgMods = configFile >> "CfgMods";
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgBackpacks = configFile >> "CfgVehicles";
private _cfgGlasses = configFile >> "CfgGlasses";

// Create list of grenades and explosives (vanilla filtered out if set)
private _magIsAddon = {
	private _mod = configSourceMod (_cfgMagazines >> _x);
	private _id = getNumber (_cfgMods >> _mod >> "appId");
	(_mod != "") and {!(_id in _allDLCs)};
};
private _allDLCs = getDLCs 0;
private _listGrenades = [];
private _listSatchels = [];
{_listGrenades append getArray (_cfgWeapons >> "Throw" >> _x >> "magazines");} forEach getArray (_cfgWeapons >> "Throw" >> "muzzles");  
{_listSatchels append getArray (_cfgWeapons >> "Put" >> _x >> "magazines");} forEach getArray (_cfgWeapons >> "Put" >> "muzzles");
if ([EVOR_var_RemoveExplVanilla,1] call BIS_fnc_bitflagsCheck) then {_listGrenades = _listGrenades select _magIsAddon;};
if ([EVOR_var_RemoveExplVanilla,2] call BIS_fnc_bitflagsCheck) then {_listSatchels = _listSatchels select _magIsAddon;};

// Create list of magazines
private _listMags = _listGrenades+_listSatchels;
{
	private _muzzles = getArray (_cfgWeapons >> _x >> "muzzles");
	if (!(_muzzles isEqualTo [])) then {{_listMags pushBackUnique _x;} forEach getArray (_cfgWeapons >> _x >> (_muzzles select 1) >> "magazines");};
	{_listMags pushBackUnique _x;} forEach getArray (_cfgWeapons >> _x >> "magazines");
} forEach (((EVOR_list_shopGear # 0)+(EVOR_list_shopGear # 1)) apply {_x # 0});

// Create lists of purchased gear
private _listWeapons	= ((EVOR_list_ShopGear # 0) select {_x # 2}) apply {_x # 0};
private _listItems		= (((EVOR_list_ShopGear # 1)+(EVOR_list_ShopGear # 2)) select {_x # 2}) apply {_x # 0};
private _listGlasses	= ((EVOR_list_ShopGear # 3) select {_x # 2}) apply {_x # 0};
private _listBacks		= ((EVOR_list_ShopGear # 4) select {_x # 2}) apply {_x # 0};

// Add purchased shopgear list to arsenal
private _arsenalCargo = missionNamespace getVariable ["bis_addVirtualWeaponCargo_cargo",[[],[],[],[]]];
(_arsenalCargo # 0) append (_listItems apply {configName (_cfgWeapons >> _x)});
(_arsenalCargo # 0) append (_listGlasses apply {configName (_cfgGlasses >> _x)});
(_arsenalCargo # 1) append (_listWeapons apply {configName (_cfgWeapons >> _x)});
(_arsenalCargo # 2) append (_listMags apply {configName (_cfgMagazines >> _x)});
(_arsenalCargo # 3) append (_listBacks apply {configName (_cfgBackpacks >> _x)});
missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",_arsenalCargo,false];