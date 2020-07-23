/*
	# Original #
	Sarge AI System 1.5
	Created for Arma 2: DayZ Mod
	Author: Sarge
	https://github.com/Swiss-Sarge

	# Fork #
	Sarge AI System 2.0+
	Modded for Arma 3: Exile Mod
	Changes: Dango
	http://www.hod-servers.com

	Tips:
	- All time formats are configured in seconds
	- All distance formats are in meters
	- Secondary AI skills can be decimal values i.e. 0.23
	- Lower time intervals for detections require more CPU resources
*/
SAR_version = "2.2.4";
SAR_HC = true; // If there is no HC it will spawn on server automatically

// TODO: Create dynamic map support for any map
SAR_maps = ["chernarus"];//["altis","chernarus","taviana","namalsk","lingor3","mbg_celle2","takistan","fallujah","panthera2","tanoa"];
SAR_useBlacklist = false;

/* Debug Settings */
SAR_DEBUG 			= false; // Set to true for RPT info on AI
SAR_EXTREME_DEBUG 	= false; // Set to true for RPT info on damn near everything
SAR_HITKILL_DEBUG 	= false; // Set to true for RPT info on AI shooting and killing
SAR_log_AI_kills 	= false; // Set to true for kill logging by variable. *These variables do not save to the database currently*
SAR_KILL_MSG 		= true; // Set to true for announcing AI kills to the server

/* AI Settings */
SAR_dynamic_spawning 				= true;		// Turn dynamic grid spawns on or off
SAR_Base_Gaurds 					= false;		// Turn AI territory gurads on or off
SAR_dynamic_group_respawn 			= true;		// Turn dynamic grid AI respawn on or off
SAR_dynamic_heli_respawn 			= true;		// Turn dynamic grid AI respawn on or off
SAR_AI_COMBAT_VEHICLE 				= false;	// Turn the option for AI using vehicles when in combat on or off
SAR_AI_STEAL_VEHICLE 				= false;	// Turn the option for AI using vehicles to reach their destination on or off
SAR_AI_disable_UPSMON_AI			= false; 	// Turning this off could have unintended consequences
SAR_respawn_waittime 				= 560;		// How long to wait before dynamic AI respawns
SAR_DESPAWN_TIMEOUT 				= 360;		// How long to wait before despawning dynamic AI
SAR_DELETE_TIMEOUT 					= 500;		// How long to wait before deleting dead AI
SAR_surv_kill_value 				= 50;		// How much respect players lose if killing friendly AI
SAR_band_kill_value 				= 50;		// How much respect players gain if killing hostile AI
SAR_RESPECT_HOSTILE_LIMIT 			= -2000;	// Friendly AI will shoot at players with respect below this number
SAR_REAMMO_INTERVAL					= 35;		// How often AI will replenish their ammunitions
SAR_DETECT_HOSTILE 					= 190;		// How far away AI can detect hostile AI & players
SAR_DETECT_INTERVAL 				= 25;		// How often AI can detect AI & players
SAR_DETECT_HOSTILE_FROM_VEHICLE 	= 400;		// How far AI can detect hostile AI & players while in a vehicle
SAR_DETECT_FROM_VEHICLE_INTERVAL 	= 10;		// How often AI can detect hostile AI & players while in a vehicle

// Chance the AI will spawn
SAR_chance_bandits 			= 22; 	// Chance to spawn 1-100%
SAR_chance_soldiers 		= 0; 	// Chance to spawn 1-100%
SAR_chance_survivors 		= 0; 	// Chance to spawn 1-100%

// Max number of AI groups allowed at once
SAR_max_grps_bandits 		= 1; 	// Total groups per grid
SAR_max_grps_soldiers 		= 0; 	// Total groups per grid
SAR_max_grps_survivors 		= 0; 	// Total groups per grid

// Size of AI groups plus a leader
SAR_max_grpsize_bandits 	= 1; 	// Size of the group If using HC use +1 at least to offset AI side bug only for bandits
SAR_max_grpsize_soldiers 	= 0;	// Size of the group
SAR_max_grpsize_survivors 	= 0; 	// Size of the group

// Chance the AI Helicopters will spawn - IN DEVELOPMENT
SAR_chance_band_heli		= 1;
SAR_chance_surv_heli		= 0;
SAR_chance_mili_heli		= 0;

// AI experience system
SAR_AI_XP_SYSTEM 	= true;		// Turn this feature on or off

// Level 1 settings
SAR_AI_XP_LVL_1 	= 0; 		// xp needed to reach this level
SAR_AI_XP_NAME_1 	= "Rookie"; // name of the level range
SAR_AI_XP_ARMOR_1 	= 1; 		// armor value for this level - values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90%

// Level 2 settings
SAR_AI_XP_LVL_2 	= 5;
SAR_AI_XP_NAME_2 	= "Veteran";
SAR_AI_XP_ARMOR_2 	= 0.5;

// Level 3 settings
SAR_AI_XP_LVL_3 	= 20;
SAR_AI_XP_NAME_3 	= "Legendary";
SAR_AI_XP_ARMOR_3 	= 0.3;

// Bonus factors for leaders
SAR_leader_health_factor = 1; // values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% -  EXPERIMENTAL


// military AI
SAR_leader_sold_skills = [
    ["aimingAccuracy",0.35, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0],
    ["aimingSpeed",   0.80, 0],
    ["spotDistance",  0.70, 0],
    ["spotTime",      0.65, 0],
    ["endurance",     0.80, 0],
    ["courage",       0.80, 0],
    ["reloadSpeed",   0.80, 0],
    ["commanding",    0.80, 0],
    ["general",       0.80, 0]
];
SAR_soldier_sold_skills  = [
    ["aimingAccuracy",0.25, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.25, 0],
    ["aimingSpeed",   0.70, 0],
    ["spotDistance",  0.55, 0],
    ["spotTime",      0.30, 0],
    ["endurance",     0.60, 0],
    ["courage",       0.60, 0],
    ["reloadSpeed",   0.60, 0],
    ["commanding",    0.60, 0],
    ["general",       0.60, 0]

];
SAR_sniper_sold_skills = [
    ["aimingAccuracy",0.80, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0],
    ["aimingSpeed",   0.70, 0],
    ["spotDistance",  0.70, 0],
    ["spotTime",      0.75, 0],
    ["endurance",     0.70, 0],
    ["courage",       0.70, 0],
    ["reloadSpeed",   0.70, 0],
    ["commanding",    0.70, 0],
    ["general",       0.70, 0]
];

// bandit AI
SAR_leader_band_skills = [
    ["aimingAccuracy",0.35, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0],
    ["aimingSpeed",   0.60, 0],
    ["spotDistance",  0.40, 0],
    ["spotTime",      0.45, 0],
    ["endurance",     0.40, 0],
    ["courage",       0.50, 0],
    ["reloadSpeed",   0.60, 0],
    ["commanding",    0.50, 0],
    ["general",       0.50, 0]
];
SAR_soldier_band_skills = [
    ["aimingAccuracy",0.15, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.15, 0],
    ["aimingSpeed",   0.60, 0],
    ["spotDistance",  0.40, 0],
    ["spotTime",      0.40, 0],
    ["endurance",     0.40, 0],
    ["courage",       0.40, 0],
    ["reloadSpeed",   0.40, 0],
    ["commanding",    0.40, 0],
    ["general",       0.40, 0]
];
SAR_sniper_band_skills = [
    ["aimingAccuracy",0.70, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0],
    ["aimingSpeed",   0.70, 0],
    ["spotDistance",  0.60, 0],
    ["spotTime",      0.40, 0],
    ["endurance",     0.22, 0],
    ["courage",       0.33, 0],
    ["reloadSpeed",   0.22, 0],
    ["commanding",    0.50, 0],
    ["general",       0.60, 0]
];

// survivor AI
SAR_leader_surv_skills = [
    ["aimingAccuracy",0.35, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0],
    ["aimingSpeed",   0.60, 0],
    ["spotDistance",  0.40, 0],
    ["spotTime",      0.45, 0],
    ["endurance",     0.40, 0],
    ["courage",       0.50, 0],
    ["reloadSpeed",   0.60, 0],
    ["commanding",    0.50, 0],
    ["general",       0.50, 0]
];
SAR_soldier_surv_skills = [
    ["aimingAccuracy",0.15, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.15, 0],
    ["aimingSpeed",   0.60, 0],
    ["spotDistance",  0.45, 0],
    ["spotTime",      0.20, 0],
    ["endurance",     0.40, 0],
    ["courage",       0.40, 0],
    ["reloadSpeed",   0.40, 0],
    ["commanding",    0.40, 0],
    ["general",       0.40, 0]
];
SAR_sniper_surv_skills = [
    ["aimingAccuracy",0.70, 0], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0],
    ["aimingSpeed",   0.70, 0],
    ["spotDistance",  0.70, 0],
    ["spotTime",      0.65, 0],
    ["endurance",     0.70, 0],
    ["courage",       0.70, 0],
    ["reloadSpeed",   0.70, 0],
    ["commanding",    0.50, 0],
    ["general",       0.60, 0]
];

// Military AI ----------------------------------------------------------
// ----------------------------------------------------------------------
SAR_leader_sold_list = ["B_officer_F"];
SAR_sniper_sold_list = ["B_ghillie_lsh_F","B_sniper_F"];
SAR_soldier_sold_list = ["B_G_medic_F","B_G_engineer_F","b_soldier_survival_F","B_G_Soldier_TL_F"];

SAR_sold_leader_weapon_list = ["arifle_Katiba_F","arifle_Mk20_F","arifle_MXC_F","arifle_MX_F","arifle_TRG21_F","arifle_TRG20_F"];
SAR_sold_leader_pistol_list = [];

SAR_sold_leader_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60],["Exile_Item_InstaDoc",100]];
SAR_sold_leader_tools =  [["ItemMap",50],["ItemCompass",30],["NVGoggles",5],["ItemRadio",100]];

SAR_sold_rifleman_weapon_list = ["arifle_Katiba_F","arifle_Mk20_F","arifle_MXC_F","arifle_MX_F","arifle_TRG21_F","arifle_TRG20_F"];
SAR_sold_rifleman_pistol_list = [];

SAR_sold_rifleman_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_sold_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];

SAR_sold_sniper_weapon_list = ["srifle_DMR_02_F","arifle_MXM_F","srifle_DMR_04_F"];
SAR_sold_sniper_pistol_list = [];

SAR_sold_sniper_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_sold_sniper_tools = [["ItemMap",50],["ItemCompass",30]];

// Survivor AI ----------------------------------------------------------
// ---------------------------------------------------------------------
SAR_leader_surv_list = ["B_G_Soldier_A_F"];
SAR_sniper_surv_list = ["B_G_Soldier_LAT_F"];
SAR_soldier_surv_list = ["B_G_Soldier_M_F"];

SAR_surv_leader_weapon_list = ["arifle_Katiba_F","arifle_Mk20_F","arifle_MXC_F","arifle_MX_F","arifle_TRG21_F","arifle_TRG20_F"];
SAR_surv_leader_pistol_list = [];

SAR_surv_leader_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_surv_leader_tools =  [["ItemMap",50],["ItemCompass",30],["NVGoggles",5],["ItemRadio",100]];

SAR_surv_rifleman_weapon_list = ["arifle_Katiba_F","arifle_Mk20_F","arifle_MXC_F","arifle_MX_F","arifle_TRG21_F","arifle_TRG20_F"];
SAR_surv_rifleman_pistol_list = [];

SAR_surv_rifleman_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_surv_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];

SAR_surv_sniper_weapon_list = ["srifle_DMR_02_F","arifle_MXM_F","srifle_DMR_04_F"];
SAR_surv_sniper_pistol_list = [];

SAR_surv_sniper_items = [["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_surv_sniper_tools = [["ItemMap",50],["ItemCompass",30]];

// Hostile AI ----------------------------------------------------------
// ---------------------------------------------------------------------
SAR_leader_band_list = ["C_journalist_F"];
SAR_sniper_band_list = ["I_G_Soldier_F"];
SAR_soldier_band_list = ["B_G_Soldier_M_F"];

SAR_band_leader_weapon_list = ["Exile_Weapon_LeeEnfield","hlc_rifle_M1903A1","hlc_rifle_M1903A1OMR","Exile_Weapon_M1014","hlc_rifle_ak47","hlc_rifle_akm"];
SAR_band_leader_pistol_list = ["hgun_Pistol_01_F","Exile_Weapon_Taurus","Exile_Weapon_Makarov","Exile_Weapon_Colt1911"];

SAR_band_leader_items = [["Exile_Item_CanOpener",10],["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_band_leader_tools =  [["ItemMap",30],["ItemCompass",30],["NVGoggles",0],["ItemRadio",100]];

SAR_band_rifleman_weapon_list = ["Exile_Weapon_LeeEnfield","hlc_rifle_M1903A1","hlc_rifle_M1903A1OMR","Exile_Weapon_M1014","hlc_rifle_ak47","hlc_rifle_akm"];
SAR_band_rifleman_pistol_list = ["hgun_Pistol_01_F","Exile_Weapon_Taurus","Exile_Weapon_Makarov","Exile_Weapon_Colt1911"];

SAR_band_rifleman_items = [["Exile_Item_CanOpener",10],["Exile_Item_EnergyDrink",40],["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_band_rifleman_tools = [["ItemMap",30],["ItemCompass",30]];

SAR_band_sniper_weapon_list = ["hlc_rifle_M1903A1_unertl","Exile_Weapon_CZ550"];
SAR_band_sniper_pistol_list = ["hgun_Pistol_01_F","Exile_Weapon_Taurus","Exile_Weapon_Makarov","Exile_Weapon_Colt1911"];

SAR_band_sniper_items = [["Exile_Item_CanOpener",20],["Exile_Item_PlasticBottleFreshWater",75],["Exile_Item_Catfood_Cooked",60]];
SAR_band_sniper_tools = [["ItemMap",20],["ItemCompass",30]];


// Helicopter Types ----------------------------------------------------
// ---------------------------------------------------------------------
SAR_heli_type = ["UH1H_M240"];


/* -------------------------------- Do Not Edit Below. If you do the AI will not work properly. -------------------------------- */
/* -------------------------------- Do Not Edit Below. If you do the AI will not work properly. -------------------------------- */
/* -------------------------------- Do Not Edit Below. If you do the AI will not work properly. -------------------------------- */
SAR_AI_friendly_side = RESISTANCE;
SAR_AI_unfriendly_side = west;
SAR_AI_monitor = [];
SAR_leader_number = 0;

true;