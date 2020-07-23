scriptName _fnd_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _animSources = ["showCamonetHull","showCamonetTurret"] select {isClass (_cfgVeh >> "AnimationSources" >> _x)};

if (_animSources isEqualTo []) exitWith {};

private _actionCond = "(isNull objectParent _this) and {alive _target}";
private _actionScript = {
	params ["_veh","_caller","_id","_params"];
	
	private _stateOld = _veh animationPhase (_params select 0);
	private _skin = [];
	{_skin append [_x,1-_stateOld];} forEach _params;
	
	[_veh,[false,_skin]] call EVOR_fnc_setVehSkin;
};

private _actionID = _veh addAction ["",_actionScript,_animSources,0,true,true,"",_actionCond,10];
_veh setUserActionText [_actionID,"Toggle Camo Net"];