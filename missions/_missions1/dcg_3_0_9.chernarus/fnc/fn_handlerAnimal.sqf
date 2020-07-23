/*
Author: SENSEI

Last modified: 9/20/2015

Description: handles animal spawns

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_expArray","_pos","_str","_mrk","_selected","_expression","_ret","_posArray"];

_posArray = [];
_expArray = [
	["(1 - forest) * (1 + meadow) * (1 - sea) * (1 - houses) * (1 - hills)","meadow"],
	["((2 + forest + trees)*2) * (1 - sea) * (1 - houses)","forest"],
	["(1 - forest) * ((2 + hills)*2) * (1 - sea)","hills"]
];

[{
	if (SEN_complete > 0) exitWith {
		params ["_args","_id"];
		_args params ["_expArray","_posArray"];
		[_id] call CBA_fnc_removePerFrameHandler;
		[{
			params ["_args","_id"];
			_args params ["_expArray","_posArray"];

			if (count _posArray > ((ceil (SEN_range*0.002)) max 10) min 25) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				if (GET_DEBUG) then {
					{
						_pos = _x select 0;
						_str = _x select 1;

						//["Animal location initialized: [%1,%2]", _pos,_str] call SEN_fnc_log;
						_mrk = createMarker [format["SEN_%1_animal_mrk",_pos],_pos];
						_mrk setMarkerColor "ColorGreen";
						_mrk setMarkerShape "ELLIPSE";
						_mrk setMarkerAlpha 0.5;
						_mrk setMarkerSize [GET_SPAWNDIST,GET_SPAWNDIST];
						_mrk = createMarker [format["SEN_%1_animal_mrk2",_pos],_pos];
						_mrk setMarkerType "mil_dot";
						_mrk setMarkerText _str;
					} forEach _posArray;
				};
				[{
					params ["_args","_id"];
					_args params ["_posArray"];

					//hintSilent str ["ANIMAL CHECK",time];
					{
						if !(missionNamespace getVariable [format["SEN_%1_animal",_x select 0],false]) then {
							_pos = _x select 0;
							_str = _x select 1;

							if ({((vehicle _x) distance _pos < GET_SPAWNDIST && {((getPosATL (vehicle _x)) select 2) < 20})} count allPlayers > 0) then {
								[_pos,_str,floor (random (10 + 1)) + 10,GET_SPAWNDIST] call SEN_fnc_spawnAnimal;
							};
						};
					} forEach _posArray;
				}, 10, [_posArray]] call CBA_fnc_addPerFrameHandler;
			};

			_selected = _expArray select floor (random (count _expArray));
			_expression = _selected select 0;
			_str = _selected select 1;
			_pos = [SEN_centerPos,0,SEN_range] call SEN_fnc_findRandomPos;
			_ret = selectBestPlaces [_pos,1000,_expression,80,1];
			if (!(count _ret isEqualTo 0) && {(_ret select 0 select 0) distance2D (getMarkerPos "SEN_safezone_mrk") > ((getMarkerSize "SEN_safezone_mrk") select 0)} && {!(surfaceIsWater(_ret select 0 select 0))} && {{((_ret select 0 select 0) distance (_x select 0)) < GET_SPAWNDIST} count _posArray isEqualTo 0}) then {
				_posArray pushBack [_ret select 0 select 0,_str];
			};
		}, 0.1, [_expArray,_posArray]] call CBA_fnc_addPerFrameHandler;
	};
}, 5, [_expArray,_posArray]] call CBA_fnc_addPerFrameHandler;


