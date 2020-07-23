class general {
	file = "functions";
	class cinematicIntro {};
	class cinematicOutro {};
	class createAirf {};
	class createFob {};
	class detectArsenal {};
	class detectArtillery {};
	class detectKillAssist {};
	class detectTeamKill {};
	class detectVehEnter {};
	class earplugs {};
	class findClosestWater {};
	class findRandPos {};
	class formatLoadout {};
	class formatShopGear {};
	class getVehSkin {};
	class initAmmobox {};
	class initBaseArsenal {};
	class initBriefing {postInit = 1;};
	class initGear {};
	class initVeh {};
	class holster {};
	class listChange {};
	class manageCleanup {};
	class manageRespawn {};
	class mark3D {};
	class markMap {};
	class objectsMapper {};
	class scoreTicker {};
	class scoreTransfer {};
	class sessionHashServer {};
	class setVehInventory {};
	class setVehMags {};
	class setVehSkin {};
	class teleport {};
};

class actions {
	file = "functions\actions";
	class actArsenal {};
	class actBuild {};
	class actCamoToggle {};
	class actCargoLoad {};
	class actEject {};
	class actFlip {};
	class actHealOther {};
	class actHealSelf {};
	class actLock {};
	class actNetwork {};
	class actPush {};
	class actServiceField {};
	class actServiceFull {};
	class actServiceRearm {};
	class actServiceRefuel {};
	class actServiceRepair {};
	class actServiceStatic {};
};

class dialogControl {
	file = "functions\dialogControl";
	class dlgDisplayFps {};
	class dlgDisplayScore {};
	class dlgFundsCombo {};
	class dlgFundsLnbChange {};
	class dlgFundsLnbFill {};
	class dlgFundsTransfer {};
	class dlgMenuOpen {};
	class dlgProgressOpen {};
	class dlgSettingsCb3DMark {};
	class dlgSettingsComboColor {};
	class dlgSettingsComboGrid {};
	class dlgSettingsComboRange {};
	class dlgSettingsEditVis {};
	class dlgSettingsSliderVis {};
	class dlgShopLnbChange {};
	class dlgShopLnbFill {};
	class dlgShopOpen {};
	class dlgShopPurchase {};
	class dlgTransportLnbChange {};
	class dlgTransportLnbFill {};
	class dlgTransportTravel {};
};

class enemies {
	file = "functions\enemies";
	class attackBaseAirstrike {};
	class attackBaseMortar {};
	class attackCounterArty {};
	class attackParaDrop {};
	class createVehicleCargo {};
	class createVehicleCrew {};
	class setUnitSkill {};
	class spawnAirpatrol {};
	class spawnBaseAmphib {};
	class spawnBaseInf {};
	class spawnBaseMortar {};
	class spawnBaseVeh {};
	class spawnObjAA {};
	class spawnObjBoat {};
	class spawnObjInf {};
	class spawnObjMines {};
	class spawnObjMot {};
	class spawnObjPara {};
	class spawnObjReinf {};
	class spawnObjTur {};
};

class objectives {
	file = "functions\objectives";
	class objCheck {};
	class objComplete {};
	class objCreate {};
	class objQueue {};
	class objPopulate {};
};

class service {
	file = "functions\service";
	class serviceField {};
	class serviceFieldRemote {};
	class serviceRearm {};
	class serviceRefuel {};
	class serviceRepair {};
};

class shops {
	file = "functions\shops";
	class createObjectServer {};
	class detractScoreServer {};
	class purchaseGear {};
	class purchaseUnit {};
	class purchaseVeh {};
	class unlockUnit {};
};