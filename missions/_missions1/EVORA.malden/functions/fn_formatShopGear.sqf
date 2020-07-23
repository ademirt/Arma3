scriptName "EVOR_fnc_formatShopGear";

private _result = [];

{
	_result append ((_x select {_x select 2}) apply {toLower (_x select 0)});
} forEach EVOR_list_ShopGear;

_result;