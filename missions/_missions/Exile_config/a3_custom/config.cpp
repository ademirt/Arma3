class CfgPatches {
	class a3_custom {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_server_config"};
	};
};

class CfgFunctions {
	class A3C {
		class A3CCustom {
			file = "a3_custom\init";
			class init {
				postInit = 1;
			};
		};
	};
};