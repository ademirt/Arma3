class DPUP {
	hkpAmmo = 4;
	hkpOverride = 0;			// -1:Remove,0:Default,1:Forced (doesn't work on drones)
	hkpRange = 30;
	wrnDuration = 15;
	wrnOverride = 0;			// -1:Remove,0:Default,1:Basic,2:Launch,3:Missile
	
	class CfgVehicles {			// Vehicles in CfgVehicles get HKP unless overridden
		/* EXAMPLE (ENTREES OVERRIDE DEFAULT)
		class B_APC_Wheeled_01_cannon_F {
			hkpAngle = 360;		// HKP covers this angular sector
			hkpAmmo = 100;		// HKP ammo at full capacity
			hkpOverride = 1;	// -1:Remove,0:Default,1:Forced (doesn't work on drones)
			hkpRange = 20;		// HKP triggers on this distance to projectile
			hkpTurret = 0;		// HKP is attached to turret instead of hull
			wrnOverride = 3;	// -1:Remove,0:Default,1:Basic,2:Launch,3:Missile
		};
		*/
		class B_APC_Tracked_01_rcws_F {};
		class B_T_APC_Tracked_01_rcws_F {};
		class B_MBT_01_cannon_F {};
		class B_T_MBT_01_cannon_F {};
		class B_MBT_01_TUSK_F {};
		class B_T_MBT_01_TUSK_F {};
		class I_APC_tracked_03_cannon_F {};
		class I_MBT_03_cannon_F {};
		class O_APC_Tracked_02_cannon_F {};
		class O_T_APC_Tracked_02_cannon_ghex_F {};
		class O_MBT_02_cannon_F {};
		class O_T_MBT_02_cannon_ghex_F {};
		class O_MBT_04_cannon_F {hkpAngle = 360;};
		class O_T_MBT_04_cannon_F: O_MBT_04_cannon_F {};
		class O_MBT_04_command_F: O_MBT_04_cannon_F {};
		class O_T_MBT_04_command_F: O_MBT_04_cannon_F {};
		
		// CUP
		class CUP_B_Challenger2_2CD_BAF {};
		class CUP_B_Challenger2_2CS_BAF {};
		class CUP_B_Challenger2_2CW_BAF {};
		class CUP_B_Challenger2_Desert_BAF {};
		class CUP_B_Challenger2_Green_CTRG {};
		class CUP_B_Challenger2_NATO {};
		class CUP_B_Challenger2_Sand_CTRG {};
		class CUP_B_Challenger2_Snow_BAF {};
		class CUP_B_Challenger2_Woodland_BAF {};
		class CUP_B_M1A1_DES_US_Army {};
		class CUP_B_M1A1_DES_USMC {};
		class CUP_B_M1A1_NATO_T {};
		class CUP_B_M1A1_Woodland_USMC {};
		class CUP_B_M1A1_Woodland_US_Army {};
		class CUP_B_M1A2_TUSK_MG_DES_US_Army {};
		class CUP_B_M1A2_TUSK_MG_DES_USMC {};
		class CUP_B_M1A2_TUSK_MG_US_Army {};
		class CUP_B_M1A2_TUSK_MG_USMC {};
		class CUP_B_M2A3Bradley_NATO_T {};
		class CUP_B_M2A3Bradley_USA_D {};
		class CUP_B_M2A3Bradley_USA_W {};
		class CUP_B_M2Bradley_NATO_T {};
		class CUP_B_M2Bradley_USA_D {};
		class CUP_B_M2Bradley_USA_W {};
		class CUP_B_M6LineBacker_USA_D {};
		class CUP_B_M6LineBacker_USA_W {};
		class CUP_B_M7Bradley_USA_D {};
		class CUP_B_M7Bradley_USA_W {};
		class CUP_B_T72_CDF {};
		class CUP_B_T72_CZ {};
		class CUP_I_T72_NAPA {};
		class CUP_I_T72_RACS {};
		class CUP_O_BMP3_RU {};
		class CUP_O_BTR90_RU {};
		class CUP_O_T72_CHDKZ {};
		class CUP_O_T72_CSAT {};
		class CUP_O_T72_CSAT_T {};
		class CUP_O_T72_SLA {};
		class CUP_O_T72_RU {};
		class CUP_O_T72_TKA {};
		class CUP_O_T90_RU {};
	};
};