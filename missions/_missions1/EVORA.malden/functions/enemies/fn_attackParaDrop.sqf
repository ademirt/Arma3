scriptName "EVOR_fnc_attackParaDrop_prepare";
if (hasInterface and {!isServer}) exitWith {};

private _group		= param [0,grpNull,[grpNull]];
private _target		= waypointPosition [_group,currentWaypoint _group];
private _vehicles	= [];

{if ((vehicle _x) isKindOf "Air") then {_vehicles pushBackUnique (vehicle _x);};} forEach units _group;

{
	[_x,_target,_group] spawn {
		scriptName "EVOR_fnc_attackParaDrop_approach";
		
		private _veh = _this select 0;
		private _target = _this select 1;
		private _group = _this select 2;
		private _pilot = driver _veh;
		private _distanceApproach = [600,800] select (_veh isKindOf "Plane");
		
		// Approaching the target
		waitUntil {sleep 1; (_veh distance2D _target < _distanceApproach + 500) or {(!alive _veh) or {!alive _pilot}}};
		if ((!alive _veh) or {!alive _pilot}) exitWith {};
		
		// Opening cargo doors
		private _doors = switch (true) do {
			case (_veh isKindOf "Heli_Transport_01_base_F"):	{["Door_L","Door_R"]};
			case (_veh isKindOf "Heli_Transport_02_base_F"):	{["CargoRamp_Open"]};
			case (_veh isKindOf "Heli_Transport_03_base_F"):	{["Door_rear_source"]};
			case (_veh isKindOf "Heli_Transport_04_base_F"):	{["Door_6_source"]};
			case (_veh isKindOf "Heli_Attack_02_base_F"):		{["Door_L","Door_R"]};
			case (_veh isKindOf "VTOL_01_base_F"):				{["Door_1_source"]};
			case (_veh isKindOf "VTOL_02_base_F"):				{["Door_1_source"]};
			default {[]};
		};
		{_veh animateDoor [_x,1];} forEach _doors;
		
		waitUntil {sleep 0.5; (_veh distance2D _target < _distanceApproach) or {(!alive _veh) or {!alive _pilot}}};
		
		// Drop troops
		private _cargo = crew _veh select {!(group _x isEqualTo _group)};
		private _sleep = 144/(speed _veh);
		private ["_para"];
		{
			_x allowDamage false;
			moveOut _x;
			unassignVehicle _x;
			sleep _sleep;
			_para = createVehicle ["NonSteerable_Parachute_F",[0,0,0],[],0,"NONE"];
			_para setPosASL getPosASL _x;
			_para setVelocity velocity _x;
			_x moveInDriver _para;
			_x allowDamage true;
		} forEach _cargo;
		
		sleep 2;
		
		// Closing cargo doors
		{_veh animateDoor [_x,0];} forEach _doors;
	};
} forEach _vehicles;