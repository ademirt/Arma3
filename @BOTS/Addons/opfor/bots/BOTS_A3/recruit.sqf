if (not local player) exitWith{};

if ( (count (units group player) + count bon_recruit_queue) >= maxx_ai_recruits ) exitWith {hint "You've reached the max. allowed group size"};

#include "dialog\definitions.sqf"
disableSerialization;

_update_queue = {
	_display = findDisplay BON_RECRUITING_DIALOG;
	_queuelist = _display displayCtrl BON_RECRUITING_QUEUE;
	_queuelist ctrlSetText format["Units queued: %1",count bon_recruit_queue];
};
//-----------------------------------------------------
_rmvAIitens = {
	_runit = _this select 0;
	removeAllWeapons _runit;
	removeAllItems _runit;
	removeAllAssignedItems _runit;
	removeUniform _runit;
	removeVest _runit;
	removeBackpack _runit;
	removeHeadgear _runit;
	removeGoggles _runit;
};
//-----------------------------------------------------

_display = findDisplay BON_RECRUITING_DIALOG;
_listbox = _display displayCtrl BON_RECRUITING_UNITLIST;
_sel = lbCurSel _listbox; if(_sel < 0) exitWith{};

_unittype = BOTS_recrtUnits select _sel;
_typename = lbtext [BON_RECRUITING_UNITLIST,_sel];

_queuepos = 0;
_queuecount = count bon_recruit_queue;
if(_queuecount > 0) then {
	_queuepos = (bon_recruit_queue select (_queuecount - 1)) + 1;
	hint parseText format["<t size='1.0' font='PuristaMedium' color='#ef2525'>%1</t> added to queue.",_typename];
};
bon_recruit_queue pushBack _queuepos;

call _update_queue;

WaitUntil{_queuepos == bon_recruit_queue select 0};
sleep (0.5 * (_queuepos min 1));
hint parseText format["Processing your <t size='1.0' font='PuristaMedium' color='#ffd800'>%1</t>.",_typename];
//sleep 1;

//private _unit = group player createUnit [_unittype, ([(getPos bon_recruit_barracks select 0) + 33 - random 33,(getPos bon_recruit_barracks select 1) + 40 - random 50,0]), [], 0, "NONE"];
private _unit = group player createUnit [_unittype, [0,0,0], [], 0, "NONE"];

private _veBOT = nil;

if (_unittype == "I_Fighter_Pilot_F") then {	
    
	private _jat = ["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_04_F"];
	
	_veBOT = createVehicle [(_jat call BIS_fnc_selectRandom), [0,0,0], [], 950, "FLY"];
	_unit moveInDriver _veBOT;
	
	[side _unit , "HQ"] sideChat "The force on the way!!";
};

if (_unittype == "I_helipilot_F") then {
	
	
	private _hlTrp = ["I_Heli_light_03_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F"];
	
	// if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then {
		// _hlTrp append ["RHS_UH60M","RHS_UH1Y_d" ];
	// };
	
	_veBOT = createVehicle [(_hlTrp call BIS_fnc_selectRandom), [0,0,0], [], 300, "FLY"];
	
	_unit moveInDriver _veBOT;
	
	[side _unit, "HQ"] sideChat "Transport on the way!!";
};

if (_unittype == "I_Story_Colonel_F") then {
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_U_denim_jersey_blk";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "hlc_30rnd_556x45_EPR";
	_unit addVest "TAC_V_tacv1LC_BK";
	for "_i" from 1 to 13 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellBlue";};
	_unit addHeadgear "CSAR2_Helmet_PilotHeli_Tan";
	_unit addGoggles "G_Aviator";

	_unit addWeapon "hlc_rifle_RU556";
	_unit addPrimaryWeaponItem "optic_Aco_smg";
	
	private _unit2 = group player createUnit ["I_helicrew_F", [0,0,0], [], 0, "NONE"];	
	
	// private _hlX = ["B_Heli_Attack_01_F"];
	
	// if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then {
		// _hlX append ["RHS_AH1Z_wd","RHS_AH64D"];
	// };
	
	//_veBOT = createVehicle [(_hlX call BIS_fnc_selectRandom), [0,0,0], [], 300, "FLY"];
	_veBOT = createVehicle ["O_Heli_Attack_02_dynamicLoadout_F", [0,0,0], [], 300, "FLY"];
	[
		_veBOT,
		["Black",1], 
		true
	] call BIS_fnc_initVehicle;

	_unit moveInDriver _veBOT;
	_unit2 moveInGunner _veBOT;
	
	[side _unit, "HQ"] sideChat "Heli attack on the way!!";
};

if (_unittype == "I_Soldier_AR_F") then {
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_T_BLK_PAD";
	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
	_unit addVest "TAC_V_Sheriff_BA_TB5";
	for "_i" from 1 to 3 do {_unit addItemToVest "hlc_200rnd_556x45_M_SAW";};
	for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	_unit addBackpack "TRYK_B_Carryall_blk";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_200rnd_556x45_M_SAW";};
	_unit addItemToBackpack "rhs_mag_m67";
	_unit addItemToBackpack "150Rnd_556x45_Drum_Mag_F";
	_unit addHeadgear "TRYK_ESS_CAP_OD";


	_unit addWeapon "hlc_m249_pip2";
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Laserdesignator";
};

if (_unittype == "I_Soldier_GL_F") then {
	[_unit] call _rmvAIitens;
	
	
	_unit addWeapon "arifle_AK12_GL_F";
	_unit addPrimaryWeaponItem "muzzle_snds_B";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "optic_Arco_blk_F";
	_unit addPrimaryWeaponItem "30Rnd_762x39_AK12_Mag_F";
	_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addHandgunItem "optic_MRD";
	_unit addHandgunItem "11Rnd_45ACP_Mag";

	_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
	_unit addVest "V_PlateCarrier2_blk";
	_unit addBackpack "B_Kitbag_rgr";

	_unit addWeapon "Laserdesignator";

	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "Chemlight_green";
	for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag";};
	for "_i" from 1 to 3 do {_unit addItemToVest "75rnd_762x39_AK12_Mag_F";};
	_unit addItemToVest "30Rnd_762x39_AK12_Mag_F";
	for "_i" from 1 to 40 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
	_unit addItemToBackpack "SmokeShellBlue";
	_unit addItemToBackpack "SmokeShellGreen";
	_unit addItemToBackpack "SmokeShellOrange";
	for "_i" from 1 to 8 do {_unit addItemToBackpack "30Rnd_762x39_AK12_Mag_F";};
	_unit addItemToBackpack "75rnd_762x39_AK12_Mag_F";
	_unit addHeadgear "H_HelmetSpecB_blk";
	_unit addGoggles "G_Bandanna_sport";	
	
	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
};

if (_unittype == "I_G_engineer_F") then {
  
    _unit addAction ["<t color='#008000'>Call Paradrop Tank...</t>" ,"bots\BOTS_A3\extra\call_tank.sqf",[],1,false,true,""];  
	_unit addAction ["<t color='#ff9900'>Request Vehicle</t>","bots\BOTS_A3\extra\createcar.sqf",[],1,false,true,""];	

	[_unit] call _rmvAIitens;
	
	_unit addWeapon "hlc_rifle_G36TAC";
	_unit addPrimaryWeaponItem "muzzle_snds_M";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "hlc_optic_HensoldtZO_Hi_Docter";
	_unit addPrimaryWeaponItem "hlc_30rnd_556x45_EPR_G36";
	_unit addPrimaryWeaponItem "HLC_bipod_UTGShooters";
	_unit addWeapon "hgun_P07_F";
	_unit addHandgunItem "16Rnd_9x21_Mag";

	_unit forceAddUniform "VSM_OGA_grey_casual_Camo";
	_unit addVest "VSM_OGA_OD_IOTV_2";
	_unit addBackpack "VSM_OGA_OD_Backpack_Kitbag";

	for "_i" from 1 to 4 do {_unit addItemToUniform "FirstAidKit";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "30Rnd_9x21_Mag";
	for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30rnd_556x45_EPR_G36";};
	_unit addItemToVest "hlc_100rnd_556x45_M_G36";
	_unit addItemToBackpack "ToolKit";
    _unit addItemToBackpack "MineDetector";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 9 do {_unit addItemToBackpack "hlc_30rnd_556x45_EPR_G36";};
	_unit addItemToBackpack "hlc_100rnd_556x45_M_G36";
	_unit addHeadgear "VSM_OD_Spray_OPS_2";
	_unit addGoggles "VSM_Shemagh_Facemask_OD_Glasses";
	_unit addWeapon "Laserdesignator";
};

if (_unittype == "I_officer_F") then {
   if (isNil "w_load_player") then {
	  [player, [missionNamespace, "w_load_player"]] call bis_fnc_saveInventory;
   };
   [_unit, [missionNamespace, "w_load_player"]] call bis_fnc_loadInventory;//ghost enemy assault	
};

if (_unittype == "I_Soldier_AT_F") then {
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_T_PAD";
	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
	_unit addVest "TAC_V_Sheriff_BA_TB5";
	_unit addItemToVest "SmokeShellGreen";
	for "_i" from 1 to 4 do {_unit addItemToVest "hlc_12Rnd_357SIG_B_P226";};
	for "_i" from 1 to 6 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
	for "_i" from 1 to 3 do {_unit addItemToVest "hlc_50rnd_556x45_EPR";};
	_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
	_unit addItemToVest "30Rnd_556x45_Stanag_red";
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "MRAWS_HEAT_F";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "MRAWS_HE_F";};
	_unit addItemToBackpack "hlc_30rnd_556x45_EPR";
	_unit addHeadgear "H_Booniehat_khk_hs";
	_unit addGoggles "TRYK_Shemagh";

	_unit addWeapon "hlc_rifle_ACR_mid_black";
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit addPrimaryWeaponItem "optic_Holosight_smg_blk_F";
	_unit addWeapon "launch_MRAWS_olive_F";
	_unit addWeapon "hlc_pistol_P226R_357Combat";
	_unit addWeapon "Binocular";

};

if (_unittype == "I_G_Survivor_F") then {
	
	[_unit] call _rmvAIitens;

	_unit addWeapon "hlc_rifle_g36KTac";
	_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "optic_Hamr";
	_unit addPrimaryWeaponItem "hlc_30rnd_556x45_EPR_G36";
	_unit addPrimaryWeaponItem "HLC_bipod_UTGShooters";

	_unit forceAddUniform "VSM_OGA_grey_casual_Camo";
	_unit addVest "VSM_CarrierRig_Breacher_OGA_OD";
	_unit addBackpack "B_AssaultPack_Kerry";

	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
	_unit addItemToVest "hlc_30rnd_556x45_SPR_G36";
	for "_i" from 1 to 4 do {_unit addItemToVest "hlc_100rnd_556x45_EPR_G36";};
	for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30rnd_556x45_SOST_G36";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_100rnd_556x45_M_G36";};
	_unit addItemToBackpack "hlc_30rnd_556x45_EPR_G36";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};

	_unit setFace "Miller";

	
	_unit setskill ["aimingAccuracy",1.0];
	_unit setskill ["spotDistance",0.95];
	_unit setskill ["spotTime",0.95];
	_unit setskill ["courage",0.95];
	_unit setskill ["commanding",0.95];
	_unit setskill ["aimingShake",0.85];
	_unit setskill ["aimingSpeed",0.85];
	_unit setskill ["reloadSpeed",0.95];
	_unit setUnitTrait ["camouflageCoef",0.95];
	_unit setUnitTrait ["audibleCoef",0.95];
	
	_unit setSkill 1;


};

if (_unittype == "I_soldier_UAV_F") then {
	_unit addAction ["<t color='#ff9900'>Greyhawk</t>","bots\BOTS_A3\extra\grey.sqf",[],1,false,true,""];
	//Independentes não possuem Falco
	//_unit addAction ["<t color='#ff9900'>Falcon</t>","bots\BOTS_A3\extra\falco.sqf",[],1,false,true,""];
	
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
	for "_i" from 1 to 3 do {_unit addItemToUniform "hlc_12Rnd_357SIG_B_P226";};
	_unit addVest "TAC_V_tacv1LC_OD";
	for "_i" from 1 to 6 do {_unit addItemToVest "hlc_60Rnd_545x39_t_rpk";};
	for "_i" from 1 to 2 do {_unit addItemToVest "hlc_12Rnd_357SIG_B_P226";};
	_unit addItemToVest "hlc_45Rnd_545x39_t_rpk";
	_unit addBackpack "I_UAV_01_backpack_F";
	_unit addHeadgear "TRYK_UA_CAP";
	_unit addGoggles "TRYK_TAC_SET_TAN";


	_unit addWeapon "hlc_rifle_ak74m";
	_unit addPrimaryWeaponItem "HLC_Optic_1p29";
	_unit addWeapon "hlc_pistol_P226R_Stainless";
	_unit addHandgunItem "hlc_acc_DBALPL";
	_unit addHandgunItem "HLC_Optic_Docter_CADEX";
	_unit linkItem "I_UavTerminal";
};

if (_unittype == "I_G_medic_F") then {
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_U_B_BLK_tan_Rollup_CombatUniform";
	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
	_unit addVest "TAC_V_Sheriff_BA_TB4";
	for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30rnd_68x43_FMJ";};
	_unit addBackpack "TRYK_B_Medbag_OD";
	_unit addItemToBackpack "Medikit";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "FirstAidKit";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "9Rnd_45ACP_Mag";};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "hlc_30rnd_68x43_FMJ";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_m67";};
	_unit addHeadgear "H_Cap_red";


	_unit addWeapon "hlc_rifle_ACR68_SBR_black";
	_unit addPrimaryWeaponItem "hlc_muzzle_300blk_KAC";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "optic_Aco_smg";
	_unit addWeapon "hgun_ACPC2_F";
};

if (_unittype == "I_G_Soldier_M_F") then {
	[_unit] call _rmvAIitens;


	_unit forceAddUniform "TRYK_U_pad_hood_tan";
	for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
	_unit addVest "TAC_EI_RRV24L_B";
	_unit addItemToVest "HandGrenade";
	_unit addItemToVest "MiniGrenade";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellGreen";
	for "_i" from 1 to 9 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
	_unit addItemToVest "150Rnd_556x45_Drum_Mag_F";
	_unit addBackpack "TAC_MTAP_BK2";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_30rnd_556x45_EPR";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "MiniGrenade";};
	_unit addItemToBackpack "hlc_30rnd_556x45_MDim";
	_unit addHeadgear "TRYK_R_CAP_BLK";
	_unit addGoggles "G_Shades_Black";

	_unit addWeapon "hlc_rifle_samr2";
	_unit addPrimaryWeaponItem "optic_MRCO";
	_unit addWeapon "hgun_Pistol_heavy_01_F";
	_unit addWeapon "Binocular";
};

if (_unittype == "I_G_Sharpshooter_F") then {
	[_unit] call _rmvAIitens;


	_unit forceAddUniform "TRYK_U_pad_hood_Cl_blk";
	_unit addItemToUniform "FirstAidKit";
	for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_30Rnd_9x19_B_MP5";};
	_unit addVest "TAC_V_tacv1L_BK";
	for "_i" from 1 to 3 do {_unit addItemToVest "hlc_30Rnd_9x19_B_MP5";};
	for "_i" from 1 to 6 do {_unit addItemToVest "hlc_20Rnd_762x51_B_M14";};
	_unit addBackpack "TAC_LBT_LEGAB2_OD";
	_unit addItemToBackpack "hlc_50Rnd_762x51_MDIM_M14";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "hlc_30Rnd_9x19_B_MP5";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_20Rnd_762x51_B_M14";};
	_unit addItemToBackpack "rhs_mag_plamyam";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
	_unit addHeadgear "TRYK_H_woolhat";

	_unit addWeapon "hlc_rifle_M14dmr_Rail";
	_unit addPrimaryWeaponItem "hlc_optic_ZF95Base";
	_unit addWeapon "hlc_smg_mp5k";
	_unit addHandgunItem "hlc_muzzle_Agendasix";
    _unit addHandgunItem "hlc_30Rnd_9x19_B_MP5";


};

if (_unittype == "I_G_Soldier_LAT_F") then {
	[_unit] call _rmvAIitens;


	_unit forceAddUniform "TRYK_U_B_BLOD_T";
	for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
	_unit addVest "TAC_V_Sheriff_BA_TB5";
	_unit addItemToVest "SmokeShellGreen";
	for "_i" from 1 to 3 do {_unit addItemToVest "hlc_12Rnd_357SIG_B_P226";};
	for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
	_unit addItemToVest "hlc_50rnd_556x45_EPR";
	_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
	for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_red";};
	for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_556x45_Drum_Mag_F";};
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_30rnd_556x45_EPR";};
	for "_i" from 1 to 7 do {_unit addItemToBackpack "RPG7_F";};
	_unit addHeadgear "H_Cap_blk";
	_unit addGoggles "TRYK_headset_Glasses";


	_unit addWeapon "hlc_rifle_ACR_mid_black";
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit addPrimaryWeaponItem "optic_Holosight_smg_blk_F";
	_unit addWeapon "launch_RPG7_F";
	_unit addWeapon "hlc_pistol_P226R_357Combat";
	_unit addWeapon "Binocular";
};

if (_unittype == "I_Soldier_AA_F") then {

	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_T_TAN_PAD";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "hlc_30rnd_556x45_EPR";
	_unit addVest "TAC_V_Sheriff_BA_TB5";
	_unit addItemToVest "150Rnd_556x45_Drum_Mag_F";
	_unit addItemToVest "150Rnd_556x45_Drum_Mag_Tracer_F";
	_unit addItemToVest "hlc_50rnd_556x45_EPR";
	for "_i" from 1 to 11 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
	for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	_unit addItemToVest "hlc_30rnd_556x45_TDim";
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "Titan_AA";};
	_unit addItemToBackpack "HandGrenade";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};
	_unit addHeadgear "VSM_MulticamTropic_Boonie";
	_unit addGoggles "TRYK_Shemagh_shade";

	_unit addWeapon "hlc_rifle_416D165_gl";
	_unit addPrimaryWeaponItem "hlc_optic_HensoldtZO_lo_Docter";
	_unit addWeapon "launch_O_Titan_F";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addWeapon "Binocular";

};

if (_unittype == "I_G_Soldier_LAT2_F") then {

	[_unit] call _rmvAIitens;

	_unit forceAddUniform "U_IG_Guerrilla_6_1";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "SmokeShell";
	_unit addItemToUniform "Chemlight_blue";
	_unit addItemToUniform "29rnd_300BLK_STANAG";
	_unit addVest "TAC_EI_RRVS_SPR2_RG";
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "Chemlight_blue";
	for "_i" from 1 to 5 do {_unit addItemToVest "29rnd_300BLK_STANAG";};
	for "_i" from 1 to 6 do {_unit addItemToVest "hlc_50rnd_300BLK_STANAG_EPR";};
	_unit addItemToVest "29rnd_300BLK_STANAG_S";
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "MRAWS_HE_F";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "MRAWS_HEAT_F";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "29rnd_300BLK_STANAG";};
	_unit addHeadgear "TRYK_R_CAP_OD_US";
	_unit addGoggles "VSM_Shemagh_Glasses_OD";

	_unit addWeapon "hlc_rifle_bcmblackjack";
	_unit addPrimaryWeaponItem "hlc_muzzle_MAG58_Brake";
	_unit addPrimaryWeaponItem "hlc_optic_HensoldtZO_lo_Docter";
	_unit addWeapon "launch_MRAWS_olive_rail_F";
	_unit addWeapon "Binocular";
};

if (_unittype == "I_ghillie_sard_F") then {
	[_unit] call _rmvAIitens;

	if (toUpper(worldName) == "TANOA") then { 
	  _unit forceAddUniform "U_B_T_FullGhillie_tna_F"; 
	  _unit addWeapon "srifle_GM6_ghex_F";
	  _unit addPrimaryWeaponItem "optic_LRPS_tna_F";
	} else { 
	  _unit forceAddUniform "U_B_FullGhillie_ard";
	  _unit addWeapon "srifle_GM6_F";
	  _unit addPrimaryWeaponItem "optic_LRPS";
	};	

	_unit addItemToUniform "FirstAidKit";
	for "_i" from 1 to 2 do {_unit addItemToUniform "5Rnd_127x108_Mag";};
	_unit addItemToUniform "SmokeShell";
	_unit addVest "V_Chestrig_oli";
	for "_i" from 1 to 5 do {_unit addItemToVest "5Rnd_127x108_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "SmokeShellOrange";
	_unit addItemToVest "SmokeShellPurple";
	_unit addItemToVest "HandGrenade";
	_unit addItemToVest "5Rnd_127x108_APDS_Mag";
	_unit addBackpack "B_AssaultPack_cbr";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "5Rnd_127x108_APDS_Mag";};
	for "_i" from 1 to 6 do {_unit addItemToBackpack "5Rnd_127x108_Mag";};
	_unit addItemToBackpack "HandGrenade";
	_unit addItemToBackpack "SmokeShellBlue";
	_unit addGoggles "VSM_balaclava_olive";

	_unit addWeapon "srifle_GM6_F";
	_unit addPrimaryWeaponItem "optic_LRPS";
	_unit addWeapon "hgun_ACPC2_F";
	_unit addHandgunItem "muzzle_snds_acp";
	_unit addWeapon "Laserdesignator";

	_unit setFace "CamoHead_Greek_02_F";
};

if (_unittype == "I_Soldier_exp_F") then {
	[_unit] call _rmvAIitens;

	_unit forceAddUniform "TRYK_U_B_PCUGs_gry_R";
	_unit addItemToUniform "FirstAidKit";
	_unit addVest "VSM_OGA_OD_IOTV_2";
	for "_i" from 1 to 3 do {_unit addItemToVest "hlc_60Rnd_545x39_t_rpk";};
	for "_i" from 1 to 2 do {_unit addItemToVest "hlc_45Rnd_545x39_m_rpk";};
	_unit addItemToVest "30Rnd_545x39_Mag_F";
	_unit addBackpack "VSM_OGA_OD_carryall";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "SatchelCharge_Remote_Mag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
	_unit addItemToBackpack "hlc_45Rnd_545x39_m_rpk";
	_unit addItemToBackpack "hlc_45Rnd_545x39_t_rpk";
	_unit addHeadgear "H_Cap_blu";
	_unit addGoggles "TRYK_headset_Glasses";

	_unit addWeapon "hlc_rifle_ak74m_MTK";
	_unit addPrimaryWeaponItem "hlc_optic_HensoldtZO_lo_Docter";

};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles";


_unit enableFatigue false;
_unit enableStamina false;
_unit setCustomAimCoef 0.3;
_unit setUnitRecoilCoefficient 0.4;
//_unit addAction ["<t color='#1d78ed'>Dismiss</t>","bots\BOTS_A3\dismiss.sqf",[],-10,false,true,""];
//_unit setVariable ["BIS_noCoreConversations", true];
//_unit setSpeaker "NoVoice";

{_unit enableAI _x} forEach ["TARGET", "AUTOTARGET", "MOVE"];

//[_unit] execVM ("bots\BOTS_A3\init_newunit.sqf");
[_unit] call compile preprocessFileLineNumbers "bots\BOTS_A3\init_newunit.sqf";

//[_unit] call A3A_fnc_initRevive;

if (isNil "_veBOT") then {
  _pos = (getPosWorld player) vectorAdd [7 + random 12 ,9 + random 10 ,0];
  _unit setPosWorld _pos;
};

hint parseText format["Your <t size='1.0' font='PuristaMedium' color='#008aff'>%1</t> %2 has arrived.",_typename,name _unit];
bon_recruit_queue = bon_recruit_queue - [_queuepos];

call _update_queue;