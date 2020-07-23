// Defines contents of ammoboxes for all factions for use in EVOR_fnc_initAmmobox
// Only needs changing when using assets from a different mod

class CfgAmmobox {
	// Cargo box
	class B_supplyCrate_F {
		cargoGearTypes = 5;
		cargoGearCount = 2;
		cargoWeaponTypes = 10;
		cargoWeaponCount = 2;
		cargoWeaponMags = 5;
		cargoFAKits = 5;
		cargoToolKits = 5;
		cargoItems[] = {{"ItemGPS",5},{"Laserdesignator",5},{"NVGoggles",5}};
		cargoBackpacks[] = {{"B_TacticalPack_mcamo",5}};
	};
	class I_supplyCrate_F: B_supplyCrate_F {
		cargoItems[] = {{"ItemGPS",5},{"Laserdesignator_03",5},{"NVGoggles_INDEP",5}};
		cargoBackpacks[] = {{"B_TacticalPack_oli",5}};
	};
	class O_supplyCrate_F: B_supplyCrate_F {
		cargoItems[] = {{"ItemGPS",5},{"Laserdesignator_02",5},{"NVGoggles_OPFOR",5}};
		cargoBackpacks[] = {{"B_TacticalPack_ocamo",5}};
	};
	
	// Arsenal box
	class B_Slingload_01_Cargo_F {
		hasArsenal = 1;
	};
	class Land_Pod_Heli_Transport_04_box_F: B_Slingload_01_Cargo_F {};
	class B_CargoNet_01_ammo_F: B_Slingload_01_Cargo_F {};
	class I_CargoNet_01_ammo_F: B_Slingload_01_Cargo_F {};
	class O_CargoNet_01_ammo_F: B_Slingload_01_Cargo_F {};

	// Ammo box
	class Box_East_Ammo_F {
		cargoMagazineTypes = 10;
		cargoMagazineCount = 4;
		cargoItems[] = {{"Laserbatteries",2},{"HandGrenade",3},{"MiniGrenade",3},{"SmokeShell",5},{"O_IR_Grenade",2},{"Chemlight_red",5}};
	};
	class Box_IND_Ammo_F: Box_East_Ammo_F {
		cargoItems[] = {{"Laserbatteries",2},{"HandGrenade",3},{"MiniGrenade",3},{"SmokeShell",5},{"I_IR_Grenade",2},{"Chemlight_green",5}};
	};
	class Box_NATO_Ammo_F: Box_East_Ammo_F {
		cargoItems[] = {{"Laserbatteries",2},{"HandGrenade",3},{"MiniGrenade",3},{"SmokeShell",5},{"B_IR_Grenade",2},{"Chemlight_blue",5}};
	};
	class Box_Syndicate_Ammo_F: Box_East_Ammo_F {
		cargoItems[] = {{"Laserbatteries",2},{"HandGrenade",3},{"MiniGrenade",3},{"SmokeShell",5},{"I_IR_Grenade",2},{"Chemlight_green",5}};
	};
	class Box_T_East_Ammo_F: Box_East_Ammo_F {};
	
	// Explosive box
	class Box_East_AmmoOrd_F {
		cargoExplosivesCount = 3;
		cargoItems[] = {{"HandGrenade",10},{"MiniGrenade",10}};
		cargoToolKits = 1;
	};
	class Box_IED_Exp_F: Box_East_AmmoOrd_F {};
	class Box_IND_AmmoOrd_F: Box_East_AmmoOrd_F {};
	class Box_NATO_AmmoOrd_F: Box_East_AmmoOrd_F {};
	
	// Support box
	class Box_East_Support_F {
		cargoFAKits = 15;
		cargoToolKits = 10;
		cargoItems[] = {{"SmokeShell",5},{"SmokeShellRed",5},{"SmokeShellGreen",5},{"SmokeShellYellow",5},{"NVGoggles_OPFOR",3}};
	};
	class Box_IND_Support_F: Box_East_Support_F {
		cargoItems[] = {{"SmokeShell",5},{"SmokeShellRed",5},{"SmokeShellGreen",5},{"SmokeShellYellow",5},{"NVGoggles_INDEP",3}};
	};
	class Box_NATO_Support_F: Box_East_Support_F {
		cargoItems[] = {{"SmokeShell",5},{"SmokeShellRed",5},{"SmokeShellGreen",5},{"SmokeShellYellow",5},{"NVGoggles",3}};
	};
	
	// Weapon box
	class Box_East_Wps_F {
		cargoWeaponTypes = 5;
		cargoWeaponCount = 2;
		cargoWeaponMags = 3;
	};
	class Box_IND_Wps_F: Box_East_Wps_F {};
	class Box_NATO_Wps_F: Box_East_Wps_F {};
	class Box_T_East_Wps_F: Box_East_Wps_F {};
	class Box_T_NATO_Wps_F: Box_East_Wps_F {};
};