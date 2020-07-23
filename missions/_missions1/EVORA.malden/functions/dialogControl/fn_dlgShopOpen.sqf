disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _shopType = param [0,0,[0]];
private _shopIndex = 0;

private _dlgShop = "EVOR_dlg_shop";
createDialog _dlgShop;
private _display = uiNamespace getVariable _dlgShop;

if (isNull _display) exitWith {};

private _cfgShop		= missionConfigFile >> _dlgShop;
private _cfgShopCtrls	= _cfgShop >> "controls";
private _ctrlTitle		= _display displayCtrl getNumber (_cfgShopCtrls >> "title" >> "idc");
private _ctrlScore		= _display displayCtrl getNumber (_cfgShopCtrls >> "score" >> "idc");
private _ctrlButtons	= ["button0","button1","button2","button3","button4"] apply {_display displayCtrl getNumber (_cfgShopCtrls >> _x >> "idc")};

// Set headers
private _shopTitle = (getArray (_cfgShop >> "typeTitles")) param [_shopType,"",[""]];
_ctrlTitle ctrlSetStructuredText parseText format ["<t align = 'left'>%1</t><t align = 'right'>%2</t>",_shopTitle,profileName];
[_ctrlScore] spawn EVOR_fnc_dlgDisplayScore;

// Configure buttons
private _shopTexts = (getArray (_cfgShop >> "typeListTitles")) param [_shopType,[],[[]]];
{
	_x ctrlSetText (_shopTexts param [_forEachIndex,"",[""]]);
	_x ctrlAddEventHandler ["buttonClick",format ["[%1,%2] call EVOR_fnc_dlgShopLnbFill;",_shopType,_forEachIndex]];
} forEach _ctrlButtons;

// Disable buttons for vehicle shop, open first available shop
if (_shopType == 1) then {
	private _baseIndex = EVOR_list_BaseCore findIf {player distance2D getMarkerPos (_x # 0) < (_x # 1)};
	if (_baseIndex < 0) then {
		_shopIndex = -1;
		{_x ctrlEnable false;} forEach _ctrlButtons;
	} else {
		private _baseShops = EVOR_list_BaseCore select _baseIndex select 3;
		_baseShops = _baseShops apply {((_x isEqualType objNull) and  {!isNull _x}) or {(_x isEqualType []) and {{!isNull _x} count _x > 0}}};
		_shopIndex = _baseShops find true;
		{_x ctrlEnable (_baseShops select _forEachIndex);} forEach _ctrlButtons;
	};
};

if (_shopIndex < 0) exitWith {};

// Fill shop
[_shopType,_shopIndex] call EVOR_fnc_dlgShopLnbFill;