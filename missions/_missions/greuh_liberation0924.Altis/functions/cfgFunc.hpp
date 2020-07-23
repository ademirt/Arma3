class GHST
{
	tag = "GHST";
	class functions
	{
		file = "functions";
		class functions {description = "core functions, called on mission start."; preInit = 1;};
	};
	class client
	{
		file = "functions\client";
		//class remotedesignator {description = "deploys remote designator";};
		class ammodrop {description = "player ammo crate call in";};
		class airsupport {description = "player air support call in";};
		class ugvsupport {description = "player ugv call in";};
		class uavsupport {description = "player uav call in";};
		class puavsupport {description = "player AR-2 Darter call in";};
	};
	class transport
	{
		file = "functions\transport";
		class init_transport {description = "init transport option";};
		class dest_transport {description = "transport destination";};
		class rtb_transport {description = "transport rtb";};
	};
};