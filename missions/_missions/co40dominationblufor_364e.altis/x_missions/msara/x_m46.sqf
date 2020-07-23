// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m46.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[10673.1,8980.08,0]]; // index: 46,   Destroy factory building in Paraiso, attention
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_1632";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_801";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _objs = nearestObjects [_poss, ["Land_Tovarna2"], 50];
	sleep 2.123;
	["specops", 2, "allmen", 1, _poss, 80, true] spawn d_fnc_CreateInf;
	sleep 2.221;
	["aa", 1, "tracked_apc", 1, "tank", 1, _poss, 1, 400, true] spawn d_fnc_CreateArmor;
	sleep 5.123;
	[_objs select 0, _objs select 1, objNull] spawn d_fnc_sidefactory;
};