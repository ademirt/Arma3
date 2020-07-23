scriptName _fnc_scriptName;
if (!hasInterface or EVOR_var_EnabledAceMedic) exitWith {};

private _caller = param [0,player,[objNull]];

private _dmgThreshold = 0.2;
private _actionCond = format ["
	(isNull objectParent _this)
	and {(cursorTarget isKindOf 'Man')
	and {(_this distanceSqr cursorTarget < 25)
	and {('FirstAidKit' in items _this)
	and {(alive cursorTarget)
	and {((damage cursorTarget > %1) or {((getAllHitPointsDamage cursorTarget) param [2,[],[[]]]) findIf {_x > %1} >= 0})
	and {(!(cursorTarget getVariable ['BIS_revive_incapacitated',false]))
	and {(vectorMagnitudeSqr velocity _this < 0.25)
	and {(isTouchingGround _this)}}}}}}}}
",_dmgThreshold];

private _actionScript = {
	(_this select 1) removeItem "FirstAidKit";
	cursorTarget setDamage 0;
};

private _actionDur = 5;
private _actionText = "Perform triage";
private _actionIcon = "\a3\ui_f\data\IGUI\Cfg\Actions\bandage_ca.paa";

[_caller,_actionText,_actionIcon,_actionIcon,_actionCond,_actionCond,nil,nil,_actionScript,nil,nil,_actionDur,-6,false] call BIS_fnc_holdActionAdd;