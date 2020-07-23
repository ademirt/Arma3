// Global settings
EVOR_var_SideFriendly		= WEST;						// Player's side
EVOR_var_SideEnemy			= EAST;						// Enemies' side
EVOR_var_FOBDistance		= 1000;						// Minimum distance between FOB's when constructing one
EVOR_var_FOBTruckType		= "C_Truck_02_covered_F";	// Classname of construction truck
EVOR_var_FOBRadius			= 50;						// Size of FOB's in which the menu can be accessed

// Cinematic settings
EVOR_var_IntroMusic			= "LeadTrack03_F";
EVOR_var_OutroMusic			= "AmbientTrack03_F";

// Difficulty settings
EVOR_var_CasualMode			= ["EVOR_param_CasualMode",0] call BIS_fnc_getParamValue isEqualTo 1;			// Enable casual mode (free gear, crap enemies)
EVOR_var_EnableSaveAllGear	= ["EVOR_param_EnableSaveAllGear",0] call BIS_fnc_getParamValue isEqualTo 1;	// Allow players to save non-purchased equipment
EVOR_var_EnableStamina		= ["EVOR_param_EnableStamina",0] call BIS_fnc_getParamValue isEqualTo 1;		// Enable stamina
EVOR_var_SquadHalo			= ["EVOR_param_SquadHalo",0] call BIS_fnc_getParamValue;						// Enable squad HALO
EVOR_var_Mark3DAllowed		= ["EVOR_param_Mark3DAllowed",1] call BIS_fnc_getParamValue isEqualTo 1;		// Allow 3D player markers
EVOR_var_CounterArtyChance	= (["EVOR_param_CounterArtyChance",5] call BIS_fnc_getParamValue)/100;			// Chance to receive counter arty on each shot
EVOR_var_MaxUnits			= [20,5] select isMultiplayer;													// Maximum amount of AI team-members in a player's group;

// Score settings
EVOR_var_ScoreStart			= ["EVOR_param_ScoreStart",15] call BIS_fnc_getParamValue;		// Score that players start with when they first connect
EVOR_var_ScoreKillAssist	= 10;				// Score given on air-kill assist
EVOR_var_ScoreObjCap		= 15;				// Score given to players in the objective when it is captured
EVOR_var_ScoreObjRT			= 25;				// Score given to the player that destroys the radio tower
EVOR_var_ScoreTickerScore	= 1;				// Score that is given to each player each cycle by the scoreTicker
EVOR_var_ScoreTickerLimit	= 40;				// Below this score the scoreTicker keeps adding points
EVOR_var_ScoreTickerSleep	= 60;				// Time between each score addition

// Objective settings
EVOR_var_ObjNumber			= ["EVOR_param_ObjNumber",10] call BIS_fnc_getParamValue;		// Amount of objectives during the mission
EVOR_var_ObjAirfChance		= 0.1;						// Chance to get an airfield objective between medium and far objectives
EVOR_var_ObjRTType			= "Land_TTowerSmall_2_F";	// Classname of radio tower

// Enemies settings
EVOR_var_EnemyUnitMin		= ["EVOR_param_EnemyUnitMin",50] call BIS_fnc_getParamValue;	// ~Amount of enemies spawned when no player slots filled
EVOR_var_EnemyUnitMax		= ["EVOR_param_EnemyUnitMax",150] call BIS_fnc_getParamValue;	// ~Amount of enemies spawned when all player slots filled
EVOR_var_EnemyUnitEnd		= 10;				// Maximum amount of units in AO before it can be completed
EVOR_var_EnemyReinfSleep	= [400,500,600];	// Time distribution between reinforcement cycles
EVOR_var_EnemyCapPP			= 0.4;				// Maximum amount of air patrols active at one time per player (rounded up)
EVOR_var_EnemyCapChance		= 1;				// Chance of CAP added to reinforcement cycle when not maxed out

// Addon settings
EVOR_var_RemoveExplVanilla	= 0; 				// Remove vanilla grenades/satchels for mod compat (0-nothing,1-grenades,2-satchels,3-both)
EVOR_var_EnabledAceMedic	= isClass (configFile >> "CfgPatches" >> "ace_medical");	// Check if ace medical is enabled
EVOR_var_EnabledAceRearm	= isClass (configFile >> "CfgPatches" >> "ace_rearm");		// Check if ace rearm is enabled
EVOR_var_EnabledAceRefuel	= isClass (configFile >> "CfgPatches" >> "ace_refuel");		// Check if ace refuel is enabled
EVOR_var_EnabledAceRepair	= isClass (configFile >> "CfgPatches" >> "ace_repair");		// Check if ace repair is enabled