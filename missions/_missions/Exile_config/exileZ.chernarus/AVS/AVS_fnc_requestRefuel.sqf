_OK = (_this select 3) params
[
	["_vehicle", objNull, [objNull]]
];

if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_requestRefuel with invalid parameters: %1",_this];
};

[_vehicle] remoteExecCall ["AVS_fnc_refuelVehicle", 2];