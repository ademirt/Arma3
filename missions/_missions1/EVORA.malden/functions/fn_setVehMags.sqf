scriptName _fnc_scriptname;

private _veh = param [0,objNull,[objNull]];
private _cfgVehMags = missionConfigFile >> "CfgVehicleMags" >> typeOf _veh;

if (!isClass _cfgVehMags) exitWith {};

if (canSuspend) then {waitUntil {(count magazinesAllTurrets _veh > 0) or {count weapons _veh == 0}};};

if (isServer) then {
	private _magsExtra	= getArray (_cfgVehMags >> "MagsExtra");
	private _magsBanned = getArray (_cfgVehMags >> "MagsBanned");
	
	// Remove banned magazines
	if (!(_magsBanned isEqualTo [])) then {
		{
			_x params ["_mag","_path"];
			if (_mag in _magsBanned) then {
				[_veh,[_mag,_path]] remoteExecCall ["removeMagazineTurret",_veh turretOwner _path];
			};
		} forEach magazinesAllTurrets _veh;
	};
	
	// Add extra magazines
	if (!(_magsExtra isEqualTo [])) then {
		{[_veh,[_x,[0]]] remoteExecCall ["addMagazineTurret",_veh turretOwner [0]];} forEach _magsExtra;
	};
} else {
	_this remoteExecCall [_fnc_scriptname,2];
};