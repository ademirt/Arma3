disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlButton = param [0,controlNull,[controlNull]];
private _dlgShop = "EVOR_dlg_shop";
private _display = ctrlParent _ctrlButton;

if (isNull _display) exitWith {};

private _cfgShop		= missionConfigFile >> _dlgShop;
private _cfgShopCtrls	= _cfgShop >> "controls";
private _ctrlListNBox	= _display displayCtrl getNumber (_cfgShopCtrls >> "listNBox" >> "idc");

private _listIndex = lnbCurSelRow _ctrlListNBox;
if ((_listIndex < 0) or {lnbSize _ctrlListNBox select 0 <= _listIndex}) exitWith {hint "Nothing selected!";};

private _shopState	= _display getVariable ["EVOR_dlg_shopState",[0,0]];
private _shopType	= _shopState select 0;
private _shopIndex	= _shopState select 1;

switch (_shopType) do {
	case 0:	{
		[_shopIndex,_listIndex] call EVOR_fnc_purchaseGear;
		_shopState call EVOR_fnc_dlgShopLnbFill;
	};
	case 1:	{
		[_shopIndex,_listIndex] call EVOR_fnc_purchaseVeh;
		private _displayMain = displayParent _display;
		_display closeDisplay 0;
		_displayMain closeDisplay 0;
	};
	case 2:	{
		[_shopIndex,_listIndex] call EVOR_fnc_purchaseUnit;
	};
};