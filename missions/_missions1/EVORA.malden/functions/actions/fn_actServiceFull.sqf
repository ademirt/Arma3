scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (_veh isKindOf "StaticWeapon") exitWith {};

private _actionCond = format [
	"
		(_target == vehicle _this)
		and {(local _target)
		and {((EVOR_list_BaseService select %1) findIf {_target distance _x < 25} >= 0)
		and {(_target getVariable ['EVOR_var_ServiceReady',true])
		and {(vectorMagnitude velocity _target < 1)
		and {((isTouchingGround _target) or {surfaceIsWater getPosWorld _target})}}}}}
	",
	["LandVehicle","Ship","Helicopter","Plane"] findIf {_veh isKindOf _x}
];

private _actionScript = {
	private _veh = _this select 0;
	private _caller = _this select 1;
	
	private _durRefuel = 5;
	private _durRearm = 10;
	private _durRepair = 30*(((getAllHitPointsDamage _veh) param [2,[damage _veh],[[]]]) call BIS_fnc_ArithmeticMean);
	
	_veh setVariable ["EVOR_var_ServiceReady",false,true];
	
	// Remove
	_veh setFuel 0;																			// Defuel vehicle
	if (!isNil "DALE_fnc_pylonRearm") then {[_veh,false] call DALE_fnc_pylonRearm;};		// Dearm vehicle
	
	// Add
	if ([_veh,_caller,true,_durRepair] call EVOR_fnc_serviceRepair) then {
		_veh setDamage 0;																	// Repair vehicle
		[_veh,false] call EVOR_fnc_setVehInventory;											// Reset inventory
		
		if ([_veh,_caller,true,_durRearm] call EVOR_fnc_serviceRearm) then {
			if (!isNil "DALE_fnc_pylonRearm") then {[_veh,true] call DALE_fnc_pylonRearm;};	// Rearm vehicle
			if (!isNil "DPUP_fnc_hkpRearm") then {[_veh,true] call DPUP_fnc_hkpRearm;};		// Reset hard-kill
			[_veh] call EVOR_fnc_setVehMags;												// Rearm bonus ammo
		
			if ([_veh,_caller,true,_durRefuel] call EVOR_fnc_serviceRefuel) then {
				_veh setFuel 1;																// Refuel vehicle
			};
		};
	};
	
	_veh setVariable ["EVOR_var_ServiceReady",true,true];
};

private _display = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
private _actionText = format ["Service %1",_display];

private _actionID = _veh addAction ["",_actionScript,nil,-5,true,true,"",_actionCond,-1,false];
_veh setUserActionText [_actionID,_actionText,"<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa'/></t>"];