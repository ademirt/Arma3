/*
Author: SENSEI

Last modified: 10/4/2015

Description: occupied location and surrounding patrol setup
__________________________________________________________________*/
if (!isServer && hasInterface) exitWith {};

#include "..\data\define.hpp"

private "_exit";

if (GET_HC) then {
	_exit = (isServer);
	["Spawning occupied location units and patrols on headless client."] call SEN_fnc_log;
} else {
	_exit = (!isServer);
	["Spawning occupied location units and patrols on server."] call SEN_fnc_log;
};

if (_exit) exitWith {["Exiting SEN_occupy.sqf."] call SEN_fnc_log};

{
	// town vars
	_townPos = getpos _x;
	_townPos set [2,0];
	_townName = text _x;
	_townType = type _x;
	_townSize = size _x;
	_avgTownSize = ((_townSize select 0) + (_townSize select 1))*0.5;

	// town type specifics
	call {
		if (_townType isEqualTo "NameCityCapital") exitWith {
			[ATLtoASL _townPos,ceil random 4,_avgTownSize*1.2,_avgTownSize*2.5] call SEN_fnc_spawnSniper;
			[_townPos,_avgTownSize,2] call SEN_fnc_spawnTower;
			[_townPos, _avgTownSize*0.45, 2] call SEN_fnc_spawnStatic;
			_grp = [[_townPos, 0, 50, 3, 0, 0.5, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,0,SEN_occupiedEnemyCount,SEN_enemySide] call SEN_fnc_spawnGroup;
			_vehArray = [[_townPos, 0, 150, 8, 0, 1, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,1,1,SEN_enemySide] call SEN_fnc_spawnGroup;
			[_grp,_avgTownSize*0.75] call SEN_fnc_setPatrolGroup;
			[(_vehArray select 0),_avgTownSize*2] call SEN_fnc_setPatrolVeh;
			if (random 1 < 0.5) then {
				_airArray = [_townPos,2,1] call SEN_fnc_spawnGroup;
				[(_airArray select 0),2000] call SEN_fnc_setPatrolVeh;
			};

			_mrkOccupy = createMarker [format["SEN_occupy_mrk_%1", _townName], [((_townPos) select 0), ((_townPos) select 1) - 70]];
			_mrkOccupy setMarkerType "o_unknown";
			_mrkOccupy setMarkerText "Occupied Capital";
			_mrkOccupy setMarkerColor "ColorEAST";

			_trgOccupy = createTrigger ["EmptyDetector", _townPos];
			_trgOccupy setTriggerArea [((_townSize select 0) + 100),((_townSize select 1) + 100), 0, false];
			_trgOccupy setTriggerActivation ["WEST", "PRESENT", false];
			_var = format ["SEN_occupiedLocation select %1",_forEachIndex];
			_trgAct = format ["[%1,%2] call SEN_fnc_onOccupiedTrg",str _var,str _mrkOccupy];
			_trgOccupy setTriggerStatements ["this", _trgAct, ""];
		};
		if (_townType isEqualTo "NameCity") exitWith {
			[ATLtoASL _townPos,ceil random 3,_avgTownSize*1.2,_avgTownSize*2.5] call SEN_fnc_spawnSniper;
			[_townPos,_avgTownSize,2] call SEN_fnc_spawnTower;
			[_townPos, _avgTownSize*0.45, 2] call SEN_fnc_spawnStatic;
			_grp = [[_townPos, 0, 50, 3, 0, 0.5, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,0,SEN_occupiedEnemyCount*.75,SEN_enemySide] call SEN_fnc_spawnGroup;
			[_grp,_avgTownSize*0.75] call SEN_fnc_setPatrolGroup;
			if (random 1 < 0.7) then {
				_vehArray = [[_townPos, 0, 150, 8, 0, 1, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,1,1,SEN_enemySide] call SEN_fnc_spawnGroup;
				[(_vehArray select 0),_avgTownSize*2] call SEN_fnc_setPatrolVeh;
			};
			if (random 1 < 0.25) then {
				_airArray = [_townPos,2,1] call SEN_fnc_spawnGroup;
				[(_airArray select 0),2000] call SEN_fnc_setPatrolVeh;
			};

			_mrkOccupy = createMarker [format["SEN_occupy_mrk_%1", _townName], [((_townPos) select 0), ((_townPos) select 1) - 70]];
			_mrkOccupy setMarkerType "o_unknown";
			_mrkOccupy setMarkerText "Occupied City";
			_mrkOccupy setMarkerColor "ColorEAST";

			_trgOccupy = createTrigger ["EmptyDetector", _townPos];
			_trgOccupy setTriggerArea [((_townSize select 0) + 100),((_townSize select 1) + 100), 0, false];
			_trgOccupy setTriggerActivation ["WEST", "PRESENT", false];
			_var = format ["SEN_occupiedLocation select %1",_forEachIndex];
			_trgAct = format ["[%1,%2] call SEN_fnc_onOccupiedTrg",str _var,str _mrkOccupy];
			_trgOccupy setTriggerStatements ["this", _trgAct, ""];
		};
		// NameVillage
		[ATLtoASL _townPos,ceil random 2,_avgTownSize*1.2,_avgTownSize*2.5] call SEN_fnc_spawnSniper;
		[_townPos,_avgTownSize,1] call SEN_fnc_spawnTower;
		[_townPos, _avgTownSize*0.45, 1] call SEN_fnc_spawnStatic;
		_grp = [[_townPos, 0, 50, 3, 0, 0.5, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,0,SEN_occupiedEnemyCount*.50,SEN_enemySide] call SEN_fnc_spawnGroup;
		[_grp,_avgTownSize*0.75] call SEN_fnc_setPatrolGroup;
		if (random 1 < 0.3) then {
			_vehArray = [[_townPos, 0, 150, 8, 0, 1, 0,[],[_townPos,_townPos]] call BIS_fnc_findSafePos,1,1,SEN_enemySide] call SEN_fnc_spawnGroup;
			[(_vehArray select 0),_avgTownSize*2] call SEN_fnc_setPatrolVeh;
		};

		_mrkOccupy = createMarker [format["SEN_occupy_mrk_%1", _townName], [((_townPos) select 0), ((_townPos) select 1) - 70]];
		_mrkOccupy setMarkerType "o_unknown";
		_mrkOccupy setMarkerText "Occupied Town";
		_mrkOccupy setMarkerColor "ColorEAST";

		_trgOccupy = createTrigger ["EmptyDetector", _townPos];
		_trgOccupy setTriggerArea [((_townSize select 0) + 100),((_townSize select 1) + 100), 0, false];
		_trgOccupy setTriggerActivation ["WEST", "PRESENT", false];
		_var = format ["SEN_occupiedLocation select %1",_forEachIndex];
		_trgAct = format ["[%1,%2] call SEN_fnc_onOccupiedTrg",str _var,str _mrkOccupy];
		_trgOccupy setTriggerStatements ["this", _trgAct, ""];
	};

	if (GET_DEBUG) then {
		_radius = (((_townSize select 0) + (_townSize select 1))/2) + 100;
		_mrk = createMarker [format["SEN_occupy_AO_%1",_townName],_townPos];
		_mrk setMarkerShape "ELLIPSE";
		_mrk setMarkerSize [_radius,_radius];
		_mrk setMarkerColor "ColorEAST";
	};

	_count = if (SEN_patrol isEqualTo 1) then {((ceil (SEN_range/512)) max 9) min 14} else {0}; // number of patrols per location
	if !(_count isEqualTo 0) then {
		private "_check";
		_check = [];
		[{
			params ["_args","_id"];
			_args params ["_town","_count","_check"];

			_townPos = getPos _town;

			if (count _check isEqualTo _count) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
				SEN_complete = SEN_complete + (1/count SEN_occupiedLocation);
				if (GET_HC && {SEN_complete isEqualTo 2}) then {publicVariableServer "SEN_complete"};
				["%1 occupied.",text _town] call SEN_fnc_log;
			};
			private "_grp";
			_pos = [_townPos,SEN_range*0.05 max 500,SEN_range*0.20 max 2000,"B_MRAP_01_F"] call SEN_fnc_findRandomPos;
			if !(_pos isEqualTo []) then {
				if (_pos distance2D SEN_centerPos <= SEN_range && {!surfaceIsWater _pos} && {_pos distance2D (getMarkerPos "SEN_safezone_mrk") > ((getMarkerSize "SEN_safezone_mrk") select 0)}) then {
					if (random 1 > SEN_armoredCount) then {
						_grp = [_pos,0,ceil (4 + random 2)] call SEN_fnc_spawnGroup; // infantry
						[_grp,SEN_range*0.08 max 1000,false] call SEN_fnc_setPatrolGroup;
					} else {
						_grp = [_pos,1,1] call SEN_fnc_spawnGroup; // technical
						[_grp select 0,(SEN_range*0.20 max 2000)] call SEN_fnc_setPatrolVeh;
						_grp = group (_grp select 0);
					};
					if (GET_DEBUG) then {
						_mrkPatrol = createMarker [format["SEN_patrol_%1",_grp],_pos];
						_mrkPatrol setMarkerType "o_unknown";
						_mrkPatrol setMarkerColor "ColorEAST";
						[{
							params ["_args","_id"];
							_args params ["_grp"];

							if (!alive (leader _grp)) exitWith {
								[_id] call CBA_fnc_removePerFrameHandler;
							};
							_mrk = createMarker [format["SEN_patrol_tracking_%1",getposATL leader _grp],getposATL leader _grp];
							_mrk setMarkerType "mil_dot";
							_mrk setMarkerColor "ColorEAST";
						}, 30, [_grp]] call CBA_fnc_addPerFrameHandler;
					};
					_check pushBack 0;
				};
			};
		}, 0.5, [_x,_count,_check]] call CBA_fnc_addPerFrameHandler;
	};
} forEach SEN_occupiedLocation;