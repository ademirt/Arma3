class CfgPatches {
	class A3XAI_config {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		A3XAIVersion = "0.2.1";
		requiredAddons[] = {};
	};
};

class CfgA3XAISettings {

	/*	A3XAI Settings
	--------------------------------------------------------------------------------------------------------------------*/	
	
	//Enable or disable event logging to the server RPT file (named arma3server_[date]_[time].rpt). Debug level setting. 0: No debug output, 1: Basic Debug output, 2: Detailed Debug output. (Default: 0)
	//Debug output may help finding additional information about A3XAI's background behavior. This output is helpful when asking for help regarding bugs or unexpected behaviors.
	debugLevel = 0;
	
	//Frequency of server monitor update to RPT log in seconds. The monitor periodically reports number of max/current AI units and dynamically spawned triggers into RPT log. (Default: 300, 0 = Disable reporting)											
	monitorReportRate = 300;
	
	//Enable or disable verification and error-correction of classname tables used by A3XAI. If invalid entries are found, they are removed and logged into the RPT log.
	//If disabled, any invalid classnames will not be removed and clients may crash if AI bodies with invalid items are looted. Only disable if a previous scan shows no invalid classnames (Default: 1).										
	verifyClassnames = 1;
	
	//Enables checking of all A3XAI config settings. (Default: 1)
	verifySettings = 1;
	
	//Minimum seconds to pass until each dead AI body or destroyed vehicle can be cleaned up by A3XAI's task scheduler. A3XAI will not clean up a body/vehicle if there is a player close by (Default: 900).									
	cleanupDelay = 900;
	
	//Enabled: A3XAI will load custom spawn/blacklist definitions file on startup (A3XAI_config.pbo >> custom_defs.sqf) (Default: 0)
	loadCustomFile = 0;
	
	
	/*	A3XAI HC Settings
	--------------------------------------------------------------------------------------------------------------------*/	

	//Enables A3XAI headless client support. (Default: 0)
	enableHC = 0;
	
	//If HC support enabled, A3XAI will pause during post-initialization until HC has successfully connected. (Default: 0)
	//IMPORTANT: It is highly recommended to ensure that the HC is properly setup before enabling this option, otherwise A3XAI may be stuck waiting for HC to to connect.
	waitForHC = 0;

	
	/*	Dynamic Classname Settings

		If a setting is disabled, A3XAI will use the corresponding classname table further below. See "AI clothing, weapon, loot, and equipment settings" section.
	--------------------------------------------------------------------------------------------------------------------*/	
	
	//Purchase price limit for items generated by dynamic classname system as defined in CfgExileArsenal. Lowering this value may reduce variety of items carried by AI. (Default: 2000)
	itemPriceLimit = 2000;
	
	//1: Generate AI weapons from Exile trader tables (Default)
	//0: Weapons defined by pistolList, rifleList, machinegunList, sniperList
	//dynamicWeaponBlacklist: Classnames of weapons to ignore from Exile trader tables
	generateDynamicWeapons = 0;
	dynamicWeaponBlacklist[] = {};
	
	//1: Use Exile loot table data as whitelist for AI-usable weapon scopes (Default)
	//0: Scopes defined by weaponOpticsList
	//dynamicOpticsBlacklist: List of optics classnames to ignore from Exile trader tables.
	generateDynamicOptics = 0;
	dynamicOpticsBlacklist[] = {};
	
	//1: Generate AI uniform types from Exile trader tables (Default)
	//0: Uniforms defined by uniformTypes0, uniformTypes1, uniformTypes2, uniformTypes3
	//dynamicUniformBlacklist: List of uniform classnames to ignore from Exile trader tables.
	generateDynamicUniforms = 0;
	dynamicUniformBlacklist[] = {};
	
	//1: Generate AI backpack types from Exile trader tables (Default)
	//0: Backpacks defined by backpackTypes0, backpackTypes1, backpackTypes2, backpackTypes3
	//dynamicBackpackBlacklist: List of backpack classnames to ignore from Exile trader tables.
	generateDynamicBackpacks = 0;
	dynamicBackpackBlacklist[] = {};
	
	//1: Generate AI backpack types from Exile trader tables (Default)
	//0: Vests defined by vestTypes0, vestTypes1, vestTypes2, vestTypes3
	//dynamicVestBlacklist: List of vest classnames to ignore from Exile trader tables.
	generateDynamicVests = 0;
	dynamicVestBlacklist[] = {};
	
	//1: Generate AI headgear types from Exile trader tables (Default)
	//0: Headgear defined by headgearTypes0, headgearTypes1, headgearTypes2, headgearTypes3
	//dynamicHeadgearBlacklist: List of headgear classnames to ignore from Exile trader tables.
	generateDynamicHeadgear = 0;
	dynamicHeadgearBlacklist[] = {};
	
	//1: Generate AI food types from Exile trader tables (Default)
	//0: Food defined by foodLoot
	//dynamicFoodBlacklist: List of food classnames to ignore from Exile trader tables.
	generateDynamicFood = 0;
	dynamicFoodBlacklist[] = {};
	
	//1: Generate AI generic loot types from Exile trader tables. Includes "Hardware", "Smoke", "Flare" -class items. (Default)
	//0: Loot defined by MiscLoot
	//dynamicLootBlacklist: List of loot classnames to ignore from Exile trader tables.
	generateDynamicLoot = 1;
	dynamicLootBlacklist[] = {};


	//Enable or disable radio message receiving. Players with radios or part of a group with at least one radio will be able to intercept some AI communications. (Default: 0)
	enableRadioMessages = 0;


	/*	Shared AI Unit Settings. These settings affect all AI spawned unless noted otherwise.
	--------------------------------------------------------------------------------------------------------------------*/	
	
	//Sets side/faction for AI spawned by A3XAI. If A3XAI units are hostile with AI spawned from other install addons, consider changing this setting. Acceptable sides: east or west (Default: east)
	side = west;
	
	//Number of online players required for maximum (or minimum) AI spawn chance. Affects Static, Dynamic, Random AI spawns. (Default: 10)	
	playerCountThreshold = 1;
	
	//1: Spawn chance multiplier scales upwards from value defined by chanceScalingThreshold to 1.00. 0: Spawn chance multiplier scales downwards from 1.00 to chanceScalingThreshold.
	upwardsChanceScaling = 1;
	
	//If upwardsChanceScaling is 1: Initial spawn chance multiplier. If upwardsChanceScaling is 0: Final spawn chance multiplier. (Default: 0.50)
	chanceScalingThreshold = 0.10;
	
	//(Static/Dynamic/Random Spawns) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
	minAI_village = 1;
	addAI_village = 1;
	unitLevel_village = 0;
	spawnChance_village = 0.20;
	
	//(Static/Dynamic/Random Spawns) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
	minAI_city = 1;
	addAI_city = 1;
	unitLevel_city = 1;
	spawnChance_city = 0.10;
	
	//(Static/Dynamic/Random Spawns) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
	minAI_capitalCity = 1;
	addAI_capitalCity = 1;
	unitLevel_capitalCity = 1;
	spawnChance_capitalCity = 0.10;
	
	//(Static/Dynamic/Random Spawns) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
	minAI_remoteArea = 1;
	addAI_remoteArea = 1;
	unitLevel_remoteArea = 2;
	spawnChance_remoteArea = 0.20;
	
	//(Static/Dynamic/Random Spawns) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
	minAI_wilderness = 1;
	addAI_wilderness = 1;
	unitLevel_wilderness = 1;
	spawnChance_wilderness = 0.10;
	
	//(For dynamic and random spawns only) Defines amount of time to wait in seconds until cleaning up temporary blacklist area after dynamic/random spawn is deactivated (Default: 1200)
	tempBlacklistTime = 1200;
	
	//Enable or disable AI death messages. Messages will be visible to all group members of player responsible for killing the AI unit. (Default: 1)
	enableDeathMessages = 1;
	
	//If enabled, AI group will attempt to track down player responsible for killing a group member. (Default: 1)
	enableFindKiller = 1;
	
	//If normal probability check for spawning NVGs fails, then give AI temporary NVGs during night hours. Temporary NVGs are unlootable and will be removed at death (Default: 0).									
	enableTempNVGs = 0;
	
	//Minimum AI unit level requirement to use underslung grenade launchers. Set to -1 to disable completely. (Default: 1)
	levelRequiredGL = -1;
	
	//Minimum AI unit level requirement to use launcher weapons. Set to -1 to disable completely. Launchers are unlootable and will be removed at death (Default: -1)
	levelRequiredLauncher = -1;
	
	//List of launcher-type weapons that AI can use.
	launcherTypes[] = {""}; 
	
	//Maximum number of launcher weapons allowed per group (Default: 1)
	launchersPerGroup = 0;
	
	//Enable or disable AI self-healing. Level 0 AI cannot self-heal. Affects: All AI infantry units (Default: 1).
	enableHealing = 1;
	
	//If enabled, A3XAI will remove all explosive ammo (missiles, rockets, bombs - but not HE rounds) from spawned AI air vehicles.  (Default: 1)
	//Affects: All AI air vehicle types (patrols/custom/reinforcement). Does not affect UAV/UGVs.
	removeExplosiveAmmo = 1;
	
	//if enabled, AI units suffer no damage from vehicle collisions. (Default: 1)
	noCollisionDamage = 1;
	
	//If enabled, AI killed by vehicle collisions will have their gear removed (Default: 1)
	roadKillPenalty = 1;
	
	//Array of positions defining trader locations. AI will be non-hostile and damage immune around this area.
	//Use this if your server is not using the standard Exile trader markers or sensors in mission.sqm
	//For performance reasons, do not add locations other than actual trader positions to this array. 
	//Example: traderAreaLocations[] = {{2998.06,18175.5,0},{14600,16797.2,0},{23334.6,24188.9,0}};
	traderAreaLocations[] = {};
	
	
	/*	Static Infantry AI Spawning Settings

		A3XAI will spawn an AI group at various named locations on the map if players are nearby. 
	--------------------------------------------------------------------------------------------------------------------*/	
	
	//Enable or disable static AI spawns. If enabled, AI spawn points will be generated in cities, towns, and other named areas.
	//Enabled: A3XAI automatically generates static spawns at named locations on map. Disabled: No static spawns will be generated. (Default: 1)
	enableStaticSpawns = 0;
	
	//Set minimum and maximum wait time (seconds) to respawn an AI group after all units have been killed. Applies to both static AI and custom spawned AI (Default: Min 300, Max 600).									
	respawnTimeMin = 300;
	respawnTimeMax = 600;
	
	//Time to allow spawned AI units to exist in seconds before being despawned when no players are present in a trigger area. Applies to both static AI and custom spawned AI (Default: 120)										
	despawnWait = 150;
	
	//Respawn Limits. Set to -1 for unlimited respawns. (Default: -1 for each).
	respawnLimit_village = 2;
	respawnLimit_city = 2;
	respawnLimit_capitalCity = 2;
	respawnLimit_remoteArea = -1;
	
	
	/*	Dynamic Infantry AI Spawning Settings. Probabilities should add up to 1.00	

		A3XAI will create ambient threat in the area for each player by periodically spawning AI to create unexpected ambush encounters. These AI may occasionally seek out and hunt a player. 
	--------------------------------------------------------------------------------------------------------------------*/		

	//Upper limit of dynamic spawns on map at once. Set to 0 to disable dynamic spawns (Default: 15)
	maxDynamicSpawns = 25;
	
	//Minimum time (in seconds) that must pass between dynamic spawns for each player (Default: 900)
	timePerDynamicSpawn = 900;
	
	//Players offline for this amount of time (seconds) will have their last spawn timestamp reset (Default: 3600)
	purgeLastDynamicSpawnTime = 3600;
	
	//Probability for dynamic AI to actively hunt a targeted player. If probability check fails, dynamic AI will patrol the area instead of hunting (Default: 0.60)
	spawnHunterChance = 0.25;
	
	//Time to wait (seconds) before despawning all AI units in dynamic spawn area when no players are present. (Default: 120)
	despawnDynamicSpawnTime = 150;
	
	
	/*	Random Infantry AI Spawning Settings

		A3XAI will create spawns that are randomly placed around the map and are periodically relocated. These spawns are preferentially created in named locations, but may be also created anywhere in the world. 
	--------------------------------------------------------------------------------------------------------------------*/		

	//Maximum number of placed random spawns on map. Set to -1 for A3XAI to automatically adjust spawn limit according to map size. Set to 0 to disable random spawns. (Default: -1)
	maxRandomSpawns = 5;
	
	//Time to wait (seconds) before despawning all AI units in random spawn area when no players are present. (Default: 120)
	despawnRandomSpawnTime = 150;	
	
	//Minimum distance between a random spawn location and other random spawns. (Default: 0)
	distanceBetweenRandomSpawns = 0;
	
	
	/*	Shared AI Vehicle Settings

		These settings affect the following AI vehicle patrol types: Air, Land, UAV, UGV
	--------------------------------------------------------------------------------------------------------------------*/

	//Time to wait (seconds) before despawning disabled/destroyed AI vehicles. If vehiclesAllowedForPlayers is enabled, this timer is cleared once a player enters the vehicle. (Default: 600)
	vehicleDespawnTime = 600;
	
	//Enable player use of AI vehicles. Players must either disable the vehicle or kill all units of the group in order to access the vehicle. (Default: 0)
	vehiclesAllowedForPlayers = 1;
	
	//Add name of location as displayed on map prevent AI vehicle patrols from travelling to these locations. Location names are case-sensitive. Note: Vehicles may still pass through these areas
	//Example: waypointBlacklistAir[] = {"Aggelochori","Panochori","Zaros"};
	waypointBlacklistAir[] = {}; //Affects Air vehicles (including UAVs)
	waypointBlacklistLand[] = {};  //Affects Land vehicles (including UGVs)
	
	
	/*	AI Air Vehicle patrol settings. 

		IMPORTANT: UAVs (Unmanned aerial vehicles) are not supported by this function. UAV spawns can be configured in the "UAV Patrol Settings" section further below.

		A3XAI will create AI vehicle patrols that will randomly travel between different cities and towns, and engage any players encountered.
		Helicopters with available cargo space may also occasionally deploy an AI group by parachute. 
	--------------------------------------------------------------------------------------------------------------------*/		

	//Global maximum number of active AI air vehicle patrols. Set at 0 to disable (Default: 0).							
	maxAirPatrols = 1;	
	
	//Probability of spawning Level 0/1/2/3 AI air vehicle patrol spawns. Probabilities should add up to 1.00		
	levelChancesAir[] = {0.00,0.50,0.35,0.15};
	
	//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
	respawnAirMinTime = 1500;
	respawnAirMaxTime = 3500;
	
	//Classnames of air vehicle types to use, with the maximum amount of each type to spawn.
	airVehicleList[] = {
		{"UH1H_M240",5}
	};
	
	//Maximum number of gunner units per air vehicle. Limited by actual number of available gunner positions. (Default: 2)
	//Affects: All AI air vehicle patrols, including custom and reinforcement.
	airGunnerUnits = 1;
	
	//Probability of AI helicopter sucessfully detecting player if there is line-of-sight. AI helicopters will conduct a visual sweep upon arriving at each waypoint and some distance after leaving. (Default: 0.80)
	//Affects: All AI air vehicle patrols, including custom and reinforcement.
	airDetectChance = 0.15;
	
	//Probability of AI to deploy infantry units by parachute if players are nearby when helicopter is investigating a waypoint. (Default: 0.50)
	//Affects: Air vehicle patrols.
	paradropChance = 0.20;
	
	//Cooldown time for AI paradrop deployment in seconds. (Default: 1800).
	//Affects: Air vehicle patrols.
	paradropCooldown = 2988;
	
	//Number of infantry AI to paradrop if players are nearby when helicopter is investigating a waypoint, or if helicopter is reinforcing a dynamic AI spawn. Limited by number of cargo seats available in the vehicle. (Default: 3)
	//Affects: Air vehicle patrols, air reinforcements.
	paradropAmount = 1;
	
	
	/*	AI Land Vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.

		IMPORTANT: UGVs (Unmanned ground vehicles) are not supported by this function. UGV spawns can be configured in the "UGV Patrol Settings" section further below.
		
		A3XAI will create AI vehicle patrols that will randomly travel between different cities and towns, and engage any players encountered.
	--------------------------------------------------------------------------------------------------------------------*/	

	//Global maximum number of active AI land vehicle patrols. Set at 0 to disable (Default: 0).	
	maxLandPatrols = 1;
	
	//Probability of spawning Level 0/1/2/3 AI land vehicle spawns. Probabilities should add up to 1.00		
	levelChancesLand[] = {0.00,0.50,0.35,0.15};
	
	//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
	respawnLandMinTime = 700;
	respawnLandMaxTime = 1250;
	
	//Classnames of land vehicle types to use, with the maximum amount of each type to spawn.
	landVehicleList[] = {
		{"Exile_Car_HMMWV_UNA_Green",2},
		{"Exile_Car_Lada_Hipster",5},
		{"Exile_Car_LandRover_Green",5},
		{"Exile_Car_Hatchback_Sport_Red",5},
		{"Exile_Car_SUV_Red",5},
		{"Exile_Car_LandRover_Urban",5},
		{"C_Offroad_02_unarmed_F",5},
		//{"Exile_Car_MB4WDOpen",5},
		{"Exile_Car_Offroad_Red",5},
		//{"Exile_Car_SUVXL_Black",2},
		//{"Exile_Car_Strider",0},
		//{"Exile_Car_Hunter",0},
		//{"Exile_Car_Ifrit",5},
		{"Ural_Civ_01",5},
		{"Exile_Car_V3S_Open",5},
		{"Exile_Car_Volha_Blue",5}
		//{"Exile_Car_Zamak",5}
		//{"Exile_Car_Tempest",5}
		//{"Exile_Car_HEMMT",5}
	};
	
	//Maximum number of gunner units per land vehicle. Limited by actual number of available gunner positions. (Default: 2)
	landGunnerUnits = 1;
	
	//Maximum number of cargo units per land vehicle. Limited by actual number of available cargo positions. (Default: 3)
	landCargoUnits = 1;
	
	
	/*	AI Air Reinforcement Settings

		Allowed types of AI groups (defined by airReinforcementAllowedTypes) may call for temporary air reinforcements if a player kills one of their units.
		Probability to summon reinforcements determined by airReinforcementSpawnChance<AI level>, where <AI level> is the level of the calling group.
		Once summoned, armed reinforcement vehicles will remain in the area for a duration determined by airReinforcementDuration<AI level> and engage nearby players.
		Unarmed reinforcement vehicles will deploy a paradrop group and exit the area.
		
	--------------------------------------------------------------------------------------------------------------------*/

	//Maximum allowed number of simultaneous active reinforcements (Default: 5)
	maxAirReinforcements = 0;
	
	//Air vehicles to use as reinforcement vehicles. Default: {"B_Heli_Transport_01_F","B_Heli_Light_01_armed_F"}
	//Armed air vehicles will detect and engage players within reinforcement area. Unarmed air vehicles will deploy an AI paradrop group.
	airReinforcementVehicles[] = {
		"UH1H_M240",
	};
	
	//Probability to spawn reinforcements for each AI level.
	airReinforcementSpawnChance0 = 0.00;
	airReinforcementSpawnChance1 = 0.05;
	airReinforcementSpawnChance2 = 0.06;
	airReinforcementSpawnChance3 = 0.08;
	
	//AI types permitted to summon reinforcements. Default: airReinforcementAllowedFor[] = {"static","dynamic","random"};
	//Usable AI types: "static", "dynamic", "random", "air", "land", "staticcustom", "aircustom", "landcustom", "vehiclecrew"
	airReinforcementAllowedFor[] = {"static","dynamic","random"};
	
	//Maximum time for reinforcement for armed air vehicles in seconds. AI air vehicle will leave the area after this time if not destroyed.
	airReinforcementDuration0 = 120;
	airReinforcementDuration1 = 180;
	airReinforcementDuration2 = 240;
	airReinforcementDuration3 = 300;
	
	
	/*	UAV Patrol Settings

		IMPORTANT: UAV patrols are a feature in testing, and may undergo significant changes or possible removal in future versions.

		A3XAI can spawn UAVs that patrol between named locations, and deploy air reinforcements if players are found.
		In order for air reinforcements to be deployed, maxAirReinforcements must be greater than zero and the current limit of air reinforcements has not been exceeded.
	--------------------------------------------------------------------------------------------------------------------*/

	//Global maximum number of active UAV patrols. Set at 0 to disable (Default: 0).	
	maxUAVPatrols = 0;
	
	//Classnames of UAV types to use, with the maximum amount of each type to spawn.
	UAVList[] = {
		{"I_UAV_02_CAS_F",5},
		{"I_UAV_02_F",5},
		{"B_UAV_02_CAS_F",5},
		{"B_UAV_02_F",5},
		{"O_UAV_02_CAS_F",5},
		{"O_UAV_02_F",5}
	};
	
	//Probability of spawning Level 0/1/2/3 UAV spawns. Probabilities should add up to 1.00	
	levelChancesUAV[] = {0.35,0.50,0.15,0.00};
	
	//Set minimum and maximum wait time in seconds to respawn a UAV after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
	respawnUAVMinTime = 600;
	respawnUAVMaxTime = 900;
	
	//Set to '1' to set detection-only behavior (UAV will not directly engage enemies). (Default: 0)
	detectOnlyUAVs = 0;
	
	//Cooldown required in between air reinforcement summons when detecting players. Value in seconds. (Default: 1800)
	UAVCallReinforceCooldown = 1800;
	
	//Probability to successfully detect player if there is line-of-sight. If at least one player is detected, air reinforcements will be summoned to the area. (Default: 0.50)
	UAVDetectChance = 0.80;
	
	
	/*	UGV Patrol Settings

		IMPORTANT: UGV patrols are a feature in testing, and may undergo significant changes or possible removal in future versions.

		A3XAI can spawn UGVs that patrol between named locations, and deploy air reinforcements if players are found. Damaged UGVs repair themselves over time if not engaging enemes.
		In order for air reinforcements to be deployed, maxAirReinforcements must be greater than zero and the current limit of air reinforcements has not been exceeded.
	--------------------------------------------------------------------------------------------------------------------*/

	//Global maximum number of active UGV patrols. Set at 0 to disable (Default: 0).	
	maxUGVPatrols = 0;
	
	//Classnames of UGV types to use, with the maximum amount of each type to spawn.
	UGVList[] = {
		{"I_UGV_01_rcws_F",5},
		{"B_UGV_01_rcws_F",5},
		{"O_UGV_01_rcws_F",5}
	};
	
	//Probability of spawning Level 0/1/2/3 AI UGV spawns. Probabilities should add up to 1.00	
	levelChancesUGV[] = {0.35,0.50,0.15,0.00};
	
	//Set minimum and maximum wait time in seconds to respawn a UGV patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
	respawnUGVMinTime = 600;
	respawnUGVMaxTime = 900;
	
	//Set to '1' to set detection-only behavior (UGV will not directly engage enemies). (Default: 0)
	detectOnlyUGVs = 0;
	
	//Cooldown required in between air reinforcement summons when detecting players. Value in seconds. (Default: 1800)
	UGVCallReinforceCooldown = 1800;
	
	//Probability to successfully detect player if there is line-of-sight. If at least one player is detected, air reinforcements will be summoned to the area. (Default: 0.50)
	UGVDetectChance = 0.80;
	
	
	/*
		AI skill settings. 
		
		These settings affect all AI units spawned by A3XAI.
		
		Skill Level: Description
		0: Low-level AI found in villages
		1: Medium-level AI found in cities and capital cities
		2: High-level AI found in remote areas such as factories and military bases
		3: Expert-level AI.
		
		Valid skill range: 0.00 - 1.00.
		Hint: For all skill types, higher number = better skill. For skill sub-type explanation, see: https://community.bistudio.com/wiki/AI_Sub-skills
	*/
	
	//AI skill settings level 0 (Skill, Minimum skill, Maximum skill). Defaults: Accuracy 0.05-0.10, Others 0.30-0.50
	skill0[] = {
		{"aimingAccuracy",0.10,0.20},
		{"aimingShake",0.06,0.20},
		{"aimingSpeed",0.05,0.15},
		{"spotDistance",0.05,0.10},
		{"spotTime",0.03,0.07},
		{"courage",0.5,0.75},
		{"reloadSpeed",0.10,0.25},
		{"commanding",0.10,0.20},
		{"general",0.10,0.20}
	};
	
	//AI skill settings level 1 (Skill, Minimum skill, Maximum skill). Defaults: Accuracy 0.10-0.15, Others 0.40-0.60
	skill1[] = {
	{"aimingAccuracy",0.10,0.20},
		{"aimingShake",0.06,0.20},
		{"aimingSpeed",0.05,0.15},
		{"spotDistance",0.05,0.10},
		{"spotTime",0.03,0.07},
		{"courage",0.5,0.75},
		{"reloadSpeed",0.10,0.25},
		{"commanding",0.10,0.20},
		{"general",0.10,0.20}
	};
	
	//AI skill settings level 2 (Skill, Minimum skill, Maximum skill). Defaults: Accuracy 0.15-0.20, Others 0.50-0.70
	skill2[] = {
{"aimingAccuracy",0.10,0.20},
		{"aimingShake",0.06,0.20},
		{"aimingSpeed",0.05,0.15},
		{"spotDistance",0.05,0.10},
		{"spotTime",0.03,0.07},
		{"courage",0.5,0.75},
		{"reloadSpeed",0.10,0.25},
		{"commanding",0.10,0.20},
		{"general",0.10,0.20}
	};
	
	//AI skill settings level 3 (Skill, Minimum skill, Maximum skill). Defaults: Accuracy 0.20-0.25, Others 0.60-0.80
	skill3[] = {
{"aimingAccuracy",0.10,0.20},
		{"aimingShake",0.06,0.20},
		{"aimingSpeed",0.05,0.15},
		{"spotDistance",0.05,0.10},
		{"spotTime",0.03,0.07},
		{"courage",0.5,0.75},
		{"reloadSpeed",0.10,0.25},
		{"commanding",0.10,0.20},
		{"general",0.10,0.20}
	};
	
	
	/*	AI loadout probability settings.
	--------------------------------------------------------------------------------------------------------------------*/

	//Probabilities to equip backpack, according to AI level.
	addBackpackChance0 = 0.60;
	addBackpackChance1 = 0.70;
	addBackpackChance2 = 0.80;
	addBackpackChance3 = 0.90;
	
	//Probabilities to equip vest, according to AI level.
	addVestChance0 = 0.60;
	addVestChance1 = 0.70;
	addVestChance2 = 0.80;
	addVestChance3 = 0.90;
	
	//Probabilities to equip headgear, according to AI level.
	addHeadgearChance0 = 0.60;
	addHeadgearChance1 = 0.70;
	addHeadgearChance2 = 0.80;
	addHeadgearChance3 = 0.90;
	
	//Probabilities to equip level 0-3 AI with each weapon type. Order: {pistols, rifles, machineguns, sniper rifles}. Probabilities must add up to 1.00.
	useWeaponChance0[] = {0.20,0.80,0.00,0.00};
	useWeaponChance1[] = {0.00,0.90,0.05,0.05};
	useWeaponChance2[] = {0.00,0.80,0.10,0.10};
	useWeaponChance3[] = {0.00,0.70,0.15,0.15};
	
	//Probability to select a random optics attachment (ie: scopes) for level 0-3 AI
	opticsChance0 = 0.00;
	opticsChance1 = 0.30;
	opticsChance2 = 0.60;
	opticsChance3 = 0.90;
	
	//Probability to select a random pointer attachment (ie: flashlights) for level 0-3 AI
	pointerChance0 = 0.00;
	pointerChance1 = 0.30;
	pointerChance2 = 0.60;
	pointerChance3 = 0.90;
	
	//Probability to select a random muzzle attachment (ie: suppressors) for level 0-3 AI
	muzzleChance0 = 0.00;
	muzzleChance1 = 0.30;
	muzzleChance2 = 0.60;
	muzzleChance3 = 0.90;
	
	//Probability to select a random underbarrel attachment (ie: bipods) for level 0-3 AI
	underbarrelChance0 = 0.00;
	underbarrelChance1 = 0.30;
	underbarrelChance2 = 0.60;
	underbarrelChance3 = 0.90;
	
	
	/*	AI loot quantity settings
	--------------------------------------------------------------------------------------------------------------------*/

	//Maximum number of food loot items found on AI. (Default: 2)								
	foodLootCount = 2;
	
	//Maximum number of items to select from MiscLoot (generic loot) table. (Default: 2)											
	miscLootCount = 2;
	
	
	/*	AI loot probability settings. AI loot is pre-generated into a pool for each unit and randomly pulled to units as time passes.
	--------------------------------------------------------------------------------------------------------------------*/

	//Chance to add a single InstaDoc to group loot pool per unit (Default: 0.25)
	firstAidKitChance = 0.25;
	
	//Probability to successfully pull a random item from loot pool for level 0-3 AI. Influences the rate at which loot items are added to units.
	lootPullChance0 = 0.20;
	lootPullChance1 = 0.40;
	lootPullChance2 = 0.60;
	lootPullChance3 = 0.80;
	
	
	/*	Respect rewards for AI kills. Note: This section only has effects if enableRespectRewards is enabled.
	--------------------------------------------------------------------------------------------------------------------*/

	//Enable Exile-style handling (ie: Respect rewards, kill-count tracking) for AI kills (Default: 1)
	enableRespectRewards = 1;
	
	//Respect bonus for kills with Axe
	respectHumiliation = 300;
	
	//Respect bonus for standard kills
	respectFragged = 100;
	
	//Respect bonus for collision kills with parachute
	respectChute = 600;
	
	//Respect bonus for collision kills with air vehicle
	respectBigBird = 600;
	
	//Respect bonus for collision kills by vehicle driver
	respectRoadkill = 500;
	
	//Respect bonus for kills with vehicle weapons
	respectLetItRain = 150;
	
	//Respect bonus per kill streak
	respectKillstreak = 50;
	
	//Respect bonus per 100m distance from target
	respectPer100m = 10;
	
	
	/*
		AI skin, weapon, loot, and equipment settings

		Note: Some of the below tables may not be used by A3XAI if a dynamic classname setting is enabled. Check each section below for details.
	*/

	//AI uniform classnames. Note: uniformTypes0-3 will not be read if generateDynamicUniforms is enabled.
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	uniformTypes0[] = {"U_BG_Guerilla1_1","U_C_Poor_1","TRYK_U_B_C02_Tsirt","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_PCUHs","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_U_B_fleece_UCP","B_G_Soldier_M_F","U_BG_Guerilla3_1"};
	uniformTypes1[] = {"U_BG_Guerilla1_1","U_C_Poor_1","TRYK_U_B_C02_Tsirt","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_PCUHs","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_U_B_fleece_UCP","B_G_Soldier_M_F","U_BG_Guerilla3_1"};
	uniformTypes2[] = {"U_BG_Guerilla1_1","U_C_Poor_1","TRYK_U_B_C02_Tsirt","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_PCUHs","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_U_B_fleece_UCP","B_G_Soldier_M_F","U_BG_Guerilla3_1"};
	uniformTypes3[] = {"U_BG_Guerilla1_1","U_C_Poor_1","TRYK_U_B_C02_Tsirt","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_PCUHs","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_U_B_fleece_UCP","B_G_Soldier_M_F","U_BG_Guerilla3_1"};
	
	//AI weapon classnames. Note: pistolList, rifleList, machinegunList, sniperList will not be read if generateDynamicWeapons is enabled.
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	pistolList[] = {"hgun_Pistol_01_F","Exile_Weapon_Taurus","Exile_Weapon_Makarov","Exile_Weapon_Colt1911","Exile_Weapon_TaurusGold"};
	rifleList[] = {"Exile_Weapon_LeeEnfield","Exile_Weapon_M1014","hlc_rifle_M1903A1OMR","hlc_rifle_M1903A1"};
	machinegunList[] = {"Exile_Weapon_AK47","Exile_Weapon_AKS","Exile_Weapon_AKS_Gold"};
	sniperList[] = {"Exile_Weapon_CZ550","hlc_rifle_M1903A1_unertl"};
	
	//AI weapon scope attachment settings. Note: weaponOpticsList will not be read if generateDynamicOptics is enabled.
	weaponOpticsList[] = {"optic_Yorris","optic_MRD"};
	
	//AI backpack types (for AI levels 0-3). Note: backpackTypes0-3 will not be read if generateDynamicBackpacks is enabled.
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	backpackTypes0[] = {"B_FieldPack_oli","B_FieldPack_blk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_OutdoorPack_blu","B_AssaultPack_khk","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan"};
	backpackTypes1[] = {"B_FieldPack_oli","B_FieldPack_blk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_OutdoorPack_blu","B_AssaultPack_khk","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan"};
	backpackTypes2[] = {"B_FieldPack_oli","B_FieldPack_blk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_OutdoorPack_blu","B_AssaultPack_khk","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan"};
	backpackTypes3[] = {"B_FieldPack_oli","B_FieldPack_blk","B_OutdoorPack_blk","B_OutdoorPack_tan","B_OutdoorPack_blu","B_AssaultPack_khk","B_AssaultPack_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan"};
	
	//AI vest types (for AI levels 0-3). Note: vestTypes0-3 will not be read if generateDynamicVests is enabled.
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vestTypes0[] = {"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"};
	vestTypes1[] = {"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"};
	vestTypes2[] = {"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"};
	vestTypes3[] = {"V_Press_F","V_Rangemaster_belt","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli","V_BandollierB_rgr","V_Chestrig_blk","V_Chestrig_khk","V_Chestrig_oli","V_Chestrig_rgr"};
	
	//AI head gear types. Note: headgearTypes0-3 will not be read if generateDynamicHeadgear is enabled.
	headgearTypes0[] = {"H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US","H_Watchcap_blk","H_Watchcap_camo"};
	headgearTypes1[] = {"H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US","H_Watchcap_blk","H_Watchcap_camo"};
	headgearTypes2[] = {"H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US","H_Watchcap_blk","H_Watchcap_camo"};
	headgearTypes3[] = {"H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US","H_Watchcap_blk","H_Watchcap_camo"};
	
	
	//AI Food/Loot item types. 
	// Note: foodLoot will not be read if generateDynamicFood is enabled.
	// Note: miscLoot will not be read if generateDynamicLoot is enabled.
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	foodLoot[] = {"Exile_Item_GloriousKnakworst","Exile_Item_SausageGravy","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Surstromming","Exile_Item_Catfood","Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_Energydrink"};
	miscLoot[] = {"Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_CamoTentKit"};
	
	
	//AI toolbelt item types. Toolbelt items are added to AI inventory upon death. Format: [item classname, item probability]
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	toolsList0[] = {
		{"Exile_Item_XM8",0.90},{"ItemCompass",0.30},{"ItemMap",0.30},{"ItemGPS",0.00},{"ItemRadio",0.00}
	};
	toolsList1[] = {
		{"Exile_Item_XM8",0.90},{"ItemCompass",0.50},{"ItemMap",0.50},{"ItemGPS",0.10},{"ItemRadio",0.10}
	};
	toolsList2[] = {
		{"Exile_Item_XM8",0.90},{"ItemCompass",0.70},{"ItemMap",0.70},{"ItemGPS",0.20},{"ItemRadio",0.20}
	};
	toolsList3[] = {
		{"Exile_Item_XM8",0.90},{"ItemCompass",0.90},{"ItemMap",0.90},{"ItemGPS",0.30},{"ItemRadio",0.30}
	};
	
	
	//AI-useable toolbelt item types. These items are added to AI inventory at unit creation and may be used by AI. Format: {item classname, item probability}
	//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	gadgetsList0[] = {
		{"binocular",0.08},{"NVGoggles",0}
	};
	gadgetsList1[] = {
		{"binocular",0.05},{"NVGoggles",0}
	};
	gadgetsList2[] = {
		{"binocular",0.06},{"NVGoggles",0}
	};
	gadgetsList3[] = {
		{"binocular",0.06},{"NVGoggles",0}
	};
};
