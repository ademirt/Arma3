/*
Author: SENSEI

Last modified: 10/2/2015

Description:  creates actions for ACE3 interaction menu
__________________________________________________________________*/
if !(hasInterface) exitWith {};

#include "..\data\define.hpp"

// top level actions
_action = ["SEN_DCG","DCG Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_FOB","Foward Operating Base","",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Civ","Civilians","",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Transport","Request Transport","",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG"], _action] call ace_interact_menu_fnc_addActionToObject;

// self actions
_action = ["SEN_FOB_create","Deploy FOB Pirelli","",{call SEN_fnc_fobCreate;},{(vehicle player isEqualTo player) && {!(GET_FOBDEPLOYED)} && {!visibleMap}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_FOB_request","Request FOB Pirelli Control","",{call SEN_fnc_fobRequest;},{(vehicle player isEqualTo player) && {GET_FOBDEPLOYED} && {!visibleMap}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Question","Question Nearby Civilians","",{call SEN_fnc_onCivQuestion;},{(vehicle player isEqualTo player) && {!visibleMap}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "SEN_DCG","SEN_Civ"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Approval","Check Civilian Approval","",{call SEN_fnc_checkApproval;},{!visibleMap}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_Civ"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Manual","Open Field Manual","",{[] spawn {(findDisplay 46) createDisplay "RscDisplayFieldManual"}},{!visibleMap}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG"], _action] call ace_interact_menu_fnc_addActionToObject;

{
	_action = [format ["SEN_Transport_%1",_x],format ["Call in %1",getText (configfile >> "CfgVehicles" >> _x >> "displayName")],"",{[_this select 2] call SEN_fnc_transportRequest;},{(vehicle player isEqualTo player) && {!visibleMap}},{},_x] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_Transport"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach SEN_airPoolWest;

// top level actions
_action = ["SEN_TransportFOB","","",{},{true},{},[],[-0.05,-0.35,-2.6],5] call ace_interact_menu_fnc_createAction;
[SEN_FlagMOB, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_TransportMOB","","",{},{true},{},[],[-0.05,-0.35,-2.6],5] call ace_interact_menu_fnc_createAction;
[SEN_FlagFOB, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_VehicleStation","","",{},{true},{},[],[0,0,0.5],5] call ace_interact_menu_fnc_createAction;
[SEN_vehicleStation, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_AmmoStation","","",{},{true},{},[],[0,0,0.5],5] call ace_interact_menu_fnc_createAction;
[SEN_ammoStation, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

// object actions
_action = ["SEN_DismantleFOB","Dismantle FOB Pirelli","",{[] remoteExecCall ["SEN_fnc_fobDelete", 2, false]},{GET_FOBDEPLOYED && !GET_FOBLOCK}] call ace_interact_menu_fnc_createAction;
[SEN_mob_laptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_CleanMOB","Clean MOB Dodge","",{call SEN_fnc_cleanupMOB},{true}] call ace_interact_menu_fnc_createAction;
[SEN_mob_laptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_Debriefing","End Mission","",{(_this select 2) remoteExecCall ["BIS_fnc_endMission", 0, false]},{["debriefing"] call BIS_fnc_taskExists},{},["SEN_end",true,true]] call ace_interact_menu_fnc_createAction;
[SEN_mob_laptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_TransportFOBMove","Transport to FOB Pirelli","",{(_this select 2) spawn SEN_fnc_setPlayerToFlag},{true},{},[1]] call ace_interact_menu_fnc_createAction;
[SEN_FlagMOB, 0, ["SEN_TransportFOB"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_TransportMOBMove","Transport to MOB Dodge","",{(_this select 2) spawn SEN_fnc_setPlayerToFlag},{true},{},[0]] call ace_interact_menu_fnc_createAction;
[SEN_FlagFOB, 0, ["SEN_TransportMOB"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_VehicleStationOpen","Vehicle Station","",{(_this select 2) spawn VVS_fnc_openVVS},{true},{},["SEN_vehSpawn_mrk","All"]] call ace_interact_menu_fnc_createAction;
[SEN_vehicleStation, 0, ["SEN_VehicleStation"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_AmmoStationOpen","Ammo Station","",{(_this select 2) spawn VVS_fnc_openVVS},{true},{},["SEN_ammo_mrk","Ammo"]] call ace_interact_menu_fnc_createAction;
[SEN_ammoStation, 0, ["SEN_AmmoStation"], _action] call ace_interact_menu_fnc_addActionToObject;

if !(isNil "SEN_ShipStation") then {
	_action = ["SEN_ShipStation","","",{},{true},{},[],[0,0,0.5],5] call ace_interact_menu_fnc_createAction;
	[SEN_shipStation, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["SEN_shipStationOpen","Ship Station","",{(_this select 2) spawn VVS_fnc_openVVS},{true},{},["SEN_shipSpawn_mrk","Ship"]] call ace_interact_menu_fnc_createAction;
	[SEN_shipStation, 0, ["SEN_ShipStation"], _action] call ace_interact_menu_fnc_addActionToObject;
};

if (SEN_acreEnabled) then {
	_action = ["SEN_ArsenalOpen","Open Arsenal","",{{player removeItem _x} forEach (call acre_api_fnc_getCurrentRadioList); (_this select 2) spawn bis_fnc_arsenal;},{true},{},["Open",true]] call ace_interact_menu_fnc_createAction;
	[SEN_arsenal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["SEN_ArsenalRadio","Take Radio","",{call SEN_fnc_setRadio},{true}] call ace_interact_menu_fnc_createAction;
	[SEN_arsenal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["SEN_ArsenalRadioPack","Take Pack Radio","",{
		if !([player, SEN_ACRE_SUPR] call acre_api_fnc_hasKindOfRadio) then {
			if (player canAddItemToBackpack SEN_ACRE_SUPR) then {
				player addItemToBackpack SEN_ACRE_SUPR;
				hintSilent format ["Added %1 to backpack.",[configFile >> "cfgWeapons" >> SEN_ACRE_SUPR] call BIS_fnc_displayName];
			} else {
				if ((backpack player) isEqualTo "") then {
					player addBackpack "B_Kitbag_cbr";
					player addItemToBackpack SEN_ACRE_SUPR;
					hintSilent format ["Added %1 to backpack.",[configFile >> "cfgWeapons" >> SEN_ACRE_SUPR] call BIS_fnc_displayName];
				};
			};
		} else {
			hintSilent "You already have a pack radio.";
		};
	},{true}] call ace_interact_menu_fnc_createAction;
	[SEN_arsenal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} else {
	_action = ["SEN_ArsenalOpen","Open Arsenal","",{(_this select 2) spawn bis_fnc_arsenal;},{true},{},["Open",true]] call ace_interact_menu_fnc_createAction;
	[SEN_arsenal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	_action = ["SEN_ArsenalRadio","Take Radio","",{call SEN_fnc_setRadio},{true}] call ace_interact_menu_fnc_createAction;
	[SEN_arsenal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};