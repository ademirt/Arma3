_OK = params
[
	["_vehicle", objNull, [objNull]]
];
if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_fillCanisterClient with invalid parameters: %1",_this];
};
_vehicle removeItem "Exile_Item_FuelCanisterEmpty";
_vehicle addItem "Exile_Item_FuelCanisterFull";