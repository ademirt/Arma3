/*
Author:
Nicholas Clark (SENSEI)

Description:
init order not guaranteed
__________________________________________________________________*/
startLoadingScreen ["Loading Mission"];

#include "bon_recruit_units\addrecruit.sqf"

player enableFatigue false;
player setCustomAimCoef 0.5;
player setUnitRecoilCoefficient 0.6;

player addEventHandler ["Respawn", {
waitUntil {!isNull player && player == player};	
	player enableFatigue false;
	player setCustomAimCoef 0.5;
	player setUnitRecoilCoefficient 0.6;
}];

// make sure player rating stays above 0, so friendly AI units don't turn hostile
player addEventHandler ["HandleRating",{
    if (rating (_this select 0) < 0) then {
        abs (rating (_this select 0));
    };
}];

// briefing
[] spawn {
    player createDiaryRecord ["Diary", ["External Content", "<br/>VVS by Tonic<br/>"]];
    player createDiaryRecord ["Diary", ["Mission Info", format ["<br/>Author: Nicholas Clark (SENSEI)"]]];
};

endLoadingScreen;
