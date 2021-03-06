// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_recruitbuttonaction.sqf"
#include "..\..\..\x_setup.sqf"

if (isDedicated || {player getVariable "d_recdbusy"}) exitWith {};

disableSerialization;

player setVariable ["d_recdbusy", true];

if (d_current_ai_num >= d_max_ai) exitWith {
	[playerSide, "HQ"] sideChat format [localize "STR_DOM_MISSIONSTRING_694", d_max_ai];
	player setVariable ["d_recdbusy", false];
};

if (player != leader (group player)) exitWith {
	[playerSide, "HQ"] sideChat (localize "STR_DOM_MISSIONSTRING_695");
	player setVariable ["d_recdbusy", false];
};

d_current_ai_num = d_current_ai_num + 1;
__TRACE_1("","d_current_ai_num")

private _exitj = false;
if (d_with_ranked) then {
	private _rank = rank player;
	if (_rank == "PRIVATE") exitWith {
		[playerSide, "HQ"] sideChat (localize "STR_DOM_MISSIONSTRING_696");
		_exitj = true;
	};

	if (score player < ((d_points_needed select 0) + (d_ranked_a select 3))) exitWith {
		[playerSide, "HQ"] sideChat format [localize "STR_DOM_MISSIONSTRING_697", score player, d_ranked_a select 3];
		_exitj = true;
	};

	private _max_rank_ai = switch (_rank) do {
		case "CORPORAL": {3};
		case "SERGEANT": {4};
		case "LIEUTENANT": {5};
		case "CAPTAIN": {6};
		case "MAJOR": {7};
		case "COLONEL": {8};
	};
	if (d_current_ai_num >= _max_rank_ai) exitWith {
		[playerSide, "HQ"] sideChat format [localize "STR_DOM_MISSIONSTRING_698", _max_rank_ai];
		_exitj = true;
	};
	// each AI soldier costs score points
	[player, (d_ranked_a select 3) * -1] remoteExecCall ["addScore", 2];
};

if (_exitj) exitWith {
	player setVariable ["d_recdbusy", false];
	d_current_ai_num = d_current_ai_num - 1;
};

private _dispx = uiNamespace getVariable "d_AIRecruitDialog";
private _idx = lbCurSel (_dispx displayCtrl 1000);
if (_idx == -1) exitWith {
	player setVariable ["d_recdbusy", false];
	d_current_ai_num = d_current_ai_num - 1;
};

private _grp = group player;
private _spawnpos = [];
if (player distance2D d_AI_HUT < 20) then {
	_spawnpos = getPosATL d_AISPAWN;
} else {
	if (!isNil "d_additional_recruit_buildings") then {
		{
			if (!isNil "_x" && {!isNull _x} && {player distance2D _x < 20}) exitWith {
				_spawnpos = player modelToWorldVisual [0,-15,0];
				false
			};
			false
		} count d_additional_recruit_buildings;
	};
};
if (_spawnpos isEqualTo []) exitWith {
	player setVariable ["d_recdbusy", false];
	d_current_ai_num = d_current_ai_num - 1;
};

private _torecruit = d_UnitsToRecruit select _idx;
private _unit = _grp createUnit [_torecruit, _spawnpos, [], 0, "NONE"];
[_unit] join _grp;
#ifdef __CARRIER__
if (surfaceIsWater _spawnpos) then {
	_unit setPosASL [_spawnpos select 0, _spawnpos select 1, d_carrier_height];
};
#endif
_unit setSkill 1;
_unit setRank "PRIVATE";
if (d_with_ranked && {!d_with_ace}) then {
	_unit addEventHandler ["handleHeal", {_this call d_fnc_handleheal}];
};
if (d_WithRevive == 0 && {_unit getUnitTrait "Medic"}) then {
	//[_unit] call d_fnc_AIRevive;
	[_unit] execFSM "fsms\fn_AIRevive.fsm";
};
[_grp, player] remoteExecCall ["d_fnc_plgroup", 2];

d_current_ai_units pushBack _unit;

_unit call d_fnc_removenvgoggles_fak;

if (!d_with_ace) then {
	_unit addEventhandler ["handleDamage", {
		if (d_player_in_base && {player inArea d_base_array}) then {
			private _shooter = param [3];
			if (!isNil "_shooter" && {!isNull _shooter && {isPlayer _shooter}}) then {
				0
			} else {
				param [2]
			};
		} else {
			param [2];
		};
	}];
};

if (d_current_ai_num == d_max_ai) then {
	(_dispx displayCtrl 1010) ctrlShow false;
};

private _ctrl = _dispx displayCtrl 1011;
if (!ctrlShown _ctrl) then {
	_ctrl ctrlShow true;
};
_ctrl = _dispx displayCtrl 1012;
if (!ctrlShown _ctrl) then {
	_ctrl ctrlShow true;
};

private _control = _dispx displayCtrl 1001;
private _ipic = getText (configFile>>"cfgVehicles">>_torecruit>>"icon");
__TRACE_2("","_torecruit","_ipic")
private _pic = if (_ipic == "") then {
	"#(argb,8,8,3)color(1,1,1,0)"
} else {
	getText(configFile>>"CfgVehicleIcons">>_ipic)
};
__TRACE_1("","_pic")
private _index = _control lbAdd ([_torecruit, "CfgVehicles"] call d_fnc_GetDisplayName);
_control lbSetPicture [_index, _pic];
_control lbSetColor [_index, [1, 1, 0, 0.8]];

(_dispx displayCtrl 1030) ctrlSetText format [localize "STR_DOM_MISSIONSTRING_693", d_current_ai_num, d_max_ai];

if (!d_with_ranked) then {
	_unit addAction [localize "STR_DOM_MISSIONSTRING_1585", {["Open",[true,nil,param [0]]] call bis_fnc_arsenal}, [], -1, false, true, "", "true", 3];
};

#ifndef __TT__
[_unit] remoteExecCall ["d_fnc_addceo", 2];
#endif
addToRemainsCollector [_unit];

if (d_ai_alone_in_vehicle == 1) then {
	_unit addEventhandler ["getInMan", {
		params ["_unit", "_pos", "_vec"];
		if (_pos == "driver") then {
			private _hasplayer = false;
			{
				if (isPlayer _x) exitWith {
					_hasplayer = true;
				};
				false
			} count (crew _vec);
			if (!_hasplayer) then {
				_unit action ["getOut", _vec];
				hintSilent "Attention!!!!\n\nAI is only allowed to drive a vehicle if a player is inside the vehicle!";
			};
		};
	}];
	/*_unit addEventhandler ["SeatSwitchedMan", {
		//unit1: Object - Unit switching seat.
		//unit2: Object - Unit with which unit1 is switching seat.
		//vehicle: Object - Vehicle where switching seats is taking place.
		params ["_unit1", "_unit2", "_vec"];
		if ((assignedVehicleRole _unit1) select 0 == "driver") then {
			private _hasplayer = false;
			{
				if (isPlayer _x) exitWith {
					_hasplayer = true;
				};
				false
			} count (crew _vec);
			if (!_hasplayer) then {
				private _old_assigned = [];
				if (!isNull _unit2) then {
					_old_assigned = assignedVehicleRole _unit1;
					moveOut _unit2;
				};
			};
		};
		
	}];*/
};

player setVariable ["d_recdbusy", false];