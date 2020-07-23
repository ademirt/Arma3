/*
Author: SENSEI

Last modified: 10/2/2015

Description: arsenal setup
__________________________________________________________________*/
["Preload"] call BIS_fnc_arsenal;

waitUntil {sleep 0.1; !isNil "bis_fnc_arsenal_data"};

if (isServer) then { // remove items from communications tab
	_data = missionnamespace getVariable "bis_fnc_arsenal_data";
	_data set [12,[]];
	missionnamespace setVariable ["bis_fnc_arsenal_data",_data,true];
};

if (hasInterface) then { // replace saved ACRE radios with chemlights
	_loadoutList = profilenamespace getVariable ["bis_fnc_saveInventory_data",[]];
	for "_i" from 0 to ((count _loadoutList) - 1) do {
		if (typeName (_loadoutList select _i) isEqualTo "ARRAY") then {
			_loadout = (_loadoutList select _i);
			_uniformItems = ((_loadout select 0) select 1);
			_vestItems = ((_loadout select 1) select 1);
			_backpackItems = ((_loadout select 2) select 1);

			{
				if ((_x select [0,5]) isEqualTo "ACRE_") then {_uniformItems set [_forEachindex,"Chemlight_green"]};
			} forEach _uniformItems;
			{
				if ((_x select [0,5]) isEqualTo "ACRE_") then {_vestItems set [_forEachindex,"Chemlight_green"]};
			} forEach _vestItems;
			{
				if ((_x select [0,5]) isEqualTo "ACRE_") then {_backpackItems set [_forEachindex,"Chemlight_green"]};
			} forEach _backpackItems;
		};
	};
};
