//New Loot Table

/**
  /////////////////////////////////////////////////////////////////////////////
  Exile Mod Loot Table Template
  /////////////////////////////////////////////////////////////////////////////
    
  Format of this file is the following:

  > LootTableName
  Spawn Chance %, Item Class Name

  You can add one item to multiple loot tables.

  Be careful with spawn chance values! They do not define how common an item is
  in general, but how common it is in relation to all the other items of that
  loot table. Values from 0..100 are allowed. The higher the chance, the more
  often will it spawn.
*/

///////////////////////////////////////////////////////////////////////////////
// Slums/Ghetto, Farms, Village Houses, Castle etc.
// Spawn Guerilla things :)
///////////////////////////////////////////////////////////////////////////////

> CivillianLowerClass

//////////////////////////////////////////////////////////
//arma and exile - CivillianLowerClass
//////////////////////////////////////////////////////////

// Food
200, Exile_Item_PlasticBottleEmpty
110, Exile_Item_PlasticBottleFreshWater
50, Exile_Item_Energydrink
150, Exile_Item_Beer
150, Exile_Item_GloriousKnakworst
150, Exile_Item_SausageGravy
150, Exile_Item_ChristmasTinner
150, Exile_Item_BBQSandwich
150, Exile_Item_Surstromming
200, Exile_Item_Catfood
20, Exile_Item_ChristmasTinner_Cooked
20, Exile_Item_BBQSandwich_Cooked
20, Exile_Item_GloriousKnakworst_Cooked
20, Exile_Item_SausageGravy_Cooked
20, Exile_Item_Surstromming_Cooked
20, Exile_Item_Catfood_Cooked

// Pistols
80, hgun_ACPC2_F
80, hgun_P07_F
80, hgun_Rook150_F
50, hgun_Pistol_heavy_01_F
50, hgun_Pistol_heavy_02_F


// Pistol Magazines
90, 11Rnd_45ACP_Mag
90, 16Rnd_9x21_Mag
90, 30Rnd_9x21_Mag
60, 6Rnd_45ACP_Cylinder
90, 9Rnd_45ACP_Mag

// Pistol Items
50, muzzle_snds_L
50, muzzle_snds_acp
20, optic_Yorris   
35, optic_MRD
 
// SMGs
50, SMG_01_F
50, SMG_02_F
50, hgun_PDW2000_F

// SMG Ammo
50, 30Rnd_45ACP_Mag_SMG_01
50, 30Rnd_45ACP_Mag_SMG_01_Tracer_Green
 
// SMG Items
50, optic_Holosight_smg
50, optic_ACO_grn_smg
50, optic_Aco_smg
50, optic_ACO_grn
50, optic_Aco
1, optic_Nightstalker

// Rifles
120, arifle_Katiba_F
120, arifle_Katiba_GL_F
30, arifle_SDAR_F
120, arifle_TRG21_F
120, arifle_TRG20_F

// Rifle Items
70, muzzle_snds_M
70, muzzle_snds_H
70, optic_Arco
70, optic_Hamr
70, optic_Holosight
70, acc_flashlight
70, acc_pointer_IR
70, optic_MRCO
30, optic_DMS
5, optic_NVS
1, optic_tws

// Rifle Ammo
50, 20Rnd_556x45_UW_mag
70, 30Rnd_556x45_Stanag
70, 30Rnd_556x45_Stanag_Tracer_Green
70, 30Rnd_556x45_Stanag_Tracer_Red
70, 30Rnd_556x45_Stanag_Tracer_Yellow
70, 30Rnd_65x39_caseless_green
70, 30Rnd_65x39_caseless_green_mag_Tracer

// Backpacks
150, B_OutdoorPack_blk
150, B_OutdoorPack_tan
150, B_OutdoorPack_blu
140, B_HuntingBackpack
120, B_AssaultPack_khk
120, B_AssaultPack_dgtl
120, B_AssaultPack_rgr
120, B_AssaultPack_sgg
120, B_AssaultPack_blk
120, B_AssaultPack_cbr
120, B_AssaultPack_mcamo
120, B_Kitbag_mcamo
120, B_Kitbag_sgg
120, B_Kitbag_cbr
100, B_FieldPack_blk
100, B_FieldPack_ocamo
100, B_FieldPack_oucamo
100, B_FieldPack_cbr
100, B_Bergen_sgg
100, B_Bergen_mcamo
100, B_Bergen_rgr
100, B_Bergen_blk
100, B_Carryall_ocamo
100, B_Carryall_oucamo
100, B_Carryall_mcamo
100, B_Carryall_oli
100, B_Carryall_khk
100, B_Carryall_cbr
50, B_Bergen_mcamo_F
50, B_Bergen_dgtl_F
50, B_Bergen_hex_F
50, B_Bergen_tna_F

// Items
70, Binocular
30, Exile_Item_CamoTentKit
30, Exile_Item_CookingPot
100, Exile_Item_DuctTape
50, Exile_Item_LightBulb
50, Exile_Item_Matches
90, Exile_Item_InstaDoc
50, ItemGPS

// Chem lights
50, Chemlight_blue
50, Chemlight_green
50, Chemlight_red
50, Chemlight_yellow

// Road flares
50, FlareGreen_F
50, FlareRed_F
50, FlareWhite_F
50, FlareYellow_F

// Uniforms
150, U_C_Poor_1
150, U_C_Poor_2
150, U_C_Poor_shorts_1
150, U_C_HunterBody_grn

// Polo
150, U_C_Poloshirt_salmon
150, U_C_Poloshirt_tricolour
150, U_C_Poloshirt_stripped
150, U_C_Poloshirt_burgundy
150, U_C_Poloshirt_blue

// Guerilla Headgear
100, H_Booniehat_khk
100, H_Booniehat_indp
100, H_Booniehat_mcamo
100, H_Booniehat_grn
100, H_Booniehat_tan
100, H_Booniehat_dirty
100, H_Booniehat_dgtl
100, H_Booniehat_khk_hs
//
100, H_Bandanna_khk
100, H_Bandanna_khk_hs
100, H_Bandanna_cbr
100, H_Bandanna_sgg
100, H_Bandanna_gry
100, H_Bandanna_camo
100, H_Bandanna_mcamo
100, H_BandMask_blk
//
100, H_Beret_blk
100, H_Beret_red
100, H_Beret_grn
100, H_Beret_grn_SF
100, H_Beret_brn_SF
100, H_Beret_ocamo
100, H_Beret_02
100, H_Beret_Colonel
//
100, H_Hat_camo
100, H_Cap_brn_SPECOPS
100, H_Cap_tan_specops_US
100, H_Cap_khaki_specops_UK
100, H_Watchcap_blk
100, H_Watchcap_khk
100, H_Watchcap_camo
100, H_Watchcap_sgg
100, H_TurbanO_blk
//
100, H_Shemag_khk
100, H_Shemag_tan
100, H_Shemag_olive
100, H_Shemag_olive_hs
100, H_ShemagOpen_khk
100, H_ShemagOpen_tan

// Guerilla Vests
115, V_BandollierB_khk
115, V_BandollierB_cbr
115, V_BandollierB_rgr
115, V_BandollierB_blk
115, V_BandollierB_oli
110, V_Chestrig_khk
110, V_Chestrig_rgr
110, V_Chestrig_blk
110, V_Chestrig_oli
115, V_HarnessO_brn
115, V_HarnessOGL_brn
115, V_HarnessO_gry
115, V_HarnessOGL_gry
115, V_HarnessOSpec_brn
115, V_HarnessOSpec_gry

15, V_I_G_resistanceLeader_F

// Guerilla Uniforms
150, U_IG_Guerilla1_1
150, U_IG_Guerilla2_1
150, U_IG_Guerilla2_2
150, U_IG_Guerilla2_3
150, U_IG_Guerilla3_1
150, U_IG_Guerilla3_2
110, U_IG_leader
15, U_I_G_resistanceLeader_F




/////////////////////////////////////////////////////////////////
//NIArms - CivillianLowerClass
/////////////////////////////////////////////////////////////////

//NiArms AK Rifles
120, hlc_rifle_ak74
120, hlc_rifle_ak74_MTK
120, hlc_rifle_ak74_dirty
120, hlc_rifle_ak74_dirty2
120, hlc_rifle_aks74
120, hlc_rifle_aks74_MTK
120, hlc_rifle_aks74u
120, hlc_rifle_aks74u_MTK
120, hlc_rifle_ak47
120, hlc_rifle_akm
120, hlc_rifle_akm_MTK
120, hlc_rifle_rpk
120, hlc_rifle_ak12
120, hlc_rifle_aku12
120, hlc_rifle_rpk12
120, hlc_rifle_rpk74n
120, hlc_rifle_ak12gl
120, hlc_rifle_akmgl
120, hlc_rifle_aks74_GL
120, hlc_rifle_saiga12k
120, hlc_rifle_aek971
120, hlc_rifle_aek971
120, hlc_rifle_aek971_mtk
120, hlc_rifle_RK62
120, hlc_rifle_slr107u
120, hlc_rifle_slr107u_MTK
120, hlc_rifle_ak74m
120, hlc_rifle_ak74m_gl
120, hlc_rifle_ak74m_MTK

//NiArms AK Ammo
120, hlc_30Rnd_545x39_B_AK
120, hlc_30Rnd_545x39_T_AK
120, hlc_30Rnd_545x39_EP_AK
120, hlc_45Rnd_545x39_t_rpk
120, hlc_60Rnd_545x39_t_rpk
120, hlc_30Rnd_762x39_b_ak
120, hlc_30Rnd_762x39_t_ak
120, hlc_45Rnd_762x39_t_rpk
120, hlc_45Rnd_762x39_m_rpk
120, hlc_75rnd_762x39_m_rpk
120, hlc_10rnd_12g_buck_S12
120, hlc_10rnd_12g_slug_S12
120, hlc_VOG25_AK
120, hlc_GRD_White
120, hlc_GRD_red
120, hlc_GRD_green
120, hlc_GRD_blue
120, hlc_GRD_orange
120, hlc_GRD_purple

//NiArms AK Attatchments
120, HLC_Optic_PSO1
120, HLC_Optic_1p29
120, hlc_muzzle_545SUP_AK
120, hlc_muzzle_762SUP_AK
120, hlc_optic_kobra
120, hlc_optic_goshawk

//NIArms AR15 Rifles
120, hlc_rifle_RU556
120, hlc_rifle_RU5562
120, hlc_rifle_Colt727
120, hlc_rifle_Colt727_GL
120, hlc_rifle_bcmjack
120, hlc_rifle_vendimus
120, hlc_rifle_SAMR
120, hlc_rifle_honeybase
120, hlc_rifle_honeybadger
120, hlc_rifle_cqbr
120, hlc_rifle_m4

//NIArms AR15 Attatchments
120, hlc_muzzle_556NATO_KAC
120, hlc_muzzle_300blk_KAC

//NIArms AR15 Ammo
120, 29rnd_300BLK_STANAG
120, 29rnd_300BLK_STANAG_T
120, 29rnd_300BLK_STANAG_S
120, hlc_30rnd_556x45_EPR
120, hlc_30rnd_556x45_SOST
120, hlc_30rnd_556x45_SPR

//NIArms AUG Rifles
60, hlc_rifle_aug
60, hlc_rifle_auga1_t
60, hlc_rifle_auga1_B
60, hlc_rifle_auga1carb
60, hlc_rifle_auga1carb_t
60, hlc_rifle_auga1carb_b
60, hlc_rifle_aughbar
60, hlc_rifle_aughbar_b
60, hlc_rifle_aughbar_t
60, hlc_rifle_augpara
60, hlc_rifle_augpara_b
60, hlc_rifle_augpara_t
100, hlc_rifle_auga2
100, hlc_rifle_auga2_b
100, hlc_rifle_auga2_t
100, hlc_rifle_auga2carb
100, hlc_rifle_auga2carb_t
100, hlc_rifle_auga2carb_b
100, hlc_rifle_auga2lsw
100, hlc_rifle_auga2lsw_t
100, hlc_rifle_auga2lsw_b
100, hlc_rifle_auga2para
100, hlc_rifle_auga2para_b
100, hlc_rifle_auga2para_t
100, hlc_rifle_augsr
100, hlc_rifle_augsr_b
100, hlc_rifle_augsr_t
100, hlc_rifle_augsrcarb
100, hlc_rifle_augsrcarb_t
100, hlc_rifle_augsrcarb_b
100, hlc_rifle_augsrhbar
100, hlc_rifle_augsrhbar_b
100, hlc_rifle_augsrhbar_t
60, hlc_rifle_auga3
60, hlc_rifle_auga3_bl
60, hlc_rifle_auga3_b
60, hlc_rifle_auga3_GL
60, hlc_rifle_auga3_GL_BL 
60, hlc_rifle_auga3_GL_B

//NIArms AUG Attatchments
120, hlc_muzzle_snds_AUG
120, hlc_muzzle_snds_a6AUG

//NIArms AUG Ammo
120, hlc_30Rnd_556x45_B_AUG
120, hlc_30Rnd_556x45_SOST_AUG
120, hlc_30Rnd_556x45_SPR_AUG
120, hlc_30Rnd_556x45_T_AUG
120, hlc_40Rnd_556x45_B_AUG
120, hlc_40Rnd_556x45_SOST_AUG
120, hlc_40Rnd_556x45_SPR_AUG
120, hlc_25Rnd_9x19mm_M882_AUG
120, hlc_25Rnd_9x19mm_JHP_AUG
120, hlc_25Rnd_9x19mm_subsonic_AUG

//NIArms AWM Rifles
120, hlc_rifle_awcovert
120, hlc_rifle_awcovert_BL
120, hlc_rifle_awcovert_FDE
120, hlc_rifle_awmagnum
120, hlc_rifle_awmagnum_BL
120, hlc_rifle_awmagnum_FDE
120, hlc_rifle_awMagnum_FDE_ghillie
120, hlc_rifle_awMagnum_BL_ghillie
120, hlc_rifle_awMagnum_OD_ghillie

//NIArms AWM Ammo
120, hlc_5rnd_300WM_FMJ_AWM
120, hlc_5rnd_300WM_AP_AWM
120, hlc_5rnd_300WM_BTSP_AWM
120, hlc_5rnd_300WM_mk248_AWM
120, hlc_5rnd_300WM_SBT_AWM

//NIArms FAL Rifles
120, hlc_rifle_l1a1slr
120, hlc_rifle_SLR
120, hlc_rifle_STG58F
120, hlc_rifle_FAL5061
120, hlc_rifle_c1A1
120, hlc_rifle_LAR
120, hlc_rifle_SLRchopmod
120, hlc_rifle_falosw
120, hlc_rifle_osw_GL

//NIArms FAL Attatchments
120, hlc_optic_PVS4FAL
120, hlc_optic_suit
120, hlc_muzzle_snds_fal

//NIArms FAL Ammo
120, hlc_20Rnd_762x51_B_fal
120, hlc_20Rnd_762x51_t_fal
120, hlc_20Rnd_762x51_S_fal
120, hlc_50rnd_762x51_M_FAL

//NIArms G3 Rifles
120, hlc_rifle_g3sg1
120, hlc_rifle_psg1
120, hlc_rifle_g3a3
120, hlc_rifle_g3a3ris
120, hlc_rifle_g3ka4
120, HLC_Rifle_g3ka4_GL
120, hlc_rifle_hk51
120, hlc_rifle_hk53
120, hlc_rifle_hk53RAS
120, hlc_rifle_hk33a2
120, hlc_rifle_hk33a2RIS
120, hlc_rifle_psg1A1
120, hlc_rifle_PSG1A1_RIS
120, hlc_rifle_g3a3v

//NIArms G3 Attatchments
120, HLC_Optic_ZFSG1
120, hlc_optic_accupoint_g3

//NIArms G3 Ammo
120, hlc_20Rnd_762x51_B_G3
120, hlc_20rnd_762x51_T_G3
120, hlc_50rnd_762x51_M_G3

//NIArms G36 Rifles
120, hlc_rifle_G36A1
120, hlc_rifle_G36A1AG36
120, hlc_rifle_G36KA1
120, hlc_rifle_G36C
120, hlc_rifle_G36E1
120, hlc_rifle_G36E1AG36
120, hlc_rifle_G36KE1
120, hlc_rifle_G36V
120, hlc_rifle_G36KV
120, hlc_rifle_G36CV
120, hlc_rifle_G36VAG36
120, hlc_rifle_G36TAC
120, hlc_rifle_G36KTAC
120, hlc_rifle_G36CTAC
120, hlc_rifle_G36MLIC
120, hlc_rifle_G36KMLIC
120, hlc_rifle_G36CMLIC
120, hlc_rifle_G36MLIAG36

//NIArms G36 Attatchments
120, HLC_Optic_G36dualoptic35x
120, HLC_Optic_G36dualoptic35x2d
120, HLC_Optic_G36Export35x
120, HLC_Optic_G36Export35x2d
120, HLC_Optic_G36Dualoptic15x
120, HLC_Optic_G36Dualoptic15x2d
120, HLC_Optic_G36Export15x
120, HLC_Optic_G36Export15x2d

//NIArms G36 Ammo
120, hlc_30rnd_556x45_EPR_G36 
120, hlc_30rnd_556x45_SOST_G36
120, hlc_30rnd_556x45_SPR_G36
120, hlc_100rnd_556x45_EPR_G36

//NIArms M14 Rifles
120, hlc_rifle_M14
120, hlc_rifle_M21
120, hlc_rifle_M14DMR
120, hlc_rifle_m14sopmod

//NIArms M14 Attatchments
120, hlc_muzzle_snds_M14
120, hlc_optic_artel_m14
120, hlc_optic_LRT_m14

//NiArms M14 Ammo
120, hlc_20Rnd_762x51_B_M14
120, hlc_20rnd_762x51_T_M14
120, hlc_50rnd_762x51_M_M14

//NIArms M60 GPMGs
80, hlc_lmg_M60E4
80, hlc_lmg_m60

//NIArms M60 GPMG Ammo
80, hlc_100Rnd_762x51_B_M60E4
80, hlc_100Rnd_762x51_T_M60E4
80, hlc_100Rnd_762x51_M_M60E4

// NIArms MP5 SMGs
120, hlc_smg_mp5k_PDW
120, hlc_smg_mp5k
120, hlc_smg_mp5a2
120, hlc_smg_mp5a3
120, hlc_smg_mp5a4
120, hlc_smg_mp5n
120, hlc_smg_mp510
120, hlc_smg_mp5sd5
120, hlc_smg_mp5sd6
120, hlc_smg_9mmar

// NIArms MP5 SMG Attatchments
120, hlc_muzzle_Agendasix
120, hlc_muzzle_Tundra
120, hlc_muzzle_Agendasix10mm

// NIArms MP5 SMG Ammo
120, 120, hlc_30Rnd_9x19_B_MP5
120, hlc_30Rnd_9x19_GD_MP5
120, hlc_30Rnd_9x19_SD_MP5
120, hlc_30Rnd_10mm_B_MP5
120, hlc_30Rnd_10mm_JHP_MP5

//NIArms Minimi LMGs
90, hlc_lmg_minimipara
90, hlc_lmg_minimi
90, hlc_lmg_minimi_railed
90, hlc_lmg_m249para
90, hlc_lmg_M249E2
90, hlc_m249_pip1
90, hlc_m249_pip2
90, hlc_m249_pip3
90, hlc_m249_pip4

//NIArms Minimi LMG Ammo
90, hlc_200rnd_556x45_M_SAW
90, hlc_200rnd_556x45_T_SAW
90, hlc_200rnd_556x45_B_SAW

//NIArms SG510 Rifles
120, hlc_rifle_STGW57
120, hlc_rifle_stgw57_RIS
120, hlc_rifle_stgw57_commando
120, hlc_rifle_sig5104
120, hlc_rifle_amt

//NIArms SG510 Attatchments
120, hlc_optic_Kern
120, hlc_optic_Kern2d

//NIArms SG510 Ammo
120, hlc_24Rnd_75x55_B_stgw
120, hlc_24Rnd_75x55_ap_stgw
120, hlc_20Rnd_762x51_b_amt
120, hlc_20Rnd_762x51_mk316_amt
120, hlc_20Rnd_762x51_bball_amt
120, hlc_20Rnd_762x51_T_amt
120, hlc_24Rnd_75x55_T_stgw


///////////////////////////////////////////////////////////////////////////////
// Apartments, Offices etc.
///////////////////////////////////////////////////////////////////////////////

> CivillianUpperClass


///////////////////////////////////////////////////////////////////////////////
//Arma and Exile - CivillianUpperClass
///////////////////////////////////////////////////////////////////////////////

200, Exile_Item_PlasticBottleEmpty
100, Exile_Item_PlasticBottleFreshWater
30, Exile_Item_Energydrink
150, Exile_Item_Beer
150, Exile_Item_GloriousKnakworst
170, Exile_Item_SausageGravy
170, Exile_Item_ChristmasTinner
170, Exile_Item_BBQSandwich
190, Exile_Item_Surstromming
200, Exile_Item_Catfood
20, Exile_Item_ChristmasTinner_Cooked
20, Exile_Item_BBQSandwich_Cooked
20, Exile_Item_GloriousKnakworst_Cooked
20, Exile_Item_SausageGravy_Cooked
20, Exile_Item_Surstromming_Cooked
20, Exile_Item_Catfood_Cooked

// Pistols
70, hgun_ACPC2_F
70, hgun_P07_F
70, hgun_Rook150_F
50, hgun_Pistol_heavy_01_F
50, hgun_Pistol_heavy_02_F
//35, hgun_Pistol_Signal_F

// Pistol Magazines
80, 11Rnd_45ACP_Mag
80, 16Rnd_9x21_Mag
80, 30Rnd_9x21_Mag
70, 6Rnd_45ACP_Cylinder
//50, 6Rnd_GreenSignal_F
//50, 6Rnd_RedSignal_F   
70, 9Rnd_45ACP_Mag

// Pistol Items
50, muzzle_snds_L
50, muzzle_snds_acp
50, optic_Yorris
50, optic_MRD

// Backpacks
170, B_OutdoorPack_blk
170, B_OutdoorPack_tan
170, B_OutdoorPack_blu
140, B_HuntingBackpack
100, B_Carryall_ocamo
100, B_Carryall_oucamo
100, B_Carryall_mcamo
100, B_Carryall_oli
100, B_Carryall_khk
100, B_Carryall_cbr
50, B_Bergen_mcamo_F
50, B_Bergen_dgtl_F
50, B_Bergen_hex_F
50, B_Bergen_tna_F

// Uniforms
100, U_C_Poloshirt_salmon
100, U_C_Poloshirt_tricolour
100, U_C_Poloshirt_stripped
100, U_C_Poloshirt_burgundy
100, U_C_Poloshirt_blue

50, U_C_Journalist
50, U_C_Scientist
50, U_Rangemaster

5, U_OrestesBody
5, U_NikosBody
5, U_NikosAgedBody

// Vests
50, V_Rangemaster_belt
50, V_Press_F
50, V_TacVest_blk_POLICE

// Headgear
60, H_Bandanna_surfer
60, H_Beret_blk_POLICE
60, H_Cap_blk
60, H_Cap_blk_Raven
60, H_Cap_blu
60, H_Cap_grn
60, H_Cap_headphones
60, H_Cap_oli
60, H_Cap_press
60, H_Cap_red
60, H_Cap_tan
60, H_Hat_blue
60, H_Hat_brown
60, H_Hat_checker
60, H_Hat_grey
60, H_Hat_tan
60, H_StrawHat
60, H_StrawHat_dark

// Rifles
70, arifle_Katiba_F
70, arifle_MXC_F
70, arifle_MX_F
70, arifle_MX_GL_F
70, arifle_MXM_F
70, arifle_SDAR_F
70, arifle_TRG21_F
70, arifle_TRG20_F
70, arifle_Mk20_F
70, arifle_Mk20C_F

// Rifle Items
40, muzzle_snds_M
40, muzzle_snds_H
150, optic_Arco
150, optic_Hamr
150, optic_Holosight
70, acc_flashlight
70, acc_pointer_IR
60, optic_MRCO
60, optic_DMS
5, optic_NVS
1, optic_Nightstalker
1, optic_tws

// Rifle Ammo
60, 20Rnd_556x45_UW_mag
80, 30Rnd_556x45_Stanag
50, 30Rnd_556x45_Stanag_Tracer_Green
50, 30Rnd_556x45_Stanag_Tracer_Red  
50, 30Rnd_556x45_Stanag_Tracer_Yellow
80, 30Rnd_65x39_caseless_green
50, 30Rnd_65x39_caseless_green_mag_Tracer
80, 30Rnd_65x39_caseless_mag
50, 30Rnd_65x39_caseless_mag_Tracer
70, 29rnd_300BLK_STANAG
70, 29rnd_300BLK_STANAG_T
70, 29rnd_300BLK_STANAG_S




/////////////////////////////////////////////////////////////////
//NIArms - CivillianUpperClass
/////////////////////////////////////////////////////////////////

//NiArms AK Rifles
120, hlc_rifle_ak74
120, hlc_rifle_ak74_MTK
120, hlc_rifle_ak74_dirty
120, hlc_rifle_ak74_dirty2
120, hlc_rifle_aks74
120, hlc_rifle_aks74_MTK
120, hlc_rifle_aks74u
120, hlc_rifle_aks74u_MTK
120, hlc_rifle_ak47
120, hlc_rifle_akm
120, hlc_rifle_akm_MTK
120, hlc_rifle_rpk
120, hlc_rifle_ak12
120, hlc_rifle_aku12
120, hlc_rifle_rpk12
120, hlc_rifle_rpk74n
120, hlc_rifle_ak12gl
120, hlc_rifle_akmgl
120, hlc_rifle_aks74_GL
120, hlc_rifle_saiga12k
120, hlc_rifle_aek971
120, hlc_rifle_aek971
120, hlc_rifle_aek971_mtk
120, hlc_rifle_RK62
120, hlc_rifle_slr107u
120, hlc_rifle_slr107u_MTK
120, hlc_rifle_ak74m
120, hlc_rifle_ak74m_gl
120, hlc_rifle_ak74m_MTK

//NiArms AK Ammo
120, hlc_30Rnd_545x39_B_AK
120, hlc_30Rnd_545x39_T_AK
120, hlc_30Rnd_545x39_EP_AK
120, hlc_45Rnd_545x39_t_rpk
120, hlc_60Rnd_545x39_t_rpk
120, hlc_30Rnd_762x39_b_ak
120, hlc_30Rnd_762x39_t_ak
120, hlc_45Rnd_762x39_t_rpk
120, hlc_45Rnd_762x39_m_rpk
120, hlc_75rnd_762x39_m_rpk
120, hlc_10rnd_12g_buck_S12
120, hlc_10rnd_12g_slug_S12
120, hlc_VOG25_AK
120, hlc_GRD_White
120, hlc_GRD_red
120, hlc_GRD_green
120, hlc_GRD_blue
120, hlc_GRD_orange
120, hlc_GRD_purple

//NiArms AK Attatchments
120, HLC_Optic_PSO1
120, HLC_Optic_1p29
120, hlc_muzzle_545SUP_AK
120, hlc_muzzle_762SUP_AK
120, hlc_optic_kobra
120, hlc_optic_goshawk

//NIArms AR15 Rifles
120, hlc_rifle_RU556
120, hlc_rifle_RU5562
120, hlc_rifle_Colt727
120, hlc_rifle_Colt727_GL
120, hlc_rifle_bcmjack
120, hlc_rifle_vendimus
120, hlc_rifle_SAMR
120, hlc_rifle_honeybase
120, hlc_rifle_honeybadger
120, hlc_rifle_cqbr
120, hlc_rifle_m4

//NIArms AR15 Attatchments
120, hlc_muzzle_556NATO_KAC
120, hlc_muzzle_300blk_KAC

//NIArms AR15 Ammo
120, 29rnd_300BLK_STANAG
120, 29rnd_300BLK_STANAG_T
120, 29rnd_300BLK_STANAG_S
120, hlc_30rnd_556x45_EPR
120, hlc_30rnd_556x45_SOST
120, hlc_30rnd_556x45_SPR

//NIArms AUG Rifles
60, hlc_rifle_aug
60, hlc_rifle_auga1_t
60, hlc_rifle_auga1_B
60, hlc_rifle_auga1carb
60, hlc_rifle_auga1carb_t
60, hlc_rifle_auga1carb_b
60, hlc_rifle_aughbar
60, hlc_rifle_aughbar_b
60, hlc_rifle_aughbar_t
60, hlc_rifle_augpara
60, hlc_rifle_augpara_b
60, hlc_rifle_augpara_t
100, hlc_rifle_auga2
100, hlc_rifle_auga2_b
100, hlc_rifle_auga2_t
100, hlc_rifle_auga2carb
100, hlc_rifle_auga2carb_t
100, hlc_rifle_auga2carb_b
100, hlc_rifle_auga2lsw
100, hlc_rifle_auga2lsw_t
100, hlc_rifle_auga2lsw_b
100, hlc_rifle_auga2para
100, hlc_rifle_auga2para_b
100, hlc_rifle_auga2para_t
100, hlc_rifle_augsr
100, hlc_rifle_augsr_b
100, hlc_rifle_augsr_t
100, hlc_rifle_augsrcarb
100, hlc_rifle_augsrcarb_t
100, hlc_rifle_augsrcarb_b
100, hlc_rifle_augsrhbar
100, hlc_rifle_augsrhbar_b
100, hlc_rifle_augsrhbar_t
60, hlc_rifle_auga3
60, hlc_rifle_auga3_bl
60, hlc_rifle_auga3_b
60, hlc_rifle_auga3_GL
60, hlc_rifle_auga3_GL_BL 
60, hlc_rifle_auga3_GL_B

//NIArms AUG Attatchments
120, hlc_muzzle_snds_AUG
120, hlc_muzzle_snds_a6AUG

//NIArms AUG Ammo
120, hlc_30Rnd_556x45_B_AUG
120, hlc_30Rnd_556x45_SOST_AUG
120, hlc_30Rnd_556x45_SPR_AUG
120, hlc_30Rnd_556x45_T_AUG
120, hlc_40Rnd_556x45_B_AUG
120, hlc_40Rnd_556x45_SOST_AUG
120, hlc_40Rnd_556x45_SPR_AUG
120, hlc_25Rnd_9x19mm_M882_AUG
120, hlc_25Rnd_9x19mm_JHP_AUG
120, hlc_25Rnd_9x19mm_subsonic_AUG

//NIArms AWM Rifles
120, hlc_rifle_awcovert
120, hlc_rifle_awcovert_BL
120, hlc_rifle_awcovert_FDE
120, hlc_rifle_awmagnum
120, hlc_rifle_awmagnum_BL
120, hlc_rifle_awmagnum_FDE
120, hlc_rifle_awMagnum_FDE_ghillie
120, hlc_rifle_awMagnum_BL_ghillie
120, hlc_rifle_awMagnum_OD_ghillie

//NIArms AWM Ammo
120, hlc_5rnd_300WM_FMJ_AWM
120, hlc_5rnd_300WM_AP_AWM
120, hlc_5rnd_300WM_BTSP_AWM
120, hlc_5rnd_300WM_mk248_AWM
120, hlc_5rnd_300WM_SBT_AWM

//NIArms FAL Rifles
120, hlc_rifle_l1a1slr
120, hlc_rifle_SLR
120, hlc_rifle_STG58F
120, hlc_rifle_FAL5061
120, hlc_rifle_c1A1
120, hlc_rifle_LAR
120, hlc_rifle_SLRchopmod
120, hlc_rifle_falosw
120, hlc_rifle_osw_GL

//NIArms FAL Attatchments
120, hlc_optic_PVS4FAL
120, hlc_optic_suit
120, hlc_muzzle_snds_fal

//NIArms FAL Ammo
120, hlc_20Rnd_762x51_B_fal
120, hlc_20Rnd_762x51_t_fal
120, hlc_20Rnd_762x51_S_fal
120, hlc_50rnd_762x51_M_FAL 

//NIArms G3 Rifles
120, hlc_rifle_g3sg1
120, hlc_rifle_psg1
120, hlc_rifle_g3a3
120, hlc_rifle_g3a3ris
120, hlc_rifle_g3ka4
120, hlc_rifle_g3ka4_GL
120, hlc_rifle_hk51
120, hlc_rifle_hk53
120, hlc_rifle_hk53RAS
120, hlc_rifle_hk33a2
120, hlc_rifle_hk33a2RIS
120, hlc_rifle_psg1A1
120, hlc_rifle_PSG1A1_RIS
120, hlc_rifle_g3a3v

//NIArms G3 Attatchments
120, HLC_Optic_ZFSG1
120, hlc_optic_accupoint_g3

//NIArms G3 Ammo
120, hlc_20Rnd_762x51_B_G3
120, hlc_20rnd_762x51_T_G3
120, hlc_50rnd_762x51_M_G3 

//NIArms G36 Rifles
120, hlc_rifle_G36A1
120, hlc_rifle_G36A1AG36
120, hlc_rifle_G36KA1
120, hlc_rifle_G36C
120, hlc_rifle_G36E1
120, hlc_rifle_G36E1AG36
120, hlc_rifle_G36KE1
120, hlc_rifle_G36V
120, hlc_rifle_G36KV
120, hlc_rifle_G36CV
120, hlc_rifle_G36VAG36
120, hlc_rifle_G36TAC
120, hlc_rifle_G36KTAC
120, hlc_rifle_G36CTAC
120, hlc_rifle_G36MLIC
120, hlc_rifle_G36KMLIC
120, hlc_rifle_G36CMLIC
120, hlc_rifle_G36MLIAG36

//NIArms G36 Attatchments
120, HLC_Optic_G36dualoptic35x
120, HLC_Optic_G36dualoptic35x2d
120, HLC_Optic_G36Export35x
120, HLC_Optic_G36Export35x2d
120, HLC_Optic_G36Dualoptic15x
120, HLC_Optic_G36Dualoptic15x2d
120, HLC_Optic_G36Export15x
120, HLC_Optic_G36Export15x2d

//NIArms G36 Ammo
120, hlc_30rnd_556x45_EPR_G36 
120, hlc_30rnd_556x45_SOST_G36
120, hlc_30rnd_556x45_SPR_G36
120, hlc_100rnd_556x45_EPR_G36

//NIArms M14 Rifles
120, hlc_rifle_M14
120, hlc_rifle_M21
120, hlc_rifle_M14DMR
120, hlc_rifle_m14sopmod

//NIArms M14 Attatchments
120, hlc_muzzle_snds_M14
120, hlc_optic_artel_m14
120, hlc_optic_LRT_m14

//NiArms M14 Ammo
120, hlc_20Rnd_762x51_B_M14
120, hlc_20rnd_762x51_T_M14
120, hlc_50rnd_762x51_M_M14

//NIArms M60 GPMGs
120, hlc_lmg_M60E4
120, hlc_lmg_m60

//NIArms M60 GPMG Ammo
120, hlc_100Rnd_762x51_B_M60E4
120, hlc_100Rnd_762x51_T_M60E4
120, hlc_100Rnd_762x51_M_M60E4

// NIArms MP5 SMGs
120, hlc_smg_mp5k_PDW
120, hlc_smg_mp5k
120, hlc_smg_mp5a2
120, hlc_smg_mp5a3
120, hlc_smg_mp5a4
120, hlc_smg_mp5n
120, hlc_smg_mp510
120, hlc_smg_mp5sd5
120, hlc_smg_mp5sd6
120, hlc_smg_9mmar

// NIArms MP5 SMG Attatchments
120, hlc_muzzle_Agendasix
120, hlc_muzzle_Tundra
120, hlc_muzzle_Agendasix10mm

// NIArms MP5 SMG Ammo
120, hlc_30Rnd_9x19_B_MP5
120, hlc_30Rnd_9x19_GD_MP5
120, hlc_30Rnd_9x19_SD_MP5
120, hlc_30Rnd_10mm_B_MP5
120, hlc_30Rnd_10mm_JHP_MP5

//NIArms Minimi LMGs
120, hlc_lmg_minimipara
120, hlc_lmg_minimi
120, hlc_lmg_minimi_railed
120, hlc_lmg_m249para
120, hlc_lmg_M249E2
120, hlc_m249_pip1
120, hlc_m249_pip2
120, hlc_m249_pip3
120, hlc_m249_pip4

//NIArms Minimi LMG Ammo
120, hlc_200rnd_556x45_M_SAW
120, hlc_200rnd_556x45_T_SAW
120, hlc_200rnd_556x45_B_SAW

//NIArms SG510 Rifles
120, hlc_rifle_STGW57
120, hlc_rifle_stgw57_RIS
120, hlc_rifle_stgw57_commando
120, hlc_rifle_sig5104
120, hlc_rifle_amt

//NIArms SG510 Attatchments
120, hlc_optic_Kern
120, hlc_optic_Kern2d

//NIArms SG510 Ammo
120, hlc_24Rnd_75x55_B_stgw
120, hlc_24Rnd_75x55_ap_stgw
120, hlc_20Rnd_762x51_b_amt
120, hlc_20Rnd_762x51_mk316_amt
120, hlc_20Rnd_762x51_bball_amt
120, hlc_20Rnd_762x51_T_amt
120, hlc_24Rnd_75x55_T_stgw


///////////////////////////////////////////////////////////////////////////////
// Kiosks, Supermarkets etc.
///////////////////////////////////////////////////////////////////////////////

> Shop

///////////////////////////////////////////////////////////////////////////////
//Arma and Exile - Shop
///////////////////////////////////////////////////////////////////////////////

// Items

200, Exile_Item_PlasticBottleEmpty
100, Exile_Item_PlasticBottleFreshWater
30, Exile_Item_Energydrink
150, Exile_Item_Beer
150, Exile_Item_GloriousKnakworst
170, Exile_Item_SausageGravy
170, Exile_Item_ChristmasTinner
170, Exile_Item_BBQSandwich
190, Exile_Item_Surstromming
200, Exile_Item_Catfood
20, Exile_Item_ChristmasTinner_Cooked
20, Exile_Item_BBQSandwich_Cooked
20, Exile_Item_GloriousKnakworst_Cooked
20, Exile_Item_SausageGravy_Cooked
20, Exile_Item_Surstromming_Cooked
20, Exile_Item_Catfood_Cooked

40, Binocular
10, Exile_Item_CamoTentKit
65, Exile_Item_CookingPot
200, Exile_Item_DuctTape
80, Exile_Item_LightBulb
150, Exile_Item_Matches
90, Exile_Item_InstaDoc
40, ItemGPS

// Smoke Nades
50, SmokeShell
50, SmokeShellRed
50, SmokeShellGreen
50, SmokeShellYellow
50, SmokeShellPurple
50, SmokeShellBlue
50, SmokeShellOrange

// Pistols
100, hgun_ACPC2_F
100, hgun_Rook150_F 
100, hgun_P07_F 
70, hgun_Pistol_heavy_01_F
70, hgun_Pistol_heavy_02_F
50, hgun_Pistol_Signal_F

// Pistol Magazines
80, 11Rnd_45ACP_Mag
80, 16Rnd_9x21_Mag
80, 30Rnd_9x21_Mag
70, 6Rnd_45ACP_Cylinder
60, 6Rnd_GreenSignal_F  
60, 6Rnd_RedSignal_F 
80, 9Rnd_45ACP_Mag

// Pistol Items
40, muzzle_snds_L
40, muzzle_snds_acp
10, optic_Yorris
30, optic_MRD




///////////////////////////////////////////////////////////////////////////////
// Factories, Construction Sites, Warehouses, Research etc.
///////////////////////////////////////////////////////////////////////////////

> Industrial

///////////////////////////////////////////////////////////////////////////////
//Arma and Exile - Industrial
///////////////////////////////////////////////////////////////////////////////

30, Exile_Item_DuctTape
25, Exile_Item_ExtensionCord
10, Exile_Item_FloodLightKit
25, Exile_Item_FuelCanisterEmpty
25, Exile_Item_FuelCanisterFull
25, Exile_Item_JunkMetal
20, Exile_Item_LightBulb
10, Exile_Item_MetalBoard
10, Exile_Item_PortableGeneratorKit
25, Exile_Item_Rope
10, Exile_Magazine_Battery
20, Exile_Melee_Axe
15, Exile_Item_Knife
25, Exile_Item_MetalWire
25, Exile_Item_Pliers
10, Exile_Item_Grinder
10, Exile_Item_BaseCameraKit
20, Exile_Item_Shovel
20, Exile_Item_Sand
20, Exile_Item_Cement
25, Exile_Item_WaterCanisterDirtyWater
25, Exile_Item_WaterCanisterEmpty
25, Exile_Item_MetalScrews
25, Exile_Item_Screwdriver
25, Exile_Item_MetalPole
25, Exile_Item_Foolbox
20, Exile_Item_Magazine01
20, Exile_Item_Magazine02
25, Exile_Item_Magazine03
25, Exile_Item_Magazine04
25, Exile_Item_Handsaw
25, Exile_Item_PortableGeneratorKit
20, Exile_Item_SledgeHammer
10, Exile_Item_MobilePhone
5, Exile_Item_Knife

///////////////////////////////////////////////////////////////////////////////
// Fuel Stations, Garages, Workshops etc.
///////////////////////////////////////////////////////////////////////////////

> VehicleService

///////////////////////////////////////////////////////////////////////////////
//Arma and Exile - VehicleService
///////////////////////////////////////////////////////////////////////////////
 
30, Exile_Item_DuctTape
25, Exile_Item_ExtensionCord
10, Exile_Item_FloodLightKit
25, Exile_Item_FuelCanisterEmpty
25, Exile_Item_FuelCanisterFull
25, Exile_Item_JunkMetal
20, Exile_Item_LightBulb
10, Exile_Item_MetalBoard
10, Exile_Item_PortableGeneratorKit
25, Exile_Item_Rope
10, Exile_Magazine_Battery
20, Exile_Melee_Axe
15, Exile_Item_Knife
25, Exile_Item_MetalWire
25, Exile_Item_Pliers
10, Exile_Item_Grinder
10, Exile_Item_BaseCameraKit
20, Exile_Item_Shovel
20, Exile_Item_Sand
20, Exile_Item_Cement
25, Exile_Item_WaterCanisterDirtyWater
25, Exile_Item_WaterCanisterEmpty
25, Exile_Item_MetalScrews
25, Exile_Item_Screwdriver
25, Exile_Item_MetalPole
25, Exile_Item_Foolbox
20, Exile_Item_Magazine01
20, Exile_Item_Magazine02
25, Exile_Item_Magazine03
25, Exile_Item_Magazine04
25, Exile_Item_Handsaw
25, Exile_Item_PortableGeneratorKit
10, Exile_Item_SledgeHammer
5, Exile_Item_Knife


///////////////////////////////////////////////////////////////////////////////
// Towers, Barracks, Hangars etc.
///////////////////////////////////////////////////////////////////////////////

> Military

///////////////////////////////////////////////////////////////////////////////
//Arma and Exile - Military
///////////////////////////////////////////////////////////////////////////////

//Bullet Cam Mags
100, Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag
100, Exile_Magazine_5Rnd_10Rnd_93x64_DMR_05_Bullet_Cam_Mag
100, Exile_Magazine_7Rnd_408_Bullet_Cam_Mag
100, Exile_Magazine_10Rnd_338_Bullet_Cam_Mag

// LMGs
300, arifle_MX_SW_Black_F
300, arifle_MX_SW_F
300, LMG_Mk200_F
300, LMG_Zafir_F
300, MMG_01_hex_F
300, MMG_01_tan_F
300, MMG_02_camo_F
300, MMG_02_black_F
300, MMG_02_sand_F
300, arifle_SPAR_02_blk_F
300, arifle_SPAR_02_khk_F
300, arifle_SPAR_02_snd_F

// LMG Ammo
120, 100Rnd_65x39_caseless_mag
120, 100Rnd_65x39_caseless_mag_Tracer
120, 150Rnd_762x54_Box
120, 150Rnd_762x54_Box_Tracer
120, 200Rnd_65x39_Belt
120, 200Rnd_65x39_Belt_Tracer_Green
120, 200Rnd_65x39_Belt_Tracer_Red
120, 200Rnd_65x39_Belt_Tracer_Yellow
120, 130Rnd_338_Mag
120, 150Rnd_93x64_Mag

// Rifles
120, arifle_Katiba_F              
120, arifle_Katiba_GL_F
120, arifle_MXC_F            
120, arifle_MX_F            
120, arifle_MX_GL_F              
120, arifle_MXM_F            
120, arifle_MXM_Black_F
120, arifle_SDAR_F            
120, arifle_TRG21_F              
120, arifle_TRG20_F             
120, arifle_TRG21_GL_F
120, arifle_Mk20_F            
120, arifle_Mk20C_F            
120, arifle_Mk20_GL_F
120, arifle_MXC_Black_F
120, arifle_MX_Black_F
120, arifle_MX_GL_Black_F
120, arifle_SPAR_01_GL_blk_F
120, arifle_SPAR_01_GL_khk_F
120, arifle_SPAR_01_GL_snd_F
120, arifle_SPAR_03_blk_F
120, arifle_SPAR_03_khk_F
120, arifle_SPAR_03_snd_F
120, arifle_ARX_blk_F
120, arifle_ARX_ghex_F
120, arifle_ARX_hex_F

// Rifle Items
200, muzzle_snds_M
200, muzzle_snds_H
200, optic_Arco
200, optic_Hamr
200, optic_Holosight
200, acc_pointer_IR
200, optic_MRCO
200, acc_flashlight
15, optic_NVS
10, optic_Nightstalker
10, optic_tws
10, optic_tws_mg

// Rifle Ammo
120, 20Rnd_556x45_UW_mag
120, 30Rnd_556x45_Stanag    
150, 30Rnd_556x45_Stanag_Tracer_Green
150, 30Rnd_556x45_Stanag_Tracer_Red
150, 30Rnd_556x45_Stanag_Tracer_Yellow
120, 30Rnd_65x39_caseless_green    
150, 30Rnd_65x39_caseless_green_mag_Tracer
120, 30Rnd_65x39_caseless_mag
150, 30Rnd_65x39_caseless_mag_Tracer
120, 10Rnd_50BW_Mag_F

// Snipers
350, srifle_DMR_01_F
350, srifle_EBR_F
350, srifle_GM6_F
350, srifle_GM6_camo_F
350, srifle_GM6_ghex_F
350, srifle_LRR_F
350, srifle_LRR_camo_F
350, srifle_LRR_tna_F
250, srifle_DMR_02_F
250, srifle_DMR_02_camo_F
250, srifle_DMR_02_sniper_F
250, srifle_DMR_05_blk_F
250, srifle_DMR_05_hex_F
250, srifle_DMR_05_tan_F
250, srifle_DMR_04_F
250, srifle_DMR_04_Tan_F
250, srifle_DMR_03_F
250, srifle_DMR_03_khaki_F
250, srifle_DMR_03_tan_F
250, srifle_DMR_03_multicam_F
250, srifle_DMR_03_woodland_F
250, srifle_DMR_06_camo_F
250, srifle_DMR_06_olive_F
250, srifle_DMR_06_camo_khs_F
250, srifle_DMR_07_blk_F
250, srifle_DMR_07_hex_F
250, srifle_DMR_07_ghex_F

// Sniper Ammo
125, 5Rnd_127x108_Mag
125, 7Rnd_1508_Mag
150, 10Rnd_762x51_Mag
150, 20Rnd_762x51_Mag
115, 5Rnd_127x108_APDS_Mag
120, 10Rnd_338_Mag
120, 10Rnd_93x64_DMR_05_Mag
120, 10Rnd_127x54_Mag
120, 20Rnd_650x39_Cased_Mag_F


// Sniper Items
175, muzzle_snds_B
200, optic_DMS
200, optic_SOS
200, optic_LRPS
120, muzzle_snds_338_black
120, muzzle_snds_338_green
120, muzzle_snds_338_sand
120, muzzle_snds_93mmg
120, muzzle_snds_93mmg_tan

// Noob Tube Nades
100, 1Rnd_HE_Grenade_shell
75, 3Rnd_HE_Grenade_shell

// Smoke Nades
50, SmokeShell
50, SmokeShellRed
50, SmokeShellGreen
50, SmokeShellYellow
50, SmokeShellPurple
50, SmokeShellBlue
50, SmokeShellOrange

// Noob Tube Flares
15, 3Rnd_UGL_FlareGreen_F
15, 3Rnd_UGL_FlareRed_F
15, 3Rnd_UGL_FlareWhite_F
15, 3Rnd_UGL_FlareYellow_F
35, UGL_FlareGreen_F
35, UGL_FlareRed_F
35, UGL_FlareWhite_F
35, UGL_FlareYellow_F

// No Infrared for now
//UGL_FlareCIR_F    
//3Rnd_UGL_FlareCIR_F

// Noob Tube Smokes
35, 1Rnd_Smoke_Grenade_shell
35, 1Rnd_SmokeBlue_Grenade_shell
35, 1Rnd_SmokeGreen_Grenade_shell
35, 1Rnd_SmokeOrange_Grenade_shell
35, 1Rnd_SmokePurple_Grenade_shell
35, 1Rnd_SmokeRed_Grenade_shell
35, 1Rnd_SmokeYellow_Grenade_shell
15, 3Rnd_Smoke_Grenade_shell
15, 3Rnd_SmokeBlue_Grenade_shell
15, 3Rnd_SmokeGreen_Grenade_shell
15, 3Rnd_SmokeOrange_Grenade_shell
15, 3Rnd_SmokePurple_Grenade_shell
15, 3Rnd_SmokeRed_Grenade_shell
15, 3Rnd_SmokeYellow_Grenade_shell

// Explosives
100, HandGrenade
100, MiniGrenade
25, IEDUrbanBig_Remote_Mag
25, IEDUrbanSmall_Remote_Mag
25, DemoCharge_Remote_Mag
25, APERSMine_Range_Mag
25, APERSTripMine_Wire_Mag
25, ClaymoreDirectionalMine_Remote_Mag

// Items
70, Binocular
50, ItemRadio
150, ItemGPS
100, NVGoggles
120, Exile_Item_InstaDoc
150, Exile_Item_EMRE
150, Exile_Item_PlasticBottleFreshWater

// Backpacks
40, B_OutdoorPack_blk
40, B_OutdoorPack_tan
40, B_OutdoorPack_blu
20, B_HuntingBackpack

20, B_AssaultPack_khk
20, B_AssaultPack_dgtl
20, B_AssaultPack_rgr
20, B_AssaultPack_sgg
20, B_AssaultPack_blk
20, B_AssaultPack_cbr
20, B_AssaultPack_mcamo

75, B_Kitbag_mcamo
75, B_Kitbag_sgg
75, B_Kitbag_cbr

40, B_FieldPack_blk
40, B_FieldPack_ocamo
40, B_FieldPack_oucamo
40, B_FieldPack_cbr

100, B_Bergen_sgg
100, B_Bergen_mcamo
100, B_Bergen_rgr
100, B_Bergen_blk

110, B_Carryall_ocamo
110, B_Carryall_oucamo
110, B_Carryall_mcamo
110, B_Carryall_oli
110, B_Carryall_khk
110, B_Carryall_cbr

// Headgear
/*70, H_MilCap_ocamo
70, H_MilCap_mcamo
70, H_MilCap_oucamo
70, H_MilCap_blue
70, H_MilCap_rucamo
70, H_MilCap_dgtl
*/
70, H_HelmetB
70, H_HelmetB_paint
70, H_HelmetB_light
70, H_HelmetB_plain_blk
70, H_HelmetSpecB
70, H_HelmetSpecB_paint1
70, H_HelmetSpecB_paint2
70, H_HelmetSpecB_blk
70, H_HelmetIA
70, H_HelmetIA_net
70, H_HelmetIA_camo
70, H_HelmetB_grass
70, H_HelmetB_snakeskin
70, H_HelmetB_desert
70, H_HelmetB_black
70, H_HelmetB_sand
70, H_HelmetB_light_grass
70, H_HelmetB_light_snakeskin
70, H_HelmetB_light_desert
70, H_HelmetB_light_black
70, H_HelmetB_light_sand

150, H_HelmetCrew_B
150, H_HelmetCrew_O
150, H_HelmetCrew_I

30, H_PilotHelmetFighter_B
30, H_PilotHelmetFighter_O
30, H_PilotHelmetFighter_I

30, H_PilotHelmetHeli_B
30, H_PilotHelmetHeli_O
30, H_PilotHelmetHeli_I

25, H_HelmetB_camo

30, H_CrewHelmetHeli_B
30, H_CrewHelmetHeli_O
30, H_CrewHelmetHeli_I
/*
25, H_BandMask_khk
25, H_BandMask_reaper
25, H_BandMask_demon
*/
10, H_HelmetO_oucamo
10, H_HelmetLeaderO_oucamo
10, H_HelmetSpecO_ocamo
10, H_HelmetSpecO_blk
10, H_HelmetO_ocamo
10, H_HelmetLeaderO_ocamo

// Vests
//70, V_Rangemaster_belt
70, V_PlateCarrier1_blk
70, V_PlateCarrier1_rgr
70, V_PlateCarrier2_rgr
70, V_PlateCarrier3_rgr
70, V_PlateCarrierGL_rgr
70, V_PlateCarrierIA1_dgtl
70, V_PlateCarrierIA2_dgtl
70, V_PlateCarrierIAGL_dgtl
70, V_PlateCarrierSpec_rgr

50, V_TacVest_blk
50, V_TacVest_brn
50, V_TacVest_camo
50, V_TacVest_khk
50, V_TacVest_oli
50, V_TacVestCamo_khk
50, V_TacVestIR_blk

30, V_RebreatherB
30, V_RebreatherIR
30, V_RebreatherIA

100, V_PlateCarrierL_CTRG
100, V_PlateCarrierH_CTRG

// Uniforms
170, U_B_CTRG_1
170, U_B_CTRG_2
170, U_B_CTRG_3
150, U_B_CombatUniform_mcam
170, U_B_CombatUniform_mcam_tshirt
170, U_B_CombatUniform_mcam_vest
190, U_B_CombatUniform_mcam_worn
130, U_B_SpecopsUniform_sgg
120, U_O_OfficerUniform_ocamo
120, U_I_OfficerUniform
135, U_I_CombatUniform
135, U_I_CombatUniform_tshirt
135, U_I_CombatUniform_shortsleeve

115, U_B_GhillieSuit
115, U_O_GhillieSuit
115, U_I_GhillieSuit

135, U_B_HeliPilotCoveralls
135, U_O_PilotCoveralls
135, U_B_PilotCoveralls
135, U_I_pilotCoveralls
135, U_I_HeliPilotCoveralls

125, U_B_Wetsuit
125, U_O_Wetsuit
125, U_I_Wetsuit

115, U_O_CombatUniform_ocamo
115, U_O_CombatUniform_oucamo
115, U_O_SpecopsUniform_ocamo
115, U_O_SpecopsUniform_blk




/////////////////////////////////////////////////////////////////
//NIArms - Military
/////////////////////////////////////////////////////////////////

//NiArms AK Rifles
50, hlc_rifle_ak74
50, hlc_rifle_ak74_MTK
50, hlc_rifle_ak74_dirty
50, hlc_rifle_ak74_dirty2
50, hlc_rifle_aks74
50, hlc_rifle_aks74_MTK
50, hlc_rifle_aks74u
50, hlc_rifle_aks74u_MTK
50, hlc_rifle_ak47
50, hlc_rifle_akm
50, hlc_rifle_akm_MTK
80, hlc_rifle_rpk
50, hlc_rifle_ak12
50, hlc_rifle_aku12
80, hlc_rifle_rpk12
80, hlc_rifle_rpk74n
50, hlc_rifle_ak12gl
50, hlc_rifle_akmgl
50, hlc_rifle_aks74_GL
75, hlc_rifle_saiga12k
50, hlc_rifle_aek971
50, hlc_rifle_aek971
50, hlc_rifle_aek971_mtk
50, hlc_rifle_RK62
50, hlc_rifle_slr107u
50, hlc_rifle_slr107u_MTK
50, hlc_rifle_ak74m
50, hlc_rifle_ak74m_gl
50, hlc_rifle_ak74m_MTK

//NiArms AK Ammo
50, hlc_30Rnd_545x39_B_AK
50, hlc_30Rnd_545x39_T_AK
50, hlc_30Rnd_545x39_EP_AK
50, hlc_45Rnd_545x39_t_rpk
50, hlc_60Rnd_545x39_t_rpk
50, hlc_30Rnd_762x39_b_ak
50, hlc_30Rnd_762x39_t_ak
50, hlc_45Rnd_762x39_t_rpk
50, hlc_45Rnd_762x39_m_rpk
50, hlc_75rnd_762x39_m_rpk
50, hlc_10rnd_12g_buck_S12
50, hlc_10rnd_12g_slug_S12
50, hlc_VOG25_AK
50, hlc_GRD_White
50, hlc_GRD_red
50, hlc_GRD_green
50, hlc_GRD_blue
50, hlc_GRD_orange
50, hlc_GRD_purple

//NiArms AK Attatchments
120, HLC_Optic_PSO1
120, HLC_Optic_1p29
120, hlc_muzzle_545SUP_AK
120, hlc_muzzle_762SUP_AK
120, hlc_optic_kobra
10, hlc_optic_goshawk

//NIArms AR15 Rifles
120, hlc_rifle_RU556
120, hlc_rifle_RU5562
120, hlc_rifle_Colt727
120, hlc_rifle_Colt727_GL
120, hlc_rifle_bcmjack
120, hlc_rifle_vendimus
120, hlc_rifle_SAMR
120, hlc_rifle_honeybase
120, hlc_rifle_honeybadger
120, hlc_rifle_cqbr
120, hlc_rifle_m4

//NIArms AR15 Attatchments
120, hlc_muzzle_556NATO_KAC
120, hlc_muzzle_300blk_KAC

//NIArms AR15 Ammo
120, 29rnd_300BLK_STANAG
120, 29rnd_300BLK_STANAG_T
120, 29rnd_300BLK_STANAG_S
120, hlc_30rnd_556x45_EPR
120, hlc_30rnd_556x45_SOST
120, hlc_30rnd_556x45_SPR

//NIArms AUG Rifles
40, hlc_rifle_aug
40, hlc_rifle_auga1_t
40, hlc_rifle_auga1_B
40, hlc_rifle_auga1carb
40, hlc_rifle_auga1carb_t
40, hlc_rifle_auga1carb_b
40, hlc_rifle_aughbar
40, hlc_rifle_aughbar_b
40, hlc_rifle_aughbar_t
40, hlc_rifle_augpara
40, hlc_rifle_augpara_b
40, hlc_rifle_augpara_t
75, hlc_rifle_auga2
75, hlc_rifle_auga2_b
75, hlc_rifle_auga2_t
75, hlc_rifle_auga2carb
75, hlc_rifle_auga2carb_t
75, hlc_rifle_auga2carb_b
75, hlc_rifle_auga2lsw
75, hlc_rifle_auga2lsw_t
75, hlc_rifle_auga2lsw_b
75, hlc_rifle_auga2para
75, hlc_rifle_auga2para_b
75, hlc_rifle_auga2para_t
75, hlc_rifle_augsr
75, hlc_rifle_augsr_b
75, hlc_rifle_augsr_t
75, hlc_rifle_augsrcarb
75, hlc_rifle_augsrcarb_t
75, hlc_rifle_augsrcarb_b
75, hlc_rifle_augsrhbar
75, hlc_rifle_augsrhbar_b
75, hlc_rifle_augsrhbar_t
40, hlc_rifle_auga3
40, hlc_rifle_auga3_bl
40, hlc_rifle_auga3_b
40, hlc_rifle_auga3_GL
40, hlc_rifle_auga3_GL_BL 
40, hlc_rifle_auga3_GL_B

//NIArms AUG Attatchments
120, hlc_muzzle_snds_AUG
120, hlc_muzzle_snds_a6AUG

//NIArms AUG Ammo
120, hlc_30Rnd_556x45_B_AUG
120, hlc_30Rnd_556x45_SOST_AUG
120, hlc_30Rnd_556x45_SPR_AUG
120, hlc_30Rnd_556x45_T_AUG
120, hlc_40Rnd_556x45_B_AUG
120, hlc_40Rnd_556x45_SOST_AUG
120, hlc_40Rnd_556x45_SPR_AUG
120, hlc_25Rnd_9x19mm_M882_AUG
120, hlc_25Rnd_9x19mm_JHP_AUG
120, hlc_25Rnd_9x19mm_subsonic_AUG

//NIArms AWM Rifles
150, hlc_rifle_awcovert
150, hlc_rifle_awcovert_BL
150, hlc_rifle_awcovert_FDE
150, hlc_rifle_awmagnum
150, hlc_rifle_awmagnum_BL
150, hlc_rifle_awmagnum_FDE
150, hlc_rifle_awMagnum_FDE_ghillie
150, hlc_rifle_awMagnum_BL_ghillie
150, hlc_rifle_awMagnum_OD_ghillie

//NIArms AWM Ammo
120, hlc_5rnd_300WM_FMJ_AWM
120, hlc_5rnd_300WM_AP_AWM
120, hlc_5rnd_300WM_BTSP_AWM
120, hlc_5rnd_300WM_mk248_AWM
120, hlc_5rnd_300WM_SBT_AWM

//NIArms FAL Rifles
120, hlc_rifle_l1a1slr
120, hlc_rifle_SLR
120, hlc_rifle_STG58F
120, hlc_rifle_FAL5061
120, hlc_rifle_c1A1
120, hlc_rifle_LAR
120, hlc_rifle_SLRchopmod
120, hlc_rifle_falosw
120, hlc_rifle_osw_GL

//NIArms FAL Attatchments
120, hlc_optic_PVS4FAL
120, hlc_optic_suit
120, hlc_muzzle_snds_fal

//NIArms FAL Ammo
120, hlc_20Rnd_762x51_B_fal
120, hlc_20Rnd_762x51_t_fal
120, hlc_20Rnd_762x51_S_fal
120, hlc_50rnd_762x51_M_FAL 

//NIArms G3 Rifles
120, hlc_rifle_g3sg1
120, hlc_rifle_psg1
120, hlc_rifle_g3a3
120, hlc_rifle_g3a3ris
120, hlc_rifle_g3ka4
120, HLC_Rifle_g3ka4_GL
120, hlc_rifle_hk51
120, hlc_rifle_hk53
120, hlc_rifle_hk53RAS
120, hlc_rifle_hk33a2
120, hlc_rifle_hk33a2RIS
120, hlc_rifle_psg1A1
120, hlc_rifle_PSG1A1_RIS
120, hlc_rifle_g3a3v

//NIArms G3 Attatchments
120, HLC_Optic_ZFSG1
120, hlc_optic_accupoint_g3

//NIArms G3 Ammo
120, hlc_20Rnd_762x51_B_G3
120, hlc_20rnd_762x51_T_G3
120, hlc_50rnd_762x51_M_G3 

//NIArms G36 Rifles
75, hlc_rifle_G36A1
75, hlc_rifle_G36A1AG36
75, hlc_rifle_G36KA1
75, hlc_rifle_G36C
75, hlc_rifle_G36E1
75, hlc_rifle_G36E1AG36
75, hlc_rifle_G36KE1
75, hlc_rifle_G36V
75, hlc_rifle_G36KV
75, hlc_rifle_G36CV
75, hlc_rifle_G36VAG36
75, hlc_rifle_G36TAC
75, hlc_rifle_G36KTAC
75, hlc_rifle_G36CTAC
75, hlc_rifle_G36MLIC
75, hlc_rifle_G36KMLIC
75, hlc_rifle_G36CMLIC
75, hlc_rifle_G36MLIAG36

//NIArms G36 Attatchments
120, HLC_Optic_G36dualoptic35x
120, HLC_Optic_G36dualoptic35x2d
120, HLC_Optic_G36Export35x
120, HLC_Optic_G36Export35x2d
120, HLC_Optic_G36Dualoptic15x
120, HLC_Optic_G36Dualoptic15x2d
120, HLC_Optic_G36Export15x
120, HLC_Optic_G36Export15x2d

//NIArms G36 Ammo
120, hlc_30rnd_556x45_EPR_G36 
120, hlc_30rnd_556x45_SOST_G36
120, hlc_30rnd_556x45_SPR_G36
120, hlc_100rnd_556x45_EPR_G36

//NIArms M14 Rifles
150, hlc_rifle_M14
150, hlc_rifle_M21
150, hlc_rifle_M14DMR
150, hlc_rifle_m14sopmod

//NIArms M14 Attatchments
150, hlc_muzzle_snds_M14
150, hlc_optic_artel_m14
150, hlc_optic_LRT_m14

//NiArms M14 Ammo
120, hlc_20Rnd_762x51_B_M14
120, hlc_20rnd_762x51_T_M14
120, hlc_50rnd_762x51_M_M14

//NIArms M60 GPMGs
120, hlc_lmg_M60E4
120, hlc_lmg_m60

//NIArms M60 GPMG Ammo
120, hlc_100Rnd_762x51_B_M60E4
120, hlc_100Rnd_762x51_T_M60E4
120, hlc_100Rnd_762x51_M_M60E4

// NIArms MP5 SMGs
120, hlc_smg_mp5k_PDW
120, hlc_smg_mp5k
120, hlc_smg_mp5a2
120, hlc_smg_mp5a3
120, hlc_smg_mp5a4
120, hlc_smg_mp5n
120, hlc_smg_mp510
120, hlc_smg_mp5sd5
120, hlc_smg_mp5sd6
120, hlc_smg_9mmar

// NIArms MP5 SMG Attatchments
120, hlc_muzzle_Agendasix
120, hlc_muzzle_Tundra
120, hlc_muzzle_Agendasix10mm

// NIArms MP5 SMG Ammo
120, 120, hlc_30Rnd_9x19_B_MP5
120, hlc_30Rnd_9x19_GD_MP5
120, hlc_30Rnd_9x19_SD_MP5
120, hlc_30Rnd_10mm_B_MP5
120, hlc_30Rnd_10mm_JHP_MP5

//NIArms Minimi LMGs
120, hlc_lmg_minimipara
120, hlc_lmg_minimi
120, hlc_lmg_minimi_railed
120, hlc_lmg_m249para
120, hlc_lmg_M249E2
120, hlc_m249_pip1
120, hlc_m249_pip2
120, hlc_m249_pip3
120, hlc_m249_pip4

//NIArms Minimi LMG Ammo
120, hlc_200rnd_556x45_M_SAW
120, hlc_200rnd_556x45_T_SAW
120, hlc_200rnd_556x45_B_SAW

//NIArms SG510 Rifles
120, hlc_rifle_STGW57
120, hlc_rifle_stgw57_RIS
120, hlc_rifle_stgw57_commando
120, hlc_rifle_sig5104
120, hlc_rifle_amt

//NIArms SG510 Attatchments
120, hlc_optic_Kern
120, hlc_optic_Kern2d

//NIArms SG510 Ammo
120, hlc_24Rnd_75x55_B_stgw
120, hlc_24Rnd_75x55_ap_stgw
120, hlc_20Rnd_762x51_b_amt
120, hlc_20Rnd_762x51_mk316_amt
120, hlc_20Rnd_762x51_bball_amt
120, hlc_20Rnd_762x51_T_amt
120, hlc_24Rnd_75x55_T_stgw


///////////////////////////////////////////////////////////////////////////////
// Hospital, Medevac etc.
///////////////////////////////////////////////////////////////////////////////

> Medical

100, Exile_Item_InstaDoc


///////////////////////////////////////////////////////////////////////////////
// Light Houses + Life Guard Towers + Castles
///////////////////////////////////////////////////////////////////////////////

> Tourist

///////////////////////////////////////////////////////////////////////////////
// Arma and Exile - Tourist
///////////////////////////////////////////////////////////////////////////////

//Backpacks
100, B_Carryall_ocamo
100, B_Carryall_oucamo
100, B_Carryall_mcamo
100, B_Carryall_oli
100, B_Carryall_khk
100, B_Carryall_cbr
50, B_Bergen_mcamo_F
50, B_Bergen_dgtl_F
50, B_Bergen_hex_F
50, B_Bergen_tna_F

// Snipers
80, srifle_DMR_01_F
80, srifle_EBR_F
70, srifle_GM6_F
70, srifle_LRR_F

// Sniper Ammo
50, 5Rnd_127x108_Mag
50, 7Rnd_1508_Mag
60, 10Rnd_762x51_Mag
60, 20Rnd_762x51_Mag
150, 5Rnd_127x108_APDS_Mag

// Sniper Items
70, muzzle_snds_B
70, acc_flashlight
70, acc_pointer_IR
70, optic_DMS
70, optic_SOS
70, optic_LRPS

// Items
80, Binocular
75, Rangefinder
//50, Laserdesignator
50, ItemRadio
150, ItemGPS
100, NVGoggles
80, Exile_Item_InstaDoc

// Explosives
25, HandGrenade
25, MiniGrenade



/////////////////////////////////////////////////////////////////
//NIArms - Tourist
/////////////////////////////////////////////////////////////////

//NiArms AK Rifles
120, hlc_rifle_ak74
120, hlc_rifle_ak74_MTK
120, hlc_rifle_ak74_dirty
120, hlc_rifle_ak74_dirty2
120, hlc_rifle_aks74
120, hlc_rifle_aks74_MTK
120, hlc_rifle_aks74u
120, hlc_rifle_aks74u_MTK
120, hlc_rifle_ak47
120, hlc_rifle_akm
120, hlc_rifle_akm_MTK
120, hlc_rifle_rpk
120, hlc_rifle_ak12
120, hlc_rifle_aku12
120, hlc_rifle_rpk12
120, hlc_rifle_rpk74n
120, hlc_rifle_ak12gl
120, hlc_rifle_akmgl
120, hlc_rifle_aks74_GL
120, hlc_rifle_saiga12k
120, hlc_rifle_aek971
120, hlc_rifle_aek971
120, hlc_rifle_aek971_mtk
120, hlc_rifle_RK62
120, hlc_rifle_slr107u
120, hlc_rifle_slr107u_MTK
120, hlc_rifle_ak74m
120, hlc_rifle_ak74m_gl
120, hlc_rifle_ak74m_MTK

//NiArms AK Ammo
120, hlc_30Rnd_545x39_B_AK
120, hlc_30Rnd_545x39_T_AK
120, hlc_30Rnd_545x39_EP_AK
120, hlc_45Rnd_545x39_t_rpk
120, hlc_60Rnd_545x39_t_rpk
120, hlc_30Rnd_762x39_b_ak
120, hlc_30Rnd_762x39_t_ak
120, hlc_45Rnd_762x39_t_rpk
120, hlc_45Rnd_762x39_m_rpk
120, hlc_75rnd_762x39_m_rpk
120, hlc_10rnd_12g_buck_S12
120, hlc_10rnd_12g_slug_S12
120, hlc_VOG25_AK
120, hlc_GRD_White
120, hlc_GRD_red
120, hlc_GRD_green
120, hlc_GRD_blue
120, hlc_GRD_orange
120, hlc_GRD_purple

//NiArms AK Attatchments
120, HLC_Optic_PSO1
120, HLC_Optic_1p29
120, hlc_muzzle_545SUP_AK
120, hlc_muzzle_762SUP_AK
120, hlc_optic_kobra
120, hlc_optic_goshawk

//NIArms AR15 Rifles
120, hlc_rifle_RU556
120, hlc_rifle_RU5562
120, hlc_rifle_Colt727
120, hlc_rifle_Colt727_GL
120, hlc_rifle_bcmjack
120, hlc_rifle_vendimus
120, hlc_rifle_SAMR
120, hlc_rifle_honeybase
120, hlc_rifle_honeybadger
120, hlc_rifle_cqbr
120, hlc_rifle_m4

//NIArms AR15 Attatchments
120, hlc_muzzle_556NATO_KAC
120, hlc_muzzle_300blk_KAC

//NIArms AR15 Ammo
120, 29rnd_300BLK_STANAG
120, 29rnd_300BLK_STANAG_T
120, 29rnd_300BLK_STANAG_S
120, hlc_30rnd_556x45_EPR
120, hlc_30rnd_556x45_SOST
120, hlc_30rnd_556x45_SPR

//NIArms AUG Rifles
60, hlc_rifle_aug
60, hlc_rifle_auga1_t
60, hlc_rifle_auga1_B
60, hlc_rifle_auga1carb
60, hlc_rifle_auga1carb_t
60, hlc_rifle_auga1carb_b
60, hlc_rifle_aughbar
60, hlc_rifle_aughbar_b
60, hlc_rifle_aughbar_t
60, hlc_rifle_augpara
60, hlc_rifle_augpara_b
60, hlc_rifle_augpara_t
100, hlc_rifle_auga2
100, hlc_rifle_auga2_b
100, hlc_rifle_auga2_t
100, hlc_rifle_auga2carb
100, hlc_rifle_auga2carb_t
100, hlc_rifle_auga2carb_b
100, hlc_rifle_auga2lsw
100, hlc_rifle_auga2lsw_t
100, hlc_rifle_auga2lsw_b
100, hlc_rifle_auga2para
100, hlc_rifle_auga2para_b
100, hlc_rifle_auga2para_t
100, hlc_rifle_augsr
100, hlc_rifle_augsr_b
100, hlc_rifle_augsr_t
100, hlc_rifle_augsrcarb
100, hlc_rifle_augsrcarb_t
100, hlc_rifle_augsrcarb_b
100, hlc_rifle_augsrhbar
100, hlc_rifle_augsrhbar_b
100, hlc_rifle_augsrhbar_t
60, hlc_rifle_auga3
60, hlc_rifle_auga3_bl
60, hlc_rifle_auga3_b
60, hlc_rifle_auga3_GL
60, hlc_rifle_auga3_GL_BL 
60, hlc_rifle_auga3_GL_B

//NIArms AUG Attatchments
120, hlc_muzzle_snds_AUG
120, hlc_muzzle_snds_a6AUG

//NIArms AUG Ammo
120, hlc_30Rnd_556x45_B_AUG
120, hlc_30Rnd_556x45_SOST_AUG
120, hlc_30Rnd_556x45_SPR_AUG
120, hlc_30Rnd_556x45_T_AUG
120, hlc_40Rnd_556x45_B_AUG
120, hlc_40Rnd_556x45_SOST_AUG
120, hlc_40Rnd_556x45_SPR_AUG
120, hlc_25Rnd_9x19mm_M882_AUG
120, hlc_25Rnd_9x19mm_JHP_AUG
120, hlc_25Rnd_9x19mm_subsonic_AUG

//NIArms AWM Rifles
120, hlc_rifle_awcovert
120, hlc_rifle_awcovert_BL
120, hlc_rifle_awcovert_FDE
120, hlc_rifle_awmagnum
120, hlc_rifle_awmagnum_BL
120, hlc_rifle_awmagnum_FDE
120, hlc_rifle_awMagnum_FDE_ghillie
120, hlc_rifle_awMagnum_BL_ghillie
120, hlc_rifle_awMagnum_OD_ghillie

//NIArms AWM Ammo
120, hlc_5rnd_300WM_FMJ_AWM // 5-round .300WM Magazine loaded with MEN S230430 FMJ rounds.
120, hlc_5rnd_300WM_AP_AWM // 5-round .300WM Magazine loaded with MEN DM131 AP rounds.
120, hlc_5rnd_300WM_BTSP_AWM // 5-round .300WM Magazine loaded with 190grain Boat-Tail Soft-Tip rounds.
120, hlc_5rnd_300WM_mk248_AWM // 5-round .300WM Magazine loaded with Mk.248 Mod.1 OTM rounds.
120, hlc_5rnd_300WM_SBT_AWM // 5-round .300WM Magazine loaded with down-loaded Soft-tip rounds.

//NIArms FAL Rifles
120, hlc_rifle_l1a1slr // Enfield L1A1 SLR
120, hlc_rifle_SLR // Lithgow SLR (Australian manufactured L1A1)
120, hlc_rifle_STG58F // Steyr STG.58
120, hlc_rifle_FAL5061 // FN FAL 'Para'
120, hlc_rifle_c1A1 // FN C1A1 (Canadian SLR variant, manufactured by FN)
120, hlc_rifle_LAR // FN LAR (Light infantry rifle contracted to Israel, Differs from the Support variant by the omission of bipod and standard width barrel)
120, hlc_rifle_SLRchopmod // Lithgow SLR Chopmod 
120, hlc_rifle_falosw // DSA Arms FAL OSW (Offensive Suppression Weapon. Or Offensively Short Weapon)
120, hlc_rifle_osw_GL // DSA Arms FAL OSW + M203 GL

//NIArms FAL Attatchments
120, hlc_optic_PVS4FAL // AN/PVS4 Night Optic (Exclusive to the FALs)
120, hlc_optic_suit // SUIT Optic (Single Unit, infantry, Trilux. Exclusive to the FALs)
120, hlc_muzzle_snds_fal // FAL Suppressor

//NIArms FAL Ammo
120, hlc_20Rnd_762x51_B_fal
120, hlc_20Rnd_762x51_t_fal
120, hlc_20Rnd_762x51_S_fal // 20 Round magazine of 7.62x51mm cold-loaded ball (subsonic, for use with suppressor)
120, hlc_50rnd_762x51_M_FAL 

//NIArms G3 Rifles
120, hlc_rifle_g3sg1 // H&K G3SG1 (Designated marksman rifle)
120, hlc_rifle_psg1 // H&K PSG1 (Sniper Weapon System. So dedcated to the role that the tripod that it mounts to is not integral to the weapon)
120, hlc_rifle_g3a3
120, hlc_rifle_g3a3ris // H&K G3A3 + Pictatinny Rail Interface
120, hlc_rifle_g3ka4 // H&K G3KA4 (Modernised,slightly shorter Infantry rifle)
120, HLC_Rifle_g3ka4_GL // H&K G3KA4 + M203
120, hlc_rifle_hk51 // FR Ordnance MC51 (G3 rifle made as compact as an MP5. A Specfic request made by the SAS, apparently 50 made, but none saw combat)
120, hlc_rifle_hk53 // H&K HK53 (H&K's formalised solution to the SASR's dilemma, essentially an HK33 made to fit the same size package as the MP5)
120, hlc_rifle_hk53RAS // H&K HK53 + RAS
120, hlc_rifle_hk33a2
120, hlc_rifle_hk33a2RIS
120, hlc_rifle_psg1A1
120, hlc_rifle_PSG1A1_RIS
120, hlc_rifle_g3a3v

//NIArms G3 Attatchments
120, HLC_Optic_ZFSG1
120, hlc_optic_accupoint_g3

//NIArms G3 Ammo
120, hlc_20Rnd_762x51_B_G3
120, hlc_20rnd_762x51_T_G3
120, hlc_50rnd_762x51_M_G3 

//NIArms G36 Rifles
120, hlc_rifle_G36A1
120, hlc_rifle_G36A1AG36
120, hlc_rifle_G36KA1 // G36K Carbine.S-E-F Triggerpack.
120, hlc_rifle_G36C // G36C Compact Carbine. 1-2-A Pictogram Triggerpack, Ironsights and optic mounting rail.
120, hlc_rifle_G36E1 // G36 Rifle as sold by H&K for Export. 1-2-A Pictogram Triggerpack.
120, hlc_rifle_G36E1AG36 // G36E Rifle with AG36 Launcher
120, hlc_rifle_G36KE1 // G36KE Carbine.1-2-A Pictogram Triggerpack.
120, hlc_rifle_G36V // G36 Modernised Export Model. 1-2-A Pictogram Triggerpack, Ironsights and optic mounting rail.
120, hlc_rifle_G36KV // G36K Modernised Export Model. 1-2-A Pictogram Triggerpack, Ironsights and optic mounting rail.
120, hlc_rifle_G36CV // G36C Modernised Export Model. 1-2-A Pictogram Triggerpack, Ironsights and optic mounting rail.
120, hlc_rifle_G36VAG36 // G36V with AG36 Launcher.
120, hlc_rifle_G36TAC // G36V Rifle with Knight's Armament interface gear.
120, hlc_rifle_G36KTAC // G36K " " " " " "
120, hlc_rifle_G36CTAC // G36C " " " " " "
120, hlc_rifle_G36MLIC // G36 Rifle fitted with the STANAG 2020 Caseless Mid-Life Improvement Kit.
120, hlc_rifle_G36KMLIC // G36K " " " " " " " " "
120, hlc_rifle_G36CMLIC // G36C " " " " " " " " "
120, hlc_rifle_G36MLIAG36 // G36-MLI(C) with AG36 

//NIArms G36 Attatchments
120, HLC_Optic_G36dualoptic35x
120, HLC_Optic_G36dualoptic35x2d
120, HLC_Optic_G36Export35x
120, HLC_Optic_G36Export35x2d
//120, HLC_Optic_G36Dualoptic15x
120, HLC_Optic_G36Dualoptic15x2d
120, HLC_Optic_G36Export15x
120, HLC_Optic_G36Export15x2d

//NIArms G36 Ammo
120, hlc_30rnd_556x45_EPR_G36 
120, hlc_30rnd_556x45_SOST_G36
120, hlc_30rnd_556x45_SPR_G36
120, hlc_100rnd_556x45_EPR_G36

//NIArms M14 Rifles
120, hlc_rifle_M14
120, hlc_rifle_M21
120, hlc_rifle_M14DMR
120, hlc_rifle_m14sopmod

//NIArms M14 Attatchments
120, hlc_muzzle_snds_M14
120, hlc_optic_artel_m14
120, hlc_optic_LRT_m14

//NiArms M14 Ammo
120, hlc_20Rnd_762x51_B_M14
120, hlc_20rnd_762x51_T_M14
120, hlc_50rnd_762x51_M_M14

//NIArms M60 GPMGs
120, hlc_lmg_M60E4
120, hlc_lmg_m60

//NIArms M60 GPMG Ammo
120, hlc_100Rnd_762x51_B_M60E4
120, hlc_100Rnd_762x51_T_M60E4
120, hlc_100Rnd_762x51_M_M60E4

// NIArms MP5 SMGs
120, hlc_smg_mp5k_PDW
120, hlc_smg_mp5k
120, hlc_smg_mp5a2
120, hlc_smg_mp5a3
120, hlc_smg_mp5a4
120, hlc_smg_mp5n
120, hlc_smg_mp510
120, hlc_smg_mp5sd5
120, hlc_smg_mp5sd6
120, hlc_smg_9mmar

// NIArms MP5 SMG Attatchments
120, hlc_muzzle_Agendasix
120, hlc_muzzle_Tundra
120, hlc_muzzle_Agendasix10mm

// NIArms MP5 SMG Ammo
120, hlc_30Rnd_9x19_B_MP5
120, hlc_30Rnd_9x19_GD_MP5
120, hlc_30Rnd_9x19_SD_MP5
120, hlc_30Rnd_10mm_B_MP5
120, hlc_30Rnd_10mm_JHP_MP5

//NIArms Minimi LMGs
120, hlc_lmg_minimipara
120, hlc_lmg_minimi
120, hlc_lmg_minimi_railed
120, hlc_lmg_m249para
120, hlc_lmg_M249E2
120, hlc_m249_pip1
120, hlc_m249_pip2
120, hlc_m249_pip3
120, hlc_m249_pip4

//NIArms Minimi LMG Ammo
120, hlc_200rnd_556x45_M_SAW
120, hlc_200rnd_556x45_T_SAW
120, hlc_200rnd_556x45_B_SAW

//NIArms SG510 Rifles
120, hlc_rifle_STGW57
120, hlc_rifle_stgw57_RIS
120, hlc_rifle_stgw57_commando
120, hlc_rifle_sig5104
120, hlc_rifle_amt

//NIArms SG510 Attatchments
120, hlc_optic_Kern
120, hlc_optic_Kern2d

//NIArms SG510 Ammo
120, hlc_24Rnd_75x55_B_stgw
120, hlc_24Rnd_75x55_ap_stgw
120, hlc_20Rnd_762x51_b_amt
120, hlc_20Rnd_762x51_mk316_amt
120, hlc_20Rnd_762x51_bball_amt
120, hlc_20Rnd_762x51_T_amt
120, hlc_24Rnd_75x55_T_stgw

////////////////////////////////////////////////////////////////////////////
// RAD ZONE SECTION
////////////////////////////////////////////////////////////////////////////

> Radiation

////////////////////////////////////////////////////////////////////////////
// Arma and Exile - Radiation
////////////////////////////////////////////////////////////////////////////

//Bullet Cam Mags
100, Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag
100, Exile_Magazine_5Rnd_10Rnd_93x64_DMR_05_Bullet_Cam_Mag
100, Exile_Magazine_7Rnd_408_Bullet_Cam_Mag
100, Exile_Magazine_10Rnd_338_Bullet_Cam_Mag

// LMGs
300, arifle_MX_SW_Black_F
300, arifle_MX_SW_F
300, LMG_Mk200_F
300, LMG_Zafir_F
300, MMG_01_hex_F
300, MMG_01_tan_F
300, MMG_02_camo_F
300, MMG_02_black_F
300, MMG_02_sand_F
300, arifle_SPAR_02_blk_F
300, arifle_SPAR_02_khk_F
300, arifle_SPAR_02_snd_F

// LMG Ammo
120, 100Rnd_65x39_caseless_mag
120, 100Rnd_65x39_caseless_mag_Tracer
120, 150Rnd_762x54_Box
120, 150Rnd_762x54_Box_Tracer
120, 200Rnd_65x39_Belt
120, 200Rnd_65x39_Belt_Tracer_Green
120, 200Rnd_65x39_Belt_Tracer_Red
120, 200Rnd_65x39_Belt_Tracer_Yellow
120, 130Rnd_338_Mag
120, 150Rnd_93x64_Mag

// Rifles
120, arifle_Katiba_F              
120, arifle_Katiba_GL_F
120, arifle_MXC_F            
120, arifle_MX_F            
120, arifle_MX_GL_F              
120, arifle_MXM_F            
120, arifle_MXM_Black_F
120, arifle_SDAR_F            
120, arifle_TRG21_F              
120, arifle_TRG20_F             
120, arifle_TRG21_GL_F
120, arifle_Mk20_F            
120, arifle_Mk20C_F            
120, arifle_Mk20_GL_F
120, arifle_MXC_Black_F
120, arifle_MX_Black_F
120, arifle_MX_GL_Black_F
120, arifle_SPAR_01_GL_blk_F
120, arifle_SPAR_01_GL_khk_F
120, arifle_SPAR_01_GL_snd_F
120, arifle_SPAR_03_blk_F
120, arifle_SPAR_03_khk_F
120, arifle_SPAR_03_snd_F
120, arifle_ARX_blk_F
120, arifle_ARX_ghex_F
120, arifle_ARX_hex_F

// Rifle Items
200, muzzle_snds_M
200, muzzle_snds_H
200, optic_Arco
200, optic_Hamr
200, optic_Holosight
200, acc_pointer_IR
200, optic_MRCO
200, acc_flashlight
15, optic_NVS
10, optic_Nightstalker
10, optic_tws
10, optic_tws_mg

// Rifle Ammo
120, 20Rnd_556x45_UW_mag
120, 30Rnd_556x45_Stanag    
150, 30Rnd_556x45_Stanag_Tracer_Green
150, 30Rnd_556x45_Stanag_Tracer_Red
150, 30Rnd_556x45_Stanag_Tracer_Yellow
120, 30Rnd_65x39_caseless_green    
150, 30Rnd_65x39_caseless_green_mag_Tracer
120, 30Rnd_65x39_caseless_mag
150, 30Rnd_65x39_caseless_mag_Tracer
120, 10Rnd_50BW_Mag_F

// Snipers
350, srifle_DMR_01_F
350, srifle_EBR_F
350, srifle_GM6_F
350, srifle_GM6_camo_F
350, srifle_GM6_ghex_F
350, srifle_LRR_F
350, srifle_LRR_camo_F
350, srifle_LRR_tna_F
250, srifle_DMR_02_F
250, srifle_DMR_02_camo_F
250, srifle_DMR_02_sniper_F
250, srifle_DMR_05_blk_F
250, srifle_DMR_05_hex_F
250, srifle_DMR_05_tan_F
250, srifle_DMR_04_F
250, srifle_DMR_04_Tan_F
250, srifle_DMR_03_F
250, srifle_DMR_03_khaki_F
250, srifle_DMR_03_tan_F
250, srifle_DMR_03_multicam_F
250, srifle_DMR_03_woodland_F
250, srifle_DMR_06_camo_F
250, srifle_DMR_06_olive_F
250, srifle_DMR_06_camo_khs_F
250, srifle_DMR_07_blk_F
250, srifle_DMR_07_hex_F
250, srifle_DMR_07_ghex_F

// Sniper Ammo
125, 5Rnd_127x108_Mag
125, 7Rnd_1508_Mag
150, 10Rnd_762x51_Mag
150, 20Rnd_762x51_Mag
115, 5Rnd_127x108_APDS_Mag
120, 10Rnd_338_Mag
120, 10Rnd_93x64_DMR_05_Mag
120, 10Rnd_127x54_Mag
120, 20Rnd_650x39_Cased_Mag_F


// Sniper Items
175, muzzle_snds_B
200, optic_DMS
200, optic_SOS
200, optic_LRPS
120, muzzle_snds_338_black
120, muzzle_snds_338_green
120, muzzle_snds_338_sand
120, muzzle_snds_93mmg
120, muzzle_snds_93mmg_tan

// Noob Tube Nades
100, 1Rnd_HE_Grenade_shell
75, 3Rnd_HE_Grenade_shell

// Smoke Nades
50, SmokeShell
50, SmokeShellRed
50, SmokeShellGreen
50, SmokeShellYellow
50, SmokeShellPurple
50, SmokeShellBlue
50, SmokeShellOrange

// Noob Tube Flares
15, 3Rnd_UGL_FlareGreen_F
15, 3Rnd_UGL_FlareRed_F
15, 3Rnd_UGL_FlareWhite_F
15, 3Rnd_UGL_FlareYellow_F
35, UGL_FlareGreen_F
35, UGL_FlareRed_F
35, UGL_FlareWhite_F
35, UGL_FlareYellow_F

// No Infrared for now
//UGL_FlareCIR_F    
//3Rnd_UGL_FlareCIR_F

// Noob Tube Smokes
35, 1Rnd_Smoke_Grenade_shell
35, 1Rnd_SmokeBlue_Grenade_shell
35, 1Rnd_SmokeGreen_Grenade_shell
35, 1Rnd_SmokeOrange_Grenade_shell
35, 1Rnd_SmokePurple_Grenade_shell
35, 1Rnd_SmokeRed_Grenade_shell
35, 1Rnd_SmokeYellow_Grenade_shell
15, 3Rnd_Smoke_Grenade_shell
15, 3Rnd_SmokeBlue_Grenade_shell
15, 3Rnd_SmokeGreen_Grenade_shell
15, 3Rnd_SmokeOrange_Grenade_shell
15, 3Rnd_SmokePurple_Grenade_shell
15, 3Rnd_SmokeRed_Grenade_shell
15, 3Rnd_SmokeYellow_Grenade_shell

// Explosives
100, HandGrenade
100, MiniGrenade
25, IEDUrbanBig_Remote_Mag
25, IEDUrbanSmall_Remote_Mag
25, DemoCharge_Remote_Mag
25, APERSMine_Range_Mag
25, APERSTripMine_Wire_Mag
25, ClaymoreDirectionalMine_Remote_Mag

// Items
70, Binocular
50, ItemRadio
150, ItemGPS
100, NVGoggles
120, Exile_Item_InstaDoc
150, Exile_Item_EMRE
150, Exile_Item_PlasticBottleFreshWater

// Backpacks
40, B_OutdoorPack_blk
40, B_OutdoorPack_tan
40, B_OutdoorPack_blu
20, B_HuntingBackpack

20, B_AssaultPack_khk
20, B_AssaultPack_dgtl
20, B_AssaultPack_rgr
20, B_AssaultPack_sgg
20, B_AssaultPack_blk
20, B_AssaultPack_cbr
20, B_AssaultPack_mcamo

75, B_Kitbag_mcamo
75, B_Kitbag_sgg
75, B_Kitbag_cbr

40, B_FieldPack_blk
40, B_FieldPack_ocamo
40, B_FieldPack_oucamo
40, B_FieldPack_cbr

100, B_Bergen_sgg
100, B_Bergen_mcamo
100, B_Bergen_rgr
100, B_Bergen_blk

110, B_Carryall_ocamo
110, B_Carryall_oucamo
110, B_Carryall_mcamo
110, B_Carryall_oli
110, B_Carryall_khk
110, B_Carryall_cbr

// Headgear
/*70, H_MilCap_ocamo
70, H_MilCap_mcamo
70, H_MilCap_oucamo
70, H_MilCap_blue
70, H_MilCap_rucamo
70, H_MilCap_dgtl
*/
70, H_HelmetB
70, H_HelmetB_paint
70, H_HelmetB_light
70, H_HelmetB_plain_blk
70, H_HelmetSpecB
70, H_HelmetSpecB_paint1
70, H_HelmetSpecB_paint2
70, H_HelmetSpecB_blk
70, H_HelmetIA
70, H_HelmetIA_net
70, H_HelmetIA_camo
70, H_HelmetB_grass
70, H_HelmetB_snakeskin
70, H_HelmetB_desert
70, H_HelmetB_black
70, H_HelmetB_sand
70, H_HelmetB_light_grass
70, H_HelmetB_light_snakeskin
70, H_HelmetB_light_desert
70, H_HelmetB_light_black
70, H_HelmetB_light_sand

150, H_HelmetCrew_B
150, H_HelmetCrew_O
150, H_HelmetCrew_I

30, H_PilotHelmetFighter_B
30, H_PilotHelmetFighter_O
30, H_PilotHelmetFighter_I

30, H_PilotHelmetHeli_B
30, H_PilotHelmetHeli_O
30, H_PilotHelmetHeli_I

25, H_HelmetB_camo

30, H_CrewHelmetHeli_B
30, H_CrewHelmetHeli_O
30, H_CrewHelmetHeli_I
/*
25, H_BandMask_khk
25, H_BandMask_reaper
25, H_BandMask_demon
*/
10, H_HelmetO_oucamo
10, H_HelmetLeaderO_oucamo
10, H_HelmetSpecO_ocamo
10, H_HelmetSpecO_blk
10, H_HelmetO_ocamo
10, H_HelmetLeaderO_ocamo

// Vests
//70, V_Rangemaster_belt
70, V_PlateCarrier1_blk
70, V_PlateCarrier1_rgr
70, V_PlateCarrier2_rgr
70, V_PlateCarrier3_rgr
70, V_PlateCarrierGL_rgr
70, V_PlateCarrierIA1_dgtl
70, V_PlateCarrierIA2_dgtl
70, V_PlateCarrierIAGL_dgtl
70, V_PlateCarrierSpec_rgr

50, V_TacVest_blk
50, V_TacVest_brn
50, V_TacVest_camo
50, V_TacVest_khk
50, V_TacVest_oli
50, V_TacVestCamo_khk
50, V_TacVestIR_blk

30, V_RebreatherB
30, V_RebreatherIR
30, V_RebreatherIA

100, V_PlateCarrierL_CTRG
100, V_PlateCarrierH_CTRG

// Uniforms
170, U_B_CTRG_1
170, U_B_CTRG_2
170, U_B_CTRG_3
150, U_B_CombatUniform_mcam
170, U_B_CombatUniform_mcam_tshirt
170, U_B_CombatUniform_mcam_vest
190, U_B_CombatUniform_mcam_worn
130, U_B_SpecopsUniform_sgg
120, U_O_OfficerUniform_ocamo
120, U_I_OfficerUniform
135, U_I_CombatUniform
135, U_I_CombatUniform_tshirt
135, U_I_CombatUniform_shortsleeve

115, U_B_GhillieSuit
115, U_O_GhillieSuit
115, U_I_GhillieSuit

135, U_B_HeliPilotCoveralls
135, U_O_PilotCoveralls
135, U_B_PilotCoveralls
135, U_I_pilotCoveralls
135, U_I_HeliPilotCoveralls

125, U_B_Wetsuit
125, U_O_Wetsuit
125, U_I_Wetsuit

115, U_O_CombatUniform_ocamo
115, U_O_CombatUniform_oucamo
115, U_O_SpecopsUniform_ocamo
115, U_O_SpecopsUniform_blk




/////////////////////////////////////////////////////////////////
//NIArms - Military
/////////////////////////////////////////////////////////////////

//NiArms AK Rifles
50, hlc_rifle_ak74
50, hlc_rifle_ak74_MTK
50, hlc_rifle_ak74_dirty
50, hlc_rifle_ak74_dirty2
50, hlc_rifle_aks74
50, hlc_rifle_aks74_MTK
50, hlc_rifle_aks74u
50, hlc_rifle_aks74u_MTK
50, hlc_rifle_ak47
50, hlc_rifle_akm
50, hlc_rifle_akm_MTK
80, hlc_rifle_rpk
50, hlc_rifle_ak12
50, hlc_rifle_aku12
80, hlc_rifle_rpk12
80, hlc_rifle_rpk74n
50, hlc_rifle_ak12gl
50, hlc_rifle_akmgl
50, hlc_rifle_aks74_GL
75, hlc_rifle_saiga12k
50, hlc_rifle_aek971
50, hlc_rifle_aek971
50, hlc_rifle_aek971_mtk
50, hlc_rifle_RK62
50, hlc_rifle_slr107u
50, hlc_rifle_slr107u_MTK
50, hlc_rifle_ak74m
50, hlc_rifle_ak74m_gl
50, hlc_rifle_ak74m_MTK

//NiArms AK Ammo
50, hlc_30Rnd_545x39_B_AK
50, hlc_30Rnd_545x39_T_AK
50, hlc_30Rnd_545x39_EP_AK
50, hlc_45Rnd_545x39_t_rpk
50, hlc_60Rnd_545x39_t_rpk
50, hlc_30Rnd_762x39_b_ak
50, hlc_30Rnd_762x39_t_ak
50, hlc_45Rnd_762x39_t_rpk
50, hlc_45Rnd_762x39_m_rpk
50, hlc_75rnd_762x39_m_rpk
50, hlc_10rnd_12g_buck_S12
50, hlc_10rnd_12g_slug_S12
50, hlc_VOG25_AK
50, hlc_GRD_White
50, hlc_GRD_red
50, hlc_GRD_green
50, hlc_GRD_blue
50, hlc_GRD_orange
50, hlc_GRD_purple

//NiArms AK Attatchments
120, HLC_Optic_PSO1
120, HLC_Optic_1p29
120, hlc_muzzle_545SUP_AK
120, hlc_muzzle_762SUP_AK
120, hlc_optic_kobra
10, hlc_optic_goshawk

//NIArms AR15 Rifles
120, hlc_rifle_RU556
120, hlc_rifle_RU5562
120, hlc_rifle_Colt727
120, hlc_rifle_Colt727_GL
120, hlc_rifle_bcmjack
120, hlc_rifle_vendimus
120, hlc_rifle_SAMR
120, hlc_rifle_honeybase
120, hlc_rifle_honeybadger
120, hlc_rifle_cqbr
120, hlc_rifle_m4

//NIArms AR15 Attatchments
120, hlc_muzzle_556NATO_KAC
120, hlc_muzzle_300blk_KAC

//NIArms AR15 Ammo
120, 29rnd_300BLK_STANAG
120, 29rnd_300BLK_STANAG_T
120, 29rnd_300BLK_STANAG_S
120, hlc_30rnd_556x45_EPR
120, hlc_30rnd_556x45_SOST
120, hlc_30rnd_556x45_SPR

//NIArms AUG Rifles
40, hlc_rifle_aug
40, hlc_rifle_auga1_t
40, hlc_rifle_auga1_B
40, hlc_rifle_auga1carb
40, hlc_rifle_auga1carb_t
40, hlc_rifle_auga1carb_b
40, hlc_rifle_aughbar
40, hlc_rifle_aughbar_b
40, hlc_rifle_aughbar_t
40, hlc_rifle_augpara
40, hlc_rifle_augpara_b
40, hlc_rifle_augpara_t
75, hlc_rifle_auga2
75, hlc_rifle_auga2_b
75, hlc_rifle_auga2_t
75, hlc_rifle_auga2carb
75, hlc_rifle_auga2carb_t
75, hlc_rifle_auga2carb_b
75, hlc_rifle_auga2lsw
75, hlc_rifle_auga2lsw_t
75, hlc_rifle_auga2lsw_b
75, hlc_rifle_auga2para
75, hlc_rifle_auga2para_b
75, hlc_rifle_auga2para_t
75, hlc_rifle_augsr
75, hlc_rifle_augsr_b
75, hlc_rifle_augsr_t
75, hlc_rifle_augsrcarb
75, hlc_rifle_augsrcarb_t
75, hlc_rifle_augsrcarb_b
75, hlc_rifle_augsrhbar
75, hlc_rifle_augsrhbar_b
75, hlc_rifle_augsrhbar_t
40, hlc_rifle_auga3
40, hlc_rifle_auga3_bl
40, hlc_rifle_auga3_b
40, hlc_rifle_auga3_GL
40, hlc_rifle_auga3_GL_BL 
40, hlc_rifle_auga3_GL_B

//NIArms AUG Attatchments
120, hlc_muzzle_snds_AUG
120, hlc_muzzle_snds_a6AUG

//NIArms AUG Ammo
120, hlc_30Rnd_556x45_B_AUG
120, hlc_30Rnd_556x45_SOST_AUG
120, hlc_30Rnd_556x45_SPR_AUG
120, hlc_30Rnd_556x45_T_AUG
120, hlc_40Rnd_556x45_B_AUG
120, hlc_40Rnd_556x45_SOST_AUG
120, hlc_40Rnd_556x45_SPR_AUG
120, hlc_25Rnd_9x19mm_M882_AUG
120, hlc_25Rnd_9x19mm_JHP_AUG
120, hlc_25Rnd_9x19mm_subsonic_AUG

//NIArms AWM Rifles
150, hlc_rifle_awcovert
150, hlc_rifle_awcovert_BL
150, hlc_rifle_awcovert_FDE
150, hlc_rifle_awmagnum
150, hlc_rifle_awmagnum_BL
150, hlc_rifle_awmagnum_FDE
150, hlc_rifle_awMagnum_FDE_ghillie
150, hlc_rifle_awMagnum_BL_ghillie
150, hlc_rifle_awMagnum_OD_ghillie

//NIArms AWM Ammo
120, hlc_5rnd_300WM_FMJ_AWM
120, hlc_5rnd_300WM_AP_AWM
120, hlc_5rnd_300WM_BTSP_AWM
120, hlc_5rnd_300WM_mk248_AWM
120, hlc_5rnd_300WM_SBT_AWM

//NIArms FAL Rifles
120, hlc_rifle_l1a1slr
120, hlc_rifle_SLR
120, hlc_rifle_STG58F
120, hlc_rifle_FAL5061
120, hlc_rifle_c1A1
120, hlc_rifle_LAR
120, hlc_rifle_SLRchopmod
120, hlc_rifle_falosw
120, hlc_rifle_osw_GL

//NIArms FAL Attatchments
120, hlc_optic_PVS4FAL
120, hlc_optic_suit
120, hlc_muzzle_snds_fal

//NIArms FAL Ammo
120, hlc_20Rnd_762x51_B_fal
120, hlc_20Rnd_762x51_t_fal
120, hlc_20Rnd_762x51_S_fal
120, hlc_50rnd_762x51_M_FAL 

//NIArms G3 Rifles
120, hlc_rifle_g3sg1
120, hlc_rifle_psg1
120, hlc_rifle_g3a3
120, hlc_rifle_g3a3ris
120, hlc_rifle_g3ka4
120, HLC_Rifle_g3ka4_GL
120, hlc_rifle_hk51
120, hlc_rifle_hk53
120, hlc_rifle_hk53RAS
120, hlc_rifle_hk33a2
120, hlc_rifle_hk33a2RIS
120, hlc_rifle_psg1A1
120, hlc_rifle_PSG1A1_RIS
120, hlc_rifle_g3a3v

//NIArms G3 Attatchments
120, HLC_Optic_ZFSG1
120, hlc_optic_accupoint_g3

//NIArms G3 Ammo
120, hlc_20Rnd_762x51_B_G3
120, hlc_20rnd_762x51_T_G3
120, hlc_50rnd_762x51_M_G3 

//NIArms G36 Rifles
75, hlc_rifle_G36A1
75, hlc_rifle_G36A1AG36
75, hlc_rifle_G36KA1
75, hlc_rifle_G36C
75, hlc_rifle_G36E1
75, hlc_rifle_G36E1AG36
75, hlc_rifle_G36KE1
75, hlc_rifle_G36V
75, hlc_rifle_G36KV
75, hlc_rifle_G36CV
75, hlc_rifle_G36VAG36
75, hlc_rifle_G36TAC
75, hlc_rifle_G36KTAC
75, hlc_rifle_G36CTAC
75, hlc_rifle_G36MLIC
75, hlc_rifle_G36KMLIC
75, hlc_rifle_G36CMLIC
75, hlc_rifle_G36MLIAG36

//NIArms G36 Attatchments
120, HLC_Optic_G36dualoptic35x
120, HLC_Optic_G36dualoptic35x2d
120, HLC_Optic_G36Export35x
120, HLC_Optic_G36Export35x2d
120, HLC_Optic_G36Dualoptic15x
120, HLC_Optic_G36Dualoptic15x2d
120, HLC_Optic_G36Export15x
120, HLC_Optic_G36Export15x2d

//NIArms G36 Ammo
120, hlc_30rnd_556x45_EPR_G36 
120, hlc_30rnd_556x45_SOST_G36
120, hlc_30rnd_556x45_SPR_G36
120, hlc_100rnd_556x45_EPR_G36

//NIArms M14 Rifles
150, hlc_rifle_M14
150, hlc_rifle_M21
150, hlc_rifle_M14DMR
150, hlc_rifle_m14sopmod

//NIArms M14 Attatchments
150, hlc_muzzle_snds_M14
150, hlc_optic_artel_m14
150, hlc_optic_LRT_m14

//NiArms M14 Ammo
120, hlc_20Rnd_762x51_B_M14
120, hlc_20rnd_762x51_T_M14
120, hlc_50rnd_762x51_M_M14

//NIArms M60 GPMGs
120, hlc_lmg_M60E4
120, hlc_lmg_m60

//NIArms M60 GPMG Ammo
120, hlc_100Rnd_762x51_B_M60E4
120, hlc_100Rnd_762x51_T_M60E4
120, hlc_100Rnd_762x51_M_M60E4

// NIArms MP5 SMGs
120, hlc_smg_mp5k_PDW
120, hlc_smg_mp5k
120, hlc_smg_mp5a2
120, hlc_smg_mp5a3
120, hlc_smg_mp5a4
120, hlc_smg_mp5n
120, hlc_smg_mp510
120, hlc_smg_mp5sd5
120, hlc_smg_mp5sd6
120, hlc_smg_9mmar

// NIArms MP5 SMG Attatchments
120, hlc_muzzle_Agendasix
120, hlc_muzzle_Tundra
120, hlc_muzzle_Agendasix10mm

// NIArms MP5 SMG Ammo
120, 120, hlc_30Rnd_9x19_B_MP5
120, hlc_30Rnd_9x19_GD_MP5
120, hlc_30Rnd_9x19_SD_MP5
120, hlc_30Rnd_10mm_B_MP5
120, hlc_30Rnd_10mm_JHP_MP5

//NIArms Minimi LMGs
120, hlc_lmg_minimipara
120, hlc_lmg_minimi
120, hlc_lmg_minimi_railed
120, hlc_lmg_m249para
120, hlc_lmg_M249E2
120, hlc_m249_pip1
120, hlc_m249_pip2
120, hlc_m249_pip3
120, hlc_m249_pip4

//NIArms Minimi LMG Ammo
120, hlc_200rnd_556x45_M_SAW
120, hlc_200rnd_556x45_T_SAW
120, hlc_200rnd_556x45_B_SAW

//NIArms SG510 Rifles
120, hlc_rifle_STGW57
120, hlc_rifle_stgw57_RIS
120, hlc_rifle_stgw57_commando
120, hlc_rifle_sig5104
120, hlc_rifle_amt

//NIArms SG510 Attatchments
120, hlc_optic_Kern
120, hlc_optic_Kern2d

//NIArms SG510 Ammo
120, hlc_24Rnd_75x55_B_stgw
120, hlc_24Rnd_75x55_ap_stgw
120, hlc_20Rnd_762x51_b_amt
120, hlc_20Rnd_762x51_mk316_amt
120, hlc_20Rnd_762x51_bball_amt
120, hlc_20Rnd_762x51_T_amt
120, hlc_24Rnd_75x55_T_stgw

///////////////////////////////////////////////////////
// END TRANSMISSION
///////////////////////////////////////////////////////