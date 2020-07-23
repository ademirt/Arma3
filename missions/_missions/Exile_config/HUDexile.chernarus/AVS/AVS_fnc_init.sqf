//AVS_fnc_getConfigLoadout = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_getConfigLoadout.sqf");
AVS_fnc_sanitizegastation = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_sanitizegastation.sqf");
if (AVS_FillCanisterActive) then {
	diag_log "AVS Fill Canister active.";
	AVS_fnc_fillCanisterClient = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_fillCanisterClient.sqf");
	AVS_fnc_getFillCanCost = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_getFillCanCost.sqf");
	AVS_fnc_requestFillCanister = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_requestFillCanister.sqf");
};	
AVS_fnc_setPlayerMoney = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_setPlayerMoney.sqf");
AVS_fnc_updateInteractionMenu = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_updateInteractionMenu.sqf");
if (!hasInterface || isServer) then	{ diag_log "AVS - Mission code initialized.";}
else
{
	// Client-side only stuff.
	//AVS_fnc_getConfigLoadout = compileFinal (preprocessFileLineNumbers "AVS\AVS_fnc_getConfigLoadout.sqf");	// Server already processed this file.
	[] spawn AVS_fnc_sanitizegastation;
	[] spawn AVS_fnc_updateInteractionMenu;
	diag_log format ["AVS - Client code version %1 initialized.", AVS_Version];
};