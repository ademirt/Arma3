// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m2.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[4678.83,2510.28,0], [4823.91,2453.85,0]]; //  steal plane prototype, Balota, second array position armor
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_current_mission_text = localize "STR_DOM_MISSIONSTRING_751";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_750";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _hangar = createVehicle [d_sm_hangar, _poss, [], 0, "NONE"];
	_hangar setDir 300;
	d_x_sm_rem_ar pushBack _hangar;
	sleep 1.0123;
	private _vec = createVehicle [d_sm_plane, _poss, [], 0, "NONE"];
	_vec setDir 120;
	sleep 2.123;
	["specops", 1, "allmen", 1, _poss, 250, true] spawn d_fnc_CreateInf;
	sleep 2.221;
	["aa", 1, "tracked_apc", 1, "tank", 1, d_x_sm_pos select 1, 1, 400, true] spawn d_fnc_CreateArmor;
	[_vec] spawn d_fnc_sidesteal;
	_vec addMPEventHandler ["MPKilled", {if (isServer) then {[param [0]] call d_fnc_sidempkilled}}];
	_vec setDamage 0;
};