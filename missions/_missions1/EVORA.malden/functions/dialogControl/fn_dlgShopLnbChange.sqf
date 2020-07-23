disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlListNBox = param [0,controlNull,[controlNull]];
private _display = ctrlParent _ctrlListNBox;

private _dlgShop		= "EVOR_dlg_shop";
private _cfgShop		= missionConfigFile >> _dlgShop;
private _cfgShopCtrls	= _cfgShop >> "controls";
private _ctrlButton		= _display displayCtrl getNumber (_cfgShopCtrls >> "buttonPurchase" >> "idc");

_ctrlButton ctrlEnable true;