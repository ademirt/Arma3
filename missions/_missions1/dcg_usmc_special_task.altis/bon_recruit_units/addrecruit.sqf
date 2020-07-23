private _uid = getPlayerUID player;
if (_uid == "76561198070956266") then {	  
  
  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
  
  player addEventHandler ["Respawn", {
	waitUntil {!isNull player && player == player};	
		//player enableFatigue false;
		//_uid = getPlayerUID player;
		  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
    }];
};