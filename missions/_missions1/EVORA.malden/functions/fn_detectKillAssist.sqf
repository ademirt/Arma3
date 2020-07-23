scriptName "EVOR_fnc_detectKillAssist";
if ((!isMultiplayer) or {!isServer}) exitWith {};

private _unit = param [0,objNull,[objNull]];

_unit addEventHandler [
	"HandleDamage",
	{
		private _unit = _this select 0;
		private _damage = _this select 2;
		private _hit = _this select 5;
		private _source = _this select 6;
		private _assistArray = _unit getVariable ["EVOR_var_KillAssists",[]];
		
		// Add player to assist list
		if (
			(isPlayer _source)
			and {([side group _unit,side group _source] call BIS_fnc_sideIsEnemy)
			and {(_damage - (_unit getHitIndex _hit) > 0.1)}}
		) then {
			_assistArray pushBackUnique _source;
			_unit setVariable ["EVOR_var_KillAssists",_assistArray,false];
		};
		
		// Pay out assist list when unit is disabled
		if (!canMove _unit) then {
			_unit removeAllEventHandlers "HandleDamage";
			_unit setVariable ["EVOR_var_KillAssists",nil,false];
			{_x addScore EVOR_var_ScoreKillAssist;} forEach _assistArray;
			(format ["%1 funds received for assisting with eliminating an enemy air asset!",EVOR_var_ScoreKillAssist]) remoteExecCall ["hint",_assistArray,false];
		};
		
		nil;
	}
];