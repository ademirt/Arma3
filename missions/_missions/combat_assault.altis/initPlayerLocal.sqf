	if (local player) then {
		[] spawn compilefinal preprocessFileLineNumbers "client\init.sqf";
		#include "bon_recruit_units\addrecruit.sqf";
	};

