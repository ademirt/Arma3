scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _caller = param [0,player,[objNull]];

private _actionCond = "
	private _veh = cursorTarget;
	(isNull objectParent _this)
	and {(!isNull _veh)
	and {(_this distance _veh < 4+(sizeOf typeOf _veh)/2)
	and {(_veh isKindOf 'LandVehicle')
	and {(!(_veh isKindOf 'StaticWeapon'))
	and {(!(_veh isKindOf 'Kart_01_Base_F'))
	and {(vectorUp _veh select 2 < 0)}}}}}}
";

private _actionScript = {
	private _veh = cursorTarget;
	private _caller = _this select 1;
	private _pos = getPos _veh;
	_veh setPos [_pos select 0,_pos select 1];
};

private _actionID = _caller addAction ["",_actionScript,nil,-10,true,true,"",_actionCond,-1,false];
_caller setUserActionText [_actionID,"Set up the vehicle","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa'/></t>"];