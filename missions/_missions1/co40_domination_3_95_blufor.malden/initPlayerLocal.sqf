// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerLocal.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerLocal.sqf"];
__TRACE_1("","_this")
if (hasInterface && {d_with_bis_dynamicgroups == 0}) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};
player enableAttack false;

if (hasInterface) then {
	0 spawn {
		sleep (1 + random 1);
		private _np = profileName splitString """'" joinString "";
		if (_np isEqualTo "Error: No unit") then {
			_np = (name player) splitString """'" joinString "";
		};
		player setVariable ["d_plname", _np, true];
		d_name_pl = _np;
	};
};
#include "bon_recruit_units\addrecruit.sqf"						 											

execVM "tasks.sqf";
diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerLocal.sqf processed"];