scriptName _fnc_scriptName;
if (!isServer) exitWith {};

private _distTaken		= 200;				// Respawn vehicles are taken when further than this from their spawn
private _distAbandoned	= 100;				// Respawn vehicles are not abandoned when players are closer than this
private _timeRespawn	= [45,60,90];		// Taken respawn vehicles are respawned after this time distribution
private _timeAbandoned	= [180,180,240];	// Abandoned respawn vehicles are destroyed after this time distribution

private _checkDamaged = {
	params ["_veh"];
	((damage _veh > 0) or {fuel _veh < 1}) and {(crew _veh findIf {alive _x} < 0)}
};

private _checkAbandoned = {
	params ["_veh","_dist"];
	(crew _veh findIf {alive _x} < 0) and {(allPlayers findIf {_veh distance2D _x < _dist} < 0)}
};

private _vehDelete = {
	params ["_veh"];
	{ropeDestroy _x;} forEach ropes _veh;
	{detach _x;} forEach attachedObjects _veh;
	{deleteVehicle _x;} forEach crew _veh;
	deleteVehicle _veh;
};

private _vehDestroy = {
	params ["_veh"];
	{deleteVehicle _x;} forEach ropeAttachedObjects _veh;
	{deleteVehicle _x;} forEach attachedObjects _veh;
	{deleteVehicle _x;} forEach crew _veh;
	_veh setDamage [1,false];
};

private _vehRespawn = {
	params ["_class","_pos","_dir","_skin"];
	_new = createVehicle [_class,[0,0,0],[],0,"NONE"];
	_new setDir _dir;
	_new setPosWorld _pos;
	[_new,_skin] call EVOR_fnc_initVeh;
	_new;
};

private _timeSet = {
	params ["_veh","_time"];
	_time = _veh getVariable ["EVOR_var_ManageTime",time+random _time];
	_veh setVariable ["EVOR_var_ManageTime",_time];
	_time;
};

private _timeUnset = {
	params ["_veh"];
	_veh setVariable ["EVOR_var_ManageTime",nil];
};

// Initialize respawn vehicles
EVOR_list_ManageRespawnReady = [];
EVOR_list_ManageRespawnTaken = [];

{
	private _type	= typeOf _x;
	private _pos	= getPosWorld _x;
	private _dir	= getDir _x;
	private _skin	= [_x] call EVOR_fnc_getVehSkin;
	
	[_x] call EVOR_fnc_initVeh;
	
	EVOR_list_ManageRespawnReady pushBack [_x,_type,_pos,_dir,_skin];
} forEach entities [["AllVehicles"],["Man"],false,true];

while {true} do {
	// Respawn vehicles when damaged/taken
	{
		_x params ["_veh","_class","_pos","_dir","_skin"];
		
		if (isNull _veh) then {
			_x set [0,[_class,_pos,_dir,_skin] call _vehRespawn];
		} else {
			if (_veh distance2D _pos > _distTaken) then {
				
				if (time > [_veh,_timeRespawn] call _timeSet) then {
					EVOR_list_ManageRespawnTaken pushBack _veh;
					[_veh] call _timeUnset;
					_x set [0,[_class,_pos,_dir,_skin] call _vehRespawn];
				};
			} else {
				if ([_veh] call _checkDamaged) then {
					
					if (time > [_veh,_timeRespawn] call _timeSet) then {
						[_veh] call _timeUnset;
						[_veh] call _vehDelete;
						uiSleep 1;
						_x set [0,[_class,_pos,_dir,_skin] call _vehRespawn];
					};
				} else {
					[_veh] call _timeUnset;
				};
			};
		};
		uiSleep 0.1;
	} forEach EVOR_list_ManageRespawnReady;
	
	uiSleep 1;
	
	// Destroy taken vehicles when abandoned
	{
		if ([_x,_distAbandoned] call _checkAbandoned) then {
			
			if (time > [_x,_timeAbandoned] call _timeSet) then {
				[_x] call _timeUnset;
				[_x] call _vehDestroy
			};
		} else {
			[_x] call _timeUnset;
		};
		uiSleep 0.1;
	} forEach EVOR_list_ManageRespawnTaken;
	
	EVOR_list_ManageRespawnTaken = EVOR_list_ManageRespawnTaken select {alive _x};
	
	uiSleep 1;
};