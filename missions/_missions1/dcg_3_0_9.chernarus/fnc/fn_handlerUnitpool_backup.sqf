/*
Author: SENSEI

Last modified: 9/14/2015

Description: unit pool settings

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

private ["_vanillaUnitPool","_return","_importPath","_indPool","_eastPool","_indVehPool","_eastVehPool","_indAirPool","_eastAirPool","_indSniperPool","_eastSniperPool","_indOfficerPool","_eastOfficerPool","_class","_master","_parentArray","_side"];

SEN_PVArray = [];
call SEN_fnc_setParams;

// set unit pools
SEN_unitPoolWest = []; // ---- DO NOT EDIT ----
SEN_vehPoolWest = []; // ---- DO NOT EDIT ----
SEN_airPoolWest = []; // ---- DO NOT EDIT ----
SEN_sniperPoolWest = []; // ---- DO NOT EDIT ----
SEN_unitPool = []; // ---- DO NOT EDIT ----
SEN_vehPool = []; // ---- DO NOT EDIT ----
SEN_airPool = []; // ---- DO NOT EDIT ----
SEN_sniperPool = []; // ---- DO NOT EDIT ----
SEN_officerPool = []; // ---- DO NOT EDIT ----
SEN_unitPoolCiv = []; // ---- DO NOT EDIT ----
SEN_vehPoolCiv = []; // ---- DO NOT EDIT ----
SEN_airPoolCiv = []; // ---- DO NOT EDIT ----
_vanillaUnitPool = []; // ---- DO NOT EDIT ----

if (SEN_allowMod isEqualTo 1) then { // if modified content mission parameter is on
	_return = false;
	if (isDedicated) then {
		_importPath = "\userconfig\dcg\sen_unitpools.sqf";
		_return = call compile preprocessFileLineNumbers _importPath;
		if (isNil "_return") then {_return = false};
	} else {
		_importPath = "userconfig\dcg\sen_unitpools.sqf";
		if (_importPath call SEN_fnc_checkFileExist) then {
			_return = call compile preprocessFileLineNumbers _importPath;
		};
	};
	if (_return) then {
		["Importing unit pools from server. Path to file is %1",str _importPath] call SEN_fnc_log;
	} else { // if file doesn't exist or if file returns false, use preset unit pools. Supports RHS, LOP
		["Building predefined unit pools."] call SEN_fnc_log;
		// EAST and INDEPENDENT UNITS
		_indPool = ["rhs_g_Soldier_F","rhs_g_Soldier_lite_F","rhs_g_Soldier_AR_F","rhs_g_medic_F","rhs_g_engineer_F","rhs_g_Soldier_exp_F","rhs_g_Soldier_GL_F","rhs_g_Soldier_M_F","rhs_g_Soldier_LAT_F","rhs_g_Soldier_AA_F","rhs_g_Soldier_AAR_F","LOP_AFR_Infantry_Corpsman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AT","LOP_AFR_Infantry_Marksman","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_GL"];
		_eastPool = ["rhs_msv_junior_sergeant","rhs_msv_engineer","rhs_msv_medic","rhs_msv_LAT","rhs_msv_RShG2","rhs_msv_aa","rhs_msv_machinegunner","rhs_msv_grenadier","rhs_msv_efreitor","rhs_msv_marksman","LOP_US_Infantry_Corpsman","LOP_US_Infantry_MG","LOP_US_Infantry_Engineer","LOP_US_Infantry_Rifleman"];
		_indVehPool = ["RHS_BM21_chdkz","rhs_zsu234_chdkz","rhs_bmd2_chdkz","rhs_btr70_chdkz","rhs_t72bb_chdkz","rhs_uaz_open_chdkz","LOP_AFR_BTR60","LOP_AFR_T72BA","LOP_AFR_M113_W","LOP_AM_Landrover_M2","LOP_AFR_Landrover_M2"];
		_eastVehPool = ["rhs_tigr_vdv","rhs_bmp1_vdv","rhs_bmp2e_vdv","rhs_t72bd_tv","rhs_t90_tv","rhs_btr80_vmf","rhs_btr80a_msv","rhs_t80b","LOP_US_ZSU234","RHS_UAZ_MSV_01","LOP_ChDKZ_Ural","LOP_ChDKZ_Ural_open"];
		_indAirPool = ["LOP_UA_Mi8MTV3_FAB","LOP_UA_Mi8MTV3_UPK23"];
		_eastAirPool = ["RHS_Ka52_vvsc","RHS_Ka52_vvs","RHS_Mi24P_vvs","RHS_Mi24P_AT_vvs"];
		_indSniperPool = [];
		_eastSniperPool = [];
		_indOfficerPool = ["rhs_g_Soldier_SL_F","LOP_AFR_Infantry_SL"];
		_eastOfficerPool = ["rhs_msv_officer_armored","LOP_US_Infantry_Officer"];

		SEN_unitPool append _indPool;
		SEN_unitPool append _eastPool;
		SEN_vehPool append _indVehPool;
		SEN_vehPool append _eastVehPool;
		SEN_airPool append _indAirPool;
		SEN_airPool append _eastAirPool;
		SEN_sniperPool append _indSniperPool;
		SEN_sniperPool append _eastSniperPool;
		SEN_officerPool append _indOfficerPool;
		SEN_officerPool append _eastOfficerPool;

		// WEST UNITS
		SEN_unitPoolWest = ["rhsusf_army_ucp_rifleman_101st","rhsusf_army_ucp_aa","rhsusf_army_ucp_javelin","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_medic","rhsusf_army_ucp_explosives","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_marksman","rhsusf_army_ucp_teamleader"];
		SEN_vehPoolWest = ["rhsusf_m1025_d_s_Mk19","rhsusf_m113_usarmy","rhsusf_m1025_w","rhsusf_m1025_w_m2"];
		SEN_airPoolWest = ["RHS_CH_47F","RHS_UH1Y_UNARMED","RHS_UH60M","B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_F"];
		SEN_sniperPoolWest = ["rhsusf_army_ucp_sniper"];

		// CIVILIAN UNITS
		if ((toUpper worldName) isEqualTo "TAKISTAN" || {(toUpper worldName) isEqualTo "KUNDUZ"} || {(toUpper worldName) isEqualTo "MOUNTAINS_ACR"}) then { // use these units for middle eastern maps
			SEN_unitPoolCiv = ["LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_04"];
			SEN_vehPoolCiv = ["LOP_TAK_Civ_Hatchback","LOP_TAK_Civ_Landrover","LOP_TAK_Civ_Offroad","LOP_TAK_Civ_UAZ","LOP_TAK_Civ_UAZ_Open","LOP_TAK_Civ_Ural","LOP_TAK_Civ_Ural_open"];
			SEN_airPoolCiv = ["RHS_Mi8amt_civilian"];
		} else {
			SEN_unitPoolCiv = ["LOP_AFR_Civ_Man_01","LOP_AFR_Civ_Man_02","LOP_AFR_Civ_Man_03","LOP_CHR_Civ_Villager_01","LOP_CHR_Civ_Woodlander_01","LOP_CHR_Civ_Worker_01"];
			SEN_vehPoolCiv = ["LOP_AFR_Civ_Landrover","LOP_AFR_Civ_Offroad","LOP_AFR_Civ_Hatchback","LOP_AFR_Civ_UAZ_Open"];
			SEN_airPoolCiv = ["RHS_Mi8amt_civilian"];
		};
	};

	// ---- DO NOT EDIT ----
	{
		if !(_x isEqualTo []) then {
			for "_i" from (count _x - 1) to 0 step -1 do {
				_class = configfile >> "CfgVehicles" >> (_x select _i);
				if !(isClass _class) then {
					_x deleteAt _i;
				} else {
					if !(getNumber (_class >> "side") in [1,3,SEN_enemySide]) then {
						_x deleteAt _i;
					};
				};
			};
		};
	} forEach [SEN_unitPoolWest,SEN_vehPoolWest,SEN_airPoolWest,SEN_sniperPoolWest,SEN_unitPool,SEN_vehPool,SEN_airPool,SEN_sniperPool,SEN_officerPool,SEN_unitPoolCiv,SEN_vehPoolCiv,SEN_airPoolCiv];

	if !(SEN_airPoolWest isEqualTo []) then {
		{
			if !(_x isKindOf "Helicopter") then {SEN_airPoolWest deleteAt _forEachIndex};
		} forEach SEN_airPoolWest;
	};
};

// ---- DO NOT EDIT BELOW ----
// ---- DO NOT EDIT BELOW ----

// fill arrays with vanilla content if still empty
if (SEN_enemySide isEqualTo 2) then {
	_vanillaUnitPool = [ // ---- DO NOT EDIT ARRAY ORDER ----
		["B_Soldier_SL_F","B_medic_F","B_soldier_AR_F","B_soldier_M_F","B_Soldier_AA_F","B_soldier_AT_F","B_soldier_F"], // SEN_unitPoolWest
		["B_mrap_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"], // SEN_vehPoolWest
		["B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_F"], // SEN_airPoolWest
		["B_sniper_F"], // SEN_sniperPoolWest
		["I_soldier_AR_F","I_medic_F","I_soldier_exp_F","I_soldier_GL_F","I_soldier_AT_F","I_soldier_repair_F","I_soldier_AAR_F","I_soldier_M_F","I_soldier_F","I_support_AMort_F","I_support_AMG_F","I_support_MG_F","I_support_Mort_F","I_engineer_F","I_Soldier_AAT_F","I_Soldier_A_F","I_Soldier_AA_F"], // SEN_unitPool
		["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Quadbike_01_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_AA_F","I_Truck_02_covered_F","I_Truck_02_transport_F"], // SEN_vehPool
		["I_Heli_light_03_F"], // SEN_airPool
		["I_sniper_F"], // SEN_sniperPool
		["I_officer_F"], // SEN_officerPool
		["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"], // SEN_unitPoolCiv
		["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F"], // SEN_vehPoolCiv
		["C_Heli_Light_01_civil_F"] // SEN_airPoolCiv
	];
} else {
	_vanillaUnitPool = [ // ---- DO NOT EDIT ARRAY ORDER ----
		["B_Soldier_SL_F","B_medic_F","B_soldier_AR_F","B_soldier_M_F","B_Soldier_AA_F","B_soldier_AT_F","B_soldier_F"], // SEN_unitPoolWest
		["B_mrap_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"], // SEN_vehPoolWest
		["B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_F"], // SEN_airPoolWest
		["B_sniper_F"], // SEN_sniperPoolWest
		["O_soldier_AR_F","O_medic_F","O_soldier_exp_F","O_soldier_GL_F","O_soldier_AT_F","O_soldier_repair_F","O_soldier_AAR_F","O_soldier_M_F","O_soldier_F","O_support_AMort_F","O_support_AMG_F","O_support_MG_F","O_support_Mort_F","O_engineer_F","O_recon_M_F","O_Soldier_AA_F"], // SEN_unitPool
		["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Quadbike_01_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_Truck_02_covered_F","O_Truck_03_transport_F"], // SEN_vehPool
		["O_Heli_Light_02_F","O_Heli_Attack_02_F","O_Heli_Light_02_v2_F"], // SEN_airPool
		["O_sniper_F"], // SEN_sniperPool
		["O_officer_F"], // SEN_officerPool
		["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"], // SEN_unitPoolCiv
		["C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F"], // SEN_vehPoolCiv
		["C_Heli_Light_01_civil_F"] // SEN_airPoolCiv
	];
};

{
	if (_x isEqualTo []) then {
		_x append (_vanillaUnitPool select _forEachIndex);
		["Building vanilla unit pool. Index %1.", _forEachIndex] call SEN_fnc_log;
	};
} forEach [SEN_unitPoolWest,SEN_vehPoolWest,SEN_airPoolWest,SEN_sniperPoolWest,SEN_unitPool,SEN_vehPool,SEN_airPool,SEN_sniperPool,SEN_officerPool,SEN_unitPoolCiv,SEN_vehPoolCiv,SEN_airPoolCiv];

if (count (SEN_officerPool arrayIntersect SEN_unitPool) > 0) then {
	SEN_unitPool = SEN_unitPool - SEN_officerPool;
	["Officer unit pool is not unique. Making unique."] call SEN_fnc_log;
}; // make sure SEN_officerPool is unique

/*
diag_log "SIDE CHECK";
_master = configFile >> "CfgVehicles";

for "_i" from 0 to (count _master) - 1 do {
	_class = _master select _i;
	_parentArray = [_class,true] call BIS_fnc_returnParents;

	if (count (["CAManBase","LandVehicle","Air","Ship"] arrayIntersect _parentArray) > 0) then {
		if (isClass _class && {getNumber (_class >> "side") isEqualTo 2} && {getNumber (_class >> "scope") > 1}) then {
			_name = configName _class;
			_side = getNumber (_class >> "side");
			diag_log str [_name,_side];
		};
	};
};
*/