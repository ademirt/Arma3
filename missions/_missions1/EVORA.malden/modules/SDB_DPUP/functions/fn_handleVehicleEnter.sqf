scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

params ["_veh"];

if (!isNil {_veh getVariable "DPUP_var_EHIncoming"}) exitWith {};

private _script = ["[_this,nil] call BIS_fnc_arrayUnShift;"];
private _scriptWrn = [_veh] call DPUP_fnc_wrnCheck;	// Add Warnings
private _scriptHkp = [_veh] call DPUP_fnc_hkpCheck;	// Add "Hard-Kill" APS
_script pushBack _scriptWrn;
_script pushBack _scriptHkp;

if (count _script > 1) then {
	// Add "IncomingMissile" Eventhandler
	_veh setVariable ["DPUP_var_EHIncoming",[_veh addEventHandler ["IncomingMissile",_script joinString " "]],false];
	
	if (!isNil "_scriptHkp") then {
		[_veh,false] call DPUP_fnc_hkpRearm;	// Set "HKP" ammo if none present
		[] call DPUP_fnc_hkpDisplayInit;		// Add "HKP" dialog
	};
};