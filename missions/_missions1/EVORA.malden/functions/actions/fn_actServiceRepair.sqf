scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

private _actionCond = "
	private _veh = vehicle _this;
	(!isNull objectParent _this)
	and {(local _veh)
	and {(_veh getVariable ['EVOR_var_ServiceReady',true])
	and {(vectorMagnitude velocity _veh < 1)
	and {((isTouchingGround vehicle _this) or {surfaceIsWater getPosWorld _veh})}}}}
";

private _actionScript = {
	private _caller = _this select 1;
	private _veh = vehicle _caller;
	
	private _durRepair = 40*(((getAllHitPointsDamage _veh) param [2,[damage _veh],[[]]]) call BIS_fnc_ArithmeticMean);
	_veh setVariable ["EVOR_var_ServiceReady",false,true];
	
	// Add
	if ([_veh,_caller,true,_durRepair] call EVOR_fnc_serviceRepair) then {
		_veh setDamage 0;							// Repair vehicle
		[_veh,false] call EVOR_fnc_setVehInventory;	// Reset inventory
	};
	
	_veh setVariable ["EVOR_var_ServiceReady",true,true];
};

private _display = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
private _actionText = format ["Repair at %1",_display];
private _actionIcon = "<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa'/></t>";

private _actionID = _veh addAction ["",_actionScript,nil,-5,true,true,"",_actionCond];
_veh setUserActionText [_actionID,_actionText,_actionIcon];