disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {false;};

private _veh	= param [0,objNull,[objNull]];
private _caller = param [1,objNull,[objNull]];
private _up		= param [2,true,[true]];
private _dur	= param [3,0,[0]];

if ((!alive _veh) or {(!alive _caller) or {!local _veh}}) exitWith {false;};

private _success = true;

if (_dur > 0) then {
	// Create bar
	private _ctrls = [] call EVOR_fnc_dlgProgressOpen;
	private _ctrlText = _ctrls select 0;
	private _ctrlBar = _ctrls select 1;
	
	_ctrlText ctrlSetStructuredText parseText format ["<t align = 'center' valign = 'middle'>%1...</t>",["DISMANTLING","REPAIRING"] select _up];
	
	// Progress bar
	private _steps = 100;
	private _start = [1,0] select _up;
	private _diff = [-1,1] select _up;
	
	private _condFail = {
		(!local _veh)
		or {(vehicle _caller != _veh)
		or {(!alive _veh)
		or {(!alive _caller)
		or {(vectorMagnitude velocity _veh > 3)
		or {((!isTouchingGround _veh) and {!surfaceIsWater getPos _veh})}}}}}
	};
	
	private ["_progress"];
	for "_i" from 1 to _steps do {
		if ([_veh,_caller] call _condFail) exitWith {_success = false};
		_progress = _start + _diff*(_i/_steps);
		_ctrlBar progressSetPosition _progress;
		
		if (getAllHitPointsDamage _veh isEqualTo []) then {
			{
				_veh setDamage ([(1-_progress) max _x,(1-_progress) min _x] select _up);
			} forEach [damage _veh];
		} else {
			{
				_veh setHitIndex [_forEachIndex,[(1-_progress) max _x,(1-_progress) min _x] select _up];
			} forEach (getAllHitPointsDamage _veh select 2);
		};
		
		sleep (_dur/_steps);
	};
	
	// Close bar
	(ctrlParent _ctrlText) closeDisplay 0;
};

_success;