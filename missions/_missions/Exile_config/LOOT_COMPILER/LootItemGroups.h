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
	> <Group Name>
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
	chance to spawn a Tomato.
*/
	
/*
	Item Groups
*/

///////////////////////////////////////////////////////////////////////////////
// Food & Drinks
///////////////////////////////////////////////////////////////////////////////

> Food
3, Exile_Item_CookingPot
12, Exile_Item_CanOpener
5, Exile_Item_Matches
8, Exile_Item_GloriousKnakworst			// 60% Hunger
8, Exile_Item_Surstromming				// 55% Hunger
8, Exile_Item_SausageGravy				// 50% Hunger
8, Exile_Item_ChristmasTinner			// 40% Hunger
8, Exile_Item_MacasCheese
7, Exile_Item_BBQSandwich				// 40% Hunger
7, Exile_Item_CatFood					// 40% Hunger
7, Exile_Item_Dogfood					// 30% Hunger
9, Exile_Item_BeefParts					// 30% Hunger
9, Exile_Item_Cheathas					// 30% Hunger
12, Exile_Item_DsNuts					// 30% Hunger
11, Exile_Item_Noodles					// 25% Hunger
7, Exile_Item_CockONut					// 20% Hunger
7, Exile_Item_SeedAstics				// 20% Hunger
9, Exile_Item_Raisins					// 15% Hunger
11, Exile_Item_Moobar					// 10% Hunger
11, Exile_Item_InstantCoffee			//  5% Hunger

> Drinks
7, Exile_Item_PowerDrink					// +95% Thirst
13, Exile_Item_PlasticBottleFreshWater		// +80% Thirst
14, Exile_Item_Beer							// +75% Thirst
9, Exile_Item_EnergyDrink					// +75% Thirst
19, Exile_Item_MountainDupe					// +50% Thirst, spawns always twice!	
25, Exile_Item_ChocolateMilk
30, Exile_Item_PlasticBottleDirtyWater		// +10% Thirst

///////////////////////////////////////////////////////////////////////////////
// Weapons & Attachments
///////////////////////////////////////////////////////////////////////////////

> Pistols
5, hgun_ACPC2_F			// ACP-C2 .45
5, hgun_P07_F				// P07 9 mm
5, hgun_Rook40_F			// Rook-40 9 mm
5, hgun_Pistol_heavy_01_F	// 4-five .45
10, hgun_Pistol_heavy_02_F	// Zubr .45
19, hgun_Pistol_Signal_F	// Starter Pistol
7, Exile_Weapon_Colt1911   // Colt 1911
40, Exile_Weapon_Makarov	// Makarov
10, Exile_Weapon_Taurus		// Taurus
7, Exile_Weapon_TaurusGold	// Taurus (Gold)
25, hgun_Pistol_01_F		// PM 9 mm
6, hgun_P07_khk_F			// P07 9 mm (Khaki)

> PistolAmmo
20, 11Rnd_45ACP_Mag			// 4-five
10, 16Rnd_9x21_Mag			// PDW2000, P07, ROOK-40
20, 30Rnd_9x21_Mag			// Sting, PDW2000, P07, ROOK-40
16, 6Rnd_45ACP_Cylinder		// Zubr
5, 6Rnd_GreenSignal_F		// Starter Pistol
7, 6Rnd_RedSignal_F			// Starter Pistol 
15, 9Rnd_45ACP_Mag			// ACP-C2
15, Exile_Magazine_7Rnd_45ACP	// Colt 1911
15, Exile_Magazine_8Rnd_9x18	// Makarov
15, Exile_Magazine_6Rnd_45ACP	// Taurus
15, 10Rnd_9x21_Mag				// PM 9 mm

> PistolAttachments
5, optic_Yorris		// No one needs this crap
5, optic_MRD

> PistolRaro
10, Makarov

> PistolRaroAmmo
10, 8Rnd_9x18_MakarovSD


> Shotguns
25, Exile_Weapon_M1014	//M1014

> ShotgunAmmo
20, Exile_Magazine_8Rnd_74Slug		//M1014

> SMG
2, SMG_01_F		// Vermin SMG .45 ACP
2, SMG_02_F		// Sting 9 mm
2, hgun_PDW2000_F	// PDW2000 9 mm

> SMGAmmo
5, 30Rnd_45ACP_Mag_SMG_01					// Vermin SMG
5, 30Rnd_45ACP_Mag_SMG_01_Tracer_Green		// Vermin SMG

> SMGAttachments
5, optic_Holosight_smg
3, optic_Holosight_smg_blk_F
3, optic_ACO_grn_smg
2, optic_Aco_smg
2, optic_ACO_grn
2, optic_Aco

> RifleComun
8, Exile_Weapon_LeeEnfield
5, hlc_rifle_M1903A1
4, hlc_rifle_M1903A1OMR

> RifleComunAmmo
8, Exile_Magazine_10Rnd_303					// Lee-Enfield
6, hlc_5rnd_3006_1903

> Rifles
/* 9, arifle_Katiba_F			// Katiba 6.5 mm
5, arifle_Katiba_GL_F		// Katiba GL 6.5 mm
8, arifle_MXC_F				// MXC 6.5 mm
8, arifle_MX_F				// MX 6.5 mm
2, arifle_MX_GL_F			// MX 3GL 6.5 mm
8, arifle_MXM_F				// MXM 6.5 mm
8, arifle_MXM_Black_F		// MXM 6.5 mm (Black)
8, arifle_SDAR_F			// SDAR 5.56 mm
8, arifle_TRG21_F			// TRG-21 5.56 mm
8, arifle_TRG20_F			// TRG-20 5.56 mm
6, arifle_TRG21_GL_F		// TRG-21 EGLM 5.56 mm
7, arifle_Mk20_F			// Mk20 5.56 mm
7, arifle_Mk20C_F			// Mk20C 5.56 mm
6, arifle_Mk20_GL_F			// Mk20 EGLM 5.56 mm
7, arifle_MXC_Black_F		// MXC 6.5 mm (Black)
7, arifle_MX_Black_F		// MX 6.5 mm (Black)
7, arifle_MX_GL_Black_F		// MX 3GL 6.5 mm (Black) */
8, Exile_Weapon_AK107	
8, Exile_Weapon_AK107_GL	
8, Exile_Weapon_AK74_GL
8, Exile_Weapon_AK74
8, Exile_Weapon_AK47		
6, Exile_Weapon_AKM		
6, Exile_Weapon_AKS		
5, Exile_Weapon_AKS_Gold
4, Exile_Weapon_VSSVintorez
//8, arifle_MX_khk_F   			// MX 6.5 mm (Khaki)
//4, arifle_MX_GL_khk_F			// MX 3GL 6.5 mm (Khaki)
//8, arifle_MXC_khk_F  			// MXC 6.5 mm (Khaki)
//3, arifle_MXM_khk_F  			// MXM 6.5 mm (Khaki)
5, arifle_AK12_F          		// AK-12 7.62 mm
/*5, arifle_AK12_GL_F             // AK-12 GL 7.62 mm
5, arifle_AKM_F                 // AKM 7.62 mm
5, arifle_AKM_FL_F              // AKM 7.62 mm
5, arifle_AKS_F                 // AKS
5, arifle_ARX_blk_F             // Type 115 6.5 mm (Black)
5, arifle_ARX_ghex_F            // Type 115 6.5 mm (Green Hex)
5, arifle_ARX_hex_F             // Type 115 6.5 mm (Hex)
5, arifle_CTAR_blk_F            // CAR-95 5.8 mm (Black)
5, arifle_CTAR_hex_F			// CAR-95 5.8 mm (Hex)
5, arifle_CTAR_ghex_F			// CAR-95 5.8 mm (Green Hex)
5, arifle_CTAR_GL_blk_F         // CAR-95 GL 5.8 mm (Black)
5, arifle_CTARS_blk_F           // CAR-95-1 5.8mm (Black)
5, arifle_CTARS_ghex_F			// CAR-95-1 5.8mm (Green Hex)
5, arifle_CTARS_hex_F			// CAR-95-1 5.8mm (Hex)
5, arifle_SPAR_01_blk_F         // SPAR-16 5.56 mm (Black)
5, arifle_SPAR_01_khk_F         // SPAR-16 5.56 mm (Khaki)
5, arifle_SPAR_01_snd_F         // SPAR-16 5.56 mm (Sand)
5, arifle_SPAR_01_GL_blk_F      // SPAR-16 GL 5.56 mm (Black)
5, arifle_SPAR_01_GL_khk_F      // SPAR-16 GL 5.56 mm (Khaki)
5, arifle_SPAR_01_GL_snd_F      // SPAR-16 GL 5.56 mm (Sand)
5, arifle_SPAR_02_blk_F         // SPAR-16S 5.56 mm (Black)
5, arifle_SPAR_02_khk_F         // SPAR-16S 5.56 mm (Khaki)
5, arifle_SPAR_02_snd_F         // SPAR-16S 5.56 mm (Sand)
5, arifle_SPAR_03_blk_F         // SPAR-17 7.62 mm (Black)
5, arifle_SPAR_03_khk_F         // SPAR-17 7.62 mm (Khaki)
5, arifle_SPAR_03_snd_F         // SPAR-17 7.62 mm (Sand) */
//NiArms AK Rifles
10, hlc_rifle_ak74
8, hlc_rifle_ak74_MTK
8, hlc_rifle_ak74_dirty
8, hlc_rifle_ak74_dirty2
8, hlc_rifle_aks74
8, hlc_rifle_aks74_MTK
8, hlc_rifle_aks74u
8, hlc_rifle_aks74u_MTK
8, hlc_rifle_ak47
8, hlc_rifle_akm
8, hlc_rifle_akm_MTK
8, hlc_rifle_rpk
8, hlc_rifle_ak12
8, hlc_rifle_aku12
8, hlc_rifle_rpk12
8, hlc_rifle_rpk74n
8, hlc_rifle_ak12gl
8, hlc_rifle_akmgl
8, hlc_rifle_aks74_GL
8, hlc_rifle_saiga12k
8, hlc_rifle_aek971
8, hlc_rifle_aek971_mtk
8, hlc_rifle_RK62
8, hlc_rifle_slr107u
8, hlc_rifle_slr107u_MTK
8, hlc_rifle_ak74m
8, hlc_rifle_ak74m_gl
8, hlc_rifle_ak74m_MTK

> RifleAmmo
9, 20Rnd_556x45_UW_mag						// SDAR
9, 30Rnd_556x45_Stanag						// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR
6, 30Rnd_556x45_Stanag_green				// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
6, 30Rnd_556x45_Stanag_red	
6, 30Rnd_556x45_Stanag_Tracer_Green			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR
6, 30Rnd_556x45_Stanag_Tracer_Red			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR
8, 30Rnd_556x45_Stanag_Tracer_Yellow		// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR
/* 15, 30Rnd_65x39_caseless_green				// Katiba
9, 30Rnd_65x39_caseless_green_mag_Tracer	// Katiba
9, 30Rnd_65x39_caseless_mag					// MX/C/M/SW/3GL
4, 30Rnd_65x39_caseless_mag_Tracer			// MX/C/M/SW/3GL */
8, Exile_Magazine_30Rnd_762x39_AK			// AK
8, Exile_Magazine_30Rnd_545x39_AK			// AK
5, Exile_Magazine_30Rnd_545x39_AK_Green		// AK
6, Exile_Magazine_30Rnd_545x39_AK_Red		// AK
5, Exile_Magazine_30Rnd_545x39_AK_White		// AK
6, Exile_Magazine_30Rnd_545x39_AK_Yellow	// AK
8, Exile_Magazine_20Rnd_762x51_DMR			// DMR
3, Exile_Magazine_20Rnd_762x51_DMR_Yellow	// DMR
3, Exile_Magazine_20Rnd_762x51_DMR_Red		// DMR
3, Exile_Magazine_20Rnd_762x51_DMR_Green	// DMR
3, Exile_Magazine_20Rnd_762x51_DMR_White	// DMR
5, Exile_Magazine_10Rnd_762x54				// SVD
5, Exile_Magazine_10Rnd_9x39				// VSS
5, Exile_Magazine_20Rnd_9x39				// VSS
9, 30Rnd_762x39_Mag_F						// AK-12, AKM
3, 30Rnd_762x39_Mag_Green_F                 // AK-12, AKM
3, 30Rnd_762x39_Mag_Tracer_F                // AK-12, AKM
3, 30Rnd_762x39_Mag_Tracer_Green_F          // AK-12, AKM
9, 30Rnd_762x39_AK47_M						// AKS
9, 30Rnd_545x39_Mag_F						// AKS
3, 30Rnd_545x39_Mag_Green_F					// AKS
3, 30Rnd_545x39_Mag_Tracer_F				// AKS
3, 30Rnd_545x39_Mag_Tracer_Green_F			// AKS
3, 10Rnd_50BW_Mag_F							// Type 115
3, 30Rnd_580x42_Mag_F						// CAR-95
3, 30Rnd_580x42_Mag_Tracer_F				// CAR-95
3, 100Rnd_580x42_Mag_F						// CAR-95-1
3, 100Rnd_580x42_Mag_Tracer_F				// CAR-95-1
3, 150Rnd_556x45_Drum_Mag_F					// SPAR-16S 
3, 150Rnd_556x45_Drum_Mag_Tracer_F			// SPAR-16S 
3, 20Rnd_762x51_Mag							// SPAR-17
//NiArms AK Ammo
9, hlc_30Rnd_545x39_B_AK
9, hlc_30Rnd_545x39_T_AK
9, hlc_30Rnd_545x39_EP_AK
6, hlc_45Rnd_545x39_t_rpk
6, hlc_60Rnd_545x39_t_rpk
6, hlc_30Rnd_762x39_b_ak
6, hlc_30Rnd_762x39_t_ak
6, hlc_45Rnd_762x39_t_rpk
6, hlc_45Rnd_762x39_m_rpk
6, hlc_75rnd_762x39_m_rpk
6, hlc_10rnd_12g_buck_S12
9, hlc_10rnd_12g_slug_S12
20, hlc_VOG25_AK
6, hlc_GRD_White
6, hlc_GRD_red
6, hlc_GRD_green
6, hlc_GRD_blue
6, hlc_GRD_orange
6, hlc_GRD_purple

> RifleAttachments
//NIArms M14 Attatchments
5, hlc_optic_artel_m14
5, hlc_optic_LRT_m14
//NIArms FAL Attatchments
5, hlc_optic_suit
5, optic_Arco
3, optic_Hamr
22, optic_Holosight
95, acc_flashlight
4, acc_pointer_IR
10, lerca_60_black 
5, lerca_60_tan 
4, Leupold_Mk4

//NIArms AR15 Attatchments


> LMG
/* 7, arifle_MX_SW_Black_F	// MX SW 6.5 mm (Black)
7, arifle_MX_SW_F			// MX SW 6.5 mm
2, LMG_Mk200_F				// Mk200 6.5 mm
2, LMG_Zafir_F				// Zafir 7.62 mm */
2, Exile_Weapon_RPK
2, Exile_Weapon_PK
2, Exile_Weapon_PKP
//2, LMG_03_F				//= LIM-85 5.56 mm

> LMGAmmo
/* 12, 100Rnd_65x39_caseless_mag			// MX SW
10, 100Rnd_65x39_caseless_mag_Tracer	// MX SW
12, 150Rnd_762x54_Box					// Zafir
10, 150Rnd_762x54_Box_Tracer			// Zafir
5, 130Rnd_338_Mag
51, 150Rnd_93x64_Mag */
10, Exile_Magazine_45Rnd_545x39_RPK_Green
10, Exile_Magazine_75Rnd_545x39_RPK_Green
10, Exile_Magazine_100Rnd_762x54_PK_Green
//10, 200Rnd_65x39_Belt					// Mk200
//10, 200Rnd_65x39_Belt_Tracer_Green	// Mk200
//10, 200Rnd_65x39_Belt_Tracer_Red		// Mk200
//10, 200Rnd_65x39_Belt_Tracer_Yellow	// Mk200
/* 8, 200Rnd_556x45_Box_F				// LIM-85 	
8, 200Rnd_556x45_Box_Red_F         // LIM-85	
8, 200Rnd_556x45_Box_Tracer_F      // LIM-85	
8, 200Rnd_556x45_Box_Tracer_Red_F  // LIM-85 */

> SniperComun
4, Exile_Weapon_CZ550
2, srifle_CZ550_base
2, hlc_rifle_M1903A1_unertl

> SniperComunAmmo
6, Exile_Magazine_5Rnd_22LR					// CZ550
5, 5x_22_LR_17_HMR_M
2, hlc_5rnd_3006_1903

> Snipers
//NIArms M14 Rifles
8, hlc_rifle_M14
7, hlc_rifle_M21
7, hlc_rifle_M14DMR
7, hlc_rifle_m14sopmod
//NIArms AWM Rifles
4, hlc_rifle_awcovert
2, hlc_rifle_awcovert_BL
2, hlc_rifle_awcovert_FDE
4, hlc_rifle_awmagnum
3, hlc_rifle_awmagnum_BL
3, hlc_rifle_awmagnum_FDE
4, hlc_rifle_awMagnum_FDE_ghillie
3, hlc_rifle_awMagnum_BL_ghillie
3, hlc_rifle_awMagnum_OD_ghillie
// 2, srifle_DMR_01_F			// Rahim 7.62 mm
//2, srifle_EBR_Hamr_pointer_F
//2, srifle_EBR_F			// Mk18 ABR 7.62 mm
2, srifle_GM6_F			// GM6 Lynx 12.7 mm
2, srifle_LRR_F			// M320 LRR .408.
6, Exile_Weapon_DMR
8, Exile_Weapon_SVD
8, Exile_Weapon_SVDCamo
2, srifle_LRR_tna_F    	// M320 LRR .408 (Tropic)
//2, srifle_GM6_ghex_F   	// GM6 Lynx 12.7 mm (Green Hex)
2, srifle_DMR_07_blk_F     // CMR-76 6.5 mm (Black)
//2, srifle_DMR_07_hex_F     // CMR-76 6.5 mm (Hex)
//2, srifle_DMR_07_ghex_F    // CMR-76 6.5 mm (Green Hex)

> SniperAmmo
//NiArms M14 Ammo
9, hlc_20Rnd_762x51_B_M14
10, hlc_20rnd_762x51_T_M14
12, hlc_50rnd_762x51_M_M14
//NIArms AWM Ammo
6, hlc_5rnd_300WM_FMJ_AWM
6, hlc_5rnd_300WM_AP_AWM
6, hlc_5rnd_300WM_BTSP_AWM
6, hlc_5rnd_300WM_mk248_AWM
6, hlc_5rnd_300WM_SBT_AWM
10, 5Rnd_127x108_Mag		// GM6 Lynx
10, 7Rnd_408_Mag			// M320 LRR
11, 10Rnd_762x54_Mag		// Rahim
11, 20Rnd_762x51_Mag		// Mk18 ABR
10, 5Rnd_127x108_APDS_Mag	// GM6 Lynx 
11, 20Rnd_650x39_Cased_Mag_F	// CMR-76
2, Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag 			// GM6 Lynx 12.7 mm
2, Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag 	// Cyrus 9.3mm	
2, Exile_Magazine_7Rnd_408_Bullet_Cam_Mag 				// M320 LRR .408	
2, Exile_Magazine_10Rnd_338_Bullet_Cam_Mag

> SniperAttachments
5, optic_DMS
5, optic_SOS
5, optic_SOS_khk_F
5, optic_LRPS
4, optic_LRPS_tna_F
5, optic_LRPS_ghex_F

> DLCRifles
// To overpowered. Do not use in vanilla Exile
//4, MMG_01_hex_F				//Navid
//4, MMG_01_tan_F				//Navid
//6, MMG_02_black_F				//SPMG
//6, MMG_02_camo_F				//SPMG
//6, MMG_02_sand_F				//SPMG
1, srifle_DMR_02_camo_F			//MAR10
1, srifle_DMR_02_F				//MAR10
1, srifle_DMR_02_sniper_F		//MAR10
1, srifle_DMR_03_F				//MK1EMR
1, srifle_DMR_03_khaki_F		//MK1EMR
1, srifle_DMR_03_tan_F			//MK1EMR
1, srifle_DMR_03_woodland_F		//MK1EMR
1, srifle_DMR_04_F				//ASP1KIR
1, srifle_DMR_04_Tan_F			//ASP1KIR
1, srifle_DMR_05_blk_F			//CYRUS
1, srifle_DMR_05_hex_F			//CYRUS
1, srifle_DMR_05_tan_F			//CYRUS
1, srifle_DMR_06_camo_F			//Mk14
1, srifle_DMR_06_olive_F		//Mk14

> DLCAmmo
//18, 150Rnd_93x64_Mag		//Navid
//25, 130Rnd_338_Mag			//SPMG
1, 10Rnd_338_Mag			//MAR10
1, 20Rnd_762x51_Mag		//MK1EMR
1, 10Rnd_127x54_Mag		//ASP1KIR
1, 10Rnd_93x64_DMR_05_Mag	//CYRUS

> DLCOptics
1, optic_AMS
1, optic_AMS_khk
1, optic_AMS_snd
1, optic_KHS_blk
1, optic_KHS_hex
1, optic_KHS_old
1, optic_KHS_tan

> DLCSupressor
2, muzzle_snds_338_black
2, muzzle_snds_338_green
1, muzzle_snds_338_sand
2, muzzle_snds_93mmg
1, muzzle_snds_93mmg_tan
2, muzzle_snds_B

> Bipods
17, bipod_03_F_oli
17, bipod_03_F_blk
17, bipod_02_F_tan
16, bipod_02_F_hex
17, bipod_02_F_blk
17, bipod_01_F_snd
16, bipod_01_F_mtp
17, bipod_01_F_blk
17, bipod_01_F_khk

> HEGrenades
2, 1Rnd_HE_Grenade_shell
2, 3Rnd_HE_Grenade_shell

> UGLFlares
8, 3Rnd_UGL_FlareGreen_F
8, 3Rnd_UGL_FlareRed_F
8, 3Rnd_UGL_FlareWhite_F
8, 3Rnd_UGL_FlareYellow_F
17, UGL_FlareGreen_F
17, UGL_FlareRed_F
17, UGL_FlareWhite_F
17, UGL_FlareYellow_F
// No Infrared for now
//UGL_FlareCIR_F
//3Rnd_UGL_FlareCIR_F

> UGLSmokes
10, 1Rnd_Smoke_Grenade_shell
10, 1Rnd_SmokeBlue_Grenade_shell
10, 1Rnd_SmokeGreen_Grenade_shell
10, 1Rnd_SmokeOrange_Grenade_shell
10, 1Rnd_SmokePurple_Grenade_shell
10, 1Rnd_SmokeRed_Grenade_shell
10, 1Rnd_SmokeYellow_Grenade_shell
4, 3Rnd_Smoke_Grenade_shell
4, 3Rnd_SmokeBlue_Grenade_shell
4, 3Rnd_SmokeGreen_Grenade_shell
4, 3Rnd_SmokeOrange_Grenade_shell
4, 3Rnd_SmokePurple_Grenade_shell
4, 3Rnd_SmokeRed_Grenade_shell
4, 3Rnd_SmokeYellow_Grenade_shell

///////////////////////////////////////////////////////////////////////////////
// Clothing & Gear
///////////////////////////////////////////////////////////////////////////////

//Civilian

> CivilianItems
35, ItemWatch
3, ItemRadio
2, Binocular
40, Exile_Item_Heatpack
19, ItemMap
6, Exile_Item_MobilePhone
6, Exile_Item_Knife
24, G_Bandanna_beast
25, G_Bandanna_blk
25, G_Bandanna_sport
20, G_Lowprofile
20, G_Aviator
19, G_Sport_Blackred
4, Exile_Headgear_GasMask

> CivilianClothing
6, U_I_G_resistanceLeader_F
7, U_C_Poor_1
7, U_C_Poor_2
7, U_C_HunterBody_grn
7, U_C_Journalist
8, U_Rangemaster
9, TRYK_U_B_Denim_T_BK
9, TRYK_U_B_Denim_T_WH
9, TRYK_U_B_RED_T_BR
9, TRYK_U_B_BLK_T_BK
9, TRYK_U_denim_jersey_blk
9, TRYK_U_denim_jersey_blu
9, TRYK_shirts_DENIM_BK
9, TRYK_shirts_DENIM_BL
9, TRYK_shirts_DENIM_od
9, TRYK_shirts_DENIM_R
9, TRYK_shirts_DENIM_WHB
9, TRYK_shirts_DENIM_od_Sleeve
9, TRYK_shirts_DENIM_ylb_Sleeve
9, TRYK_shirts_DENIM_BK_Sleeve
9, TRYK_shirts_DENIM_BL_Sleeve
9, TRYK_shirts_DENIM_BWH_Sleeve
9, TRYK_shirts_DENIM_R_Sleeve
9, TRYK_shirts_DENIM_RED2_Sleeve
9, TRYK_shirts_DENIM_WHB_Sleeve
9, TRYK_shirts_DENIM_WH_Sleeve
9, TRYK_shirts_PAD_BL
9, TRYK_shirts_BLK_PAD_BL
9, TRYK_shirts_PAD_BLW
9, TRYK_shirts_BLK_PAD_BLW
9, TRYK_shirts_OD_PAD_BLW
9, TRYK_shirts_TAN_PAD_BLW
9, TRYK_shirts_PAD_BLU3
9, TRYK_U_denim_hood_3c
9, TRYK_U_denim_hood_blk
9, TRYK_U_denim_hood_mc
9, TRYK_U_denim_hood_nc
9, TRYK_OVERALL_SAGE_BLKboots_nk_blk
9, TRYK_OVERALL_SAGE_BLKboots_nk_blk2
9, TRYK_OVERALL_SAGE
9, TRYK_U_B_PCUGs_OD
9, TRYK_U_B_PCUGs_gry_R

> CivilianBackpacks
20, B_FieldPack_oli
20, B_FieldPack_blk
13, B_OutdoorPack_blk
12, B_OutdoorPack_tan
10, B_OutdoorPack_blu
5, B_HuntingBackpack
4, B_AssaultPack_khk
4, B_AssaultPack_dgtl
4, B_AssaultPack_rgr
4, B_AssaultPack_sgg
4, B_AssaultPack_blk
4, B_AssaultPack_cbr
4, B_AssaultPack_mcamo
3, B_Kitbag_mcamo
3, B_Kitbag_sgg
3, B_Kitbag_cbr
4, B_AssaultPack_tna_F

> CivilianVests
35, V_Rangemaster_belt
35, V_Press_F
35, V_TacVest_blk_POLICE
2, TRYK_V_Sheriff_BA_OD 
2, TRYK_V_Sheriff_BA_TL
2, TRYK_V_Sheriff_BA_TBL
2, TRYK_V_Sheriff_BA_TCL
2, TRYK_V_Sheriff_BA_TL2
2, TRYK_V_Sheriff_BA_TBL2
2, TRYK_V_Sheriff_BA_TCL2
2, TRYK_V_Sheriff_BA_T
2, TRYK_V_Sheriff_BA_TB
2, TRYK_V_Sheriff_BA_T2
2, TRYK_V_Sheriff_BA_TB2
2, TRYK_V_Sheriff_BA_T3
2, TRYK_V_Sheriff_BA_TB3
2, TRYK_V_Sheriff_BA_T4
2, TRYK_V_Sheriff_BA_TB4
2, TRYK_V_Sheriff_BA_T5
2, TRYK_V_Sheriff_BA_TB5
2, TRYK_V_Sheriff_BA_TBL3_BK
2, TRYK_V_Sheriff_BA_TBL3_OD
2, TRYK_V_Sheriff_BA_TBL3_TN 

> CivilianHeadgear
19, Exile_Headgear_SafetyHelmet
20, Exile_Cap_Exile
22, H_Watchcap_camo
22, TRYK_H_woolhat
20, TRYK_H_woolhat_br
20, TRYK_H_woolhat_cu
20, TRYK_H_woolhat_CW
10, H_Bandanna_surfer
15, H_Beret_blk_POLICE
22, H_Cap_blk
22, H_Cap_blk_Raven
15, H_Cap_blu
15, H_Cap_grn
2, H_Cap_headphones
15, H_Cap_oli
16, H_Cap_press
16, H_Cap_red
16, H_Cap_tan
16, H_Hat_blue
16, H_Hat_brown
16, H_Hat_checker
16, H_Hat_grey
16, H_Hat_tan
16, H_StrawHat
16, H_StrawHat_dark

> GuerillaClothing
16, U_IG_Guerilla1_1
16, U_IG_Guerilla2_1
16, U_IG_Guerilla2_2
16, U_IG_Guerilla2_3
15, U_IG_Guerilla3_1
15, U_IG_Guerilla3_2
13, U_BG_Guerilla1_1 
13, U_BG_Guerilla2_1 
13, U_BG_Guerilla2_2 
13, U_BG_Guerilla2_3 
13, U_BG_Guerilla3_1 
13, U_BG_Guerilla3_2 
13, U_OG_Guerilla1_1 
13, U_OG_Guerilla2_1 
13, U_OG_Guerilla2_2 
13, U_OG_Guerilla2_3 
13, U_OG_Guerilla3_1 
13, U_OG_Guerilla3_2 
7, U_IG_leader
8, G_Balaclava_oli
8, G_Balaclava_blk

> GuerillaBackpacks
14, B_FieldPack_blk
14, B_FieldPack_ocamo
14, B_FieldPack_oucamo
14, B_FieldPack_cbr
11, B_Bergen_sgg
11, B_Bergen_mcamo
11, B_Bergen_rgr
11, B_Bergen_blk
11, B_FieldPack_ghex_F 
3, B_ViperHarness_base_F         
3, B_ViperHarness_blk_F          
3, B_ViperHarness_ghex_F         
3, B_ViperHarness_hex_F          
3, B_ViperHarness_khk_F          
3, B_ViperHarness_oli_F          
3, B_ViperLightHarness_base_F    
3, B_ViperLightHarness_blk_F     
3, B_ViperLightHarness_ghex_F    
3, B_ViperLightHarness_hex_F     
3, B_ViperLightHarness_khk_F     
3, B_ViperLightHarness_oli_F

> GuerillaVests
7, V_BandollierB_khk
7, V_BandollierB_cbr
7, V_BandollierB_rgr
7, V_BandollierB_blk
7, V_BandollierB_oli
5, V_Chestrig_khk
5, V_Chestrig_rgr
5, V_Chestrig_blk
5, V_Chestrig_oli
7, V_HarnessO_brn
7, V_HarnessOGL_brn
7, V_HarnessO_gry
7, V_HarnessOGL_gry
7, V_HarnessOSpec_brn
7, V_HarnessOSpec_gry
4, V_I_G_resistanceLeader_F
4, TRYK_V_PlateCarrier_JSDF 
4, TRYK_V_ArmorVest_AOR1 
4, TRYK_V_ArmorVest_AOR2 
4, TRYK_V_ArmorVest_coyo 
4, TRYK_V_ArmorVest_Brown 
4, TRYK_V_ArmorVest_CBR 
4, TRYK_V_ArmorVest_khk 
4, TRYK_V_ArmorVest_rgr 
4, TRYK_V_ArmorVest_green 
4, TRYK_V_ArmorVest_tan 
4, TRYK_V_ArmorVest_Delta 
4, TRYK_V_ArmorVest_Ranger 
4, TRYK_V_ArmorVest_AOR1_2 
4, TRYK_V_ArmorVest_AOR2_2 
4, TRYK_V_ArmorVest_coyo2 
4, TRYK_V_ArmorVest_Brown2 
4, TRYK_V_ArmorVest_cbr2 
4, TRYK_V_ArmorVest_khk2 
4, TRYK_V_ArmorVest_rgr2 
5, TRYK_V_ArmorVest_green2 
5, TRYK_V_ArmorVest_tan2 
5, TRYK_V_ArmorVest_Delta2 
5, TRYK_V_ArmorVest_Ranger2 
5, TRYK_V_PlateCarrier_blk 
5, TRYK_V_PlateCarrier_oli 
5, TRYK_V_PlateCarrier_coyo 
4, TRYK_V_PlateCarrier_wood 
4, TRYK_V_PlateCarrier_ACU 
4, TRYK_V_TacVest_coyo
3, TRYK_V_harnes_blk_L 
3, TRYK_V_harnes_od_L 
3, TRYK_V_harnes_TAN_L 
3, TRYK_V_PlateCarrier_blk_L 
3, TRYK_V_PlateCarrier_wood_L 
3, TRYK_V_PlateCarrier_ACU_L 
3, TRYK_V_PlateCarrier_coyo_L 
3, TRYK_V_ChestRig_L 
3, TRYK_V_ChestRig 
3, TRYK_V_Bulletproof 
3, TRYK_V_Bulletproof_BLK 
3, TRYK_V_Bulletproof_BL 
3, TRYK_V_IOTV_BLK
3, TRYK_V_tacSVD_BK 
3, TRYK_V_tacSVD_OD
3, TRYK_V_tacv1M_BK 
3, TRYK_V_tacv1MLC_BK 
3, TRYK_V_tacv1 
3, TRYK_V_tacv1_CY 
3, TRYK_V_tacv1_BK 
3, TRYK_V_tacv1_P_BK 
3, TRYK_V_tacv1_SHERIFF_BK 
3, TRYK_V_tacv1_FBI_BK 
3, TRYK_V_tacv1LP_BK 
3, TRYK_V_tacv1LSRF_BK 
3, TRYK_V_tacv1LC_BK 
3, TRYK_V_tacv1LC_CY 
3, TRYK_V_tacv1LC_OD 
3, TRYK_V_tacv1LC_FBI_BK 
3, TRYK_V_tacv1LC_SRF_BK 
3, TRYK_V_tacv1LC_SRF_OD 
3, TRYK_V_tacv1LC_P_BK 
3, TRYK_V_PlateCarrier_POLICE 
3, TRYK_V_ArmorVest_HRT_B 
3, TRYK_V_ArmorVest_HRT_OD 
3, TRYK_V_ArmorVest_HRT2_B 
3, TRYK_V_ArmorVest_HRT2_OD
2, TRYK_V_tacv18_BK 
3, TRYK_V_tacv18_OD 
2, TRYK_V_tacv18_TN 
2, TRYK_V_tacv18LC_BK 
2, TRYK_V_tacv18LC_OD 
2, TRYK_V_tacv18LC_TN 
2, TRYK_V_tacv1L_BK 
2, TRYK_V_tacv1L_OD 
2, TRYK_V_tacv1L_CY 
2, TRYK_V_tacv1LC_FBI2_BK 
2, TRYK_V_tacv1LC_SRF2_BK 
2, TRYK_V_tacv1LC_SRF2_OD 
2, TRYK_V_tacv1LC_P2_BK 
2, TRYK_V_tacv1_MSL_BK
2, TRYK_V_tacv1LMSL_BK
2, TRYK_V_tacv1LC_MSL_BK 

> GuerillaHeadgear
2, Exile_Headgear_GasMask
4, H_Booniehat_khk
4, H_Booniehat_indp
4, H_Booniehat_mcamo
4, H_Booniehat_grn
4, H_Booniehat_tan
4, H_Booniehat_dirty
4, H_Booniehat_dgtl
4, H_Booniehat_khk_hs
3, H_Bandanna_khk
3, H_Bandanna_khk_hs
3, H_Bandanna_cbr
3, H_Bandanna_sgg
3, H_Bandanna_gry
3, H_Bandanna_camo
3, H_Bandanna_mcamo
3, H_BandMask_blk
1, H_Beret_blk
1, H_Beret_red
1, H_Beret_grn
1, H_Beret_grn_SF
1, H_Beret_brn_SF
1, H_Beret_ocamo
1, H_Beret_02
1, H_Beret_Colonel
3, H_Hat_camo
3, H_Cap_brn_SPECOPS
3, H_Cap_tan_specops_US
3, H_Cap_khaki_specops_UK
3, H_Watchcap_blk
3, H_Watchcap_khk
2, H_Watchcap_camo
2, H_Watchcap_sgg
2, H_TurbanO_blk
2, H_Shemag_khk
2, H_Shemag_tan
2, H_Shemag_olive
2, H_Shemag_olive_hs
3, H_ShemagOpen_khk
3, H_ShemagOpen_tan
2, TRYK_Shemagh_shade_MESH
2, TRYK_TAC_EARMUFF_SHADE 
2, TRYK_TAC_EARMUFF 
2, TRYK_NOMIC_TAC_EARMUFF 
2, TRYK_Kio_Balaclava
//2, TRYK_ESS_CAP 
//2, TRYK_ESS_CAP_OD 
//2, TRYK_ESS_CAP_tan 
2, TRYK_R_CAP_BLK 
2, TRYK_R_CAP_TAN 
2, TRYK_R_CAP_OD_US 
2, TRYK_r_cap_tan_Glasses 
2, TRYK_r_cap_blk_Glasses 
3, TRYK_r_cap_od_Glasses 
2, TRYK_H_headsetcap_Glasses 
2, TRYK_H_headsetcap_blk_Glasses 
3, TRYK_H_headsetcap_od_Glasses
7, TRYK_H_Helmet_JSDF 
7, TRYK_H_Helmet_CC 
7, TRYK_H_Helmet_WOOD 
7, TRYK_H_Helmet_ACU 
7, TRYK_H_Helmet_MARPAT_Wood 
7, TRYK_H_Helmet_MARPAT_Desert 
7, TRYK_H_Helmet_MARPAT_Desert2 
7, TRYK_H_Helmet_3C 
7, TRYK_H_Booniehat_JSDF 
7, TRYK_H_Booniehat_3CD 
7, TRYK_H_Booniehat_CC 
7, TRYK_H_Booniehat_WOOD 
7, TRYK_H_Booniehat_MARPAT_WOOD 
7, TRYK_H_Booniehat_MARPAT_Desert 
7, TRYK_H_Booniehat_AOR1 
7, TRYK_H_Booniehat_AOR2 

//Military
> MilitaryWeapon
//NIArms AR15 Rifles
3, hlc_rifle_Bushmaster300 
2, hlc_rifle_m4m203
2, hlc_rifle_samr2
6, hlc_rifle_bcmjack
6, hlc_rifle_vendimus
3, hlc_rifle_m4
//NIArms AUG Rifles
5, hlc_rifle_aug
5, hlc_rifle_auga1_t
5, hlc_rifle_auga1_B
5, hlc_rifle_auga1carb
5, hlc_rifle_auga1carb_t
5, hlc_rifle_auga1carb_b
5, hlc_rifle_aughbar
5, hlc_rifle_aughbar_b
5, hlc_rifle_aughbar_t
5, hlc_rifle_augpara
5, hlc_rifle_augpara_b
5, hlc_rifle_augpara_t
6, hlc_rifle_auga2
6, hlc_rifle_auga2_b
6, hlc_rifle_auga2_t
6, hlc_rifle_auga2carb
6, hlc_rifle_auga2carb_t
6, hlc_rifle_auga2carb_b
6, hlc_rifle_auga2lsw
6, hlc_rifle_auga2lsw_t
6, hlc_rifle_auga2lsw_b
6, hlc_rifle_auga2para
6, hlc_rifle_auga2para_b
6, hlc_rifle_auga2para_t
6, hlc_rifle_augsr
6, hlc_rifle_augsr_b
6, hlc_rifle_augsr_t
6, hlc_rifle_augsrcarb
6, hlc_rifle_augsrcarb_t
6, hlc_rifle_augsrcarb_b
6, hlc_rifle_augsrhbar
6, hlc_rifle_augsrhbar_b
6, hlc_rifle_augsrhbar_t
5, hlc_rifle_auga3
5, hlc_rifle_auga3_bl
5, hlc_rifle_auga3_b
5, hlc_rifle_auga3_GL
5, hlc_rifle_auga3_GL_BL 
5, hlc_rifle_auga3_GL_B
//NIArms FAL Rifles
4, hlc_rifle_l1a1slr
4, hlc_rifle_SLR
4, hlc_rifle_STG58F
4, hlc_rifle_FAL5061
4, hlc_rifle_c1A1
4, hlc_rifle_LAR
4, hlc_rifle_SLRchopmod
4, hlc_rifle_falosw
4, hlc_rifle_osw_GL
//NIArms G36 Rifles
4, hlc_rifle_G36A1
4, hlc_rifle_G36A1AG36
4, hlc_rifle_G36KA1
4, hlc_rifle_G36C
4, hlc_rifle_G36E1
4, hlc_rifle_G36E1AG36
4, hlc_rifle_G36KE1
4, hlc_rifle_G36V
4, hlc_rifle_G36KV
4, hlc_rifle_G36CV
4, hlc_rifle_G36VAG36
4, hlc_rifle_G36TAC
4, hlc_rifle_G36KTAC
4, hlc_rifle_G36CTAC
4, hlc_rifle_G36MLIC
4, hlc_rifle_G36KMLIC
4, hlc_rifle_G36CMLIC
4, hlc_rifle_G36MLIAG36
//NIArms M60 GPMGs
4, hlc_lmg_M60E4
4, hlc_lmg_m60

> MilitaryAttach
//NIArms G36 Attatchments
3, HLC_Optic_G36dualoptic35x
3, HLC_Optic_G36dualoptic35x2d
3, HLC_Optic_G36Export35x
3, HLC_Optic_G36Export35x2d
3, HLC_Optic_G36Dualoptic15x
3, HLC_Optic_G36Dualoptic15x2d
3, HLC_Optic_G36Export15x
3, HLC_Optic_G36Export15x2d

> MilitaryAmmo
2, hlc_30rnd_556x45_EPR
//NIArms AR15 Ammo
4, 29rnd_300BLK_STANAG
4, 29rnd_300BLK_STANAG_T
4, 29rnd_300BLK_STANAG_S
4, hlc_30rnd_556x45_SOST
4, hlc_30rnd_556x45_SPR
//NIArms FAL Ammo
4, hlc_20Rnd_762x51_B_fal
4, hlc_20Rnd_762x51_t_fal
4, hlc_20Rnd_762x51_S_fal
4, hlc_50rnd_762x51_M_FAL
//NIArms AUG Ammo
5, hlc_30Rnd_556x45_B_AUG
5, hlc_30Rnd_556x45_SOST_AUG
5, hlc_30Rnd_556x45_SPR_AUG
5, hlc_30Rnd_556x45_T_AUG
5, hlc_40Rnd_556x45_B_AUG
5, hlc_40Rnd_556x45_SOST_AUG
5, hlc_40Rnd_556x45_SPR_AUG
5, hlc_25Rnd_9x19mm_M882_AUG
5, hlc_25Rnd_9x19mm_JHP_AUG
5, hlc_25Rnd_9x19mm_subsonic_AUG
//NIArms M60 GPMG Ammo
3, hlc_100Rnd_762x51_B_M60E4
3, hlc_100Rnd_762x51_T_M60E4
3, hlc_100Rnd_762x51_M_M60E4
//NIArms G36 Ammo
3, hlc_30rnd_556x45_EPR_G36 
3, hlc_30rnd_556x45_SOST_G36
3, hlc_30rnd_556x45_SPR_G36
3, hlc_100rnd_556x45_EPR_G36

> MilitaryClothing
10, Exile_Uniform_Woodland
5, U_B_CTRG_1						// CTRG Combat Uniform (UBACS)
5, U_B_CTRG_2						// CTRG Combat Uniform (UBACS2)
5, U_B_CTRG_3						// CTRG Combat Uniform (Tee)
5, U_B_CombatUniform_mcam			// Combat Fatigues (MTP)
5, U_B_CombatUniform_mcam_tshirt	// Combat Fatigues (MTP) (Tee)
5, U_B_CombatUniform_mcam_vest		// Recon Fatigues (MTP)
5, U_B_CombatUniform_mcam_worn		// Worn Combat Fatigues (MTP)
3, U_B_SpecopsUniform_sgg			// Specop Fatigues (Sage)
2, U_O_OfficerUniform_ocamo			// Officer Fatigues (Hex)
2, U_I_OfficerUniform				// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform				// Combat Fatigues [AAF]
4, U_I_CombatUniform_tshirt			// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform_shortsleeve	// Combat Fatigues [AAF]
4, U_B_HeliPilotCoveralls			// Heli Pilot Coveralls
4, U_O_PilotCoveralls				// Pilot Coveralls [CSAT]
4, U_B_PilotCoveralls				// Pilot Coveralls [NATO]
4, U_I_pilotCoveralls				// Pilot Coveralls [AAF]
4, U_I_HeliPilotCoveralls			// Heli Pilot Coveralls
2, U_B_Wetsuit						// Wetsuit [NATO]
2, U_O_Wetsuit						// Wetsuit [CSAT]
2, U_I_Wetsuit						// Wetsuit [AAF]
12, U_O_CombatUniform_ocamo			// Heli Pilot Coveralls
12, U_O_CombatUniform_oucamo			// Fatigues (Urban) [CSAT]
22, U_O_SpecopsUniform_ocamo			// Recon Fatigues (Hex)
22, U_O_SpecopsUniform_blk			// Recon Fatigues (Black)
29, TRYK_U_B_OD_OD_CombatUniform 
29, TRYK_U_B_OD_OD_R_CombatUniform 
12, TRYK_U_B_TANTAN_CombatUniform 
10, TRYK_U_B_TANTAN_R_CombatUniform 
10, TRYK_U_B_BLKBLK_CombatUniform 
10, TRYK_U_B_BLKBLK_R_CombatUniform 
10, TRYK_U_B_GRYOCP_CombatUniform 
10, TRYK_U_B_GRYOCP_R_CombatUniformTshirt 
10, TRYK_U_B_TANOCP_CombatUniform 
10, TRYK_U_B_TANOCP_R_CombatUniformTshirt 
10, TRYK_U_B_BLKOCP_CombatUniform 
10, TRYK_U_B_BLKOCP_R_CombatUniformTshirt 
10, TRYK_U_B_BLKTAN_CombatUniform 
10, TRYK_U_B_BLKTANR_CombatUniformTshirt 
6, TRYK_U_B_ODTAN_CombatUniform 
6, TRYK_U_B_ODTANR_CombatUniformTshirt 
6, TRYK_U_B_GRTAN_CombatUniform 
6, TRYK_U_B_GRTANR_CombatUniformTshirt 
6, TRYK_U_B_wood_CombatUniform 
6, TRYK_U_B_woodR_CombatUniformTshirt 
6, TRYK_U_B_wood3c_CombatUniform 
7, TRYK_U_B_wood3c_CombatUniformTshirt 
7, TRYK_U_B_MARPAT_WOOD_CombatUniform 
6, TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt 
5, TRYK_U_B_WOOD_MARPAT_CombatUniform 
5, TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt 
5, TRYK_U_B_woodtan_CombatUniform 
5, TRYK_U_B_woodtanR_CombatUniformTshirt 
5, TRYK_U_B_JSDF_CombatUniform 
5, TRYK_U_B_JSDF_CombatUniformTshirt 
5, TRYK_U_B_3CD_Delta_BDU 
6, TRYK_U_B_3CD_Delta_BDUTshirt 
6, TRYK_U_B_3CD_Ranger_BDU 
6, TRYK_U_B_3CD_Ranger_BDUTshirt 
6, TRYK_U_B_3CD_BLK_BDUTshirt 
6, TRYK_U_B_3CD_BLK_BDUTshirt2 
6, TRYK_U_B_ACU 
6, TRYK_U_B_ACUTshirt 
6, TRYK_U_B_MARPAT_Wood 
6, TRYK_U_B_MARPAT_Wood_Tshirt 
6, TRYK_U_B_MARPAT_Desert 
6, TRYK_U_B_MARPAT_Desert_Tshirt 
6, TRYK_U_B_MARPAT_Desert2 
6, TRYK_U_B_MARPAT_Desert2_Tshirt 
6, TRYK_U_B_3c 
6, TRYK_U_B_3cr 
6, TRYK_U_B_Sage_Tshirt 
6, TRYK_U_B_BLK3CD 
6, TRYK_U_B_BLK3CD_Tshirt 
6, TRYK_U_B_BLK 
6, TRYK_U_B_BLK_Tshirt 
6, TRYK_U_B_BLKTAN 
6, TRYK_U_B_BLKTAN_Tshirt 
6, TRYK_U_B_ODTAN 
6, TRYK_U_B_ODTAN_Tshirt 
6, TRYK_U_B_BLK_OD 
6, TRYK_U_B_BLK_OD_Tshirt 
6, TRYK_U_B_C01_Tsirt 
6, TRYK_U_B_C02_Tsirt 
6, TRYK_U_B_OD_BLK 
6, TRYK_U_B_OD_BLK_2 
6, TRYK_U_B_BLK_TAN_1 
6, TRYK_U_B_BLK_TAN_2

> MilitaryBackpacks
3, B_Carryall_ocamo
3, B_Carryall_oucamo
3, B_Carryall_mcamo
3, B_Carryall_oli
3, B_Carryall_khk
3, B_Carryall_cbr

> MilitaryVests
9, Exile_Vest_Snow
3, Exile_Item_EMRE						// 75% Hunger
10, V_PlateCarrier1_blk
10, V_PlateCarrier1_rgr
10, V_PlateCarrier2_rgr
10, V_PlateCarrier3_rgr
10, V_PlateCarrierGL_rgr
10, V_PlateCarrierIA1_dgtl
10, V_PlateCarrierIA2_dgtl
5, V_PlateCarrierIAGL_dgtl
5, V_PlateCarrierSpec_rgr
5, V_PlateCarrierL_CTRG
5, V_PlateCarrierH_CTRG

> MilitaryHeadgear
8, Exile_Headgear_GasMask
9, H_MilCap_ocamo
9, H_MilCap_mcamo
9, H_MilCap_oucamo
9, H_MilCap_blue
4, H_MilCap_rucamo
4, H_MilCap_dgtl
3, H_HelmetB
3, H_HelmetB_paint
3, H_HelmetB_light
3, H_HelmetB_plain_blk
3, H_HelmetSpecB
3, H_HelmetSpecB_paint1
3, H_HelmetSpecB_paint2
3, H_HelmetSpecB_blk
3, H_HelmetIA
2, H_HelmetIA_net
2, H_HelmetIA_camo
2, H_HelmetB_grass
2, H_HelmetB_snakeskin
2, H_HelmetB_desert
2, H_HelmetB_black
2, H_HelmetB_sand
2, H_HelmetB_light_grass
2, H_HelmetB_light_snakeskin
2, H_HelmetB_light_desert
2, H_HelmetB_light_black
2, H_HelmetB_light_sand
1, H_HelmetCrew_B
1, H_HelmetCrew_O
1, H_HelmetCrew_I
1, H_PilotHelmetFighter_B
1, H_PilotHelmetFighter_O
1, H_PilotHelmetFighter_I
1, H_PilotHelmetHeli_B
1, H_PilotHelmetHeli_O
1, H_PilotHelmetHeli_I
1, H_HelmetB_camo
1, H_CrewHelmetHeli_B
1, H_CrewHelmetHeli_O
1, H_CrewHelmetHeli_I
2, H_BandMask_khk
2, H_BandMask_reaper
2, H_BandMask_demon
1, H_HelmetO_oucamo
1, H_HelmetLeaderO_oucamo
1, H_HelmetSpecO_ocamo
1, H_HelmetSpecO_blk
1, H_HelmetO_ocamo
1, H_HelmetLeaderO_ocamo
1, H_HelmetO_ghex_F 
2, H_Helmet_Skate    
2, H_HelmetB_Enh_tna_F        
2, H_HelmetB_Light_tna_F 	
2, H_Beret_gen_F  
2, H_HelmetB_tna_F   		 
2, H_HelmetSpecO_ghex_F       
2, H_HelmetLeaderO_ghex_F
2, H_HelmetCrew_O_ghex_F 
2, H_HelmetB_TI_tna_F 

> DLCVests
2, V_PlateCarrierGL_blk
2, V_PlateCarrierGL_mtp
2, V_PlateCarrierGL_rgr
2, V_PlateCarrierIAGL_dgtl
2, V_PlateCarrierIAGL_oli
2, V_PlateCarrierSpec_blk
2, V_PlateCarrierSpec_mtp
2, V_PlateCarrierSpec_rgr

> Rebreathers
1, V_RebreatherB
1, V_RebreatherIR
1, V_RebreatherIA

///////////////////////////////////////////////////////////////////////////////
// Other Items
///////////////////////////////////////////////////////////////////////////////

> MedicalItems
9, Exile_Item_InstaDoc
8, Exile_Item_Bandage
10, Exile_Item_Vishpirin
10, Exile_Item_Heatpack
3, RyanZombiesAntiVirusTemporary
3, RyanZombiesAntiVirusCure
2, Exile_Item_Defibrillator

> IndustrialItems
10, Exile_Item_SledgeHammer
3, Exile_Item_Cement
3, Exile_Item_ThermalScannerPro
10, Exile_Item_FloodLightKit
10, Exile_Item_PortableGeneratorKit
10, Exile_Item_MetalBoard
13, Exile_Item_ScrewDriver
10, Exile_Melee_Shovel
4, Exile_Item_Foolbox
8, Exile_Item_MetalScrews
4, Exile_Item_Sand
12, Exile_Item_JunkMetal
10, Exile_Item_WaterCanisterEmpty
8, Exile_Item_ExtensionCord
10, Exile_Item_Rope
9, Exile_Item_LightBulb
13, Exile_Item_Handsaw
13, Exile_Item_Pliers
22, Exile_Melee_Axe
9, Exile_Item_CamoTentKit
10, Exile_Item_Grinder

> Vehicle
4, Exile_Item_FuelCanisterFull
55, Exile_Item_FuelCanisterEmpty
11, Exile_Item_DuctTape

// Throwables

> Chemlights
34, Chemlight_blue
45, Chemlight_green
38, Chemlight_red
32, Chemlight_yellow

> RoadFlares
2, FlareGreen_F
2, FlareRed_F
2, FlareWhite_F
2, FlareYellow_F

> SmokeGrenades
1, SmokeShell
1, SmokeShellRed
2, SmokeShellGreen
1, SmokeShellYellow
3, SmokeShellPurple
1, SmokeShellBlue
1, SmokeShellOrange

> Restraints
4, Exile_Item_ZipTie

> Electronics
2, Exile_Item_Laptop
3, Exile_Item_BaseCameraKit

 // Trash or items not currently being used

> Trash
10, Exile_Item_Can_Empty
10, Exile_Item_ToiletPaper
10, Exile_Item_PlasticBottleEmpty			// Nothing :)
10, Exile_Item_Magazine01
10, Exile_Item_Magazine02
10, Exile_Item_Magazine03
10, Exile_Item_Magazine04

> Unused
3, Exile_Item_CordlessScrewdriver
3, Exile_Item_FireExtinguisher
10, Exile_Item_OilCanister
14, Exile_Item_Hammer
14, Exile_Item_Shovel
17, Exile_Item_Screws
3, Exile_Item_Cement
5, Exile_Item_Sand
5, Exile_Item_Carwheel
5, Exile_Item_SleepingMat
5, Exile_Item_Wrench
4, Exile_Item_Screwdriver

> TrykGlasses
3, TRYK_SPGEAR_Glasses
2, TRYK_headset_Glasses
4, TRYK_SpsetG_Glasses
4, TRYK_Spset_PHC1_Glasses
4, TRYK_Spset_PHC2_Glasses
3, TRYK_headset_glasses
3, TRYK_headset2_glasses

> TrykHeadgear  //HeadGear
8, TRYK_R_CAP_BLK
8, TRYK_R_CAP_TAN
8, TRYK_R_CAP_OD_US
8, TRYK_r_cap_tan_Glasses
8, TRYK_r_cap_blk_Glasses
8, TRYK_r_cap_od_Glasses
8, TRYK_H_headsetcap_Glasses
8, TRYK_H_headsetcap_blk_Glasses
8, TRYK_H_headsetcap_od_Glasses
8, TRYK_TAC_EARMUFF_SHADE
8, TRYK_TAC_EARMUFF
8, TRYK_NOMIC_TAC_EARMUFF
8, TRYK_headset2
8, TRYK_TAC_EARMUFF_Gs
8, TRYK_TAC_SET_bn
8, TRYK_NOMIC_TAC_EARMUFF_Gs
8, TRYK_TAC_EARMUFF_SHADE_Gs
8, TRYK_TAC_SET_TAN
8, TRYK_TAC_SET_OD
8, TRYK_TAC_SET_WH
8, TRYK_TAC_SET_MESH
8, TRYK_TAC_SET_TAN_2
8, TRYK_TAC_SET_OD_2
8, TRYK_TAC_SET_WH_2
8, TRYK_TAC_SET_MESH_2
8, TRYK_bandana_g
8, TRYK_H_PASGT_BLK
8, TRYK_H_PASGT_OD
8, TRYK_H_PASGT_COYO
8, TRYK_H_PASGT_TAN
8, TRYK_H_WH
8, TRYK_H_GR
8, TRYK_H_AOR8
8, TRYK_H_AOR2
8, TRYK_H_EARMUFF
8, TRYK_H_TACEARMUFF_H
8, TRYK_H_Bandana_H
8, TRYK_H_headset2
8, TRYK_H_headsetcap
8, TRYK_H_headsetcap_blk
8, TRYK_H_headsetcap_od
8, TRYK_H_pakol
8, TRYK_H_pakol2
8, TRYK_H_LHS_HEL_G

> TrykUniform //Uniforms
10, TRYK_HRP_UCP
10, TRYK_HRP_USMC
10, TRYK_HRP_khk
10, TRYK_U_B_OD_OD_CombatUniform
10, TRYK_U_B_OD_OD_R_CombatUniform
10, TRYK_U_B_TANTAN_CombatUniform
10, TRYK_U_B_TANTAN_R_CombatUniform
10, TRYK_U_B_BLKBLK_CombatUniform
10, TRYK_U_B_BLKBLK_R_CombatUniform
10, TRYK_U_B_GRYOCP_CombatUniform
10, TRYK_U_B_GRYOCP_R_CombatUniformTshirt
10, TRYK_U_B_TANOCP_CombatUniform
10, TRYK_U_B_TANOCP_R_CombatUniformTshirt
10, TRYK_U_B_BLKOCP_CombatUniform
10, TRYK_U_B_BLKOCP_R_CombatUniformTshirt
10, TRYK_U_B_BLKTAN_CombatUniform
10, TRYK_U_B_BLKTANR_CombatUniformTshirt
10, TRYK_U_B_ODTAN_CombatUniform
10, TRYK_U_B_ODTANR_CombatUniformTshirt
10, TRYK_U_B_GRTAN_CombatUniform
10, TRYK_U_B_GRTANR_CombatUniformTshirt
10, TRYK_U_B_wood_CombatUniform
10, TRYK_U_B_woodR_CombatUniformTshirt
10, TRYK_U_B_wood3c_CombatUniform
10, TRYK_U_B_wood3c_CombatUniformTshirt
10, TRYK_U_B_MARPAT_WOOD_CombatUniform
10, TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt
10, TRYK_U_B_WOOD_MARPAT_CombatUniform
10, TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt
10, TRYK_U_B_woodtan_CombatUniform
10, TRYK_U_B_woodtanR_CombatUniformTshirt
10, TRYK_U_B_JSDF_CombatUniform
10, TRYK_U_B_JSDF_CombatUniformTshirt
10, TRYK_U_B_3CD_Delta_BDU
10, TRYK_U_B_3CD_Delta_BDUTshirt
10, TRYK_U_B_3CD_Ranger_BDU
10, TRYK_U_B_3CD_Ranger_BDUTshirt
10, TRYK_U_B_3CD_BLK_BDUTshirt
10, TRYK_U_B_3CD_BLK_BDUTshirt2
10, TRYK_U_B_ACU
10, TRYK_U_B_ACUTshirt
10, TRYK_U_B_MARPAT_Wood
10, TRYK_U_B_MARPAT_Wood_Tshirt
10, TRYK_U_B_MARPAT_Desert
10, TRYK_U_B_MARPAT_Desert_Tshirt
10, TRYK_U_B_MARPAT_Desert2
10, TRYK_U_B_MARPAT_Desert2_Tshirt
10, TRYK_U_B_3c
10, TRYK_U_B_3cr
10, TRYK_U_B_Sage_Tshirt
10, TRYK_U_B_BLK3CD
10, TRYK_U_B_BLK3CD_Tshirt
10, TRYK_U_B_BLK
10, TRYK_U_B_BLK_Tshirt
10, TRYK_U_B_BLKTAN
10, TRYK_U_B_BLKTAN_Tshirt
10, TRYK_U_B_ODTAN
10, TRYK_U_B_ODTAN_Tshirt
10, TRYK_U_B_BLK_OD
10, TRYK_U_B_BLK_OD_Tshirt
10, TRYK_U_B_C010_Tsirt
10, TRYK_U_B_C02_Tsirt
10, TRYK_U_B_OD_BLK
10, TRYK_U_B_OD_BLK_2
10, TRYK_U_B_BLK_TAN_10
10, TRYK_U_B_BLK_TAN_2
10, TRYK_U_B_wh_tan_Rollup_CombatUniform
10, TRYK_U_B_wh_OD_Rollup_CombatUniform
10, TRYK_U_B_wh_blk_Rollup_CombatUniform
10, TRYK_U_B_BLK_tan_Rollup_CombatUniform
10, TRYK_U_B_BLK_OD_Rollup_CombatUniform
10, TRYK_U_B_NATO_UCP_GRY_CombatUniform
10, TRYK_U_B_NATO_UCP_GRY_R_CombatUniform
10, TRYK_U_B_NATO_UCP_CombatUniform
10, TRYK_U_B_NATO_UCP_R_CombatUniform
10, TRYK_U_B_NATO_OCP_c_BLK_CombatUniform
10, TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform
10, TRYK_U_B_NATO_OCP_BLK_CombatUniform
10, TRYK_U_B_NATO_OCP_BLK_R_CombatUniform
10, TRYK_U_B_NATO_OCPD_CombatUniform
10, TRYK_U_B_NATO_OCPD_R_CombatUniform
10, TRYK_U_B_NATO_OCP_CombatUniform
10, TRYK_U_B_NATO_OCP_R_CombatUniform
10, TRYK_U_B_AOR10_Rollup_CombatUniform
10, TRYK_U_B_AOR2_Rollup_CombatUniform
10, TRYK_U_B_MTP_CombatUniform
10, TRYK_U_B_MTP_R_CombatUniform
10, TRYK_U_B_MTP_BLK_CombatUniform
10, TRYK_U_B_MTP_BLK_R_CombatUniform
10, TRYK_U_B_Woodland
10, TRYK_U_B_Woodland_Tshirt
10, TRYK_U_B_WDL_GRY_CombatUniform
10, TRYK_U_B_WDL_GRY_R_CombatUniform
10, TRYK_U_B_ARO10_GR_CombatUniform
10, TRYK_U_B_ARO10_GR_R_CombatUniform
10, TRYK_U_B_ARO10_GRY_CombatUniform
10, TRYK_U_B_ARO10_GRY_R_CombatUniform
10, TRYK_U_B_ARO10_CombatUniform
10, TRYK_U_B_ARO10R_CombatUniform
10, TRYK_U_B_ARO10_BLK_CombatUniform
10, TRYK_U_B_ARO10_BLK_R_CombatUniform
10, TRYK_U_B_ARO10_CBR_CombatUniform
10, TRYK_U_B_ARO10_CBR_R_CombatUniform
10, TRYK_U_B_ARO2_CombatUniform
10, TRYK_U_B_ARO2R_CombatUniform
10, TRYK_U_B_AOR2_BLK_CombatUniform
10, TRYK_U_B_AOR2_BLK_R_CombatUniform
10, TRYK_U_B_AOR2_OD_CombatUniform
10, TRYK_U_B_AOR2_OD_R_CombatUniform
10, TRYK_U_B_AOR2_GRY_CombatUniform
10, TRYK_U_B_AOR2_GRY_R_CombatUniform
10, TRYK_U_B_Denim_T_WH
10, TRYK_U_B_Denim_T_BK
10, TRYK_U_B_BLK_T_WH
10, TRYK_U_B_BLK_T_BK
10, TRYK_U_B_RED_T_BR
10, TRYK_U_B_Denim_T_BG_WH
10, TRYK_U_B_Denim_T_BG_BK
10, TRYK_U_B_BLK_T_BG_WH
10, TRYK_U_B_BLK_T_BG_BK
10, TRYK_U_B_RED_T_BG_BR
10, TRYK_U_B_fleece
10, TRYK_U_B_fleece_UCP
10, TRYK_U_B_UCP_PCUs
10, TRYK_U_B_GRY_PCUs
10, TRYK_U_B_Wood_PCUs
10, TRYK_U_B_PCUs
10, TRYK_U_B_UCP_PCUs_R
10, TRYK_U_B_GRY_PCUs_R
10, TRYK_U_B_Wood_PCUs_R
10, TRYK_U_B_PCUs_R
10, TRYK_U_B_PCUGs
10, TRYK_U_B_PCUODs
10, TRYK_U_B_PCUGs_gry
10, TRYK_U_B_PCUGs_BLK
10, TRYK_U_B_PCUGs_OD
10, TRYK_U_B_PCUGs_gry_R
10, TRYK_U_B_PCUGs_BLK_R
10, TRYK_U_B_PCUGs_OD_R
10, TRYK_U_Bts_GRYGRY_PCUs
10, TRYK_U_Bts_UCP_PCUs
10, TRYK_U_Bts_Wood_PCUs
10, TRYK_U_Bts_PCUs
10, TRYK_U_pad_j
10, TRYK_U_pad_j_blk
10, TRYK_U_pad_hood_Cl
10, TRYK_U_pad_hood_Cl_blk
10, TRYK_U_pad_hood_tan
10, TRYK_U_pad_hood_Blk
10, TRYK_U_pad_hood_CSATBlk
10, TRYK_U_pad_hood_Blod
10, TRYK_U_pad_hood_odBK
10, TRYK_U_pad_hood_BKT2
10, TRYK_hoodie_Blk
10, TRYK_hoodie_FR
10, TRYK_hoodie_Wood
10, TRYK_hoodie_3c
10, TRYK_T_camo_tan
10, TRYK_T_camo_3c
10, TRYK_T_camo_Wood
10, TRYK_T_camo_wood_marpat
10, TRYK_T_camo_Desert_marpat
10, TRYK_T_camo_3c_BG
10, TRYK_T_camo_Wood_BG
10, TRYK_T_camo_wood_marpat_BG
10, TRYK_T_camo_desert_marpat_BG
10, TRYK_T_PAD
10, TRYK_T_OD_PAD
10, TRYK_T_TAN_PAD
10, TRYK_T_BLK_PAD
10, TRYK_T_T2_PAD
10, TRYK_T_CSAT_PAD
10, TRYK_U_nohoodPcu_gry
10, TRYK_U_hood_nc
10, TRYK_U_hood_mc
10, TRYK_U_denim_hood_blk
10, TRYK_U_denim_hood_mc
10, TRYK_U_denim_hood_3c
10, TRYK_U_denim_hood_nc
10, TRYK_U_denim_jersey_blu
10, TRYK_U_denim_jersey_blk
10, TRYK_shirts_PAD
10, TRYK_shirts_OD_PAD
10, TRYK_shirts_TAN_PAD
10, TRYK_shirts_BLK_PAD
10, TRYK_shirts_PAD_BK
10, TRYK_shirts_OD_PAD_BK
10, TRYK_shirts_TAN_PAD_BK
10, TRYK_shirts_BLK_PAD_BK
10, TRYK_shirts_PAD_BLW
10, TRYK_shirts_OD_PAD_BLW
10, TRYK_shirts_TAN_PAD_BLW
10, TRYK_shirts_BLK_PAD_BLW
10, TRYK_shirts_PAD_YEL
10, TRYK_shirts_OD_PAD_YEL
10, TRYK_shirts_TAN_PAD_YEL
10, TRYK_shirts_BLK_PAD_YEL
10, TRYK_shirts_PAD_RED2
10, TRYK_shirts_OD_PAD_RED2
10, TRYK_shirts_TAN_PAD_RED2
10, TRYK_shirts_BLK_PAD_RED2
10, TRYK_shirts_PAD_BLU3
10, TRYK_shirts_OD_PAD_BLU3
10, TRYK_shirts_TAN_PAD_BLU3
10, TRYK_shirts_BLK_PAD_BLU3
10, TRYK_shirts_DENIM_R
10, TRYK_shirts_DENIM_BL
10, TRYK_shirts_DENIM_BK
10, TRYK_shirts_DENIM_WH
10, TRYK_shirts_DENIM_BWH
10, TRYK_shirts_DENIM_RED2
10, TRYK_shirts_DENIM_WHB
10, TRYK_shirts_DENIM_ylb
10, TRYK_shirts_DENIM_od
10, TRYK_shirts_DENIM_R_Sleeve
10, TRYK_shirts_DENIM_BL_Sleeve
10, TRYK_shirts_DENIM_BK_Sleeve
10, TRYK_shirts_DENIM_WH_Sleeve
10, TRYK_shirts_DENIM_BWH_Sleeve
10, TRYK_shirts_DENIM_RED2_Sleeve
10, TRYK_shirts_DENIM_WHB_Sleeve
10, TRYK_shirts_DENIM_ylb_Sleeve
10, TRYK_shirts_DENIM_od_Sleeve
10, TRYK_shirts_PAD_BL
10, TRYK_shirts_OD_PAD_BL
10, TRYK_shirts_TAN_PAD_BL
10, TRYK_shirts_BLK_PAD_BL
10, TRYK_U_taki_wh
10, TRYK_U_taki_COY
10, TRYK_U_taki_BL
10, TRYK_U_taki_BLK
10, TRYK_U_Bts_PCUGs
10, TRYK_U_Bts_PCUODs
10, TRYK_U_taki_G_WH
10, TRYK_U_taki_G_COY
10, TRYK_U_taki_G_BL
10, TRYK_U_taki_G_BLK
10, TRYK_U_B_PCUHs
10, TRYK_U_B_PCUGHs
10, TRYK_U_B_PCUODHs
10, TRYK_B_USMC_R
10, TRYK_B_USMC_R_ROLL
10, TRYK_ZARATAKI
10, TRYK_ZARATAKI2
10, TRYK_ZARATAKI3
10, TRYK_B_TRYK_UCP_T
10, TRYK_B_TRYK_3C_T
10, TRYK_B_TRYK_MTP_T
10, TRYK_B_TRYK_OCP_T
10, TRYK_B_TRYK_OCP_D_T
10, TRYK_DMARPAT_T
10, TRYK_C_AOR2_T
10, TRYK_U_B_Sage_T
10, TRYK_U_B_Wood_T
10, TRYK_U_B_BLTAN_T
10, TRYK_U_B_BLOD_T
10, TRYK_OVERALL_flesh
10, TRYK_OVERALL_nok_flesh
10, TRYK_OVERALL_SAGE_BLKboots
10, TRYK_OVERALL_SAGE_BLKboots_nk_blk
10, TRYK_OVERALL_SAGE_BLKboots_nk
10, TRYK_OVERALL_SAGE_BLKboots_nk_blk2
10, TRYK_OVERALL_SAGE
5, TRYK_SUITS_BLK_F
5, TRYK_SUITS_BR_F
10, TRYK_shoulder_armor_BK
10, TRYK_shoulder_armor_OD
10, TRYK_shoulder_armor_CY
10, TRYK_U_B_PCUHsW
10, TRYK_U_B_PCUHsW2
10, TRYK_U_B_PCUHsW3
10, TRYK_U_B_PCUHsW3nh
10, TRYK_U_B_PCUHsW4
10, TRYK_U_B_PCUHsW5
10, TRYK_U_B_PCUHsW6

//Vests
> TrykVests
2, TRYK_Hrp_vest_ucp
2, TRYK_Hrp_vest_od
2, TRYK_V_PlateCarrier_JSDF
2, TRYK_V_ArmorVest_AOR8
2, TRYK_V_ArmorVest_AOR2
2, TRYK_V_ArmorVest_coyo
2, TRYK_V_ArmorVest_Brown
2, TRYK_V_ArmorVest_CBR
2, TRYK_V_ArmorVest_khk
2, TRYK_V_ArmorVest_rgr
2, TRYK_V_ArmorVest_green
2, TRYK_V_ArmorVest_tan
2, TRYK_V_ArmorVest_Delta
2, TRYK_V_ArmorVest_Ranger
2, TRYK_V_ArmorVest_AOR8_2
2, TRYK_V_ArmorVest_AOR2_2
2, TRYK_V_ArmorVest_coyo2
2, TRYK_V_ArmorVest_Brown2
2, TRYK_V_ArmorVest_cbr2
2, TRYK_V_ArmorVest_khk2
2, TRYK_V_ArmorVest_rgr2
2, TRYK_V_ArmorVest_green2
2, TRYK_V_ArmorVest_tan2
2, TRYK_V_ArmorVest_Delta2
2, TRYK_V_ArmorVest_Ranger2
2, TRYK_V_PlateCarrier_blk
2, TRYK_V_PlateCarrier_oli
2, TRYK_V_PlateCarrier_coyo
2, TRYK_V_PlateCarrier_wood
2, TRYK_V_PlateCarrier_ACU
2, TRYK_V_TacVest_coyo
2, TRYK_V_harnes_blk_L
2, TRYK_V_harnes_od_L
2, TRYK_V_harnes_TAN_L
2, TRYK_V_PlateCarrier_blk_L
2, TRYK_V_PlateCarrier_wood_L
2, TRYK_V_PlateCarrier_ACU_L
2, TRYK_V_PlateCarrier_coyo_L
2, TRYK_V_ChestRig_L
2, TRYK_V_ChestRig
2, TRYK_V_Bulletproof
2, TRYK_V_Bulletproof_BLK
2, TRYK_V_Bulletproof_BL
2, TRYK_V_IOTV_BLK
2, TRYK_V_tacv8M_BK
2, TRYK_V_tacv8MLC_BK
2, TRYK_V_tacv8
2, TRYK_V_tacv8_CY
2, TRYK_V_tacv8_BK
2, TRYK_V_tacv8_P_BK
2, TRYK_V_tacv8_SHERIFF_BK
2, TRYK_V_tacv8_FBI_BK
2, TRYK_V_tacv8LP_BK
2, TRYK_V_tacv8LSRF_BK
2, TRYK_V_tacv8LC_BK
2, TRYK_V_tacv8LC_CY
2, TRYK_V_tacv8LC_OD
2, TRYK_V_tacv8LC_FBI_BK
2, TRYK_V_tacv8LC_SRF_BK
2, TRYK_V_tacv8LC_SRF_OD
2, TRYK_V_tacv8LC_P_BK
2, TRYK_V_PlateCarrier_POLICE
2, TRYK_V_ArmorVest_HRT_B
2, TRYK_V_ArmorVest_HRT_OD
2, TRYK_V_ArmorVest_HRT2_B
2, TRYK_V_ArmorVest_HRT2_OD
2, TRYK_V_ArmorVest_Winter
2, TRYK_V_Sheriff_BA_OD
2, TRYK_V_tacv80_BK
2, TRYK_V_tacv80_OD
2, TRYK_V_tacv80_TN
2, TRYK_V_tacv80LC_BK
2, TRYK_V_tacv80LC_OD
2, TRYK_V_tacv80LC_TN
2, TRYK_V_tacv8L_BK
2, TRYK_V_tacv8L_OD
2, TRYK_V_tacv8L_CY
2, TRYK_V_tacv8LC_FBI2_BK
2, TRYK_V_tacv8LC_SRF2_BK
2, TRYK_V_tacv8LC_SRF2_OD
2, TRYK_V_tacv8LC_P2_BK
2, TRYK_V_tacv8_MSL_BK
2, TRYK_V_tacv8_MSL_NV
2, TRYK_V_tacv8LMSL_BK
2, TRYK_V_tacv8LMSL_NV
2, TRYK_V_tacv8LC_MSL_BK
2, TRYK_V_tacv8LC_MSL_NV
2, TRYK_V_tacSVD_BK
2, TRYK_V_tacSVD_OD
2, TRYK_LOC_AK_chestrig_OD
2, TRYK_LOC_AK_chestrig_TAN

//BackPacks
> TrykBacks
10, TRYK_B_AssaultPack_UCP
10, TRYK_B_AssaultPack_Type2camo
10, TRYK_B_AssaultPack_MARPAT_Desert
10, TRYK_B_AssaultPack_MARPAT_Wood
9, TRYK_B_Kitbag_Base
8, TRYK_B_Kitbag_blk
8, TRYK_B_Kitbag_aaf
2, TRYK_B_Carryall_blk
2, TRYK_B_Carryall_wh
2, TRYK_B_Carryall_wood
2, TRYK_B_Carryall_JSDF
8, TRYK_B_Kitbag_Base_JSDF
2, TRYK_B_Coyotebackpack
2, TRYK_B_Coyotebackpack_OD
2, TRYK_B_Coyotebackpack_BLK
14, TRYK_B_Alicepack
14, TRYK_B_Medbag
14, TRYK_B_Medbag_OD
14, TRYK_B_Medbag_BK
14, TRYK_B_Medbag_ucp
8, TRYK_B_Belt
8, TRYK_B_Belt_BLK
8, TRYK_B_Belt_CYT
8, TRYK_B_Belt_tan
8, TRYK_B_Belt_br
8, TRYK_B_Belt_GR
8, TRYK_B_Belt_AOR8
8, TRYK_B_Belt_AOR2
8, TRYK_B_FieldPack_Wood

> DLCGhillies
2, U_B_FullGhillie_ard		
2, U_B_FullGhillie_lsh
2, U_B_FullGhillie_sard
2, U_O_FullGhillie_ard
2, U_O_FullGhillie_lsh
2, U_O_FullGhillie_sard
2, U_I_FullGhillie_ard
2, U_I_FullGhillie_lsh
2, U_I_FullGhillie_sard

> RaroLoot
2, hlc_muzzle_556NATO_KAC
2, hlc_muzzle_300blk_KAC
2, hlc_optic_kobra
2, hlc_muzzle_545SUP_AK
2, hlc_muzzle_762SUP_AK
2, hlc_muzzle_snds_M14
2, hlc_optic_PVS4FAL
2, hlc_muzzle_snds_fal
//NIArms AUG Attatchments
2, hlc_muzzle_snds_AUG
2, hlc_muzzle_snds_a6AUG
10, ItemGPS
10, Exile_Item_EMRE
5, srifle_EBR_DMS_pointer_snds_F
2, muzzle_snds_M//silenciador
2, muzzle_snds_H//silenciador
2, muzzle_snds_L
2, muzzle_snds_acp
2, muzzle_snds_B
2, muzzle_snds_B_khk_F
2, muzzle_snds_B_snd_F
3, U_B_GhillieSuit			// Ghillie Suit [NATO]
2, U_O_GhillieSuit			// Ghillie Suit [CSAT]
3, U_I_GhillieSuit			// Ghillie Suit [AAF]
2, Rangefinder
5, ItemCompass
2, NVGoggles
2, TRYK_US_ESS_Glasses_H
2, TRYK_US_ESS_Glasses_Cover
2, optic_tws
2, optic_NVS
2, optic_tws_mg
2, optic_Nightstalker
5, optic_MRCO
6, optic_DMS
3, TRYK_H_ghillie_top_headless3glass
2, TRYK_H_ghillie_top_headless3
3, TRYK_H_ghillie_over
3, TRYK_H_ghillie_top
2, TRYK_H_ghillie_top_headless
3, TRYK_H_ghillie_over_green
2, TRYK_H_ghillie_top_green
3, TRYK_H_ghillie_top_headless_green
1, HandGrenade
1, MiniGrenade
1, DemoCharge_Remote_Mag
1, IEDUrbanSmall_Remote_Mag
1, IEDLandSmall_Remote_Mag
1, APERSMine_Range_Mag
1, APERSBoundingMine_Range_Mag
1, APERSTripMine_Wire_Mag
1, SatchelCharge_Remote_Mag

> AntiVirus
32, RyanZombiesAntiVirusTemporary
15, RyanZombiesAntiVirusCure