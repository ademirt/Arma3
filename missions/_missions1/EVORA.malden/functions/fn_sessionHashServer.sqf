// IMPORTANT: DO NOT CHANGE, YOU WILL BREAK MISSION. Determines whether player has connected to server before

scriptName "EVOR_fnc_sessionHashServer";
if (!isServer) exitWith {};

private _player		= param [0,objNull,[objNull]];
private _hashClient	= param [1,"",[""]];
private _hashServer	= missionNamespace getVariable ["EVOR_var_HashServer",(random 99999999999999999) toFixed 0];
missionNamespace setVariable ["EVOR_var_HashServer",_hashServer,false];

private _joinedBefore = _hashClient isEqualTo _hashServer;

[
	[_hashServer,_joinedBefore],{
		profileNamespace setVariable ["EVOR_var_HashClient",_this select 0];
		missionNamespace setVariable ["EVOR_var_SessionJoinedBefore",_this select 1];
	}
] remoteExecCall ["call",_player,false];

// Check for corrupted mission, restarts if so
if ((toLower missionName) find "evor" < 0) exitWith {"EveryoneLost" call BIS_fnc_endMissionServer;};

// Add score
if (isMultiplayer and {!_joinedBefore}) then {waitUntil {time > 5}; _player addScore EVOR_var_ScoreStart;};