if (!hasInterface) exitWith {};

private _newUnit = param [0,player,[objNull]];
private _oldUnit = param [1,objNull,[objNull]];

private _markRespawn = ([playerSide,false] call BIS_fnc_getRespawnMarkers) param [0,"",[""]];
private _posRespawn = (getMarkerPos _markRespawn) vectorAdd [-4+random 8,-4+random 8,0];
private _intersections = lineIntersectsSurfaces [_posRespawn vectorAdd [0,0,100],_posRespawn,objNull,objNull,true,1,"GEOM","NONE",false];
_newUnit setPosASL (_intersections select 0 select 0);

// Load loadout when actually respawned and add laserbattery if designator in inventory
if (!(_newUnit getVariable ["BIS_revive_incapacitated",false])) then {
	_newUnit setUnitLoadout [profileNamespace getVariable "EVOR_var_SavedLoadout",true];
};

// Disconnect UAV's from old unit
_oldUnit connectTerminalToUAV objNull;

// Initialize actions
if (playerSide isEqualTo EVOR_var_SideFriendly) then {[player] call EVOR_fnc_actNetwork;};
[player] call EVOR_fnc_actFlip;
[player] call EVOR_fnc_actPush;
[player] call EVOR_fnc_actServiceField;
[player] call EVOR_fnc_actHealOther;
[player] call EVOR_fnc_actHealSelf;

// Player traits
_newUnit setUnitTrait ["explosiveSpecialist",true];
_newUnit setUnitTrait ["UAVHacker",true];
_newUnit enableStamina EVOR_var_EnableStamina;
_newUnit setVehicleReceiveRemoteTargets true;
_newUnit setVehicleReportOwnPosition true;
_newUnit setVehicleReportRemoteTargets true;

// ACE traits
if (EVOR_var_EnabledAceMedic) then {_newUnit setVariable ["ACE_medical_medicClass",2,true];};
if (EVOR_var_EnabledAceRepair) then {_newUnit setVariable ["ACE_IsEngineer",0];};

if (!isNull _oldUnit) then {
	sleep 2;
	hideBody _oldUnit;
};

player enableFatigue false;
player setCustomAimCoef 0.4;
player setUnitRecoilCoefficient 0.5;

[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;