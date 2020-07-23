class EVOR_rsc_splashIntro {
	idd				= 2008;
	movingEnable	= false;
	duration		= 4;
	fadeIn			= 2;
	fadeOut			= 4;
	controls[]		= {text1,text2,text3,logoSDB,logoEW,text4};
	onLoad			= "uiNamespace setVariable [""EVOR_rsc_splashIntro"",_this select 0];";
	onUnload		= "uiNamespace setVariable [""EVOR_rsc_splashIntro"",nil];";

	class text1: RscStructuredText {
		idc = 1000;
		text = "<t align = 'center'>Sgt. Dennenboom</t>";
		x = safezoneW * 0.15 + safezoneX;
		y = safezoneH * 0.25 + safezoneY;
		w = safezoneW * 0.30;
		h = safezoneH * 0.05;
		size = safezoneH * 0.05;
	};
	class text2: RscStructuredText {
		idc = 1001;
		text = "<t align = 'center'>in collaboration with</t>";
		x = safezoneW * 0.15 + safezoneX;
		y = safezoneH * 0.15 + safezoneY;
		w = safezoneW * 0.70;
		h = safezoneH * 0.05;
		size = safezoneH * 0.05;
	};
	class text3: RscStructuredText {
		idc = 1002;
		text = "<t align = 'center'>Elite-Warriors</t>";
		x = safezoneW * 0.55 + safezoneX;
		y = safezoneH * 0.25 + safezoneY;
		w = safezoneW * 0.30;
		h = safezoneH * 0.05;
		size = safezoneH * 0.05;
	};
	class logoSDB: RscPicture {
		idc = 1003;
		text = "resources\images\Logo_SDB.paa";
		x = safezoneX + safezoneW * (0.30 - 0.15/(getResolution select 4));
		y = safezoneH * 0.35 + safezoneY;
		w = safezoneW * 0.30 / (getResolution select 4);
		h = safezoneH * 0.30;
	};
	class logoEW: RscPicture {
		idc = 1004;
		text = "resources\images\Logo_EW.paa";
		x = safezoneX + safezoneW * (0.70 - 0.15/(getResolution select 4));
		y = safezoneH * 0.35 + safezoneY;
		w = safezoneW * 0.30 / (getResolution select 4);
		h = safezoneH * 0.30;
	};
	class text4: RscStructuredText {
		idc = 1005;
		text = "<t align = 'center'>is proud to present...</t>";
		x = safezoneW * 0.15 + safezoneX;
		y = safezoneH * 0.70 + safezoneY;
		w = safezoneW * 0.70;
		h = safezoneH * 0.05;
		size = safezoneH * 0.05;
	};
};