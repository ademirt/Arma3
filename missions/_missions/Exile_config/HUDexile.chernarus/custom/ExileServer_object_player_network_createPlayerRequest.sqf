private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_accountData","_bambiPlayer","_cargoType"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
_bambiuniforms = [
	"U_BG_Guerilla3_1",
	"U_C_HunterBody_grn",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"TRYK_shirts_DENIM_BK",
	"TRYK_shirts_DENIM_BL",
	"TRYK_shirts_DENIM_BWH",
	"TRYK_shirts_DENIM_od",
	"TRYK_shirts_DENIM_R",
	"TRYK_shirts_DENIM_WHB",
	"TRYK_shirts_DENIM_ylb",
	"TRYK_shirts_DENIM_od_Sleeve",
	"TRYK_shirts_DENIM_BL_Sleeve",
	"TRYK_shirts_DENIM_BWH_Sleeve",
	"TRYK_shirts_DENIM_R_Sleeve",
	"TRYK_shirts_DENIM_WHB_Sleeve",
	"TRYK_U_B_Denim_T_BK"
] call BIS_fnc_selectRandom;
_bambifood = ["Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy","Exile_Item_Catfood","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Dogfood","Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_Noodles","Exile_Item_SeedAstics","Exile_Item_Raisins","Exile_Item_Moobar"] call BIS_fnc_selectRandom;
_bambidrink = ["Exile_Item_PlasticBottleCoffee","Exile_Item_PowerDrink","Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_EnergyDrink","Exile_Item_MountainDupe"] call BIS_fnc_selectRandom;

try
{
	if (isNull _requestingPlayer) then 
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_spawnLocationMarkerName = _parameters select 0;
	_playerUID = getPlayerUID _requestingPlayer;
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam sucks!.",name _requestingPlayer];
	};
	_accountData = format["getAccountStats:%1", _playerUID] call ExileServer_system_database_query_selectSingle;
	_bambiPlayer = (createGroup independent) createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
	_bambiplayer forceadduniform _bambiuniforms;
	_bambiplayer addItem _bambifood;
	_bambiplayer addItem _bambidrink;
	removeHeadgear _bambiPlayer;
	{
		_cargoType = _x call ExileClient_util_cargo_getType;
		switch (_cargoType) do
		{
			case 1:	{ _bambiPlayer addItem _x; };
			case 2:	{ _bambiPlayer addWeaponGlobal _x; };
			case 3:	{ _bambiPlayer addBackpackGlobal _x; };
			case 4:	{ _bambiPlayer linkItem _x; };
			default	{ _bambiPlayer addItem _x; };
		};
	}
	forEach getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "loadOut");
	[_sessionID, _requestingPlayer, _spawnLocationMarkerName, _bambiPlayer, _accountData] call ExileServer_object_player_createBambi;
}
catch
{
	_exception call ExileServer_util_log;
};