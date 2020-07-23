_OK = params
[
	["_vehicle", objNull, [objNull]],
	["_fuelAddedInliters", 0, [0]]
];

if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_getRefuelCost with invalid parameters: %1",_this];
};

//_totalFuelLiters = AVS_RefuelSpeed * _fuelAddedInliters;

_totalCost = AVS_FuelCost * _fuelAddedInliters;
_totalCost