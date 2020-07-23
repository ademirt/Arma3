// dcg_main_enemySide is defined in mission parameters
dcg_main_playerSide = WEST;

enableSaving [false, false];
enableSentences false;
enableRadio false;

_null = [] execVM "VCOMAI\init.sqf";
[] execVM "bon_recruit_units\init.sqf";
//execVM "scripts\NRE_earplugs.sqf";

[
	{!isNil "dcg_main" && {dcg_main}},
	{
		["Preload"] call dcg_main_fnc_arsenal;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
