class EVOR_rsc_titleIntro {
	idd				= 2008;
	movingEnable	= false;
	duration		= 3.5;
	fadeIn			= 0.1;
	fadeOut			= 3.5;
	controls[]		= {logo};
	onLoad			= "uiNamespace setVariable [""EVOR_rsc_titleIntro"",_this select 0];";
	onUnload		= "uiNamespace setVariable [""EVOR_rsc_titleIntro"",nil];";
	
	class logo: RscPicture {
		idc = 1000;
		text = "resources\images\Logo_Evora.paa";
		x = safezoneW * 0.25 + safezoneX;
		y = safezoneH * (0.50 - 0.25 * (getResolution select 4)) + safezoneY;
		w = safezoneW * 0.50;
		h = safezoneH * 0.50 * (getResolution select 4);
	};
};