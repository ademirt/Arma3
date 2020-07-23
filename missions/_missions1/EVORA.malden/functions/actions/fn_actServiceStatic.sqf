scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (!(_veh isKindOf "StaticWeapon")) exitWith {};

private _actionCond = "
	(_target == vehicle _this)
	and {(local _target)
	and {(EVOR_list_BaseCore findIf {_target distance2D getMarkerPos (_x # 0) < (_x # 1)} >= 0)
	and {(_target getVariable ['EVOR_var_ServiceReady',true])}}}
";

private _actionScript = {
	private _veh = _this select 0;
	private _caller = _this select 1;
	
	private _durRearm = 20;
	
	_veh setVariable ["EVOR_var_ServiceReady",false,true];
	
	// Remove
	if (!isNil "DALE_fnc_pylonRearm") then {[_veh,false] call DALE_fnc_pylonRearm;};	// Dearm vehicle
	
	// Add
	if ([_veh,_caller,true,_durRearm] call EVOR_fnc_serviceRearm) then {
		if (!isNil "DALE_fnc_pylonRearm") then {[_veh,true] call DALE_fnc_pylonRearm;};	// Rearm vehicle
		if (!isNil "DPUP_fnc_hkpRearm") then {[_veh,true] call DPUP_fnc_hkpRearm;};		// Reset hard-kill
		[_veh,false] call EVOR_fnc_setVehInventory;										// Reset inventory
		[_veh] call EVOR_fnc_setVehMags;												// Rearm bonus
	};
	
	_veh setVariable ["EVOR_var_ServiceReady",true,true];
};

private _display = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
private _actionText = format ["Rearm %1",_display];
private _actionIcon = "<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa'/></t>";

private _actionID = _veh addAction ["",_actionScript,nil,-5,true,true,"",_actionCond];
_veh setUserActionText [_actionID,_actionText,_actionIcon];