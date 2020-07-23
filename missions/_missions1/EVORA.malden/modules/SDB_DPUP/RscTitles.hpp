class DPUP_RscHkpDisplay {
	access			= 0;
	duration		= 1e10;
	idd				= -1;
	movingEnable	= 0;
	onload			= "uiNamespace setVariable [""DPUP_RscHkpDisplay"",_this select 0];";
	
	controls[] = {Sector,Threat,Ammo};
	
	class Sector {
		idc = -1;
		x = 0; y = 0; w = 0; h = 0;
		text = "";
		
		access = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {0,0,0,0};
		deleteAble = 0;
		fade = 0;
		fixedWidth = 0;
		font = "TahomaB";
		lineSpacing = 0;
		shadow = 0;
		sizeEx = 0;
		style = 48;
		type = 0;
	};
	class Threat:Sector {};
	class Ammo {
		idc = -1;
		x = 0; y = 0; w = 0; h = 0;
		text = "";
		
		access = 0;
		colorText[] = {0,0,0,0};
		deleteAble = 0;
		fade = 0;
		shadow = 0;
		size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		style = 0;
		type = 13;
		class attributes {
			align = "left";
			color = "#ffffff";
			colorLink = "#D09B43";
			font = "PuristaLight";
			shadow = 0;
		};
	};
};