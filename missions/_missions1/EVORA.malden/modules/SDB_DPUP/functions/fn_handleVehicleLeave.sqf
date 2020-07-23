scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

params ["_veh"];

_veh setVariable ["DPUP_var_ListIncoming",nil,false];

// Remove "IncomingMissile" Eventhandlers
{_veh removeEventHandler ["IncomingMissile",_x];} forEach (_veh getVariable ["DPUP_var_EHIncoming",[]]);
_veh setVariable ["DPUP_var_EHIncoming",nil,false];