scriptName "EVOR_fnc_spawnObjInf";
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _ptrlRadius	= [0.0,0.95] apply {_x*(_objActive select 2)};
private _objDiff	= _objActive select 4;
private _nInfGrp	= param [1,0,[0]];
private _nInfUnit	= param [2,0,[0]];
private _allUnits	= [];
private _allVehs	= [];

if ((_nInfGrp isEqualTo 0) or {_nInfUnit isEqualTo 0}) exitWith {[_allUnits,_allVehs];};

private _objUnits	= EVOR_list_objectiveUnits select _objDiff;
private _classesInf = _objUnits select 0;

if (_classesInf isEqualTo []) exitWith {[_allUnits,_allVehs];};

private ["_group","_spawnPos","_unit","_WP"];
for "_i" from 1 to _nInfGrp do {
	// Create group and fill with units
	_group = createGroup [EVOR_var_SideEnemy,true];
	_spawnPos = [_objPos,_ptrlRadius,360,0,5] call EVOR_fnc_findRandPos;
	for "_i" from 1 to (round random ([2/3,1,3/2] vectorMultiply _nInfUnit)) do {
		_unit = _group createUnit [selectRandom _classesInf,[0,0,0],[],0,"NONE"];
		_allUnits pushBack _unit;
		_unit setPos _spawnPos;
		
		sleep 0.5;
	};
	
	// Add waypoints to group (random 3 point patrol loop)
	{deleteWaypoint _x;} forEach waypoints _group;
	for "_i" from 1 to 3 do {
		_WP = _group addWayPoint [[_objPos,_ptrlRadius,[120*(_i-1),120*_i]] call EVOR_fnc_findRandPos,0];
		_WP setWaypointFormation (["NO CHANGE","STAG COLUMN"] select (_i isEqualTo 1));
		_WP setWaypointBehaviour (["UNCHANGED","SAFE"] select (_i isEqualTo 1));
		_WP setWaypointCombatMode (["NO CHANGE","RED"] select (_i isEqualTo 1));
		_WP setWaypointSpeed (["UNCHANGED","LIMITED"] select (_i isEqualTo 1));
		_WP setWaypointCompletionRadius 30;
		_WP setWaypointType "MOVE";
	};
	(_group addWayPoint [wayPointPosition [_group,0],0]) setWayPointType "CYCLE";
	
	sleep 0.5;
};

[_allUnits,_objDiff] call EVOR_fnc_setUnitSkill;

[_allUnits,_allVehs];