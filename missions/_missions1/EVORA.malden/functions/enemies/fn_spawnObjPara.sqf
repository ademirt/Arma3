scriptName "EVOR_fnc_spawnObjPara";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.0,1.0] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nParaGrp	= param [1,0,[0]];
private _nParaVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nParaGrp isEqualTo 0) or {_nParaVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf = _objUnits select 0;
private _classesVeh	= _objUnits select 6;

if ((_classesInf isEqualTo []) or {_classesVeh isEqualTo []}) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_class","_veh","_WP"];
for "_i" from 1 to _nParaGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [[worldSize/2,worldSize/2],[worldSize/2-1000,worldSize/2-500],[135,405],-1] call EVOR_fnc_FindRandPos;
	_class = selectRandom _classesVeh;
	
	for "_i" from 1 to _nParaVeh do {
		_veh = createVehicle [_class,_spawnPos,[],300,"FLY"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_veh setDir (_veh getDir _objPos);
		_veh setVelocity (vectorDir _veh vectorMultiply 50);
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		_veh flyInHeight 200;
		[_veh] remoteExecCall ["EVOR_fnc_detectKillAssist",2,false];
		
		// Add transported groups to cargo
		private _cargoCap = _veh emptyPositions "Cargo";
		private _cargoGrpSize = 8;
		private _nCargoGrp = 1 max floor (_cargoCap/_cargoGrpSize);
		for "_i" from 1 to _nCargoGrp do {
			private _cargoGroup = createGroup [EVOR_var_SideEnemy,true];
			_allUnits append ([_veh,_cargoGroup,_classesInf,1,[_cargoGrpSize,_cargoCap] select (_nCargoGrp isEqualTo 1)] call EVOR_fnc_createVehicleCargo);
			
			private ["_WP"];
			// Add waypoints to cargo group (random 3 point patrol loop)
			{deleteWaypoint _x;} forEach waypoints _group;
			for "_i" from 1 to 3 do {
				_WP = _cargoGroup addWayPoint [[_objPos,_ptrlRadius,[120*(_i-1),120*_i]] call EVOR_fnc_findRandPos,0];
				_WP setWaypointFormation (["NO CHANGE","STAG COLUMN"] select (_i isEqualTo 1));
				_WP setWaypointBehaviour (["UNCHANGED","SAFE"] select (_i isEqualTo 1));
				_WP setWaypointCombatMode (["NO CHANGE","RED"] select (_i isEqualTo 1));
				_WP setWaypointSpeed (["UNCHANGED","LIMITED"] select (_i isEqualTo 1));
				_WP setWaypointCompletionRadius 30;
				_WP setWaypointType "MOVE";
			};
			(_cargoGroup addWayPoint [wayPointPosition [_cargoGroup,0],0]) setWayPointType "CYCLE";
			
			sleep 0.5;
		};
		
		sleep 0.5;
	};
	
	// Add waypoints to make group do something (In this case patrol loop around random positions)
	{deleteWaypoint _x;} forEach waypoints _group;
	_WP = _group addWayPoint [_objPos,0];
	_WP setWaypointFormation "STAG COLUMN";
	_WP setWaypointBehaviour "CARELESS";
	_WP setWaypointCombatMode "RED";
	_WP setWaypointSpeed "FULL";
	_WP setWaypointCompletionRadius 300;
	_WP setWayPointType "MOVE";
	
	_WP = _group addWayPoint [[[worldSize/2,worldSize/2],[worldSize/2+1000,worldSize/2+1000],[180,360],-1] call EVOR_fnc_findRandPos,0];
	_WP setWaypointFormation "NO CHANGE";
	_WP setWaypointBehaviour "UNCHANGED";
	_WP setWaypointCombatMode "NO CHANGE";
	_WP setWaypointSpeed "UNCHANGED";
	_WP setWaypointCompletionRadius 300;
	_WP setWayPointType "MOVE";
	_WP setWayPointStatements ["true","{(vehicle _x) removeAllEventHandlers 'HandleDamage'; deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;"];
	
	// Make vehicles do paradrop
	[_group] spawn EVOR_fnc_attackParaDrop;
	
	sleep 0.5;
};

//[[EVOR_var_SideFriendly,"HQ"],"Enemy transport aircraft has entered the airspace!"] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits,_objDiff] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];