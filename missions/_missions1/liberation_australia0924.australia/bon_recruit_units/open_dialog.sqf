bon_recruit_barracks = _this select 0;
_uid = getPlayerUID player;
if (_uid != "76561198070956266") then {
	if (leader group player != player) exitWith {
		player sideChat "Only group leaders can recruit AI";
	};
};
createDialog "RecruitUnitsDialog";