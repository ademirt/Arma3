scriptName "EVOR_fnc_scoreTicker";
if ((!isServer) or {!isMultiplayer}) exitWith {};

while {true} do {
	sleep EVOR_var_ScoreTickerSleep;
	{
		if (score _x < EVOR_var_ScoreTickerLimit) then {_x addScore EVOR_var_ScoreTickerScore;};
	} forEach allPlayers;
};