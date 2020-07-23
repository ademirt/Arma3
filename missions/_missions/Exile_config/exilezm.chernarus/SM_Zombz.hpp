class SM_Zombz
{
	SM_Debug = 0; // used to debug the system (just logs a lot of stuff)

	//Client
	SM_NotificatonType = 1; // 1 for custom notification, 2 for mod notification.
	SM_ZombieDamagePlayer = 0.15; // how much damage a zombie does to a player
	SM_ZombieDamagePlayerStrength = 1; // strenth in wich a zombie does to a player (based on damage)
	SM_ZombieDamageCar = 0.02; // how much damage a zombie does to a car
	SM_ZombieDamageCarStrength = 1.5; // strenth in wich a zombie does to a car (based on damage)
	SM_SoundVolume = 1; // volume in wich sound plays
	SM_AttackSpeed = 0.8; // delay from each zombie attack
	SM_BleedingEnabled = 1; // when a zombie attacks a player they can bleed
	SM_BleedTime = 20; // how long a player will bleed if they are attacked by a zombie
	SM_BleedChanceHigh = 100; // not recommended to change
	SM_BleedChanceLow = 90; // 100 - 90 = 10% chance
	SM_ZombieAgroRange = 50; // how far a zombie can track a player
	SM_ZombieTargetPosMemory = 7.5; // in seconds how long a zombie remembers the position it's walking to
	SM_ZombieSoundDelayAggressive = 3; // seconds between each aggresive sound a zombie makes
	SM_ZombieSoundDelayMoan = 15; // seconds between each moan sound a zombie makes
	SM_ZombieEat = 30; // how long a zombie eats a target
	SM_SoundDistance = 30; // how far a zombie sound travels
	SM_ZombieEatSoundDelay = 7; // seconds between each eating sound
	SM_ZombieSpeedIncreaseEnabled = 1; // increase / decrease zombie speed based on distance
	SM_ZombieSpeedDistance = 35; // distance to increase / decrease zombie speed
	SM_ZombieSpeedMultiplyer = 1.5; // multiplier for zombie speed
	SM_ZombiesFastClose = 1; // 1 = zombies walk fast close // 0 = zombies walk fast far away
	SM_MultiplierDistanceFromTarget = 1.5; // random of 10, multiplier, if 5, then will be 7.5 meter wander distance from target.
	SM_ZombieInBuildingSpeedDevidor = 2; // Devidor of default zombie speed, how fast a zombie moves in a building.
	SM_FiredNearEVHEnabled = 1; // if a player shoots near a zombie, the zombie will walk to that shot position

	//Custom effects to display on screen when hit.
	SM_CustomScreenEffects = 1; // scratches, bites etc.. on screen when attacked.
	SM_ScreenEffects[] =
	{
		"\SM_Zombz\textures\badger\SM_BloodEffect_1.paa",
		"\SM_Zombz\textures\badger\SM_BloodEffect_2.paa",
		"\SM_Zombz\textures\badger\SM_ZombieBite.paa",
		"\SM_Zombz\textures\badger\SM_ZombieStrike_1.paa",
		"\SM_Zombz\textures\badger\SM_ZombieStrike_2.paa"
	};

	// faces...
	SM_FacesArray[] =
	{
		"SM_Zombie1",
		"SM_Zombie2",
		"SM_Zombie3",
		"SM_Zombie4",
		"SM_Zombie5",
		"SM_Zombie6",
		"SM_Zombie7",
		"SM_Zombie8",
		"SM_Zombie9",
		"SM_Zombie10",
		"SM_Zombie11",
		"SM_Zombie13",
		"SM_Zombie14",
		"SM_Zombie15",
		"SM_Zombie16",
		"SM_Zombie17",
		"SM_Zombie18",
		"SM_Zombie19",
		"SM_Zombie20",
		"SM_Zombie21",
		"SM_Zombie22",
		"SM_Zombie23",
		"SM_Zombie24",
		"SM_Zombie25",
		"SM_Zombie26",
		"SM_Zombie27",
		"SM_Zombie28",
		"SM_Zombie29",
		"SM_Zombie30",
		"SM_Zombie31",
		"SM_Zombie32"
	};

	//Sounds start
	SM_ZombieBiteArray[] =
	{
		"SM_ZombieBite"
	};
	SM_AttackArray[] =
	{
		"SM_Attack1",
		"SM_Attack2",
		"SM_Attack3",
		"SM_Attack4",
		"SM_Attack5"
	};
	SM_AggressiveArray[] =
	{
		"SM_Aggressive1",
		"SM_Aggressive2",
		"SM_Aggressive3",
		"SM_Aggressive4",
		"SM_Aggressive5",
		"SM_Aggressive6",
		"SM_Aggressive7",
		"SM_Aggressive8",
		"SM_Aggressive9",
		"SM_Aggressive10",
		"SM_Aggressive11",
		"SM_Aggressive12",
		"SM_Aggressive13",
		"SM_Aggressive14",
		"SM_Aggressive15",
		"SM_Aggressive16",
		"SM_Aggressive17",
		"SM_Aggressive18",
		"SM_Aggressive19",
		"SM_Aggressive20",
		"SM_Aggressive21",
		"SM_Aggressive22",
		"SM_Aggressive23",
		"SM_Aggressive24",
		"SM_Aggressive25",
		"SM_Aggressive26",
		"SM_Aggressive27",
		"SM_Aggressive28",
		"SM_Aggressive29",
		"SM_Aggressive30",
		"SM_Aggressive31",
		"SM_Aggressive32",
		"SM_Aggressive33",
		"SM_Aggressive34",
		"SM_Aggressive35",
		"SM_Aggressive36",
		"SM_Aggressive37",
		"SM_Aggressive38",
		"SM_Aggressive39",
		"SM_Aggressive40",
		"SM_Aggressive41",
		"SM_Aggressive42",
		"SM_Aggressive43",
		"SM_Aggressive44",
		"SM_Aggressive45",
		"SM_Aggressive46",
		"SM_Aggressive47",
		"SM_Aggressive48",
		"SM_Aggressive49",
		"SM_Aggressive50",
		"SM_Aggressive51",
		"SM_Aggressive52",
		"SM_Aggressive53",
		"SM_Aggressive54",
		"SM_Aggressive55",
		"SM_Aggressive56",
		"SM_Aggressive57",
		"SM_Aggressive58",
		"SM_Aggressive59",
		"SM_Aggressive60",
		"SM_Aggressive61",
		"SM_Aggressive62",
		"SM_Aggressive63",
		"SM_Aggressive64",
		"SM_Aggressive65",
		"SM_Aggressive66",
		"SM_Aggressive67",
		"SM_Aggressive68",
		"SM_Aggressive69",
		"SM_Aggressive70",
		"SM_Aggressive71",
		"SM_Aggressive72",
		"SM_Aggressive73",
		"SM_Aggressive74",
		"SM_Aggressive75",
		"SM_Aggressive76",
		"SM_Aggressive77",
		"SM_Aggressive78",
		"SM_Aggressive79",
		"SM_Aggressive80"
	};
	SM_JumpArray[] =
	{
		"SM_Jump1",
		"SM_Jump2",
		"SM_Jump3",
		"SM_Jump4",
		"SM_Jump5",
		"SM_Jump6"
	};
	SM_CrawlerEatingArray[] =
	{
		"SM_HitCrawler1",
		"SM_HitCrawler2"
	};
	SM_EatingArray[] =
	{
		"SM_Eat1",
		"SM_Eat2",
		"SM_Eat3",
		"SM_Eat4",
		"SM_Eat5"
	};
	SM_MoanArray[] =
	{
		"SM_Moan1",
		"SM_Moan2",
		"SM_Moan3",
		"SM_Moan4",
		"SM_Moan5",
		"SM_Moan6",
		"SM_Moan7"
	};
	SM_ScreamArray[] =
	{
		"SM_Scream1",
		"SM_Scream2", 
		"SM_Scream3",
		"SM_Scream4",
		"SM_Scream5",
		"SM_Scream6",
		"SM_Scream7",
		"SM_Scream8",
		"SM_Scream9"
	};
	SM_VehicleHitArray[] =
	{
		"SM_Vehiclehit1",
		"SM_Vehiclehit2",
		"SM_Vehiclehit3",
		"SM_Vehiclehit4"
	};
	SM_ThrowArray[] =
	{
		"SM_VehicleThrow1",
		"SM_VehicleThrow2"
	};
	SM_CrawlerAggressiveArray[] =
	{
		"SM_CrawlerAttack1",
		"SM_CrawlerAttack2",
		"SM_CrawlerAttack3",
		"SM_CrawlerAttack4",
		"SM_CrawlerAttack5",
		"SM_CrawlerAttack6",
		"SM_CrawlerAttack7",
		"SM_CrawlerAttack8",
		"SM_CrawlerAttack9",
		"SM_CrawlerAttack10",
		"SM_CrawlerAttack11",
		"SM_CrawlerAttack12",
		"SM_CrawlerAttack13",
		"SM_CrawlerAttack14",
		"SM_CrawlerAttack14",
		"SM_CrawlerAttack16",
		"SM_CrawlerAttack17",
		"SM_CrawlerAttack18",
		"SM_CrawlerAttack19",
		"SM_CrawlerAttack20",
		"SM_CrawlerAttack21",
		"SM_CrawlerAttack22",
		"SM_CrawlerAttack23",
		"SM_CrawlerAttack24"
	};
	SM_CrawlerAttackArray[] =
	{
		"SM_CrawlerAttack1",
		"SM_CrawlerAttack2"
	};
	//Sounds end

	//DO NOT TOUCH ( NOT IMPLEMENTED )
	SM_InfectionIncrease = 0.25;
	SM_Infection = 0;
	SM_InfectionChanceHigh = 100;
	SM_InfectionChanceLow = 85;
	SM_InfectionDamage = 0.01;
	SM_InfectionDelay = 2;

	//Server
	SM_NotificationEnabled = 1; //Enable notification of killing zombies?
	SM_ZombieGutsLength = 300; //How long zombie guts last.
	SM_TownSearchTypes[] = //You're also able to put town names
	{
		"NameCityCapital",
		"NameLocal",
		"NameCity",
		"NameVillage"
	};
	SM_ZombieMaxDistanceTown = 100; // max distance to spawn zombies from a player in a town
	SM_ZombieMinDistanceTown = 25; // min distance to spawn zombies from a player in a town
	SM_ZombieSpawnMaxDistanceFromPositionTown = 10; // meters to spread out zombies from their spawn position in a town
	SM_SearchForTownRadius = 1000; // will search for a town near a player within 1000 meters.
	SM_MaxZombiesInTown = 15; // How many zombies a player have in a town.
	SM_ZombiesPerWaveTown = 7; // How many zombies to spawn on a player per wave in town.
	SM_HordeMarkerColor = "ColorRed"; // used for SM_HordeMarkerStyle.
	SM_HordeMarkerStyle = "hd_warning"; // if you have a marker you want to use, set SM_HordeMarkerType to 6.
	SM_HordeMarkerText = ""; //"!!! --- HORDE --- !!!"; // pretty obvious...
	SM_HordeMarkerCleanupEnabled = 1; // cleanup the horde marker
	SM_HordeMarkerType = 1; // 1-5 https://puu.sh/rUpoG/f0e0e59919.png
	SM_HordeNotificationText = "A zombie horde has spawned!";
	SM_DespawnZombieOrKill = 1; // 1 = kill
	SM_ZombieSide = "east"; // side to create the zombie
	SM_HordeNotificationEnabled = 1; // notification for hordes
	SM_HordeMarkerEnabled = 1; // markers for hordes
	SM_ZombiesPerWave = 5; // zombies to spawn on a player per wave
	SM_HordeSpawnMaxDistanceFromPosition = 35; // meters to spawn out horde zombies from their spawn position
	SM_ZombieSpawnMaxDistanceFromPosition = 15; // meters to spread out zombies from their spawn position
	SM_HordeMarkerCleanup = 120; // time it takes for the horde marker to cleanup
	SM_HordeSpawnDelay = 120; // in seconds how long it takes to do check to spawn hordes (check horde chance)
	SM_HordesEnabled = 1; // hordes enabled 1 = on
	SM_SpawnHordeChance = 2.5; // chance to spawn a horde
	SM_MaxZombiesInHorde = 69; // max zombies to spawn in a horde
	SM_MinZombiesInHorde = 10; // min zombies to spawn in a horde
	SM_ExplodingHeadEnabled = 1; // exploding heads
	SM_Zombie_GlowingFace = 0; // glowing zombie face
	SM_Zombie_SpawnInGround = 1; // when zombies spawn they spawn out of the ground
	SM_ZombieCleanupDeath = 150; // how long it takes for a zombie body to get cleand up
	SM_ZombieWaveCount = 5; // how many players to spawn zombies on per wave
	SM_ZombieItemCount = 5; // max amount of items to spawn on a zombie when it's killed
	SM_ZombieSpawnDelay = 60; // in seconds how long it takes to spawn more zombies
	SM_ZombieMaxDistance = 150; // max distance to spawn zombies from a player
	SM_ZombieMinDistance = 25; // min distance to spawn zombies from a player
	SM_ZombieCleanup = 60; // in seconds when the cleanup runs
	SM_ZombieCleanupDistance = 300; // cleanup zombies that are past this distance (from the controlling player)
	SM_MaxZombies = 200; // max zombies to have on map
	SM_ZombiesPerPlayer = 10; // max zombies a player can have
	SM_ZombieHealth = 0.7; // health a zombie can have ( 1 = dead )
	SM_GiveZombiePoptabs = 1; // enable giving zombies poptabs?
	SM_GiveCrpyto = 1; // enable giving player crpyto when killed a zombie //Epoch only
	SM_MaxCrypto = 50; // max amount of crpyto to give to killing player //Epoch only
	SM_MaxPoptabs = 50; // max amount of poptabs to give zombies
	SM_PoptabChanceHigh = 100; // not recommended to change
	SM_PopTabsChanceLow = 65; // 100 - 65 = 35% chance
	SM_GivePlayerRespect = 1; // enable giving players respect when they kill a zombie
	SM_MaxRespect = 50; // max amount of respect to give a player when they kill a zombie
	SM_MaxChanceOfLoot = 100; // not recommended to change
	SM_MinChanceOfLoot = 85; // 100 - 85 = 15% chance of a zombie having loot
	SM_MaxItemDrop = 3; // maximum amount of loot to have on a zombie // disabled for anything but exile (until i am not lazy.)
	SM_ShuffleArrayDelay = 300; // Time to randomize loot, and zombie spawn classes.
	SM_LootItems[] =
	{
		"hgun_P07_F",
		"hgun_ACPC2_F",
		"hgun_Rook40_F"
	};
	SM_LootItemsExile[] =
	{
		"Exile_Item_Magazine04",
		"Exile_Item_Magazine03",
		"Exile_Item_Magazine02",
		"Exile_Item_Magazine01",
		"Exile_Item_Moobar",
		"Exile_Item_Raisins",
		"Exile_Item_PowerDrink",
		"Exile_Item_SeedAstics",
		"Exile_Item_CockONut",
		"Exile_Item_Noodles",
		"Exile_Item_DsNuts",
		"Exile_Item_BBQSandwich",
		"Exile_Item_BeefParts",
		"Exile_Item_Dogfood",
		"Exile_Item_CatFood",
		"Exile_Item_MacasCheese",
		"Exile_Item_ChristmasTinner",
		"Exile_Item_SausageGravy",
		"Exile_Item_Surstromming",
		"Exile_Item_Cheathas",
		"Exile_Item_GloriousKnakworst",
		"Exile_Item_Matches",
		"Exile_Item_CanOpener",
		"Exile_Item_EMRE",
		"Exile_Item_CookingPot"
	};
	SM_LootItemsEpoch[] =
	{
		"hgun_P07_F",
		"hgun_ACPC2_F",
		"hgun_Rook40_F"
	};

	//I WILL ADD RUNNERS LATER!
	SM_ZombieClasses[] =
	{
		"SM_Zombz_walker1",
		"SM_Zombz_walker2",
		"SM_Zombz_walker3",
		"SM_Zombz_walker4",
		"SM_Zombz_walker5",
		"SM_Zombz_walker6",
		"SM_Zombz_walker7",
		"SM_Zombz_walker8",
		"SM_Zombz_walker9",
		"SM_Zombz_walker10",
		"SM_Zombz_walker11",
		"SM_Zombz_walker12",
		"SM_Zombz_walker13",
		"SM_Zombz_walker14",
		"SM_Zombz_walker15",
		"SM_Zombz_walker16",
		"SM_Zombz_walker17",
		"SM_Zombz_walker18",
		"SM_Zombz_walker19",
		"SM_Zombz_walker20",
		"SM_Zombz_walker21",
		"SM_Zombz_walker22",
		"SM_Zombz_walker23",
		"SM_Zombz_walker24",
		"SM_Zombz_walker25",
		"SM_Zombz_walker26",
		"SM_Zombz_walker27",
		"SM_Zombz_walker28",
		"SM_Zombz_walker29",
		"SM_Zombz_walker30",
		"SM_Zombz_walker31",
		"SM_Zombz_walker32",
		"SM_Zombz_walker33",
		"SM_Zombz_walker34",
		"SM_Zombz_walker35",
		"SM_Zombz_walker36",
		"SM_Zombz_walker37",
		"SM_Zombz_walker1",
		"SM_Zombz_walker2",
		"SM_Zombz_walker3",
		"SM_Zombz_walker4",
		"SM_Zombz_walker5",
		"SM_Zombz_walker6",
		"SM_Zombz_walker7",
		"SM_Zombz_walker8",
		"SM_Zombz_walker9",
		"SM_Zombz_walker10",
		"SM_Zombz_walker11",
		"SM_Zombz_walker12",
		"SM_Zombz_walker13",
		"SM_Zombz_walker14",
		"SM_Zombz_walker15",
		"SM_Zombz_walker16",
		"SM_Zombz_walker17",
		"SM_Zombz_walker18",
		"SM_Zombz_walker19",
		"SM_Zombz_walker20",
		"SM_Zombz_walker21",
		"SM_Zombz_walker22",
		"SM_Zombz_walker23",
		"SM_Zombz_walker24",
		"SM_Zombz_walker25",
		"SM_Zombz_walker26",
		"SM_Zombz_walker27",
		"SM_Zombz_walker28",
		"SM_Zombz_walker29",
		"SM_Zombz_walker30",
		"SM_Zombz_walker31",
		"SM_Zombz_walker32",
		"SM_Zombz_walker33",
		"SM_Zombz_walker34",
		"SM_Zombz_walker35",
		"SM_Zombz_walker36",
		"SM_Zombz_walker37",
		"SM_Zombz_Crawler1",
		"SM_Zombz_Crawler2",
		"SM_Zombz_Crawler3",
		"SM_Zombz_Crawler4",
		"SM_Zombz_Crawler5",
		"SM_Zombz_Crawler6",
		"SM_Zombz_Crawler7",
		"SM_Zombz_Crawler8",
		"SM_Zombz_Crawler9",
		"SM_Zombz_Crawler10",
		"SM_Zombz_Crawler11",
		"SM_Zombz_Crawler12",
		"SM_Zombz_Crawler13",
		"SM_Zombz_Crawler14",
		"SM_Zombz_Crawler15",
		"SM_Zombz_Crawler16",
		"SM_Zombz_Crawler17",
		"SM_Zombz_Crawler18",
		"SM_Zombz_Crawler19",
		"SM_Zombz_Crawler20",
		"SM_Zombz_Crawler21",
		"SM_Zombz_Crawler22",
		"SM_Zombz_Crawler23",
		"SM_Zombz_Crawler24",
		"SM_Zombz_Crawler25",
		"SM_Zombz_Crawler26",
		"SM_Zombz_Crawler27",
		"SM_Zombz_Crawler28",
		"SM_Zombz_Crawler29",
		"SM_Zombz_Crawler30",
		"SM_Zombz_Crawler31",
		"SM_Zombz_Crawler32",
		"SM_Zombz_Crawler33",
		"SM_Zombz_Crawler34",
		"SM_Zombz_Crawler35",
		"SM_Zombz_Crawler36",
		"SM_Zombz_Crawler37"
	};

	/*
		{
			{1250,219}, //1
			300, // 2
			14, 	// 3
			5, 	// 4 
			30, // 5
			5, 	// 6
			10 	// 7
		}

		1 - 2d position.
		2 - max distance from 2d position
		3 - max zombies per player
		4 - min distance to spawn zombies from player
		5 - max distance to spawn zombies from player
		6 - min distance to spawn zombies from spawn position
		7 - max distance to spawn zombies from spawn position
	*/
	SM_ZombieZonesEnabled = 0;
	SM_ZombieZones[] =
	{
		{{8611,18289},300,14,5,30,5,10}
	};


	/* THESE ARE FOR VANILLA ARMA 3, EXILE AND EPOCH SAFEZONES / BASES ARE AUTOMATICALLY DETECTED! */

	SM_UserBaseCheck = 0; // Custom base checking
	SM_UserBaseCheckDistance = 50; // meters to check for custom base objects / plotpile
	SM_UserBaseCheckType = 1; //1 = object // 2 = marker
	SM_UserBaseCheckMarkerObjects[] = //Objects or marker type to check for
	{
		"", // object or marker type
		"" // object or marker type
	};

	SM_UserSafezoneCheck = 0; // custom safezone checking
	SM_UserSafezoneCheckDistance = 50; // meters to check for objects / markers
	SM_UserSafezoneCheckType = 1; //1 = object // 2 = marker;
	SM_UserSafezoneCheckMarkerObjects[] = //Objects or marker type to check for
	{
		"", // object or marker type
		"" // object or marker type
	};
};