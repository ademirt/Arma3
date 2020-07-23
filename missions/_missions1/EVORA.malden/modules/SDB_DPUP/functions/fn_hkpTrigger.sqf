scriptName _fnc_scriptName;

params ["_proj","_veh","_ammo","_source"];

// Add launch to list of incoming
if (isNil "_proj") then {
	_proj = nearestObject [_source,_ammo];
};

// Determine HKP data
private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cfgDPUP = missionConfigFile >> "DPUP";
private _cfgDPUPVeh = _cfgDPUP >> "CfgVehicles" >> typeOf _veh;
private _turret = ([_cfgDPUPVeh,"hkpTurret",getNumber (_cfgVeh >> "smokeLauncherOnTurret")] call BIS_fnc_returnConfigEntry) == 1;
private _angle = ([_cfgDPUPVeh,"hkpAngle",getNumber (_cfgVeh >> "smokeLauncherAngle")] call BIS_fnc_returnConfigEntry)/2;
private _range = [_cfgDPUPVeh,"hkpRange",getNumber (_cfgDPUP >> "hkpRange")] call BIS_fnc_returnConfigEntry;

// Wait until projectile is close
waitUntil {(isNull _proj) or {(!alive _veh) or {_veh distance _proj < _range}}};
if ((isNull _proj) or {!alive _veh}) exitWith {};

// Check if HKP has ammo and projectile is in HKP sector
private _ammoCur = _veh getVariable ["DPUP_var_HkpAmmo",0];
private _relDirProj = _veh getRelDir _proj;
private _relDirTurret = if (_turret) then {(360-deg(_veh animationPhase "MainTurret")) mod 360} else {0};
private _relDirDiff = (360+_relDirProj - _relDirTurret + _angle) mod 360;
if ((_relDirDiff > 2*_angle) or {_ammoCur < 1}) exitWith {};

// Substract HKP ammo
_veh setVariable ["DPUP_var_HkpAmmo",_ammoCur-1,true];

// Spawn explosives and delete projectile
private _modelCntr = _veh selectionPosition ["OsaVeze","Memory"];
private _modelProj = _veh worldToModel (_proj modelToWorld [0,0,0]);
private _modelVector = (_modelCntr vectorFromTo _modelProj) vectorMultiply 3;

private _bomb = createVehicle ["ClaymoreDirectionalMine_Remote_Ammo_Scripted",[0,0,0],[],0,"CAN_COLLIDE"];
_bomb setDir (_veh getDir _proj);
_bomb setPos (_veh modelToWorld (_modelCntr vectorAdd _modelVector));
_bomb setDamage 1;

private _expl = createVehicle ["SmallSecondary",[0,0,0],[],0,"CAN_COLLIDE"];
_expl setPosWorld getPosWorld _proj;
deleteVehicle _proj;