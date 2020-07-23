// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m25.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[4436.46,8071.55,0]]; // Specop camp
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_759";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_760";
};

if (call d_fnc_checkSHC) then {
	[d_x_sm_pos select 0] spawn d_fnc_sidespecops;
};