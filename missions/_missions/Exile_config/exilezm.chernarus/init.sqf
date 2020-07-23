[] execVM "AVS\AVS_fnc_init.sqf";//call compile preprocessFileLineNumbers 
private ["_timeStamp"];
_timeStamp = diag_tickTime;
if (!isDedicated) then {
	if (hasInterface) then {
		call exile_fnc_statusbar;
	};
};