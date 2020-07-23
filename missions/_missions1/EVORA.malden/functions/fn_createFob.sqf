scriptName "EVOR_fnc_createFob";
if (!isServer) exitWith {};

private _veh	= param [0,objNull,[objNull]];
private _fobPos	= getPos _veh;
private _fobDir	= getDir _veh;
private _fobRadius = EVOR_var_FOBRadius;

if (isNull _veh) exitWith {};

private _fobName = if (EVOR_list_BaseNames isEqualTo []) then {
	mapGridPosition _fobPos;
} else {
	EVOR_list_BaseNames deleteAt (floor random count EVOR_list_BaseNames);
};
private _fobBase = format ["base%1",_fobName];

deleteVehicle _veh;

// If water is found spawn a dock and an invisible helipad as a boat spawn
private _water = [_fobPos,20,60] call EVOR_fnc_findClosestWater;
private ["_spawnBoat"];
if (_water isEqualTo []) then {
	_spawnBoat = objNull;
} else {
	_spawnBoat = createSimpleObject ["Land_HelipadEmpty_F",[0,0,0]];
	private _waterDir = _fobPos getDir _water;
	_spawnBoat setDir _waterDir;
	_spawnBoat setPosASL (_water vectorAdd [10*sin _waterDir,10*cos _waterDir,1]);
};

// Spawn the FOB buildings
[_fobPos,_fobDir,[_fobBase] call (compile preprocessFileLineNumbers "data\comp_Fob.sqf")] call EVOR_fnc_objectsMapper;
private _arsenal = missionNamespace getVariable [format ["%1_arsenal",_fobBase],objNull];
[_arsenal] remoteExecCall ["EVOR_fnc_initBaseArsenal",0,_arsenal];

// Add fob to base core and base service arrays
private _teleport		= missionNamespace getVariable [format ["%1_teleport",_fobBase],objNull];
private _spawnSupply	= missionNamespace getVariable [format ["%1_supply",_fobBase],objNull];
private _spawnVeh		= missionNamespace getVariable [format ["%1_veh",_fobBase],objNull];
private _spawnHeli		= missionNamespace getVariable [format ["%1_heli",_fobBase],objNull];
private _spawnJet		= missionNamespace getVariable [format ["%1_jet",_fobBase],objNull];
private _service		= missionNamespace getVariable [format ["%1_service",_fobBase],objNull];
EVOR_list_BaseCore pushBack [_fobBase,_fobRadius,_teleport,[_spawnSupply,_spawnVeh,_spawnBoat,_spawnHeli,_spawnJet],0];
if (!isNull _service) then		{(EVOR_list_BaseService select 0) pushBack _service;};
if (!isNull _spawnBoat) then	{(EVOR_list_BaseService select 1) pushBack _spawnBoat;};
if (!isNull _service) then		{(EVOR_list_BaseService select 2) pushBack _service;};
if (!isNull _service) then		{(EVOR_list_BaseService select 3) pushBack _service;};
publicVariable "EVOR_list_BaseCore";
publicVariable "EVOR_list_BaseService";

// Creating new FOB marker
_fobMarker = createMarker [_fobBase,_fobPos];
_fobMarker setMarkerShape "ICON";
_fobMarker setMarkerType (["o_service","b_service","n_service"] param [EVOR_var_SideFriendly call BIS_fnc_sideID,"",[""]]);
_fobMarker setMarkerText format ["FOB %1",_fobName];

[[EVOR_var_SideFriendly,"HQ"],format ["FOB %1 constructed at grid %2",_fobName,mapGridPosition _fobPos]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];