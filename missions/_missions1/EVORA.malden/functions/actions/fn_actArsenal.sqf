scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _box = param [0,objNull,[objNull]];

private _actionCond = "(isNull objectParent _this) and {(alive _target) and {(isPlayer _this)}}";
private _actionScript = {["Open",true] spawn BIS_fnc_arsenal;};

private _actionID = _box addAction ["",_actionScript,nil,-4,true,true,"",_actionCond,15];
_box setUserActionText [_actionID,"Arsenal","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/></t>"];