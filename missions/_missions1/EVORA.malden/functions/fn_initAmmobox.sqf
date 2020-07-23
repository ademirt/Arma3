#define selectGear(index)	((selectRandom (EVOR_list_ShopGear select index)) select 0)

scriptName _fnc_scriptName;

private _box = param [0,objNull,[objNull]];
private _cfgBox = missionConfigFile >> "CfgAmmobox" >> typeOf _box;

if (!isClass _cfgBox) exitWith {};

private _cfgWeapons				= configFile >> "CfgWeapons";
private _cargoBackpacks			= getArray (_cfgBox >> "cargoBackpacks");
private _cargoItems				= getArray (_cfgBox >> "cargoItems");
private _cargoGearTypes			= getNumber (_cfgBox >> "cargoGearTypes");
private _cargoGearCount			= getNumber (_cfgBox >> "cargoGearCount");
private _cargoMagazineTypes 	= getNumber (_cfgBox >> "cargoMagazineTypes");
private _cargoMagazineCount		= getNumber (_cfgBox >> "cargoMagazineCount");
private _cargoWeaponTypes		= getNumber (_cfgBox >> "cargoWeaponTypes");
private _cargoWeaponCount		= getNumber (_cfgBox >> "cargoWeaponCount");
private _cargoWeaponMags		= getNumber (_cfgBox >> "cargoWeaponMags");
private _cargoExplosivesCount	= getNumber (_cfgBox >> "cargoExplosivesCount");
private _cargoFAKits			= getNumber (_cfgBox >> "cargoFAKits");
private _cargoToolKits			= getNumber (_cfgBox >> "cargoToolKits");

clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

// Kits
if (_cargoFAKits > 0) then {_cargoItems pushBack ["FirstAidKit",_cargoFAKits];};
if (_cargoToolKits > 0) then {_cargoItems pushBack ["ToolKit",_cargoToolKits];};

// Equipment
for "_i" from 1 to _cargoGearTypes do {
	_cargoItems pushBack [selectGear(1),_cargoGearCount];
};

// Magazines
for "_i" from 1 to _cargoMagazineTypes do {
	_cargoItems pushBack [selectRandom getArray (_cfgWeapons >> selectGear(0) >> "magazines"),_cargoMagazineCount];
};

// Weapons
for "_i" from 1 to _cargoWeaponTypes do {
	_weapon = selectGear(0);
	_cargoItems append [[_weapon,_cargoWeaponCount],[selectRandom getArray (_cfgWeapons >> _weapon >> "magazines"),_cargoWeaponMags]];
};

// Explosives
if (_cargoExplosivesCount > 0) then {
	{
		{_cargoItems pushBack [_x,_cargoExplosivesCount];} forEach getArray (_cfgWeapons >> "Put" >> _x >> "magazines");
	} forEach getArray (_cfgWeapons >> "Put" >> "muzzles");
};

{_box addItemCargoGlobal _x;} forEach _cargoItems;
{_box addBackpackCargoGlobal _x;} forEach _cargoBackpacks;