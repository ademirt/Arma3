scriptName _fnc_scriptName;
if (!isServer) exitWith {};

private _timeWreck		= [120,180,300];	// Wrecks are deleted after this time distribution
private _timeAbandoned	= [800,1200,1500];	// Abandoned vehicles are destroyed after this time distribution
private _distAbandoned	= 100;				// Vehicles are not abandoned when players are closer than this
private _timeHolder		= [90,120,150];		// Weaponholders and corpses are deleted after this time distribution
private _distHolder		= 50;				// Weaponholders and corpses are not deleted when players are closer than this
private _timeRuin		= [90,150,210];		// Ruins and craters are deleted after this time distribution
private _distLeaflet	= 100;				// Leaflets are not deleted when players are closer than this

private _checkOwner = {
	params ["_veh"];
	private _owner = _veh getVariable ["EVOR_var_VehOwner",""];
	(locked _veh == 2) and {allPlayers findIf {name _x == _owner} < 0}
};

private _checkAbandoned = {
	params ["_veh","_dist"];
	(crew _veh findIf {alive _x} < 0)
	and {(allPlayers findIf {_veh distance2D _x < _dist} < 0)
	and {(EVOR_list_BaseCore findIf {_veh distance2D getMarkerPos (_x # 0) < (_x # 1)} < 0)
	and {(!isObjectHidden _veh)
	and {(isNull ropeAttachedTo _veh)
	and {(isNull isVehicleCargo _veh)}}}}}
};

private _vehDelete = {
	params ["_veh"];
	{objNull setVehicleCargo _x;} forEach getVehicleCargo _veh;
	{ropeDestroy _x;} forEach ropes _veh;
	{deleteVehicle _x;} forEach crew _veh;
	deleteVehicle _veh;
};

private _vehDestroy = {
	params ["_veh"];
	{deleteVehicle _x;} forEach ropeAttachedObjects _veh;
	{deleteVehicle _x;} forEach getVehicleCargo _veh;
	{deleteVehicle _x;} forEach crew _veh;
	_veh setDamage [1,false];
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

private _cleanWreck = {
	params ["_object","_time"];
	
	// Check if vehicle already has abandoned time set
	private _timeC = [_object,_time] call _timeSet;
	if (_timeC > time + selectMax _timeWreck) then {
		[_object] call _timeUnset;
		_timeC = [_object,_time] call _timeSet;
	};
	
	// Delete vehicle after time
	if (time > _timeC) then {
		[_object] call _timeUnset;
		[_object] call _vehDelete;
	};
	uiSleep 0.1;
};

private _cleanAbandoned = {
	params ["_object","_time","_dist"];
	// Unlock vehicle if owner is not in game
	if ([_object] call _checkOwner) then {[_object,0] remoteExecCall ["lock",_object,false];};
	
	// Destroy vehicles when abandoned
	if ([_object,_dist] call _checkAbandoned) then {
		if (time > [_object,_time] call _timeSet) then {
			[_object] call _timeUnset;
			[_object] call _vehDestroy;
		};
	} else {
		[_object] call _timeUnset;
	};
	uiSleep 0.1;
};

private _cleanHolder = {
	params ["_object","_time","_dist"];
	if (
		(_object distance2D _objPos > _objSize + 250) or {(allPlayers findIf {_object distance2D _x < _dist} < 0)}
	) then {
		if (time > [_object,_time] call _timeSet) then {
			[_object] call _timeUnset;
			deleteVehicle _object;
		};
	} else {
		[_object] call _timeUnset;
	};
	uiSleep 0.1;
};

private _cleanRuin = {
	params ["_object","_time"];
	if (_forEachIndex < 100) then {
		if (_object distance2D _objPos > _objSize + 500) then {
			if (time > [_object,_time] call _timeSet) then {
				[_object] call _timeUnset;
				deleteVehicle _object;
			};
		} else {
			[_object] call _timeUnset;
		};
		uiSleep 0.1
	} else {
		deleteVehicle _object;
	};
};

private _cleanLeaflet = {
	params ["_object","_dist"];
	if (_forEachIndex < 100) then {
		if (allPlayers findIf {_object distance2D _x < _dist} < 0) then {
			deleteVehicle _object;
		};
		uiSleep 0.1;
	} else {
		deleteVehicle _x;
	};
};

private _cleanMine = {
		params ["_object"];
		if (EVOR_list_BaseCore findIf {_object distance2D getMarkerPos (_x # 0) < (_x # 1)} >= 0) then {
			deleteVehicle _object;
		};
		uiSleep 0.1;
};

waitUntil {["EVOR_list_ObjectiveQueue","EVOR_list_ManageRespawnReady","EVOR_list_ManageRespawnTaken"] findIf {isNil _x} < 0};

while {true} do {
	private _objIndex = EVOR_list_ObjectiveQueue findIf {!(_x select 5)};
	if (_objIndex < 0) exitWith {};
	private _objPos = EVOR_list_ObjectiveQueue select _objIndex select 1;
	private _objSize = EVOR_list_ObjectiveQueue select _objIndex select 2;
	
	private _respawnVehicles = (EVOR_list_ManageRespawnReady apply {_x select 0}) + EVOR_list_ManageRespawnTaken;
	private _allVehicles = (entities [["AllVehicles","ReammoBox_F"],["Man"],false,false]) - _respawnVehicles;
	private _aliveVehicles = _allVehicles select {alive _x};
	private _deadVehicles = _allVehicles - _aliveVehicles;
	
	uiSleep 1; {[_x,_timeWreck] call _cleanWreck;} forEach _deadVehicles;											// Wrecks
	uiSleep 1; {[_x,_timeAbandoned,_distAbandoned] call _cleanAbandoned;} forEach _aliveVehicles;					// Vehicles
	uiSleep 1; {[_x,_timeHolder,_distHolder] call _cleanHolder;} forEach allDeadMen;								// Corpses
	uiSleep 1; {[_x,_timeHolder,_distHolder] call _cleanHolder;} forEach allMissionObjects "GroundWeaponHolder";	// Weaponholders
	uiSleep 1; {[_x,_timeHolder,_distHolder] call _cleanHolder;} forEach entities "WeaponHolderSimulated";		// Weaponholders
	uiSleep 1; {[_x,_timeRuin] call _cleanRuin;} forEach allMissionObjects "Ruins";								// Ruins
	uiSleep 1; {[_x,_timeRuin] call _cleanRuin;} forEach allMissionObjects "CraterLong";							// Craters
	uiSleep 1; {[_x,_distLeaflet] call _cleanLeaflet;} forEach entities "Leaflet_05_F";							// Leaflets
	uiSleep 1; {[_x] call _cleanMine;} forEach allMines;															// Mines
	uiSleep 1; {deleteVehicle _x;} forEach entities "Plane_Canopy_Base_F";										// Canopies
	uiSleep 1; {deleteGroup _x;} forEach (allGroups select {[] isEqualTo units _x});								// Groups
};