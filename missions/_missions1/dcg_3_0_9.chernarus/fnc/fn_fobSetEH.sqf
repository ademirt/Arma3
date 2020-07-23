/*
Author: SENSEI

Last modified: 9/11/2015

Description: set curator event handler. run on player only

Return: nothing
__________________________________________________________________*/
SEN_fobReinforced = false;
publicVariable "SEN_fobReinforced";
SEN_fobVehicles = false;
publicVariable "SEN_fobVehicles";

(_this select 0) addEventHandler ["CuratorObjectPlaced",{
	if (typeOf (_this select 1) in ["Land_Medevac_house_V1_F", "Land_Medevac_HQ_V1_F"]) then {
		(_this select 1) setvariable ["ace_medical_isMedicalFacility", true, true];
	};
	if (typeOf (_this select 1) in ["Land_HelipadCircle_F", "Land_HelipadCivil_F", "Land_HelipadEmpty_F","Land_HelipadRescue_F","Land_HelipadSquare_F","Land_JumpTarget_F"] && {!SEN_fobReinforced}) then {
		SEN_fobReinforced = true;
		publicVariable "SEN_fobReinforced";
		hintSilent "Helipad deployed. Reinforcements inbound.";
		[(getPosATL (_this select 1)),WEST,0,2000,"MOVE",true,true] remoteExecCall ["SEN_fnc_spawnReinforcements", 2, false];
	};
	if (typeOf (_this select 1) in ["CamoNet_BLUFOR_big_Curator_F", "CamoNet_OPFOR_big_Curator_F", "CamoNet_INDP_big_Curator_F"] && {!SEN_fobVehicles}) then {
		SEN_fobVehicles = true;
		publicVariable "SEN_fobVehicles";
		hintSilent "Vehicle cover deployed. You can spawn vehicles now.";
		[(_this select 0),["rhsusf_c_hmmwv","A3_Soft_F_MRAP_01","A3_Soft_F_HEMTT"]] remoteExecCall ["SEN_fnc_fobAddAddon", 2, false];
	};
}];