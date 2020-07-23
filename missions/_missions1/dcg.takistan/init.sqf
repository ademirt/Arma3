// dcg_main_enemySide is defined in mission parameters
dcg_main_playerSide = WEST;

enableSaving [false, false];
enableSentences false;
enableRadio false;

[] execVM "bon_recruit_units\init.sqf";
execVM "scripts\NRE_earplugs.sqf";

if ((paramsArray select 0) != 4) then {
	// define the global sand parameter array
	//[fog,overcast,use ppEfx,allow rain,force wind,vary fog,use wind audio,EFX strength]
	MKY_arSandEFX = [0,"",true,false,true,true,true,1];
	// init the EFX scripts
	nul = [] execVM "MKY\MKY_Sand_Snow_Init.sqf";
};

[
	{!isNil "dcg_main" && {dcg_main}},
	{
		["Preload"] call dcg_main_fnc_arsenal;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;