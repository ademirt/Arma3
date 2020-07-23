scriptName _fnc_scriptName;
if ((!isServer) or {!isMultiplayer}) exitWith {};

private _score	= param [0,0,[0]];
private _taker	= param [1,objNull,[objNull]];
private _giver	= param [2,objNull,[objNull]];

if ((_score == 0) or {score _giver < _score}) exitWith {};

_giver addScore (-_score);
_taker addScore _score;
(format ["%1 funds received from %2",_score,name _giver]) remoteExecCall ["hint",_taker,false];