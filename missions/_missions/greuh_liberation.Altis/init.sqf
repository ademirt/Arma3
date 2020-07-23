enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

[] execVM "bon_recruit_units\init.sqf";

if ( GRLIB_revive > 0 ) then {
	[] execVM "FAR_revive\FAR_revive_init.sqf";
};
[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
	#include "bon_recruit_units\addrecruit.sqf"
	
	switch (toLower(worldName)) do 
	{
		case "takistan": { ghst_air_cargo = "B_Heli_Transport_03_F";
						   ghst_casplane = "B_Plane_CAS_01_F";
						   ghst_attachhelo = "CUP_B_AH64D_MR_USA";
						   ghst_transportheli = "CUP_B_UH60M_US";
						   ghst_escortheli = ["CUP_B_AH64D_MR_USA","CUP_B_AH64D_ES_USA"]; };
						   
		default { ghst_air_cargo = "B_Heli_Transport_03_F";
				   ghst_casplane = "B_Plane_CAS_01_F";
				   ghst_attachhelo = "B_Heli_Attack_01_F";
				   ghst_transportheli = "B_Heli_Transport_03_F";
				   ghst_escortheli = ["B_Heli_Attack_01_F","I_Heli_light_03_F"]; };
	};
			/* 
			if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then {
				ghst_casplane = "RHS_A10";
				ghst_attachhelo = "RHS_AH64D_wd";
				ghst_transportheli = "RHS_UH60M";
				ghst_escortheli = ["RHS_AH64D_wd", "RHS_AH64D_wd_AA"];
			} else {
				ghst_casplane = "B_Plane_CAS_01_F";
				ghst_attachhelo = "CUP_B_AH64D_ES_USA";
				ghst_transportheli = "CUP_B_UH60M_US";
				ghst_escortheli = ["CUP_B_AH64D_MR_USA","CUP_B_AH64D_ES_USA"];
			}; */
			if (player iskindof "B_recon_TL_F" || player iskindof "B_recon_medic_F") then {
				[player,"Attackhelo"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_helosup", 0];
				[player,"Casplane"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_cassup", 0];
				[player,"UAV"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_uavsup", 0];
				[player,"UGV"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_ugvsup", [0,0]];
				/* [player,"UAV2"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_uavsup", 0]; */
				[player,"UAV3"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_uavsup", 0];
				[player,"PUAV"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_puavsup", 0];
				/* 	[player,"AMMO"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_ammodrop", 0]; */
				[player,"Transport"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_transport", 0];
				/* [player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
				player setVariable ["ghst_remotedes", 0]; */
			};
	
} else {
	setViewDistance 1600;
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////
[] execVM "VCOMAI\init.sqf";