scriptName "EVOR_fnc_createAirf";
if (!isServer) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objName	= _objActive select 0;
private _airfName	= _objName + " Airfield";
private _airfBase	= "base" + _objName;
private _airfRadius	= 100;

// Reveal airfield buildings
{
	if (isObjectHidden _x) then {
		_x hideObjectGlobal false;
		sleep 5;
	};
} forEach ((getMarkerPos _airfBase) nearObjects ["All",_airfRadius + 50]);

// Add airfield to base core and base service arrays
private _teleport		= missionNamespace getVariable [format ["%1_teleport",_airfBase],objNull];
private _spawnSupply	= missionNamespace getVariable [format ["%1_supply",_airfBase],objNull];
private _spawnVeh		= missionNamespace getVariable [format ["%1_veh",_airfBase],objNull];
private _spawnBoat		= missionNamespace getVariable [format ["%1_boat",_airfBase],objNull];
private _spawnHeli		= missionNamespace getVariable [format ["%1_heli",_airfBase],objNull];
private _spawnJet		= missionNamespace getVariable [format ["%1_jet",_airfBase],objNull];
private _serviceJet		= missionNamespace getVariable [format ["%1_service",_airfBase],objNull];
EVOR_list_BaseCore pushBack [_airfBase,_airfRadius,_teleport,[_spawnSupply,_spawnVeh,_spawnBoat,_spawnHeli,_spawnJet],0];
if (!isNull _spawnVeh) then		{(EVOR_list_BaseService select 0) pushBack _spawnVeh;};
if (!isNull _spawnBoat) then	{(EVOR_list_BaseService select 1) pushBack _spawnBoat;};
if (!isNull _spawnHeli) then	{(EVOR_list_BaseService select 2) pushBack _spawnHeli;};
if (!isNull _spawnJet) then		{(EVOR_list_BaseService select 3) pushBack _spawnJet;};
if (!isNull _serviceJet) then	{(EVOR_list_BaseService select 3) pushBack _serviceJet;};
publicVariable "EVOR_list_BaseCore";
publicVariable "EVOR_list_BaseService";

// Reveal new airfield marker
_airfBase setMarkerAlpha 1;
_airfBase setMarkerText _airfName;

[[EVOR_var_SideFriendly,"HQ"],format ["%1 is now under our control!",_airfName]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];