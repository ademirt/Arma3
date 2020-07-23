// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m27.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[10135.7,6187.1,0]]; // index: 27,   Radio tower on top of mount Baranchik
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_762";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_727";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _vec = createVehicle [d_illum_tower, _poss, [], 0, "NONE"];
	_vec setPos _poss;
	_vec setVectorUp [0,0,1];
	_vec call d_fnc_addKilledEHSM;
	sleep 2.333;
	["specops", 2, "allmen", 2, _poss, 250, true] spawn d_fnc_CreateInf;
	d_x_sm_vec_rem_ar pushBack _vec;
};