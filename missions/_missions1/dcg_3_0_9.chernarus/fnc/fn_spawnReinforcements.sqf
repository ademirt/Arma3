/*
Author: SENSEI

Last modified: 10/3/2015

Description: send reinforcements to position

Return: nothing
__________________________________________________________________*/
private ["_startPos","_side","_minDist","_spawnDist","_WPType","_patrolOnWP","_findHelipad","_buffer","_unitPool","_vehPool","_backup","_lz","_helipadPos","_pos","_veh","_grp","_pilot","_patrolGrp","_wp1","_wp2","_wp"];

_startPos = param [0];
_side = param [1,SEN_enemySide];
_minDist = param [2,300,[0]];
_spawnDist = param [3,1500,[0]];
_WPType = param [4,"SAD",[""]];
_patrolOnWP = param [5,false];
_findHelipad = param [6,false];
_buffer = 200;

call {
	if (_side isEqualTo WEST) exitWith {
		_unitPool = SEN_unitPoolWest;
		_vehPool = SEN_airPoolWest;
		_backup = "B_Heli_Light_01_F";
	};
	if (_side isEqualTo CIVILIAN) exitWith {
		_unitPool = SEN_unitPoolCiv;
		_vehPool = SEN_airPoolCiv;
		_backup = "C_Heli_Light_01_civil_F";
	};
	_unitPool = SEN_unitPool;
	_vehPool = SEN_airPool;
	_backup = "O_Heli_Light_02_unarmed_F";
};

_lz = [_startPos,_minDist,_minDist+_buffer,[],_backup] call SEN_fnc_findRandomPos;

if (_lz isEqualTo []) exitWith {
	["Reinforcements LZ undefined."] call SEN_fnc_log;
};

if (_findHelipad) then {
	_helipadPos = [_lz] call SEN_fnc_getNearHelipad;
	if !(_helipadPos isEqualTo []) then {
		_lz = _helipadPos;
	};
};

_lz set [2,0];
_pos = [_lz,_spawnDist,_spawnDist+_buffer] call SEN_fnc_findRandomPos;
_veh = createVehicle [_vehPool select floor (random (count _vehPool)),_pos,[],0,"FLY"];
if (_veh emptyPositions "cargo" isEqualTo 0 || {!(_veh isKindOf "Helicopter")}) then {
	deleteVehicle _veh;
	_veh = createVehicle [_backup,_pos,[],0,"FLY"];
};
_veh flyInHeight 100;
_veh lock 3;
_veh setVariable ["SEN_vehCacheDisable", true];
_grp = createGroup _side;
_grp setBehaviour "CARELESS";
_pilot = _grp createUnit [_unitPool select floor (random (count _unitPool)),_pos, [], 0, "NONE"];
_pilot moveInDriver _veh;
_pilot allowfleeing 0;
_pilot disableAI "FSM";
_pilot disableAI "TARGET";
_pilot disableAI "AUTOTARGET";

_patrolGrp = [_pos,0,(_veh emptyPositions "cargo") min 8,_side] call SEN_fnc_spawnGroup;
{
	_x assignAsCargoIndex [_veh, _forEachIndex];
	_x moveInCargo _veh;
} forEach (units _patrolGrp);

_wp1 = _grp addWaypoint [_lz, 0];
_wp1 setWaypointType "TR UNLOAD";
_wp2 = _grp addWaypoint [_pos, 0];
_wp2 setWaypointStatements ["true", "deleteVehicle (vehicle this); deleteVehicle this;"];
["Reinforcements inbound to %1.",_lz] call SEN_fnc_log;

[{
	params ["_args","_id"];
	_args params ["_startPos","_patrolGrp","_WPType","_patrolOnWP"];

	if (vehicle (leader _patrolGrp) isEqualTo (leader _patrolGrp)) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		["Reinforcements complete."] call SEN_fnc_log;
		_wp = _patrolGrp addWaypoint [_startPos, 0];
		_wp setWaypointType _WPType;
		_wp setWaypointSpeed "FULL";
		if (_patrolOnWP) then {
			_wp setWaypointStatements ["true", "[group this] call SEN_fnc_setPatrolGroup"];
		} else {
			_wp setWaypointStatements ["true", "if !(isPlayer(this findNearestEnemy this)) then {(units (group this)) call SEN_fnc_cleanup;}"];
		};
	};
}, 1, [_startPos,_patrolGrp,_WPType,_patrolOnWP]] call CBA_fnc_addPerFrameHandler;

[{
	params ["_args","_id"];
	_args params ["_veh","_pilot"];

	if (!alive _pilot || {vehicle _pilot isEqualTo _pilot} || {isTouchingGround _veh && (!(canMove _veh) || (fuel _veh isEqualTo 0))}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_pilot call SEN_fnc_cleanup;
		_veh call SEN_fnc_cleanup;
		["Reinforcement vehicle destroyed."] call SEN_fnc_log;
	};
}, 1, [_veh,_pilot]] call CBA_fnc_addPerFrameHandler;