// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m59.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = "d_sm_59" call d_fnc_smmapos; //index:59 Find and eliminate the lonewolf sniper near Dorida
d_x_sm_type = "normal"; // "convoy"

if (!isDedicated && {!d_IS_HC_CLIENT}) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_1547";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_1545";
};

if (call d_fnc_checkSHC) then {
	private _newpos = [d_x_sm_pos select 0, 80] call d_fnc_GetRanPointCircle;
	private _ogroup = [d_side_enemy] call d_fnc_creategroup;
	private _sm_vec = _ogroup createUnit [d_sniper, _newpos, [], 0, "FORM"];
	_sm_vec addEventHandler ["HandleDamage",{_damage = (_this select 2)*1.70; _damage}];//teste
	[_sm_vec] joinSilent _ogroup;
	_sm_vec setPos _newpos;
	_sm_vec call d_fnc_removenvgoggles_fak;
	_sm_vec call d_fnc_addkillednormal;
	d_x_sm_rem_ar pushBack _sm_vec;
	[_ogroup, 1] call d_fnc_setGState;
	sleep 2.123;
	private _leadero = leader _ogroup;
	_leadero setRank "COLONEL";
	_ogroup allowFleeing 0;
	_ogroup setBehaviour "AWARE";
	_leadero disableAI "DOWN";
};
