scriptName "EVOR_fnc_detectArsenal";
if (!hasInterface) exitWith {};

/* [
	missionNamespace,
	"arsenalOpened",
	{
		(_this select 0) displayAddEventHandler ["KeyDown",{(_this select 3) and {(_this select 1) in [19,24,31,46]}}];
		{((_this select 0) displayCtrl _x) ctrlEnable false;} forEach [44146,44147,44148,44149,44150];
	}
] call BIS_fnc_addScriptedEventHandler;

if (!isMultiplayer) exitWith {};

[
	missionNamespace,
	"arsenalClosed",
	{
		// Get purchased items
		private _purchased = [] call EVOR_fnc_formatShopGear;
		private _bipod = toLower ((primaryWeaponItems player) select 3);
		if (!(_bipod in _purchased)) then {player removePrimaryWeaponItem _bipod;};
		private _equipped = [player] call EVOR_fnc_formatLoadout;
		private _banned = _equipped - _purchased;
		// Save gear
		if (EVOR_var_EnableSaveAllGear or {_banned isEqualTo []}) then {
				profileNamespace setVariable ["EVOR_var_SavedLoadout",getUnitLoadout player];
				saveProfileNamespace;
				hint "Inventory save successful!";
		} else {
			private _bannedStrings = _banned apply {getText (configFile >> (["CfgWeapons","CfgVehicles"] select (_x isKindOf "Bag_Base")) >> _x >> "displayname")};
			hint format ["Inventory save failed!\nNon-purchased item(s) found:\n\n%1",_bannedStrings joinString "\n"];
		};
	}
] call BIS_fnc_addScriptedEventHandler; */