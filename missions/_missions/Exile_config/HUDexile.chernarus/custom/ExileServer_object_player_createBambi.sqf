private["_sessionID","_requestingPlayer","_spawnLocationMarkerName","_bambiPlayer","_accountData","_direction","_position","_spawnAreaPosition","_spawnAreaRadius","_clanID","_clanData","_clanGroup","_player","_devFriendlyMode","_devs","_parachuteNetID","_spawnType","_parachuteObject"];
_sessionID = _this select 0;
_requestingPlayer = _this select 1;
_spawnLocationMarkerName = _this select 2;
_bambiPlayer = _this select 3;
_accountData = _this select 4;
_direction = random 360;
if ((count ExileSpawnZoneMarkerPositions) isEqualTo 0) then 
{
	_position = call ExileClient_util_world_findCoastPosition;
	if ((toLower worldName) isEqualTo "namalsk") then 
	{
		while {(_position distance2D [76.4239, 107.141, 0]) < 100} do 
		{
			_position = call ExileClient_util_world_findCoastPosition;
		};
	};
}
else 
{
	_spawnAreaPosition = getMarkerPos _spawnLocationMarkerName;
	_spawnAreaRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
	_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
	while {surfaceIsWater _position} do 
	{
		_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
	};
};
_name = name _requestingPlayer;
_clanID = (_accountData select 3);
if !((typeName _clanID) isEqualTo "SCALAR") then
{
	_clanID = -1;
	_clanData = [];
}
else
{
	_clanData = missionNamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
	if(isNull (_clanData select 5))then
	{
		_clanGroup = createGroup independent;
		_clanData set [5,_clanGroup];
		_clanGroup setGroupIdGlobal [_clanData select 0];
		missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanData];
	}
	else
	{
		_clanGroup = (_clanData select 5);
	};
	[_player] joinSilent _clanGroup;
};
_bambiPlayer setPosATL [_position select 0,_position select 1,0];
_bambiPlayer disableAI "FSM";
_bambiPlayer disableAI "MOVE";
_bambiPlayer disableAI "AUTOTARGET";
_bambiPlayer disableAI "TARGET";
_bambiPlayer disableAI "CHECKVISIBLE";
_bambiPlayer setDir _direction;
_bambiPlayer setName _name;
_bambiPlayer setVariable ["ExileMoney", 0, true]; 
_bambiPlayer setVariable ["ExileScore", (_accountData select 0)];
_bambiPlayer setVariable ["ExileKills", (_accountData select 1)];
_bambiPlayer setVariable ["ExileDeaths", (_accountData select 2)];
_bambiPlayer setVariable ["ExileClanID", _clanID];
_bambiPlayer setVariable ["ExileClanData", _clanData];
_bambiPlayer setVariable ["ExileHunger", 100];
_bambiPlayer setVariable ["ExileThirst", 100];
_bambiPlayer setVariable ["ExileTemperature", 37];
_bambiPlayer setVariable ["ExileWetness", 0];
_bambiPlayer setVariable ["ExileAlcohol", 0]; 
_bambiPlayer setVariable ["ExileName", _name]; 
_bambiPlayer setVariable ["ExileOwnerUID", getPlayerUID _requestingPlayer]; 
_bambiPlayer setVariable ["ExileIsBambi", true];
_bambiPlayer setVariable ["ExileXM8IsOnline", false, true];
_bambiPlayer setVariable ["ExileLocker", (_accountData select 4), true];
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then 
{
	_devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	{
		if ((getPlayerUID _requestingPlayer) isEqualTo (_x select 0))exitWith 
		{
			if((name _requestingPlayer) isEqualTo (_x select 1))then
			{
				_bambiPlayer setVariable ["ExileMoney", 500000, true];
				_bambiPlayer setVariable ["ExileScore", 100000];
			};
		};
	}
	forEach _devs;
};
_parachuteNetID = "";
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
if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteSpawning")) isEqualTo 1) then
{
	_position set [2, getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteDropHeight")]; 
	if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "haloJump")) isEqualTo 1) then
	{
		_bambiPlayer addBackpackGlobal "B_Parachute";	
		_bambiPlayer setPosATL _position;
		_spawnType = 2;
	}
	else 
	{
		_parachuteObject = createVehicle ["Steerable_Parachute_F", _position, [], 0, "CAN_COLLIDE"];
		_parachuteObject setDir _direction;
		_parachuteObject setPosATL _position;
		_parachuteObject enableSimulationGlobal true;
		_parachuteNetID = netId _parachuteObject;
		_spawnType = 1;
	};
}
else
{
	_spawnType = 0;
};
_bambiplayer forceadduniform _bambiuniforms;
_bambiplayer addItem _bambifood;
_bambiplayer addItem _bambidrink;	
_bambiPlayer addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
_bambiPlayer call ExileServer_object_player_database_insert;
_bambiPlayer call ExileServer_object_player_database_update;
[
	_sessionID, 
	"createPlayerResponse", 
	[
		_bambiPlayer, 
		_parachuteNetID, 
		str (_accountData select 0),
		(_accountData select 1),
		(_accountData select 2),
		100,
		100,
		0,
		(getNumber (configFile >> "CfgSettings" >> "BambiSettings" >> "protectionDuration")) * 60, 
		_clanData,
		_spawnType
	]
] 
call ExileServer_system_network_send_to;
[_sessionID, _bambiPlayer] call ExileServer_system_session_update;
true