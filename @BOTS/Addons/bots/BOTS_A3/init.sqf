//BOTS_A3 = "bon_recruit_units\";
maxx_ai_recruits = 10;
bon_recruit_queue = [];
//bon_dynamic_list = true;// Select false if you want to use a a static unit list. You can customize static lists in recruitable_units_static.sqf
if (isServer) then {
	"bon_recruit_newunit" addPublicVariableEventHandler {
		_newunit = _this select 1;
		//[_newunit] execFSM (BOTS_A3+"unit_lifecycle.fsm");
	};
};

//call compile preprocessFileLineNumbers "bots\BOTS_A3\paradrop.sqf";

if (isDedicated) exitWith {};
	
//[] execVM "bots\BOTS_A3\dlc_unlocker.sqf";
call compile preprocessFileLineNumbers "bots\BOTS_A3\dlc_unlocker.sqf";

ADD_RECRUIT = {
	waitUntil {(!isNull player) and (alive player)};
	
	player enableFatigue false;
	player setFatigue 0;
	player setCustomAimCoef 0.3;
	player setUnitRecoilCoefficient 0.4;
	
	player addAction [
		"<t color='#1E90FF'>...>>--------- Recrutar!!</t>", 
		"bots\BOTS_A3\open_dialog.sqf", 
		0, 
		-1, 
		false, 
		true, 
		"User20", 
		"true", 
		-1, 
		false
	];
};

waitUntil {(!isNull player) and (alive player)};
call ADD_RECRUIT;

_bRes = player addEventHandler ["Respawn", {[_this] call ADD_RECRUIT}];
_bRes = player addEventHandler ["Killed", {[_this] call ADD_RECRUIT}];