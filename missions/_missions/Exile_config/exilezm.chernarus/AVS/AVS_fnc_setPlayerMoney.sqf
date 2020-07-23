_OK = params
[
	["_money", 0, [0]]
];
if (!_OK) exitWith
{
	diag_log format ["AVS Error: Calling AVS_fnc_setPlayerMoney with invalid parameters: %1",_this];
};
ExileClientPlayerMoney = _money;