scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _caller = param [0,player,[objNull]];

private _dmgThreshold = 0.5;
private _actionCond = format ["
	(isNull objectParent _this)
	and {(cursorTarget isKindOf 'AllVehicles')
	and {(!(cursorTarget isKindOf 'Man'))
	and {(_this distanceSqr cursorTarget < (4+sizeOf typeOf cursorTarget/2)^2)
	and {(('ToolKit' in items _this) or {'ToolKit' in itemCargo cursorTarget})
	and {((damage cursorTarget > %1) or {((getAllHitPointsDamage cursorTarget) param [2,[],[[]]]) findIf {_x > %1} >= 0})
	and {(alive cursorTarget)
	and {(vectorMagnitudeSqr velocity cursorTarget < 1)
	and {(isTouchingGround _this)}}}}}}}}
",_dmgThreshold];

private _actionScript = {
	[] call EVOR_fnc_serviceField;
};

private _actionDur = 10;
private _actionText = "Field-repair vehicle";
private _actionIcon = "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";

[_caller,_actionText,_actionIcon,_actionIcon,_actionCond,_actionCond,nil,nil,_actionScript,nil,nil,_actionDur,-3,false] call BIS_fnc_holdActionAdd;