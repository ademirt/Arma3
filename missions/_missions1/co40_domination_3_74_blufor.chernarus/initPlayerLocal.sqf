// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerLocal.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerLocal.sqf"];
__TRACE_1("","_this")
if (hasInterface) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};
#include "bon_recruit_units\addrecruit.sqf"

player enableFatigue false;
player setCustomAimCoef 0.4;
player setUnitRecoilCoefficient 0.5;

player addEventHandler ["Respawn", {
		waitUntil { alive player };
			player enableFatigue false;
			player setCustomAimCoef 0.4;
			player setUnitRecoilCoefficient 0.5;
}];

execVM "tasks.sqf";
diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerLocal.sqf processed"];