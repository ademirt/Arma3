class CfgVehicleMags {
	// Scorcher
	class B_MBT_01_arty_F {
		MagsBanned[] = {"4Rnd_155mm_Mo_guided","6Rnd_155mm_Mo_mine","2Rnd_155mm_Mo_Cluster","6Rnd_155mm_Mo_AT_mine"};
	};
	class B_T_MBT_01_arty_F: B_MBT_01_arty_F {};
	
	// Sochor
	class O_MBT_02_arty_F {
		MagsBanned[] = {"2Rnd_155mm_Mo_guided_O","6Rnd_155mm_Mo_mine_O","2Rnd_155mm_Mo_Cluster_O","6Rnd_155mm_Mo_AT_mine_O"};
	};
	class O_T_MBT_02_arty_ghex_F: O_MBT_02_arty_F {};
	
	// Angara
	class O_MBT_04_cannon_F {
		MagsExtra[] = {"4Rnd_125mm_cannon_missiles"};
	};
	class O_T_MBT_04_cannon_F: O_MBT_04_cannon_F {};
	class O_MBT_04_command_F: O_MBT_04_cannon_F {};
	class O_T_MBT_04_command_F: O_MBT_04_cannon_F {};
};