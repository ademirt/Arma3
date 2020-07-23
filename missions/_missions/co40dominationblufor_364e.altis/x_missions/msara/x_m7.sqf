// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m7.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[6400.09,7472.16,0], [6611.5,7652.1,0]]; // index: 7,   Training facility in San Peregrino
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_1641";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_817";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _vec = createVehicle ["Land_OrlHot", _poss, [], 0, "NONE"];
	_vec call d_fnc_addKilledEHSM;
	_vec setDir 270;
	_vec setPos _poss;
	_vec setVectorUp [0,0,1];
	d_x_sm_vec_rem_ar pushBack _vec;
	sleep 2.132;
	["specops", 1, "allmen", 1, _poss, 80, true] spawn d_fnc_CreateInf;
	sleep 2.234;
	["aa", 1, "tracked_apc", 1, "tank", 1, _poss, 1, 110, true] spawn d_fnc_CreateArmor;
};