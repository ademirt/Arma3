/*
Author: SENSEI

Last modified: 9/20/2015

Description: spawns IEDs

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_roads","_road","_pos","_mine","_mrk","_check"];

if (SEN_allowIED isEqualTo 0) exitWith {};

_type = ["IEDLandBig_Range_Ammo","IEDLandSmall_Range_Ammo","IEDUrbanBig_Range_Ammo","IEDUrbanSmall_Range_Ammo"];
_buffer = 1000;
_posArray = [];

[{
	if (SEN_complete > 0) exitWith {
		params ["_args","_id"];
		_args params ["_buffer","_type","_posArray"];
		[_id] call CBA_fnc_removePerFrameHandler;
		[{
			params ["_args","_id"];
			_args params ["_buffer","_type","_posArray"];

			if (count _posArray >= ((ceil (SEN_range*0.00255)) max 25) min 40) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				{
					_roads = _x nearRoads (_buffer*0.25);
					if !(_roads isEqualTo []) then {
						_road = _roads select floor (random (count _roads));
						_pos = if (random 1 < 0.5) then {_road modelToWorld [-3,0,0]} else {_road modelToWorld [3,0,0]};
						_pos set [2,0];
						_mine = (_type select floor (random (count _type))) createVehicle _pos;
						if (GET_DEBUG) then {
								_mrk = createMarker [format["SEN_%1_ied_mrk",_pos],_pos];
								_mrk setMarkerType "mil_dot";
								_mrk setMarkerColor "ColorOrange";
								_mrk setMarkerText format ["%1",typeOf _mine];
						};
					};
				} forEach _posArray;
			};
			_check = true;
			_pos = [SEN_centerPos,0,SEN_range] call SEN_fnc_findRandomPos;
			if !(_pos isEqualTo []) then {
				if (!((_pos nearRoads (_buffer*0.25)) isEqualTo []) && {!(surfaceIsWater _pos)} && {_pos distance2D (getMarkerPos "SEN_safezone_mrk") > ((getMarkerSize "SEN_safezone_mrk") select 0)*2} && {{_pos distance2D (getpos _x) < 350} count SEN_occupiedLocation isEqualTo 0}) then {
					{
						if (_x distance2D _pos < _buffer) exitWith {_check = false};
					} forEach _posArray;
					if (_check) then {_posArray pushBack _pos;};
				};
			};
		}, 0.1, [_buffer,_type,_posArray]] call CBA_fnc_addPerFrameHandler;
	};
}, 5, [_buffer,_type,_posArray]] call CBA_fnc_addPerFrameHandler;