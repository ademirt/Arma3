private["_spawnRadius","_minimumDistanceToTraderZones","_minimumDistanceToTerritories","_lootLifeTime","_buildings","_buildingNetIdsToSpawnLootIn","_building","_lastTimeSentToServer"];
if !(alive player) exitWith {false};
if !((vehicle player) isEqualTo player) exitWith {false};
_spawnRadius = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "spawnRadius");
_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "minimumDistanceToTraderZones");
_minimumDistanceToTerritories = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "minimumDistanceToTerritories");
_lootLifeTime = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "lifeTime") * 60;
_buildings = [];
{
  	_buildings append (player nearObjects [_x, _spawnRadius]);
} forEach ["Building","House","CUP_A2_an2wreck","CUP_A2_wreck_uh60","Land_UWreck_MV22_F"]; //_buildings = player nearObjects ["House", _spawnRadius];
_buildingNetIdsToSpawnLootIn = [];
{
	_building = _x;
	try 
	{
		if (isObjectHidden _building) throw false;
		_lastTimeSentToServer = _building getVariable ["ExileLastLootRequestedAt", -99999];
		if ((time - _lastTimeSentToServer) < _lootLifeTime) throw false;
		if (_minimumDistanceToTraderZones > 0) then
		{
			if ([_building, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
			{
				throw false;
			};
		};
		if (_minimumDistanceToTerritories > 0) then
		{
			if ([_building, _minimumDistanceToTerritories] call ExileClient_util_world_isTerritoryInRange) then
			{
				throw false;
			};
		};
		_buildingNetIdsToSpawnLootIn pushBack (netId _building);
		_building setVariable ["ExileLastLootRequestedAt", time];
	}
	catch 
	{
	};
}
forEach _buildings;
if ((count _buildingNetIdsToSpawnLootIn) > 0) then 
{
	["spawnLootRequest", [_buildingNetIdsToSpawnLootIn]] call ExileClient_system_network_send;
};