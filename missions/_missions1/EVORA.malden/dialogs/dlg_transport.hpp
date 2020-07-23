class EVOR_dlg_transport {
	idd = 2001;
	movingEnable = false;
	onLoad = "uiNamespace setVariable [""EVOR_dlg_transport"",_this select 0];";
	onUnload = "uiNamespace setVariable [""EVOR_dlg_transport"",nil];";
	
	class controls {
		// Main headers
		class title: RscStructuredText {
			idc = 1000;
			colorbackground[] = {0.77,0.51,0.08,0.8};
			x = safezoneW * 0.200 + safezoneX;
			y = safezoneH * 0.175 + safezoneY;
			w = safezoneW * 0.600;
			h = safezoneH * 0.020;
			onLoad = "(_this select 0) ctrlSetStructuredText parseText format [""<t align = 'left'>FAST TRAVEL</t><t align = 'right'>%1</t>"",profileName];";
		};
		class score: RscStructuredText {
			idc = 1000;
			colorbackground[] = {0,0,0,1};
			x = safezoneW * 0.200 + safezoneX;
			y = safezoneH * 0.200 + safezoneY;
			w = safezoneW * 0.600;
			h = safezoneH * 0.020;
		};
		class back1: IGUIBack {
			idc = 1001;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.200 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.195;
			h = safezoneH * 0.400;
		};
		class back2: IGUIBack {
			idc = 1002;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.400;
		};
		class headDestination: RscText {
			idc = 1003;
			text = "SELECT DESTINATION";
			x = safezoneW * 0.200 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.195;
			h = safezoneH * 0.020;
			colorbackground[] = {0,0,0,1};
		};
		
		// Listbox
		class list: RscListNBox {
			idc = 1004;
			x = safezoneW * 0.200 + safezoneX;
			y = safezoneH * 0.250 + safezoneY;
			w = safezoneW * 0.195;
			h = safezoneH * 0.375;
			onLoad = "_this call EVOR_fnc_dlgTransportLnbFill;";
			onLBSelChanged = "_this call EVOR_fnc_dlgTransportLnbChange;";
		};
		
		// Map
		class map: RscMapControl {
			idc = 1005;
			x = safezoneW * 0.405 + safezoneX;
			y = safezoneH * 0.230 + safezoneY;
			w = safezoneW * 0.390;
			h = safezoneH * 0.390;
		};
		
		// Buttons
		class buttonTravel: RscButton {
			idc = 1006;
			text = "TRAVEL";
			x = safezoneW * 0.605 + safezoneX;
			y = safezoneH * 0.630 + safezoneY;
			w = safezoneW * 0.095;
			h = safezoneH * 0.020;
			onButtonClick = "_this call EVOR_fnc_dlgTransportTravel;";
			onLoad = "(_this select 0) ctrlEnable false;";
		};
		class buttonClose: RscButton {
			idc = 1007;
			text = "BACK";
			x = safezoneW * 0.705 + safezoneX;
			y = safezoneH * 0.630 + safezoneY;
			w = safezoneW * 0.095;
			h = safezoneH * 0.020;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 0;";
		};
	};
};