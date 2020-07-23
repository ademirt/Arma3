/*
Author: SENSEI

Last modified: 10/4/2015

Description: set group on patrol

Return: nothing
__________________________________________________________________*/
private ["_houseArray","_center","_wpCount","_d","_r","_pos","_wp"];

params ["_grp",["_range",100],["_individual",true]];

if (typeName _grp isEqualTo "OBJECT") then {_grp = group _grp};

if (_individual) exitWith {
	private "_houseArray";
	_houseArray = (getposATL (leader _grp)) nearObjects ["house",_range];
	{
	    [_x,_range,_houseArray] call SEN_fnc_setPatrolUnit;
	} forEach units _grp;
};

_center = getPosATL (leader _grp);
_grp setBehaviour "SAFE";
_grp setFormation "STAG COLUMN";
_wpCount = 3; // initial waypoint makes 4

[{
	params ["_args","_id"];
    _args params ["_center","_range","_grp","_wpCount"];

    if (count (waypoints _grp) > _wpCount) exitWith {
        [_id] call CBA_fnc_removePerFrameHandler;
        (waypoints _grp) select ((count (waypoints _grp)) - 1) setWaypointType "CYCLE";
        //["Waypoints set for %1. Waypoint count is %2.", _grp, count (waypoints _grp)] call SEN_fnc_log;
    };

    _d = random 360;
    _r = (ceil random _range) max _range*0.3;
    _pos = [(_center select 0) + (sin _d) * _r, (_center select 1) + (cos _d) * _r, 0];
    if (!surfaceIsWater _pos && {{_pos distance2D (waypointPosition _x) < (_range*0.3)} count (waypoints _grp) isEqualTo 0}) then {
    	_wp = _grp addWaypoint [_pos, 0];
        _wp setWaypointSpeed "LIMITED";
    };
}, 1, [_center,_range,_grp,_wpCount]] call CBA_fnc_addPerFrameHandler;
