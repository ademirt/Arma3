/*
Author: SENSEI

Last modified: 9/20/2015

Description: spawns animals

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

private ["_agentArray","_type","_agent"];

params ["_pos","_expression","_count","_dist"];

missionNamespace setVariable [format["SEN_%1_animal",_pos],true];
_agentArray = [];
_type = "";

if (_expression isEqualTo "hills") then {_type = "Goat_random_F"} else {_type = "Sheep_random_F"};

for "_i" from 0 to (_count - 1) do {
	_agent = createAgent [_type, _pos, [], 150, "NONE"];
	_agentArray pushBack _agent;
};

[{
	params ["_args","_id"];
	_args params ["_pos","_dist","_agentArray"];

	if ({_x distance _pos < _dist} count allPlayers isEqualTo 0) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		missionNamespace setVariable [format["SEN_%1_animal",_pos],false];
		_agentArray call SEN_fnc_cleanup;
	};
}, 30, [_pos,_dist,_agentArray]] call CBA_fnc_addPerFrameHandler;