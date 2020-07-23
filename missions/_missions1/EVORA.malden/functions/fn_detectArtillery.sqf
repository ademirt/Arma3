scriptName "EVOR_fnc_detectArtillery";
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (getNumber (configFile >> "CfgVehicles" >> typeOf _veh >> "artilleryScanner") != 1) exitWith {};
if (EVOR_var_CounterArtyChance <= 0) exitWith {};

_veh addEventHandler [
	"Fired",{
		private _veh = _this select 0;
		private _weapon = _this select 1;
		
		if (
			(local _veh)
			and {(_weapon in (_veh weaponsTurret [0]))
			and {(random 1 <= EVOR_var_CounterArtyChance)}}
		) then {
			[_veh] remoteExec ["EVOR_fnc_attackCounterArty",2,false];
		};
	}
];