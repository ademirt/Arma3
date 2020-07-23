/*
Author: SENSEI

Last modified: 9/30/2015

Description: gets list of players

Note: allPlayers command is faster, but it returns an empty array (on dedicated) until some time after time > 0

Return: array
__________________________________________________________________*/
private ["_allPlayers"];

_allPlayers = [];
{
	if (isPlayer _x) then {
		_allPlayers pushBack _x;
	};
} forEach (playableUnits + allDeadMen);

_allPlayers