class DPUP {
	class INIT {
		file = "modules\SDB_DPUP\functions";
		class getTurretCamera {};
		class handleVehicleEnter {};
		class handleVehicleLeave {};
		class initBriefing {postInit = 1;};
		class initDPUP {postInit = 1;};
	};
	class HKP {
		file = "modules\SDB_DPUP\functions";
		class hkpCheck {};
		class hkpDisplayAdjust {};
		class hkpDisplayCreate {};
		class hkpDisplayInit {};
		class hkpRearm {};
		class hkpTrigger {};
	};
	class WRN {
		file = "modules\SDB_DPUP\functions";
		class wrnBasic {};
		class wrnCheck {};
		class wrnLaunch {};
		class wrnMissile {};
		class wrnSound {};
	};
};