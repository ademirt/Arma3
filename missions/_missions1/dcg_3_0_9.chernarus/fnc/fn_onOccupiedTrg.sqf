/*
Author: SENSEI

Last modified: 9/29/2015

Description: runs when players enter occupied location

Return: nothing
__________________________________________________________________*/
if (!isServer && hasInterface) exitWith {};

#include "..\data\define.hpp"

private ["_townPos","_radius","_enemyArray","_threshold","_hint","_time","_approval","_townType"];

params ["_town","_mrk"];

_town = call compile (_town);
_townPos = getpos _town;
_townPos set [2,0];
_radius = ((((size _town) select 0) + ((size _town) select 1))*0.5) + 100;
_enemyArray = [];

["Occupied Location Trigger: Town: %1",_town] call SEN_fnc_log;
["Occupied Location Trigger: Town Name: %1",text _town] call SEN_fnc_log;
["Occupied Location Trigger: Position: %1",_townPos] call SEN_fnc_log;
["Occupied Location Trigger: Town Type: %1",type _town] call SEN_fnc_log;
["Occupied Location Trigger: Trigger Radius: %1",_radius] call SEN_fnc_log;

{
	if (side _x isEqualTo SEN_enemySide) then {_enemyArray pushBack _x};
} forEach (_townPos nearEntities [["Man","LandVehicle","Air","Ship"], _radius]);
_threshold = round ((count _enemyArray)*0.30);

["Occupied Location Trigger: Enemies: %1",_enemyArray] call SEN_fnc_log;
["Occupied Location Trigger: Enemy Threshold: %1",_threshold] call SEN_fnc_log;

[{
	params ["_args","_id"];
	_args params ["_enemyArray","_threshold","_radius","_town","_townPos","_mrk"];

	if ({alive _x} count _enemyArray <= _threshold) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_hint = format ["The enemy is losing control of %1! Keep up the fight and they will surrender!",text _town];
		_hint remoteExecCall ["hintSilent", allPlayers, false];
		[{
			params ["_args","_id"];
			_args params ["_enemyArray","_radius","_town","_townPos","_time","_mrk"];

			if (diag_tickTime > _time) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				_approval = 0;
				_townType = type _town;
				call {
					if (_townType isEqualTo "NameCityCapital") exitWith {
						_townType = "Capital";
						_approval = 100;
					};
					if (_townType isEqualTo "NameCity") exitWith {
						_townType = "City";
						_approval = 75;
					};
					_townType = "Town";
					_approval = 50;
				};

				{ // check for new units in area
					if (side _x isEqualTo SEN_enemySide) then {_enemyArray pushBack _x};
				} forEach (_townPos nearEntities [["Man","LandVehicle","Air","Ship"], _radius]);

				if !(_enemyArray isEqualTo []) then {
					{
						if !(typeOf _x isKindOf "AIR") then {
							[_x] call SEN_fnc_setUnitSurrender;
							if !(_x isEqualTo SEN_officer) then {_x call SEN_fnc_cleanup};
						} else {
							_x setBehaviour "CARELESS";
							_x call SEN_fnc_cleanup;
						};
					} forEach _enemyArray;
				};
				["SEN_liberate",[text _town]] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
				_mrk setMarkerText format ["Liberated %1",_townType];
				_mrk setMarkerColor "ColorWEST";
				SEN_approvalCiv = SEN_approvalCiv + _approval;
				publicVariable "SEN_approvalCiv";
				["SEN_approvalBonus",[_approval,'Assisting the local population has increased your approval!']] remoteExecCall ["BIS_fnc_showNotification", allPlayers, false];
				if (GET_DEBUG) then {
					(format["SEN_occupy_AO_%1",text _town]) setMarkerColor "ColorWEST";
				};
				if !(isNull SEN_officer) then {
					if (getposATL SEN_officer distance _townPos < _radius) then {
						_hint = format ["Aerial reconnaissance shows the enemy officer is somewhere in %1.",text _town];
						_hint remoteExecCall ["hintSilent", allPlayers, false];
						["officer",getPosATL SEN_officer] call BIS_fnc_taskSetDestination;
					};
				};
				if (random 1 < 0.5) then {
					[getPos _town,SEN_enemySide,_radius] spawn SEN_fnc_spawnReinforcements;
				};
			};
		}, 1, [_enemyArray,_radius,_town,_townPos,diag_tickTime+60,_mrk]] call CBA_fnc_addPerFrameHandler;
	};
}, 5, [_enemyArray,_threshold,_radius,_town,_townPos,_mrk]] call CBA_fnc_addPerFrameHandler;

/*
[] spawn {
	_a = [];
	_town = (SEN_occupiedLocation select 0);
	_townPos = getpos _town;
	_townPos set [2,0];
	_radius = ((((size _town) select 0) + ((size _town) select 1))/2) + 100;
	player setpos _townPos;
	player allowDamage false;
	sleep 10;
	{
		if (side _x isEqualTo SEN_enemySide) then {_a pushBack _x};
	} forEach (_townPos nearEntities [["Man","Car","Tank","Air","Ship"], _radius]);
	_threshold = (round ((count _a)*0.30));
	_kill = ((count _a) - _threshold) + 1;
	for "_i" from 0 to _kill do {
		(_a select _i) setDamage 1;
	};
};
*/