class EVOR_rsc_titleOutro {
	idd				= 2008;
	movingEnable	= false;
	duration		= 10;
	fadeIn			= 3;
	fadeOut			= 5;
	controls[]		= {header,logo};
	onLoad			= "uiNamespace setVariable [""EVOR_rsc_titleOutro"",_this select 0];";
	onUnload		= "uiNamespace setVariable [""EVOR_rsc_titleOutro"",nil];";
	
	class header: RscStructuredText {
		idc = -1;
		text = "<t align = 'center'>MISSION COMPLETE!</t>";
		x = safezoneW * 0.15 + safezoneX;
		y = safezoneH * 0.15 + safezoneY;
		w = safezoneW * 0.70;
		h = safezoneH * 0.1;
		size = safezoneH * 0.1;
	};
	class logo: RscPicture {
		idc = -1;
		text = "resources\images\Logo_Evora.paa";
		x = safezoneW * 0.25 + safezoneX;
		y = safezoneH * 0.25 + safezoneY;
		w = safezoneW * 0.50;
		h = safezoneH * 0.50 * (getResolution select 4);
	};
};