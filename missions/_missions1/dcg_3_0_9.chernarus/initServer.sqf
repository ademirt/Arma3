/*
Author: SENSEI

Last modified: 9/14/2015

Note: init order not guaranteed
__________________________________________________________________*/
#include "data\define.hpp"

[SEN_cacheDist,0,false,100,SEN_cacheDist,SEN_cacheDist] execVM "scripts\zbe_cache\main.sqf";
["Initialize"] call BIS_fnc_dynamicGroups;

if (isClass (configfile >> "CfgPatches" >> "task_force_radio")) then {
	tf_give_personal_radio_to_regular_soldier = false;
	publicVariable "tf_give_personal_radio_to_regular_soldier";
	tf_no_auto_long_range_radio = true;
	publicVariable "tf_no_auto_long_range_radio";
	tf_give_microdagr_to_soldier = false;
	publicVariable "tf_give_microdagr_to_soldier";
	tf_same_sw_frequencies_for_side = true;
	publicVariable "tf_same_sw_frequencies_for_side";
	tf_same_lr_frequencies_for_side = true;
	publicVariable "tf_same_lr_frequencies_for_side";
	tf_default_radioVolume = 4;
	publicVariable "tf_default_radioVolume";
	SEN_TFAR_RF = "tf_rf7800str";
	publicVariable "SEN_TFAR_RF";
	SEN_TFAR_SW = "tf_anprc152";
	publicVariable "SEN_TFAR_SW";
	SEN_TFAR_LR = "tf_rt1523g_big";
	publicVariable "SEN_TFAR_LR";
};

// side setup
if (SEN_enemySide isEqualTo 0) then {SEN_enemySide = EAST} else {SEN_enemySide = RESISTANCE};
createCenter SEN_enemySide;
WEST setFriend [SEN_enemySide, 0];
CIVILIAN setFriend [WEST,1];
CIVILIAN setFriend [SEN_enemySide,1];

// location setup
SEN_range = worldSize*0.5;
SEN_centerPos = [SEN_range,SEN_range,0];
_SEN_blacklistLocation = ["Sagonisi","Ekali","Timurkalay","Delfinaki","Kalithea","Ioannina"]; // locations in array will be removed from DCG. You can add to array, but do not remove current locations from list

{ // if location is in _SEN_blacklistLocation, does not have a name or is near the MOB safezone, it is not added to DCG
	_locName = text _x;
	_locPos = getpos _x;
	_locPos set [2,0];
	if (_locPos distance2D (getmarkerpos "sen_safezone_mrk") > ((getMarkerSize "SEN_safezone_mrk") select 0) + 900) then {
		if (!(_locName in _SEN_blacklistLocation) && {!(_locName isEqualTo "")}) then {SEN_whitelistLocation pushBack _x};
	};
} forEach (nearestLocations [SEN_centerPos, ["NameCityCapital","NameCity","NameVillage"], SEN_range]);

["SEN_range: %1, SEN_centerPos: %2, SEN_whitelistLocation count: %3",SEN_range, SEN_centerPos, count SEN_whitelistLocation] call SEN_fnc_log;

// headless client setup
if (GET_HC) then {
	["Headless client: TRUE."] call SEN_fnc_log;
} else {
	["Headless client: FALSE."] call SEN_fnc_log;
};

// safezone setup
"SEN_safezone_mrk" setMarkerAlpha 0;
[{
	{
		if (side _x isEqualTo SEN_enemySide && {!isPlayer _x}) then {deleteVehicle (vehicle _x); deleteVehicle _x};
	} forEach ((getMarkerPos "SEN_safezone_mrk") nearEntities [["Man","LandVehicle","Ship","Air"], ((getMarkerSize "SEN_safezone_mrk") select 0) min 2000]);
}, 60, []] call CBA_fnc_addPerFrameHandler;

// transport setup
"SEN_transportRequest" addPublicVariableEventHandler {[_this select 1] spawn SEN_fnc_transportHandler};
missionNameSpace setVariable ["SEN_transportReady", 1];

// FOB setup
"SEN_fobRequest" addPublicVariableEventHandler {[_this select 1] spawn SEN_fnc_fobRequestHandler};
SEN_curatorFOBUnitUID = "";
addMissionEventHandler ["HandleDisconnect",{
	if ((_this select 2) isEqualTo SEN_curatorFOBUnitUID) then {unassignCurator SEN_curatorFOB};
	deleteVehicle (_this select 0);
	false
}];

// debug setup
if (GET_DEBUG) then {
	[{
		_allEnemy = {alive _x && {side _x isEqualTo SEN_enemySide}} count allUnits;
		_allCiv = {alive _x && {side _x isEqualTo CIVILIAN}} count allUnits;
		_allGrp = str (count allGroups);
		["ENEMY COUNT: %1, CIVILIAN COUNT: %2, GROUP COUNT: %3, SERVER FPS: %4, MISSION UPTIME: %5",_allEnemy,_allCiv,_allGrp,round diag_fps,time] call SEN_fnc_log;
	}, 60, []] call CBA_fnc_addPerFrameHandler;
};

// MOB Dodge Medical Center setup
private "_grp";
if !(getMarkerColor "SEN_med_mrk" isEqualTo "") then {
	_med = ["Land_Hospital_main_F", "Land_Hospital_side2_F", "Land_Hospital_side1_F", "Land_Medevac_house_V1_F", "Land_Medevac_HQ_V1_F"];
	{
		if ((typeOf _x) in _med) then {_x setvariable["ace_medical_isMedicalFacility", true, true]};
	} forEach ((getMarkerPos "SEN_med_mrk") nearObjects ["House", 500]);
	_grp = createGroup civilian;
	_grp setBehaviour "CARELESS";
	_grp setVariable ["zbe_cacheDisabled", true, true];
	_hospital1 = (nearestObjects [getMarkerPos "SEN_med_mrk", ["Land_Hospital_main_F"], 500]) select 0;
	_hospital2 = (nearestObjects [getMarkerPos "SEN_med_mrk", ["Land_Medevac_HQ_V1_F"], 500]) select 0;
	if !(isNil "_hospital1") then {
		for "_i" from 3 to 6 do {
			_doc = _grp createUnit ["C_scientist_F", getMarkerPos "SEN_med_mrk", [], 0, "NONE"];
			_doc setPosATL (_hospital1 buildingPos _i);
			_doc setFormDir ([getPosASL _doc, getMarkerPos "SEN_med_mrk"] call BIS_fnc_dirTo);
			_doc setDir ([getPosASL _doc, getMarkerPos "SEN_med_mrk"] call BIS_fnc_dirTo);
			_doc disableAI "MOVE";
			_doc disableAI "FSM";
			_doc allowDamage false;
			_doc setVariable ["ace_medical_allowDamage", false];
		};
	};
	if !(isNil "_hospital2") then {
		_doc = _grp createUnit ["C_scientist_F",getMarkerPos "SEN_med_mrk", [], 0, "NONE"];
		_doc setPosATL (_hospital2 buildingPos 1);
		_doc setFormDir ([getPosASL _doc, getPosASL _hospital2] call BIS_fnc_dirTo) - 50;
		_doc setDir ([getPosASL _doc, getPosASL _hospital2] call BIS_fnc_dirTo) - 50;
		_doc disableAI "MOVE";
		_doc disableAI "FSM";
		_doc allowDamage false;
		_doc setVariable ["ace_medical_allowDamage", false];
	};
};

// MOB Dodge headquarters setup
SEN_mob_laptop allowDamage false;
SEN_arsenal allowDamage false;
clearItemCargoGlobal SEN_arsenal;
clearWeaponCargoGlobal SEN_arsenal;
clearMagazineCargoGlobal SEN_arsenal;

// occupied location setup
for "_s" from 1 to SEN_occupiedCount do {
	_targetTown = SEN_whitelistLocation select floor (random (count SEN_whitelistLocation));
	SEN_occupiedLocation pushBack _targetTown;
	SEN_whitelistLocation = SEN_whitelistLocation - [_targetTown];
	["Occupied location: Name: %1, Position: %2, Type: %3",text _targetTown,getpos _targetTown,type _targetTown] call SEN_fnc_log;
	if (SEN_VFX isEqualTo 1) then {
		_townPos = getpos _targetTown;
		_townPos set [2,0];
		_townSize = size _targetTown;
		_avgTownSize = ((_townSize select 0) + (_townSize select 1))*0.5;

		// spawn wrecked cars
		_wreckArray = ["Land_Wreck_Truck_dropside_F","Land_Wreck_Truck_F","Land_Wreck_UAZ_F","Land_Wreck_Ural_F","Land_Wreck_Van_F","Land_Wreck_Skodovka_F","Land_Wreck_CarDismantled_F","Land_Wreck_Car3_F","Land_Wreck_Car_F"];
		_fxArray = [];
		_count = ceil random 4;
		[{
			params ["_args","_id"];
			_args params ["_townPos","_avgTownSize","_fxArray","_wreckArray","_count"];

			if (count _fxArray isEqualTo _count) exitWith {
				[_id] call CBA_fnc_removePerFrameHandler;
			};
			_vehPos = [_townPos,_avgTownSize*0.25,_avgTownSize,[],"Land_Wreck_Truck_F"] call SEN_fnc_findRandomPos;
			if !(_vehPos isEqualTo []) then {
				if (!isOnRoad _vehPos) then {
					private ["_fx"];
					_veh = (_wreckArray select floor (random (count _wreckArray))) createVehicle [0,0,0];
					_veh setDir random 360;
					_veh setPosATL _vehPos;
					_veh setVectorUp surfaceNormal position _veh;
					_fx = "test_EmptyObjectForSmoke" createVehicle getposATL _veh;
					_fx attachTo [_veh,[0,0,0]];
					_fxArray pushBack _fx;
				};
			};
		}, 1, [_townPos,_avgTownSize,_fxArray,_wreckArray,_count]] call CBA_fnc_addPerFrameHandler;
	};
};

// send variables
if (GET_HC) then {
	(owner SEN_HC) publicVariableClient "SEN_debug";
	(owner SEN_HC) publicVariableClient "SEN_centerPos";
	(owner SEN_HC) publicVariableClient "SEN_range";
	(owner SEN_HC) publicVariableClient "SEN_occupiedLocation";
	(owner SEN_HC) publicVariableClient "SEN_occupiedEnemyCount";
	(owner SEN_HC) publicVariableClient "SEN_whitelistLocation";
	(owner SEN_HC) publicVariableClient "SEN_enemySide";
	(owner SEN_HC) publicVariableClient "SEN_patrol";
	(owner SEN_HC) publicVariableClient "SEN_armoredCount";
	(owner SEN_HC) publicVariableClient "SEN_unitPoolWest";
	(owner SEN_HC) publicVariableClient "SEN_vehPoolWest";
	(owner SEN_HC) publicVariableClient "SEN_airPoolWest";
	(owner SEN_HC) publicVariableClient "SEN_sniperPoolWest";
	(owner SEN_HC) publicVariableClient "SEN_unitPool";
	(owner SEN_HC) publicVariableClient "SEN_vehPool";
	(owner SEN_HC) publicVariableClient "SEN_airPool";
	(owner SEN_HC) publicVariableClient "SEN_sniperPool";
	(owner SEN_HC) publicVariableClient "SEN_officerPool";
	(owner SEN_HC) publicVariableClient "SEN_unitPoolCiv";
	(owner SEN_HC) publicVariableClient "SEN_vehPoolCiv";
	(owner SEN_HC) publicVariableClient "SEN_airPoolCiv";

	"scripts\SEN_occupy.sqf" remoteExec ["BIS_fnc_execVM", owner SEN_HC, false];
} else {
	execVM "scripts\SEN_occupy.sqf";
};

publicVariable "SEN_airPoolWest";
publicVariable "SEN_range";
publicVariable "SEN_PVArray";
SEN_complete = 1;
publicVariable "SEN_complete";

// date and weather setup
sleep 1; // don't remove
_overcast = [];
_hour = 1;
_month = 1;
_day = ceil (random 27);
if (SEN_season isEqualTo -1) then {SEN_season = ([0,1,2,3] select floor (random (count [0,1,2,3])))};
if (SEN_time isEqualTo -1) then {SEN_time = ([0,1,2,3] select floor (random (count [0,1,2,3])))};

call {
	if (SEN_season isEqualTo 1) exitWith {_month = ([9,10,11] select floor (random (count [9,10,11])))};
	if (SEN_season isEqualTo 2) exitWith {_month = ([12,1,2] select floor (random (count [12,1,2])))};
	if (SEN_season isEqualTo 3) exitWith {_month = ([3,4,5] select floor (random (count [3,4,5])))};
	_month = ([6,7,8] select floor (random (count [6,7,8])));
};
call {
	if (SEN_time isEqualTo 1) exitWith {_hour = ([12,13,14,15] select floor (random (count [12,13,14,15])))};
	if (SEN_time isEqualTo 2) exitWith {_hour = ([16,17,18,19] select floor (random (count [16,17,18,19])))};
	if (SEN_time isEqualTo 3) exitWith {_hour = ([20,21,22,23,0,1,2,3,4] select floor (random (count [20,21,22,23,0,1,2,3,4])))};
	_hour = ([5,6,7,8,9,10,11] select floor (random (count [5,6,7,8,9,10,11])));
};

// data from weatherspark.com
call {
	if ((toUpper worldName) isEqualTo "TAKISTAN" || {(toUpper worldName) isEqualTo "KUNDUZ"} || {(toUpper worldName) isEqualTo "MOUNTAINS_ACR"}) exitWith {
		_overcast = [0,0.54,0.60,0.55,0.46,0.32,0.19,0.15,0.15,0.12,0.15,0.25,0.41];
	};
	/*if ((toUpper worldName) isEqualTo "CHERNARUS") exitWith {
		_overcast = [0,0.98,0.96,0.93,0.90,0.86,0.84,0.84,0.86,0.88,0.94,0.96,0.98];
	};*/
	if ((toUpper worldName) isEqualTo "CHERNARUS_SUMMER") exitWith {
		_overcast = [0,0.94,0.92,0.89,0.85,0.76,0.70,0.66,0.65,0.74,0.84,0.91,0.95];
	};
	_overcast = [0,0.67,0.65,0.56,0.52,0.44,0.34,0.26,0.27,0.33,0.47,0.54,0.62]; // default is ALTIS data
};

setDate [2015, _month, _day, _hour, 00];
_overcast = ((_overcast select _month) + random 0.1) min 1;
[_overcast] call BIS_fnc_setOvercast;

//setTimeMultiplier 3.6;

// continue Medical Center setup after briefing screen
if !(isNil "_grp") then {
	if !((units _grp) isEqualTo []) then {
		[units _grp,{
			{
				_action = [format ["SEN_doctor%1",_forEachIndex],"Provide Medical Attention","",{
					[
						10,
						[],
						{
							[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
							hintSilent "You're good to go soldier. Try to be more careful next time.";
						},
						{

						},
						"Providing Medical Attention..."
					] call ace_common_fnc_progressBar;
				},{true}] call ace_interact_menu_fnc_createAction;
				[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
			} forEach _this;
		}] remoteExecCall ["BIS_fnc_call", west, true];
	};
};