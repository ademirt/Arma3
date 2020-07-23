class EVOR_dlg_settings {
	idd = 2006;
	movingEnable = false;
	onLoad = "uiNamespace setVariable [""EVOR_dlg_settings"",_this select 0];";
	onUnload = "uiNamespace setVariable [""EVOR_dlg_settings"",nil];";
	
	mark3DRangeValues[] = {50,100,250,500,1000,2000,5000,10000};
	mark3DColorValues[] = {{"RED","[EAST] call BIS_fnc_sideColor"},{"BLUE","[WEST] call BIS_fnc_sideColor"},{"GREEN","[INDEPENDENT] call BIS_fnc_sideColor"},{"PURPLE","[CIVILIAN] call BIS_fnc_sideColor"},{"GRAY","[0.5,0.5,0.5,1]"},{"WHITE","[1,1,1,1]"}};
	visTerrainValues[] = {"LOW","STANDARD","HIGH","VERY HIGH","ULTRA"};
	
	class controls {
		// Main headers
		class title: RscStructuredText {
			idc = 1000;
			colorbackground[] = {0.77,0.51,0.08,0.8};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.175 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
			onLoad = "(_this select 0) ctrlSetStructuredText parseText format [""<t align = 'left'>MISSION OPTIONS</t><t align = 'right'>%1</t>"",profileName];";
		};
		class fps: RscStructuredText {
			idc = 1001;
			colorbackground[] = {0,0,0,1};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.200 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
			onLoad = "_this spawn EVOR_fnc_dlgDisplayFps;";
		};
		class back: IGUIBack {
			idc = 1002;
			colorbackground[] = {0,0,0,0.6};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.400;
		};
		class headMarker: RscText {
			idc = 1003;
			text = "3D PLAYER MARKERS";
			colorbackground[] = {0,0,0,1};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.225 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
		};
		class headVisibility: RscText {
			idc = 1004;
			text = "VISIBILITY";
			colorbackground[] = {0,0,0,1};
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.425 + safezoneY;
			w = safezoneW * 0.400;
			h = safezoneH * 0.020;
		};
		
		// Controls text
		class textMarkerEnabled: RscStructuredText {
			idc = 1005;
			text = "<t align = 'right'>ENABLED: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.250 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textMarkerRange: RscStructuredText {
			idc = 1006;
			text = "<t align = 'right'>RANGE: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.275 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textMarkerColor: RscStructuredText {
			idc = 1007;
			text = "<t align = 'right'>COLOR: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.300 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textVisOverall: RscStructuredText {
			idc = 1008;
			text = "<t align = 'right'>OVERALL: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.450 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textVisObject: RscStructuredText {
			idc = 1009;
			text = "<t align = 'right'>OBJECT: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.475 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textVisShadow: RscStructuredText {
			idc = 1010;
			text = "<t align = 'right'>SHADOW: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.500 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		class textVisGrid: RscStructuredText {
			idc = 1011;
			text = "<t align = 'right'>TERRAIN: </t>";
			x = safezoneW * 0.300 + safezoneX;
			y = safezoneH * 0.525 + safezoneY;
			w = safezoneW * 0.100;
			h = safezoneH * 0.020;
		};
		
		// Marker controls
		class mark3DCheckbox: RscCheckBox {
			idc = 1012;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.250 + safezoneY;
			w = safezoneW * 0.030;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsCb3DMark;";
			onCheckedChanged = "_this call EVOR_fnc_dlgSettingsCb3DMark;";
		};
		class mark3DComboRange: RscCombo {
			idc = 1013;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.275 + safezoneY;
			w = safezoneW * 0.225;
			h = safezoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsComboRange;";
			onLBSelChanged = "_this call EVOR_fnc_dlgSettingsComboRange;";
		};
		class mark3DComboColor: RscCombo {
			idc = 1014;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.300 + safezoneY;
			w = safezoneW * 0.225;
			h = safezoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsComboColor;";
			onLBSelChanged = "_this call EVOR_fnc_dlgSettingsComboColor;";
		};
		
		// Visibility Sliders
		class sliderOverall: RscSlider {
			idc = 1015;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.450 + safezoneY;
			w = safezoneW * 0.225;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsSliderVis;";
			onSliderPosChanged = "_this call EVOR_fnc_dlgSettingsSliderVis;";
		};
		class sliderObject: RscSlider {
			idc = 1016;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.475 + safezoneY;
			w = safezoneW * 0.225;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsSliderVis;";
			onSliderPosChanged = "_this call EVOR_fnc_dlgSettingsSliderVis;";
		};
		class sliderShadow: RscSlider {
			idc = 1017;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.500 + safezoneY;
			w = safezoneW * 0.225;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsSliderVis;";
			onSliderPosChanged = "_this call EVOR_fnc_dlgSettingsSliderVis;";
		};
		class comboTerrain: RscCombo {
			idc = 1018;
			x = safezoneW * 0.400 + safezoneX;
			y = safezoneH * 0.525 + safezoneY;
			w = safezoneW * 0.225;
			h = safezoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsComboGrid;";
			onLBSelChanged = "_this call EVOR_fnc_dlgSettingsComboGrid;";
		};
		
		// Visibility Edits
		class editOverall: RscEdit {
			idc = 1019;
			x = safezoneW * 0.625 + safezoneX;
			y = safezoneH * 0.450 + safezoneY;
			w = safezoneW * 0.050;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsEditVis;";
			onChar = "_this call EVOR_fnc_dlgSettingsEditVis;";
		};
		class editObject: RscEdit {
			idc = 1020;
			x = safezoneW * 0.625 + safezoneX;
			y = safezoneH * 0.475 + safezoneY;
			w = safezoneW * 0.050;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsEditVis;";
			onChar = "_this call EVOR_fnc_dlgSettingsEditVis;";
		};
		class editShadow: RscEdit {
			idc = 1021;
			x = safezoneW * 0.625 + safezoneX;
			y = safezoneH * 0.500 + safezoneY;
			w = safezoneW * 0.050;
			h = safeZoneH * 0.020;
			onLoad = "_this call EVOR_fnc_dlgSettingsEditVis;";
			onChar = "_this call EVOR_fnc_dlgSettingsEditVis;";
		};
			
		// Buttons
		class buttonClose: RscButton {
			idc = 1022;
			text = "BACK";
			x = safezoneW * 0.605 + safezoneX;
			y = safezoneH * 0.630 + safezoneY;
			w = safezoneW * 0.095;
			h = safezoneH * 0.020;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 0;";
		};
	};
};