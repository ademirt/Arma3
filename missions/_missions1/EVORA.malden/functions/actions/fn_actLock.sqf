scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (fullCrew [_veh,"",true] isEqualTo []) exitWith {};

private _actionCond = "true";
private _actionScript = {
	params ["_veh","_caller","_id","_display"];
	private _locked = locked _veh == 2;
	
	// Kick crew if caller is not inside when locked
	if ((!_locked) and {!(_veh isEqualTo vehicle _caller)}) then {
		{
			if (isPlayer _x) then {
				moveOut _x;
			} else {
				if (leader _x != _caller) then {doGetOut _x; _x leaveVehicle _veh;};
			};
		} forEach crew _veh;
	};
	
	// Toggle action text
	private _text = format ["%1 %2",["Unlock","Lock"] select _locked,_display];
	_veh setUserActionText [_id,_text,_text];
	
	// User feedback
	hintSilent format ["%1 %2",["Locked","Unlocked"] select _locked,_display];
	playSound "FD_CP_Clear_F";
	
	// (Un)lock vehicle
	[_veh,[2,0] select _locked] remoteExecCall ["lock",_veh,false];
};

private _display = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName");
private _actionText = format ["%1 %2",["Lock","Unlock"] select (locked _veh == 2),_display];
private _actionID = _veh addAction ["",_actionScript,_display,10,true,true,"",_actionCond,50,true];
_veh setUserActionText [_actionID,_actionText,_actionText];