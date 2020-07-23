scriptName "EVOR_fnc_objComplete";
if (!isServer) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objRT		= param [1,objNull,[objNull]];
private _objName	= _objActive select 0;
private _objPos		= _objActive select 1;
private _objRadius	= _objActive select 2;
private _objFlags	= _objActive select 3;

if (_objActive select 5) exitWith {};
_objActive set [5,true];

// Adding points to every friendly player in the game
if (isMultiplayer) then {
	private _scorePlayers = allPlayers select {side group _x isEqualTo EVOR_var_SideFriendly};
	{_x addScore EVOR_var_ScoreObjCap;} forEach _scorePlayers;
	(format ["%1 funds received for capturing the objective!",EVOR_var_ScoreObjCap]) remoteExecCall ["hint",_scorePlayers,false];
};

// Changing color of _objMarker
private _objMarker = format ["objective_%1",_objName];
_objMarker setMarkerColor ([EVOR_var_SideFriendly,true] call BIS_fnc_sideColor);
_objMarker setMarkerSize [_objRadius,_objRadius];

// Cleanup the objective
deleteVehicle _objRT;
{
	if ((vehicle _x) isKindOf "Air") then {(vehicle _x) removeAllEventHandlers "HandleDamage";};
	deleteVehicle _x;
} forEach (allUnits select {side _x == EVOR_var_SideEnemy});
{deleteGroup _x;} forEach (allGroups select {units _x findIf {alive _x} < 0});
{deleteVehicle _x;} forEach allMines;

// Setting task complete
["task_"+_objName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState;

// Create airfield if objective was an airfield
if ([_objFlags,1] call BIS_fnc_bitflagsCheck) then {[_objActive] spawn EVOR_fnc_createAirf;};

if (EVOR_list_ObjectiveQueue findIf {!(_x # 5)} >= 0) then {
	[[EVOR_var_SideFriendly,"HQ"],"Great job men, the objective has been captured! Standby for redeployment."] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];
	sleep random [20,40,50];
	[] call EVOR_fnc_objCreate;	// Create new objective
} else {
	[[EVOR_var_SideFriendly,"HQ"],"Great job men, you've completed the mission!"] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];
	[EVOR_var_OutroMusic] remoteExec ["EVOR_fnc_cinematicOutro",0,false];		// End mission
};