scriptName "EVOR_fnc_spawnAirpatrol";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _objDiff	= _objActive select 4;
private _nCapGrp	= param [1,0,[0]];
private _nCapVeh	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nCapGrp isEqualTo 0) or {_nCapVeh isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesVeh	= _objUnits select 5;

if (_classesVeh isEqualTo []) exitWith {[_allUnits,_allVehs];};

private _mainBase = EVOR_list_BaseCore select 0;
private ["_group","_spawnPos","_class","_veh","_case","_chanceObj","_chanceBase","_WP"];
for "_i" from 1 to _nCapGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [[worldSize/2,worldSize/2],[worldSize/2-1000,worldSize/2-500],[135,405],-1] call EVOR_fnc_FindRandPos;
	_class = selectRandom _classesVeh;
	
	for "_i" from 1 to _nCapVeh do {
		_veh = createVehicle [_class,_spawnPos,[],300,"FLY"];
		_allVehs pushBack _veh;
		[_veh] call EVOR_fnc_initVeh;
		_veh setDir (_veh getDir _objPos);
		_veh setVelocity (vectorDir _veh vectorMultiply 50);
		_allUnits append ([_veh,_group] call EVOR_fnc_createVehicleCrew);
		_veh flyInHeight ([75,200] select (_veh isKindOf "Plane"));
		[_veh] remoteExecCall ["EVOR_fnc_detectKillAssist",2,false];
		
		sleep 0.5;
	};
	
	// Add waypoints to group (random 5 point patrol loop)
	{deleteWaypoint _x;} forEach waypoints _group;
	_case = 0;
	_chanceObj = 0.45;
	_chanceBase = 0.45;
	for "_i" from 1 to 5 do {
		switch (true) do {
			case (_case < _chanceObj): {	// Aircraft heading to objective
				_WP = _group addWayPoint [_objPos,0];
				_WP setWaypointType "MOVE";
				_WP setWaypointBehaviour "COMBAT";
				_case = 0.5;
			};
			case (_case > 1-_chanceBase): {	// Aircraft heading to MOB and doing an airstrike
				if (!isNil "_WP") then {
					_WP setWaypointStatements ["true","[group this] call EVOR_fnc_attackBaseAirstrike;"];
				};
				_WP = _group addWayPoint [getMarkerPos (_mainBase select 0),0];
				_WP setWaypointType "MOVE";
				_WP setWaypointBehaviour "COMBAT";
				_case = random (1-_chanceBase);
			};
			default {	// Aircraft heading to random pos
				_WP = _group addWayPoint [[[worldSize/2,worldSize/2],worldSize/2-2500] call EVOR_fnc_findRandPos,0];
				_WP setWaypointType "MOVE";
				_WP setWaypointBehaviour "STEALTH";
				_case = random 1;
			};
		};
		_WP setWaypointFormation (["NO CHANGE","DIAMOND"] select (_i isEqualTo 1));
		_WP setWaypointCombatMode (["NO CHANGE","RED"] select (_i isEqualTo 1));
		_WP setWaypointSpeed (["UNCHANGED","NORMAL"] select (_i isEqualTo 1));
		_WP setWaypointCompletionRadius 300;
	};
	(_group addWayPoint [wayPointPosition [_group,0],0]) setWayPointType "CYCLE";
	
	sleep 0.5;
};

//[[EVOR_var_SideFriendly,"HQ"],"Heads up! Enemy CAS has entered the airspace!"] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];