scriptName "EVOR_fnc_spawnBaseInf";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objDiff	= _objActive select 4;
private _nInfGrp	= param [1,0,[0]];
private _nInfUnit	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nInfGrp isEqualTo 0) or {_nInfUnit isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf	= _objUnits select 0;

if (_classesInf isEqualTo []) exitWith {[_allUnits,_allVehs];};

private _mainBaseMarker = EVOR_list_BaseCore select 0 select 0;
private ["_group","_spawnPos","_unit","_WP"];
for "_i" from 1 to _nInfGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_mainBaseMarker,[600,750],360,0,5] call EVOR_fnc_findRandPos;
	for "_i" from 1 to (floor random ([2/3,1,3/2] vectorMultiply _nInfUnit)) do {
		_unit = _group createUnit [selectRandom _classesInf,[0,0,0],[],0,"NONE"];
		_allUnits pushBack _unit;
		_unit setPos _spawnPos;
		
		sleep 0.5;
	};
	
	// Add waypoints to make group do something (Unload then hold ground)
	{deleteWaypoint _x;} forEach waypoints _group;
	_WP = _group addWayPoint [[_mainBaseMarker,[100,150],360,0] call EVOR_fnc_findRandPos,0];
	_WP setWaypointFormation "WEDGE";
	_WP setWaypointBehaviour "AWARE";
	_WP setWaypointCombatMode "RED";
	_WP setWaypointSpeed "FULL";
	_WP setWaypointCompletionRadius 30;
	_WP setWayPointType "MOVE";
	
	_WP = _group addWayPoint [waypointPosition _WP,0];
	_WP setWaypointFormation "DIAMOND";
	_WP setWaypointBehaviour "COMBAT";
	_WP setWaypointCombatMode "NO CHANGE";
	_WP setWaypointSpeed "LIMITED";
	_WP setWaypointCompletionRadius 30;
	_WP setWayPointType "HOLD";
	
	sleep 0.5;
};

[[EVOR_var_SideFriendly,"HQ"],format ["Enemy infantry is heading to %1; prepare to fend them off!",markerText _mainBaseMarker]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];

[_allUnits] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];