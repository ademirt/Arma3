// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m42.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = "d_sm_42" call d_fnc_smmapos; // index: 42,   Officer on north island
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_1693";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_1535";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _ogroup = [d_side_enemy] call d_fnc_creategroup;
	private _sm_vec = _ogroup createUnit [d_soldier_officer, _poss, [], 0, "FORM"];
	[_sm_vec] joinSilent _ogroup;
	_sm_vec call d_fnc_removenvgoggles_fak;
	_sm_vec addEventHandler ["killed", {_this call d_fnc_KilledSMTarget500}];
	d_x_sm_rem_ar pushBack _sm_vec;
	removeAllWeapons _sm_vec;
	[_ogroup, 1] call d_fnc_setGState;
	sleep 2.123;
	["specops", 3, "allmen", 2, _poss, 200, true] spawn d_fnc_CreateInf;
	sleep 2.123;
	private _leadero = leader _ogroup;
	_leadero setRank "COLONEL";
	_ogroup setbehaviour "AWARE";
	_leadero disableAI "PATH";
	[_sm_vec] spawn d_fnc_sidearrest;
};
