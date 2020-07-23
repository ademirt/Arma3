if (not local player) exitWith{};

if ( (count (units group player) + count bon_recruit_queue) >= max_ai_recruits ) exitWith {hint "You've reached the max. allowed group size"};

#include "dialog\definitions.sqf"
disableSerialization;

_update_queue = {
	_display = findDisplay BON_RECRUITING_DIALOG;
	_queuelist = _display displayCtrl BON_RECRUITING_QUEUE;
	_queuelist ctrlSetText format["Units queued: %1",count bon_recruit_queue];
};

_display = findDisplay BON_RECRUITING_DIALOG;
_listbox = _display displayCtrl BON_RECRUITING_UNITLIST;
_sel = lbCurSel _listbox; if(_sel < 0) exitWith{};

_unittype = bon_recruit_recruitableunits select _sel;
_typename = lbtext [BON_RECRUITING_UNITLIST,_sel];

_queuepos = 0;
_queuecount = count bon_recruit_queue;
if(_queuecount > 0) then {
	_queuepos = (bon_recruit_queue select (_queuecount - 1)) + 1;
	hint parseText format["<t size='1.0' font='PuristaMedium' color='#ef2525'>%1</t> added to queue.",_typename];
};
bon_recruit_queue pushBack _queuepos;

[] call _update_queue;

WaitUntil{_queuepos == bon_recruit_queue select 0};
sleep (0.5 * (_queuepos min 1));
hint parseText format["Processing your <t size='1.0' font='PuristaMedium' color='#ffd800'>%1</t>.",_typename];
sleep 1;

_unit = group player createUnit [_unittype, [0,0,0], [], 0, "NONE"];

if (_unittype == "JS_S_FA18X_Pilot") then {	
    
	private _jat = ["B_Plane_CAS_01_F","I_Plane_Fighter_03_CAS_F"];		
	
	if (isClass(configFile >> "cfgPatches" >> "rhsusf_main")) then
	{
		_jat append ["rhsusf_f22"];
	};	
	if (isClass(configFile >> "cfgPatches" >> "JS_S_FA18X")) then
	{
		_jat append ["JS_S_FA18X"];
	};
	if (isClass(configFile >> "cfgPatches" >> "F_35C")) then
	{
		_jat append ["F_35C_S","F_35C"];
	};
	
	[West, "HQ"] sideChat "The force on the way!!";
	
	private _jetWW = _jat call BIS_fnc_selectRandom;
	//create group and aircraft
	private _F35Bveh = createVehicle [_jetWW, [0,0,0], [], 5000, "FLY"];
	_unit moveInDriver _F35Bveh;
} else 
{
  _unit setPos ([(getPos bon_recruit_barracks select 0) + 22 - random 22,(getPos bon_recruit_barracks select 1) + 22 - random 33,0]);
  
};


if (_unittype == "B_Helipilot_F") then {

	
	_unit addAction ["<t color='#ff9900'>Create heli</t>","bon_recruit_units\extra\createheli.sqf",[],1,false,true,""];
	//_unit addAction ["<t color='#ff9900'>Create AHZ1</t>","bon_recruit_units\extra\createheli2.sqf",[],1,false,true,""];
};


if (_unittype == "B_engineer_F") then {
  _unit addAction ["<t color='#ff9900'>Request Vehicle</t>","bon_recruit_units\extra\createcar.sqf",[],1,false,true,""];
};
/*if (_sel == 9) then {
  _unit addAction ["<t color='#ff9900'>Call UGV Storm</t>","bon_recruit_units\extra\createauto.sqf",[],1,false,true,""];	
}; */
if (_unittype == "rhsusf_usmc_recon_marpat_d_marksman") then {

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform "rhs_uniform_FROG01_d";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "rhsusf_ANPVS_14";
	_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";
	_unit addItemToUniform "rhs_mag_mk84";
	_unit addVest "rhsusf_spc_marksman";
	for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_7x45acp_MHP";};
	for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
	_unit addBackpack "B_AssaultPack_ocamo";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m62_Mag";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m118_special_Mag";};
	_unit addHeadgear "rhsusf_mich_bare_norotos_arc_tan";
	_unit addGoggles "rhs_googles_clear";

	_unit addWeapon "rhs_weap_sr25_ec";
	_unit addPrimaryWeaponItem "rhsusf_acc_SR25S";
	_unit addPrimaryWeaponItem "rhsusf_acc_premier";
	_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "lerca_1200_tan";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
};

if (_unittype == "rhsusf_usmc_recon_marpat_d_sniper_M107") then {
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


_unit forceAddUniform "rhs_uniform_g3_mc";
for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
_unit addVest "rhsusf_spc_teamleader";
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_10Rnd_STD_50BMG_mk211";};
_unit addBackpack "B_Carryall_ocamo";
for "_i" from 1 to 5 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_mk211";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_10Rnd_STD_50BMG_M33";};
_unit addItemToBackpack "SmokeShellYellow";
_unit addItemToBackpack "SmokeShell";
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "SmokeShellOrange";
for "_i" from 1 to 2 do {_unit addItemToBackpack "MiniGrenade";};
_unit addHeadgear "H_Booniehat_mcamo";
_unit addGoggles "rhs_googles_clear";

_unit addWeapon "rhs_weap_M107_d";
_unit addPrimaryWeaponItem "rhsusf_acc_premier";
_unit addWeapon "rhsusf_weap_m1911a1";
_unit addWeapon "lerca_1200_black";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

if (_unittype == "rhsusf_usmc_recon_marpat_d_grenadier_m32") then {
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_ANPVS_14";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_6Rnd_M433_HEDP";};
_unit addItemToVest "rhsusf_mag_7x45acp_MHP";
_unit addItemToVest "Chemlight_green";
_unit addBackpack "B_ViperHarness_hex_F";
for "_i" from 1 to 7 do {_unit addItemToBackpack "rhsusf_mag_6Rnd_M433_HEDP";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_mag_6Rnd_M441_HE";};
_unit addHeadgear "rhsusf_mich_helmet_marpatd_norotos";
_unit addGoggles "rhs_googles_clear";

_unit addWeapon "rhs_weap_m32";
_unit addWeapon "rhsusf_weap_m1911a1";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

if (_unittype == "rhsusf_usmc_marpat_d_javelin") then {
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_ANPVS_14";
_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhs_mag_m67";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
_unit addBackpack "B_Carryall_ocamo";
_unit addHeadgear "rhsusf_lwh_helmet_marpatd";
_unit addGoggles "rhs_googles_clear";

_unit addWeapon "rhs_weap_m16a4_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
_unit addWeapon "rhs_weap_fgm148";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

if (_unittype == "rhsusf_usmc_marpat_d_stinger") then {

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_ANPVS_14";
_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhs_mag_m67";
_unit addBackpack "B_ViperHarness_hex_F";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_fim92_mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer";};
_unit addHeadgear "rhsusf_lwh_helmet_marpatd";
_unit addGoggles "rhs_googles_clear";

_unit addWeapon "rhs_weap_m16a4_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
_unit addWeapon "rhs_weap_fim92";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

};

if (_unittype == "rhsusf_usmc_marpat_d_smaw") then {
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_d";
_unit addItemToUniform "FirstAidKit";
_unit addItemToUniform "rhsusf_ANPVS_14";
_unit addVest "rhsusf_spc_light";
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToVest "rhs_mag_m67";
_unit addBackpack "B_Carryall_ocamo";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_smaw_HEDP";};
_unit addItemToBackpack "rhsusf_m112_mag";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
_unit addHeadgear "rhsusf_lwh_helmet_marpatd";
_unit addGoggles "rhs_ess_black";

_unit addWeapon "rhs_weap_m4_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_top";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
_unit addWeapon "rhs_weap_smaw_green";
_unit addSecondaryWeaponItem "rhs_weap_optic_smaw";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

};

if (_unittype == "B_officer_F") then {  
	//[ _unit, GRLIB_respawn_loadout ] call F_setLoadout;//cti liberation    
	[player, [missionNamespace, "w_load_player"]] call bis_fnc_saveInventory;
	[_unit, [missionNamespace, "w_load_player"]] call bis_fnc_loadInventory;//ghost enemy assault	
	/*private _Ag = player getVariable "d_respawngear";
	if (!isNil "_Ag") then {
		_unit setUnitLoadout [_Ag, false];
	};*/

};
if (_unittype == "B_CTRG_soldier_AR_A_F") then {  
	_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
	_loadouts_data = [];
	_counter = 0;
	if ( !isNil "_saved_loadouts" ) then {
		{
			if ( _counter % 2 == 0 ) then {
				_loadouts_data pushback _x;
			};
			_counter = _counter + 1;
		} foreach _saved_loadouts;
	};
    [_unit, [profileNamespace, _loadouts_data select (random count _loadouts_data) ]] call bis_fnc_loadInventory;
};

[_unit] execVM (BON_RECRUIT_PATH+"init_newunit.sqf");

hint parseText format["Your <t size='1.0' font='PuristaMedium' color='#008aff'>%1</t> %2 has arrived.",_typename,name _unit];
bon_recruit_queue = bon_recruit_queue - [_queuepos];

[] call _update_queue;