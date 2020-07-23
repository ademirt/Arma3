_OK = params
[
	["_vehicle", objNull, [objNull]]
];

if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_getFillCanCost with invalid parameters: %1",_this];
};

_litersToRefuel = 20;

_totalCost = AVS_FuelCost * _litersToRefuel;
_totalCost