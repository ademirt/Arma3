class EVOR_dlg_menu {
	idd = 2000;
	movingEnable = false;
	onLoad = "uiNamespace setVariable [""EVOR_dlg_menu"",_this select 0];";
	onUnload = "uiNamespace setVariable [""EVOR_dlg_menu"",nil];";
	
	class controls {
		// Main headers
		class title: RscStructuredText {
			idc = 1000;
			colorbackground[] = {0.77,0.51,0.08,0.8};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.175 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
		};
		class score: RscStructuredText {
			idc = 1001;
			colorbackground[] = {0,0,0,1};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.200 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
		};
		class back1: IGUIBack {
			idc = 1002;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.155;
		};
		class back2: IGUIBack {
			idc = 1003;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.385 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.240;
		};
		class headProgress: RscText {
			idc = 1004;
			colorbackground[] = {0,0,0,1};
			text = "MISSION PROGRESS";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.385 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
		};
		
		// Menus
		class buttonTrans: RscButton {
			idc = 1005;
			text = "FAST TRAVEL";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.230 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "createDialog 'EVOR_dlg_transport';";
		};
		class buttonGear: RscButton {
			idc = 1006;
			text = "ARSENAL";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.255 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "[0] call EVOR_fnc_dlgShopOpen";
		};
		class buttonVeh: RscButton {
			idc = 1007;
			text = "MOTORPOOL";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.280 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "[1] call EVOR_fnc_dlgShopOpen";
		};
		class buttonUnit: RscButton {
			idc = 1008;
			text = "BARRACKS";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.305 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "[2] call EVOR_fnc_dlgShopOpen";
		};
		class buttonFund: RscButton {
			idc = 1009;
			text = "FUND MANAGEMENT";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.330 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "createDialog 'EVOR_dlg_funds';";
		};
		class buttonSettings: RscButton {
			idc = 1010;
			text = "MISSION OPTIONS";
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.355 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
			onButtonClick = "createDialog 'EVOR_dlg_settings';";
		};
		
		// Progress
		class textStateNumber: RscStructuredText {
			idc = 1011;
			text = "<t align = 'right'>Number: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.410 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textStateCurrent: RscStructuredText {
			idc = 1012;
			text = "<t align = 'right'>Objective: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.435 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textStateTower: RscStructuredText {
			idc = 1013;
			text = "<t align = 'right'>Radio tower: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.460 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class valueStateNumber: RscStructuredText {
			idc = 1014;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.410 + safezoneY;
			w = safezoneW * 0.300;
			h = safezoneH * 0.020;
		};
		class valueStateCurrent: RscStructuredText {
			idc = 1015;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.435 + safezoneY;
			w = safezoneW * 0.300;
			h = safezoneH * 0.020;
		};
		class valueStateTower: RscStructuredText {
			idc = 1016;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.460 + safezoneY;
			w = safezoneW * 0.300;
			h = safezoneH * 0.020;
		};
		
		// Buttons
		class buttonClose: RscButton {
			idc = 1017;
			text = "CLOSE";
			x = safezoneW * 0.505 + safezoneX;
			y = safezoneH * 0.630 + safezoneY;
			w = safezoneW * 0.195;
			h = safezoneH * 0.020;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 0;";
		};
	};
};