// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerLocal.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerLocal.sqf"];
__TRACE_1("","_this")
if (hasInterface) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
    
	if ((getPlayerUID player) == "76561198070956266") then {
	  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];

	  player addEventHandler ["Respawn", {
		waitUntil {!isNull player && player == player};
			  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
		}];
	};
	player enableFatigue false;
	player enableStamina false;
	player setCustomAimCoef 0.3;
	player setUnitRecoilCoefficient 0.4;

	player addEventHandler ["respawn",{
		player enableFatigue false;
		player enableStamina false;
		player setCustomAimCoef 0.3;
		player setUnitRecoilCoefficient 0.4;
		//[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;
	}];
};
execVM "tasks.sqf";
diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerLocal.sqf processed"];