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

endLoadingScreen;