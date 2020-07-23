class EVOR_dlg_shop {
	idd = 2003;
	movingEnable = false;
	onLoad = "uiNamespace setVariable [""EVOR_dlg_shop"",_this select 0];";
	onUnload = "uiNamespace setVariable [""EVOR_dlg_shop"",nil];";
	
	typeListTitles[] = {{"WEAPONS","ITEMS","EQUIPMENT","GOGGLES","BACKPACKS"},{"SUPPLIES","MOTORIZED","NAVAL","ROTARY WING","FIXED-WING"},{"MERCENARY","ARMY","URBAN","RECON","SPECOP"}};
	typeTitles[] = {"ARSENAL","MOTORPOOL","BARRACKS"};
	
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
		class back: IGUIBack {
			idc = 1002;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.600;
		};
		class textDLC: RscStructuredText {
			idc = 1003;
			text = "<t align = 'left'>DLC</t>";
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.040;
			h = safezoneH * 0.020;
		};
		class textItem: RscStructuredText {
			idc = 1004;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.440 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.200;
			h = safezoneH * 0.020;
		};
		class textPrice: RscStructuredText {
			idc = 1005;
			text = "<t align = 'left'>PRICE</t>";
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.640 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.060;
			h = safezoneH * 0.020;
		};

		// ListNBox
		class listNBox: RscListNbox {
			idc = 1006;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.250 + safezoneY;
			w = safezoneW * 0.300;
			h = safezoneH * 0.575;
			rowHeight = safezoneH * 0.04;
			columns[] = {-0.01,0.1,0.6,0.825};
			onLBSelChanged = "_this call EVOR_fnc_dlgShopLnbChange;";
		};
		
		// Buttons
		class button0: RscButton {
			idc = 1007;
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.450 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class button1: RscButton {
			idc = 1008;
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.475 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class button2: RscButton {
			idc = 1009;
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.500 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class button3: RscButton {
			idc = 1010;
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.525 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class button4: RscButton {
			idc = 1011;
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.550 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		
		class buttonPurchase: RscButton {
			idc = 1012;
			text = "PURCHASE";
			x = safezoneW * 0.505 + safezoneX;
			y = safezoneH * 0.830 + safezoneY;
			w = safezoneW * 0.095;
			h = safezoneH * 0.020;
			onButtonClick = "_this call EVOR_fnc_dlgShopPurchase;";
			onLoad = "(_this select 0) ctrlEnable false;";
		};
		class buttonClose: RscButton {
			idc = 1013;
			text = "BACK";
			x = safezoneW * 0.605 + safezoneX;
			y = safezoneH * 0.830 + safezoneY;
			w = safezoneW * 0.095;
			h = safezoneH * 0.020;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 0;";
		};
	};
};