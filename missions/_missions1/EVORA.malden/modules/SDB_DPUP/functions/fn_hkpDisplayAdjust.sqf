scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

disableSerialization;

private _display = param [0,displayNull,[displayNull]];

if (isNull _display) exitWith {};

private _ctrls = allControls _display;
private _type = toLower param [1,"",[""]];

switch _type do {
	case "update": {	// Update display
		private _veh		= param [2,objNull,[objNull]];
		private _turret		= param [3,true,[false]];
		
		private _ctrlSector	= _ctrls select 0;
		private _ctrlThreat	= _ctrls select 1;
		private _ctrlAmmo	= _ctrls select 2;
		
		private _angle		= [0,-deg (_veh animationPhase "mainTurret")] select _turret;
		private _threats	= (_veh getVariable ["DPUP_var_ListIncoming",[]]) select {!isNull (_x select 0)};
		private _ammo		= _veh getVariable ["DPUP_var_HkpAmmo",0];
		private _count		= -1 + count _threats;
		
		{_x ctrlShow true;} forEach [_ctrlSector,_ctrlAmmo];
		_ctrlSector ctrlSetAngle [_angle,0.5,0.5];
		_ctrlThreat ctrlShow (_count >= 0);
		if (_count >= 0) then {_ctrlThreat ctrlSetAngle [_veh getRelDir (_threats select _count select 0),0.5,0.5];};
		_ctrlAmmo ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",_ammo];
	};
	case "hide": {		// Hide display
		{_x ctrlShow false;} forEach _ctrls;
	};
	default {			// Close display
		_display closeDisplay 1;
	};
};