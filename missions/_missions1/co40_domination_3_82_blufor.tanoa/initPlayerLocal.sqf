// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerLocal.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerLocal.sqf"];
__TRACE_1("","_this")
if (hasInterface && {d_with_bis_dynamicgroups == 0}) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};
#include "bon_recruit_units\addrecruit.sqf"
player enableAttack false;
execVM "tasks.sqf";
diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerLocal.sqf processed"];