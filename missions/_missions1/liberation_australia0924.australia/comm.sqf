ghst_air_cargo = "B_Heli_Transport_03_F";

if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then {
	ghst_casplane = "RHS_A10";
	ghst_attachhelo = "RHS_AH64D_wd";
	ghst_transportheli = "RHS_UH60M";
	ghst_escortheli = ["RHS_AH64D_wd", "RHS_AH64D_wd_AA"];
} else {
	ghst_casplane = "B_Plane_CAS_01_F";
	ghst_attachhelo = "B_Heli_Attack_01_F";
	ghst_transportheli = "B_Heli_Transport_01_camo_F";
	ghst_escortheli = ["B_Heli_Attack_01_F"];
};

if (player iskindof "B_recon_TL_F" || player iskindof "B_recon_medic_F") then {
	[player,"Attackhelo"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_helosup", 0];
	[player,"Casplane"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_cassup", 0];
	[player,"UAV"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_uavsup", 0];
	[player,"UGV"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_ugvsup", [0,0]];
	[player,"PUAV"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_puavsup", 0];
	[player,"AMMO"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_ammodrop", 0];
	[player,"Transport"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_transport", 0];	
	[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
	player setVariable ["ghst_remotedes", 0];
};