scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _caller = param [0,player,[objNull]];

private _actionCond = "
	private _veh = cursorTarget;
	(isNull objectParent _this)
	and {(!isNull _veh)
	and {(_this distance _veh < 4+(sizeOf typeOf _veh)/2)
	and {(_veh isKindOf 'Ship')
	and {(isTouchingGround _this)}}}}
";

private _actionScript = {
	private _veh = cursorTarget;
	private _caller = _this select 1;
	private _vector = (vectorDir _caller) vectorMultiply 2;
	[_veh,_vector] remoteExecCall ["setVelocity",_veh,false];
};

private _actionID = _caller addAction ["",_actionScript,nil,-10,true,false,"",_actionCond,-1,false];
_caller setUserActionText [_actionID,"Push","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa'/></t>"];