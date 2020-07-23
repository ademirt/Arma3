/*
	///////////////////////////////////////////////////////////////////////////////
	// Class Names
	///////////////////////////////////////////////////////////////////////////////

	Remember that item class names, group names and loot table names cannot 
	contain spaces. Also be 100% sure to have the exact same name as in Arma,
	as they are *case sensive*.

	///////////////////////////////////////////////////////////////////////////////
	// Item Groups
	///////////////////////////////////////////////////////////////////////////////

	You can link one group of items to loot tables.
	One item should only be in one group.

	Syntax:
	= <Group Name>
	<Spawn Chance Within Group>,<Item Class Name>

	///////////////////////////////////////////////////////////////////////////////
	// Propability
	///////////////////////////////////////////////////////////////////////////////

	<Spawn Chance>,<Item>

	10, Banana
	20, Tomato
	30, Cherry

	Sum of chances:
	10 + 20 + 30 = 60 = 100%

	Spawn chances:
	Banana	10 : 60 = 10 * 100 / 60 = 16.67%
	Tomato	20 : 60 = 20 * 100 / 60 = 33.33%
	Cherry	30 : 60 = 30 * 100 / 60 = 50%

	In words: 
	If Exile should spawn an item of the above group, it has a 33.33%
	chance to spawn a Banana.

	///////////////////////////////////////////////////////////////////////////////
	// Loot Tables
	///////////////////////////////////////////////////////////////////////////////

	Defines which item group spawns in which building type. The loot table itself
	is linked with a building in exile_server_config.pbo/config/CfgBuildings. Spawn
	chances work like for items.

	Syntax:
	> <Loot Table Name>
	<Spawn Chance Within Loot Table>,<Group Name>
*/



/*
	Loot Tables
*/

///////////////////////////////////////////////////////////////////////////////
// Slums/Ghetto, Farms, Village Houses, Castle etc.
// Spawn Guerilla things :)
///////////////////////////////////////////////////////////////////////////////
> CivillianLowerClass
30, Trash
28, Food
10, Drinks
5, Pistols
6, PistolAmmo
9, Shotguns
2, SMGAttachments
19, CivilianClothing
11, CivilianBackpacks
5, ShotgunAmmo
6, CivilianVests
20, CivilianHeadgear
25, CivilianItems
1, Restraints
28, Chemlights
12, RoadFlares

///////////////////////////////////////////////////////////////////////////////
// Apartments, Offices etc.
///////////////////////////////////////////////////////////////////////////////
> CivillianUpperClass
30, Trash
28, Food
10, Drinks
19, IndustrialItems
4, Pistols
4, PistolAmmo
19, CivilianClothing
12, CivilianBackpacks
9, CivilianVests
20, CivilianHeadgear
16, CivilianItems
45, Chemlights
10, RoadFlares
2, Restraints
2, TrykGlasses
9, Shotguns
5, ShotgunAmmo
4, RifleComun
3, RifleComunAmmo

///////////////////////////////////////////////////////////////////////////////
// Kiosks, Supermarkets etc.
///////////////////////////////////////////////////////////////////////////////
> Shop
30, Trash
25, Food
25, Drinks
7, RifleComun
7, RifleComunAmmo
2, Pistols
4, PistolAmmo
5, CivilianBackpacks
12, CivilianClothing
15, CivilianHeadgear
12, CivilianVests
25, CivilianItems
9, Shotguns
5, ShotgunAmmo
30, Chemlights
5, RoadFlares
2, SmokeGrenades
7, IndustrialItems
3, Restraints
2, MedicalItems
2, TrykGlasses

///////////////////////////////////////////////////////////////////////////////
// Construction Sites, Warehouses, Research etc.
///////////////////////////////////////////////////////////////////////////////
> Industrial
30, Trash
40, IndustrialItems
25, Vehicle
15, RoadFlares
5, Restraints
8, Unused

> Rural
30, Trash
5, Restraints
8, Unused
40, IndustrialItems
5, RifleComun
2, RifleComunAmmo
2, SniperComun
2, SniperComunAmmo

> VehicleWreck
15, IndustrialItems
10, Electronics
35, Trash
2, MilitaryAmmo
12, CivilianItems
15, Chemlights
4, RifleComunAmmo
2, RifleComun


///////////////////////////////////////////////////////////////////////////////
// Factories
///////////////////////////////////////////////////////////////////////////////
> Factories
10, Electronics
40, Trash
50, IndustrialItems
15, RoadFlares
8, Unused

///////////////////////////////////////////////////////////////////////////////
// Fuel Stations, Garages, Workshops etc.
///////////////////////////////////////////////////////////////////////////////
> VehicleService
30, Trash
25, IndustrialItems
40, Vehicle
15, RoadFlares
5, Restraints
6, Unused

///////////////////////////////////////////////////////////////////////////////
// Towers, Barracks, Hangars etc.
///////////////////////////////////////////////////////////////////////////////
> Military
10, TrykGlasses
9, TrykUniform
9, TrykHeadgear
2, TrykVests
7, TrykBacks
4, AntiVirus
15, Trash
8, CivilianItems
1, HEGrenades
12, UGLFlares
3, UGLSmokes
11, SmokeGrenades
2, Restraints
7, MedicalItems
7, GuerillaClothing
7, MilitaryClothing
3, GuerillaBackpacks
3, MilitaryBackpacks
7, GuerillaVests
7, MilitaryVests
1, DLCVests
8, GuerillaHeadgear
8, MilitaryHeadgear
2, DLCGhillies
2, Rebreathers
6, PistolAttachments
20, Rifles
12, RifleAmmo
12, RifleAttachments
3, LMG
3, LMGAmmo
3, Snipers
9, SniperAmmo
2, SniperAttachments
2, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
2, Bipods
2, MilitaryAttach
2, MilitaryWeapon
2, MilitaryAmmo

> M_militar
5, PistolRaro
2, PistolRaroAmmo
2, MilitaryWeapon
2, MilitaryAmmo
30, Trash
28, Food
10, Drinks
10, Pistols
8, PistolAmmo
3, PistolAttachments
2, Rifles
2, RifleAmmo
2, SMG
2, SMGAmmo
2, SMGAttachments
10, CivilianClothing
8, CivilianBackpacks
3, CivilianVests
10, CivilianHeadgear
10, CivilianItems
1, Restraints
29, Chemlights
4, RoadFlares
2, TrykGlasses
5, TrykUniform
2, TrykHeadgear
2, TrykVests
2, TrykBacks

> MilMedic
25, MedicalItems
4, AntiVirus
28, Chemlights
12, TrykGlasses
2, TrykUniform
2, TrykHeadgear
2, TrykVests
2, TrykBacks
40, Trash
9, CivilianItems
3, UGLFlares
3, UGLSmokes
3, SmokeGrenades
2, Restraints
10, GuerillaClothing
2, MilitaryClothing
3, GuerillaBackpacks
3, MilitaryBackpacks
8, GuerillaVests
2, MilitaryVests
2, DLCVests
8, GuerillaHeadgear
2, MilitaryHeadgear
7, Rebreathers
2, Rifles
2, RifleAttachments
2, Bipods

///////////////////////////////////////////////////////////////////////////////
// Hospital, Medevac etc. (Does not spawn on Altis!)
///////////////////////////////////////////////////////////////////////////////
> Medical
35, Trash
71, MedicalItems
10, AntiVirus

///////////////////////////////////////////////////////////////////////////////
// Light Houses + Life Guard Towers + Castles
///////////////////////////////////////////////////////////////////////////////
> Tourist
35, Trash
12, Drinks
13, Food
13, Shotguns
13, ShotgunAmmo
10, IndustrialItems
35, CivilianItems
4, Restraints
3, MedicalItems
12, CivilianHeadgear
28, Chemlights

> CrashSite
2, MilitaryAttach
3, MilitaryWeapon
3, MilitaryAmmo
12, AntiVirus
9, TrykGlasses
11, TrykUniform
9, TrykHeadgear
2, TrykVests
2, RaroLoot
9, TrykBacks
19, Trash
15, CivilianItems
1, HEGrenades
12, UGLFlares
3, UGLSmokes
11, SmokeGrenades
2, Restraints
18, MedicalItems
15, GuerillaClothing
15, MilitaryClothing
12, GuerillaBackpacks
12, MilitaryBackpacks
13, GuerillaVests
14, MilitaryVests
19, Chemlights
5, DLCVests
13, GuerillaHeadgear
13, MilitaryHeadgear
2, DLCGhillies
2, Rebreathers
10, Rifles
10, RifleAmmo
12, RifleAttachments
23, LMG
12, LMGAmmo
10, Snipers
8, SniperAmmo
7, SniperAttachments
2, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
15, Bipods

> Radiation
2, MilitaryAttach
2, MilitaryWeapon
2, MilitaryAmmo
2, RaroLoot
4, AntiVirus
15, Trash
8, CivilianItems
1, HEGrenades
12, UGLFlares
3, UGLSmokes
11, SmokeGrenades
2, Restraints
7, MedicalItems
15, GuerillaClothing
15, MilitaryClothing
13, GuerillaBackpacks
13, MilitaryBackpacks
13, GuerillaVests
13, MilitaryVests
9, DLCVests
13, GuerillaHeadgear
13, MilitaryHeadgear
2, DLCGhillies
2, Rebreathers
6, PistolAttachments
28, Rifles
10, RifleAmmo
12, RifleAttachments
5, LMG
4, LMGAmmo
3, Snipers
9, SniperAmmo
2, SniperAttachments
3, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
2, Bipods