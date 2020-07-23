titleParam1 = "Start time";
textsParam1[] = {"Random","00:00","04:00","08:00","12:00","16:00","20:00"};
valuesParam1[] = {-1,0,4,8,12,16,20};
defValueParam1 = 8;

titleParam2 = "Time multiplier";
textsParam2[] = {"1","4","8","12","24"};
valuesParam2[] = {1,4,8,12,24};
defValueParam2 = 4;

class Params {
	class EVOR_param_ObjNumber {
		title		= "Number of objectives";
		texts[]		= {"5","7","10","15","20"};
		values[]	= {5,7,10,15,20};
		default		= 10;
	};
	class EVOR_param_ScoreStart {
		title		= "Score that players start with when they first connect";
		texts[]		= {"0","5","15","25","50"};
		values[]	= {0,5,15,25,50};
		default		= 15;
	};
	class EVOR_param_CasualMode {
		title		= "Enable casual mode (free equipment, crap enemies)";
		texts[]		= {"Enabled","Disabled"};
		values[]	= {1,0};
		default		= 0;
	};
	class EVOR_param_EnableSaveAllGear {
		title		= "Enable saving non-purchased equipment";
		texts[]		= {"Enabled","Disabled"};
		values[]	= {1,0};
		default		= 0;
	};
	class EVOR_param_EnableStamina {
		title		= "Stamina";
		texts[]		= {"Enabled","Disabled"};
		values[]	= {1,0};
		default		= 0;
	};
	class EVOR_param_SquadHalo {
		title		= "Squad-leader HALO";
		texts[]		= {"Always enabled","Airfield required","Always disabled"};
		values[]	= {1,0,-1};
		default		= 1;
	};
	class EVOR_param_CounterArtyChance {
		title		= "Chance to receive counter-battery fire on each artillery shot";
		texts[]		= {"Off","2%","5%","7%","10%","15%"};
		values[]	= {0,2,5,7,10,15};
		default		= 7;
	};
	class EVOR_param_Mark3DAllowed {
		title		= "3D player markers";
		texts[]		= {"Enabled","Disabled"};
		values[]	= {1,0};
		default		= 1;
	};
	class EVOR_param_EnemyUnitMin {
		title		= "Approximate number of enemies when no player slots filled";
		texts[]		= {"30","40","50","75","100"};
		values[]	= {30,40,50,75,100};
		default		= 40;
	};
	class EVOR_param_EnemyUnitMax {
		title		= "Approximate number of enemies when all player slots filled ";
		texts[]		= {"100","125","150","175","200"};
		values[]	= {100,125,150,175,200};
		default		= 125;
	};
};