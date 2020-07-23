scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _caller = param [0,player,[objNull]];

private _actionCond = "
	(isNull objectParent _this)
	and {(EVOR_list_BaseCore findIf {_this distance2D getMarkerPos (_x # 0) < (_x # 1)} >= 0)
	and {(isPlayer _this)}}
";

private _actionScript = {_this call EVOR_fnc_dlgMenuOpen;};

private _actionID = _caller addAction ["",_actionScript,nil,-5,false,true,"",_actionCond,-1,false];
_caller setUserActionText [_actionID,"Support Network","<t size='2.5'><img image='a3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa'/></t>"];