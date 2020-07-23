class param_SEN_title {
	title = "---------------------- Dynamic Combat Generator Parameters ----------------------";
	values[] = {1};
	texts[] = {""};
	default = 1;
   SEN_paramCode = "";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_debug {
   title = "Debug Mode";
   values[] = {0,1};
   texts[] = {"Off", "On"};
   default = 0;
   SEN_paramCode = "SEN_debug = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_SEN_disableCamera {
   title = "Disable Third Person Camera";
   values[] = {0,1};
   texts[] = {"Off", "On"};
   default = 0;
   SEN_paramCode = "SEN_disableCamera = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_SEN_season {
   title = "Season";
   values[] = {-1,0,1,2,3};
   texts[] = {"Random","Summer","Fall","Winter","Spring"};
   default = 2;
   SEN_paramCode = "SEN_season = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_time {
   title = "Time of Day";
   values[] = {-1,0,1,2,3};
   texts[] = {"Random","Morning","Midday","Evening","Night"};
   default = 0;
   SEN_paramCode = "SEN_time = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_enemySide {
   title = "Enemy Side";
   values[] = {0,2};
   texts[] = {"East", "Independent"};
   default = 0;
   SEN_paramCode = "SEN_enemySide = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_patrol {
   title = "Enemy Patrols";
   values[] = {0,1};
   texts[] = {"Off", "On"};
   default = 1;
   SEN_paramCode = "SEN_patrol = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_armoredCount {
   title = "Armored Patrol Count";
   values[] = {0,10,20,50,80};
   texts[] = {"None", "Lite", "Low", "Medium", "High"};
   default = 10;
   SEN_paramCode = "SEN_armoredCount = ((%1)*.01);";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_occupiedCount {
   title = "Occupied Location Count";
   values[] = {1,2,3};
   texts[] = {"1", "2", "3 (SERVER INTENSIVE)"};
   default = 1;
   SEN_paramCode = "SEN_occupiedCount = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_occupiedEnemyCount {
   title = "Occupied Location Enemy Count";
   values[] = 10,20,40};
   texts[] = {"Low","Medium", "High"};
   default = 10;
   SEN_paramCode = "SEN_occupiedEnemyCount = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_allowIED {
   title = "Roadside IEDs";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
   SEN_paramCode = "SEN_allowIED = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_VFX {
	title = "Visual Effects";
	values[] = {0,1};
	texts[] = {"Off","On"};
	default = 1;
   SEN_paramCode = "SEN_VFX = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_allowMod {
   title = "Use Modified Content if Available";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
   SEN_paramCode = "SEN_allowMod = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_SEN_cacheDist {
   title = "AI Cache Distance (meters)";
   values[] = {1000,2000,3000};
   texts[] = {"1000","2000","3000"};
   default = 1000;
   SEN_paramCode = "SEN_cacheDist = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_ACE_title {
   title = "---------------------- ACE 3 Parameters ----------------------";
   values[] = {1};
   texts[] = {""};
   default = 1;
   SEN_paramCode = "";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_ACE_AdvMed {
   title = "* requires Advanced Medical Level";
   values[] = {1};
   texts[] = {""};
   default = 1;
   SEN_paramCode = "";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 0;
};
class param_ACE_MedLevel {
   title = "Medical Level";
   values[] = {1,2};
   texts[] = {"Basic","Advanced"};
   default = 1;
   SEN_paramCode = "ace_medical_level = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_AdvWounds {
   title = "Advanced Wounds *";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
   SEN_paramCode = "ace_medical_enableAdvancedWounds = %1;";
   SEN_paramBoolean = 1;
   SEN_paramPublic = 1;
};
class param_ACE_playerDmgThreshold {
   title = "Player Damage Threshold";
   values[] = {8,11,14};
   texts[] = {"Low","Medium","High"};
   default = 11;
   SEN_paramCode = "ace_medical_playerDamageThreshold = ((%1)*0.1);";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_reviveTime {
   title = "Max Revive Time (minutes)";
   values[] = {60,300,600,900};
   texts[] = {"1","5","10","15"};
   default = 600;
   SEN_paramCode = "ace_medical_maxReviveTime = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_preventInstaDeath {
   title = "Prevent Instant Death";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 0;
   SEN_paramCode = "ace_medical_preventInstaDeath = %1;";
   SEN_paramBoolean = 1;
   SEN_paramPublic = 1;
};
class param_ACE_PAKUsage {
   title = "Personal Aid Kit Usage *";
   values[] = {0,1};
   texts[] = {"Anyone","Medic Only"};
   default = 1;
   SEN_paramCode = "ace_medical_medicSetting_PAK = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_PAKConsume {
   title = "Consume Personal Aid Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
   SEN_paramCode = "ace_medical_consumeItem_PAK = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_PAKLocal {
   title = "Personal Aid Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 0;
   SEN_paramCode = "ace_medical_useLocation_PAK = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_PAKCond {
   title = "Personal Aid Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
   SEN_paramCode = "ace_medical_useCondition_PAK = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_surgicalUsage {
   title = "Surgical Kit Usage *";
   values[] = {0,1};
   texts[] = {"Anyone","Medic Only"};
   default = 1;
   SEN_paramCode = "ace_medical_medicSetting_SurgicalKit = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_surgicalConsume {
   title = "Consume Surgical Kit *";
   values[] = {0,1};
   texts[] = {"No","Yes"};
   default = 1;
   SEN_paramCode = "ace_medical_consumeItem_SurgicalKit = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_surgicalLocal {
   title = "Surgical Kit Usage Location *";
   values[] = {0,1,2,3,4};
   texts[] = {"Anywhere","Medical Vehicles","Medical Facilities","Medical Vehicles and Facilities","Disabled"};
   default = 3;
   SEN_paramCode = "ace_medical_useLocation_SurgicalKit = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_surgicalCond {
   title = "Surgical Kit Usage Condition *";
   values[] = {0,1};
   texts[] = {"Usable Any Time","Usable on Stable Patient"};
   default = 1;
   SEN_paramCode = "ace_medical_useCondition_SurgicalKit = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_viewDist {
   title = "Max View Distance (meters)";
   values[] = {3000,6000,9000};
   texts[] = {"3000","6000","9000"};
   default = 6000;
   SEN_paramCode = "ace_viewdistance_limitViewDistance = %1;";
   SEN_paramBoolean = 0;
   SEN_paramPublic = 1;
};
class param_ACE_AB {
   title = "Advanced Ballistics";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
   SEN_paramCode = "ace_advanced_ballistics_enabled = %1;";
   SEN_paramBoolean = 1;
   SEN_paramPublic = 1;
};
class param_ACE_BFT {
   title = "Blue Force Tracking";
   values[] = {0,1};
   texts[] = {"Off","On"};
   default = 1;
   SEN_paramCode = "ace_map_bft_enabled = %1;";
   SEN_paramBoolean = 1;
   SEN_paramPublic = 1;
};