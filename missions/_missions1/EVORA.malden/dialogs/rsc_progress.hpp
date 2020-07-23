class EVOR_rsc_progress {
	idd				= 2007;
	movingEnable	= false;
	duration		= 9999;
	fadeIn			= 0;
	fadeOut			= 0;
	controls[]		= {back,text,bar};
	onLoad			= "uiNamespace setVariable [""EVOR_rsc_progress"",_this select 0];";
	onUnload		= "uiNamespace setVariable [""EVOR_rsc_progress"",nil];";
	
	class back: IGUIBack {
		idc = 1000;
		colorbackground[] = {0,0,0,0.6};
		x = safezoneW * 0.375 + safezoneX;
		y = safezoneH * 0.800 + safezoneY;
		w = safezoneW * 0.250;
		h = safezoneH * 0.030;
	};
	class text: RscStructuredText {
		idc = 1001;
		text = "";
		x = safezoneW * 0.375 + safezoneX;
		y = safezoneH * 0.800 + safezoneY;
		w = safezoneW * 0.250;
		h = safezoneH * 0.030;
	};
	class bar: RscProgress {	
		idc = 1002;
		x = safezoneW * 0.375 + safezoneX;
		y = safezoneH * 0.800 + safezoneY;
		colorBar[] = {0.77,0.51,0.08,0.8};
		onLoad = "(_this select 0) progressSetPosition 0;";
	};
};