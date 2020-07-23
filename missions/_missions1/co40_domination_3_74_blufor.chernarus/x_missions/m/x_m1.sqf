// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_m1.sqf"
#include "..\..\x_setup.sqf"

d_x_sm_pos = [[11256.2,4294.15,0], [11075.9,4119.91,0]]; // Officer, Rog, second array = position Shilka
d_x_sm_type = "normal"; // "convoy"

if (hasInterface) then {
	d_cur_sm_txt = localize "STR_DOM_MISSIONSTRING_728";
	d_current_mission_resolved_text = localize "STR_DOM_MISSIONSTRING_729";
};

if (call d_fnc_checkSHC) then {
	private _poss = d_x_sm_pos select 0;
	private _pos_other = d_x_sm_pos select 1;
	["aa", 1, "", 0, "", 0, _pos_other, 1, 0, false] call d_fnc_CreateArmor;
	sleep 2.123;
	private _fortress = createVehicle [d_sm_fortress, _poss, [], 0, "NONE"];
	_fortress setDir -133.325;
	_fortress setPos _poss;
	d_x_sm_vec_rem_ar pushBack _fortress;
	sleep 2.123;
	private _ogroup = [d_side_enemy] call d_fnc_creategroup;
	private _sm_vec = _ogroup createUnit [d_soldier_officer, _poss, [], 0, "NONE"];
	[_sm_vec] joinSilent _ogroup;
	_ogroup deleteGroupWhenEmpty true;
	_sm_vec call d_fnc_removenvgoggles_fak;
	_sm_vec call d_fnc_addkillednormal;
	d_x_sm_rem_ar pushBack _sm_vec;
	sleep 2.123;
	private _bpos = getPosATL _fortress;
	_bpos set [2, 1];
	_sm_vec setFormDir ((direction _fortress) + 90);
	_sm_vec setPos _bpos;
	sleep 2.123;
	["specops", 2, "allmen", 2, _poss, 300, true] call d_fnc_CreateInf;
	sleep 2.123;
	private _leadero = leader _ogroup;
	_leadero setRank "COLONEL";
	_ogroup allowFleeing 0;
	_ogroup setBehaviour "AWARE";
	_leadero disableAI "PATH";
	if (d_with_dynsim == 0) then {
		_sm_vec enableDynamicSimulation true;
	};
};