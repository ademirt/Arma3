/*
Author: SENSEI

Last modified: 9/18/2015

Description: set unit to explode on position

Return: nothing
__________________________________________________________________*/
params ["_unit",["_tar",objNull,[objNull]],"_range"];

_unit addEventHandler ["Hit", {
	"HelicopterExploSmall" createVehicle ((_this select 0) modeltoworld [0,0,0]);
	(_this select 0) removeAllEventHandlers "Hit";
}];
_unit enableAI "FSM";
_unit setBehaviour "CARELESS";
_unit allowfleeing 0;
_unit addVest "V_TacVestIR_blk";
_wp = (group _unit) addWaypoint [getPosATL _tar, 0];
_wp setWaypointSpeed "FULL";

[group _unit,_wp,_tar,6] call SEN_fnc_setWaypointPos;

[{
	params ["_args","_id"];
	_args params ["_unit","_tar","_range"];
	private "_bombArray";

	if !(alive _unit) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	if ((vehicle _unit) distance _tar <= _range) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		_bombArray = ["R_TBG32V_F","HelicopterExploSmall"];
		(_bombArray select floor (random (count _bombArray))) createVehicle (getPosATL (vehicle _unit));
		deleteVehicle (vehicle _unit);
	};
}, 0.1, [_unit,_tar,_range]] call CBA_fnc_addPerFrameHandler;

[_unit,_tar,_range] spawn {
	_unit = vehicle (_this select 0);
	_tar = _this select 1;
	_range = _this select 2;
	while {alive (driver _unit)} do {
		if ((_tar distance _unit) < (_range*6 min 100)) then {
			playSound3D ["A3\Sounds_F\sfx\Beep_Target.wss", _unit, false, getPosATL _unit, 0.80, 1, 200];
		};
		sleep (((_tar distance _unit)*0.005 max 0.1) min 1);
	};
};

["Suicide bomber spawned."] call SEN_fnc_log;