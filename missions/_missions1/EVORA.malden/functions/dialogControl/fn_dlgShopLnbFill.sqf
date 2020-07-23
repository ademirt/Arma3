disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _getDLC = {
	private _dlc = "";
	private _addons = configSourceAddonList _this;
	if (count _addons > 0) then {
		private _mods = configSourceModList (configFile >> "CfgPatches" >> _addons select 0);
		if (count _mods > 0) then {
			_dlc = _mods select 0;
		};
	};
	_dlc
};

private _shopType = param [0,0,[0]];
private _shopIndex = param [1,0,[0]];

private _dlgShop = "EVOR_dlg_shop";
private _display = uiNamespace getVariable _dlgShop;

if (isNull _display) exitWith {};

private _cfgShop		= missionConfigFile >> _dlgShop;
private _cfgShopCtrls	= _cfgShop >> "controls";
private _ctrlText		= _display displayCtrl getNumber (_cfgShopCtrls >> "textItem" >> "idc");
private _ctrlListNBox	= _display displayCtrl getNumber (_cfgShopCtrls >> "listNBox" >> "idc");

// Set header
private _shopTexts = (getArray (_cfgShop >> "typeListTitles")) param [_shopType,[],[[]]];
_ctrlText ctrlSetStructuredText parseText format ["<t align = 'center'>%1</t>",_shopTexts param [_shopIndex,"",[""]]];

// Clear listNbox
lnbClear _ctrlListNBox;

// Fill listNbox with items that aren't removed
private _shopList = missionNamespace getVariable [["EVOR_list_shopGear","EVOR_list_shopVeh","EVOR_list_shopUnit"] select _shopType,[]];
_shopList = (_shopList select _shopIndex) select {!(_x select 2)};

private _cfgGlasses = configFile >> "CfgGlasses";
private _cfgVehicles = configFile >> "CfgVehicles";
private _cfgWeapons = configFile >> "CfgWeapons";
private ["_config","_text","_img","_dlc","_row"];
{
	_x params ["_class","_price"];
	
	_config = switch (true) do {
		case (isClass (_cfgGlasses >> _class)):		{_cfgGlasses >> _class};
		case (isClass (_cfgVehicles >> _class)):	{_cfgVehicles >> _class};
		case (isClass (_cfgWeapons >> _class)):		{_cfgWeapons >> _class};
		default {configNull};
	};
	
	_text = _x param [4,"%1",[""]];
	_text = format [_text,getText (_config >> "displayName")];
	_img = switch (true) do {
		case (_class isKindOf "ReammoBox_F");
		case (_class isKindOf "StaticWeapon");
		case (_class isKindOf "man"): {format ["A3\ui_f\data\map\VehicleIcons\%1_ca.paa",getText (_config >> "icon")];};
		default {getText (_config >> "picture")};
	};
	_dlc = (modParams [_config call _getDLC,["logo"]]) param [0,"",[""]];
	
	_row = _ctrlListNBox lnbAddRow ["",_text,"",str _price];
	_ctrlListNBox lnbSetPicture [[_row,0],_dlc];
	_ctrlListNBox lnbSetPicture [[_row,2],_img];
} forEach _shopList;

// Save current state of shop to dialog
_display setVariable ["EVOR_dlg_shopState",[_shopType,_shopIndex]];