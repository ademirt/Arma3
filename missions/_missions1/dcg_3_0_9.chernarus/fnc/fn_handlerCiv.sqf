/*
Author: SENSEI

Last modified: 9/20/2015

Description: handles civilian spawns

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_mrk","_townPos","_unitCount","_vehCount"];

[{
	if (SEN_complete > 0) exitWith {
		params ["_args","_id"];
		[_id] call CBA_fnc_removePerFrameHandler;
		if (SEN_whitelistLocation isEqualTo []) exitWith {};

		if (GET_DEBUG) then {
			private "_mrk";
			{
				["%1 initialized.", text _x] call SEN_fnc_log;
				_mrk = createMarker [format["SEN_%1_civ_mrk",text _x],getpos _x];
				_mrk setMarkerColor "ColorBlack";
				_mrk setMarkerShape "ELLIPSE";
				_mrk setMarkerAlpha 0.5;
				_mrk setMarkerSize [GET_SPAWNDIST,GET_SPAWNDIST];
			} forEach SEN_whitelistLocation;
		};

		[{
			params ["_args","_id"];
			//hintSilent str ["CIV CHECK",time];
			{
				if !(missionNamespace getVariable [format["SEN_%1_civ",text _x],false]) then {
					private ["_townPos","_unitCount","_vehCount"];
					_townPos = getpos _x;
					_townPos set [2,0];

					if ({((vehicle _x) distance _townPos < GET_SPAWNDIST && {((getPosATL (vehicle _x)) select 2) < 20})} count allPlayers > 0) then {
						call {
							if ((type _x) isEqualTo "NameCity") exitWith {
								_unitCount = 5;//8;
								_vehCount = 2;
							};
							if ((type _x) isEqualTo "NameCityCapital") exitWith {
								_unitCount = 8;//12;
								_vehCount = 2;
							};
							_unitCount = 5;
							_vehCount = 1;
						};
						[_townPos,_unitCount,_vehCount,text _x,GET_SPAWNDIST] call SEN_fnc_spawnCiv;
					};
				}
			} forEach SEN_whitelistLocation;
		}, 10, []] call CBA_fnc_addPerFrameHandler;
	};
}, 5, []] call CBA_fnc_addPerFrameHandler;