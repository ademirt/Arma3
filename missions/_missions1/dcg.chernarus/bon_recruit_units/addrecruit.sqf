//if (!isDedicated && hasInterface) then {
	//waitUntil {!isNull player && player == player};	
    //player enableFatigue false;
	//[player] execVM "scripts\groupsMenu\initGroups.sqf"; 
	//execVM "scripts\NRE_earplugs.sqf";
	
_uid = getPlayerUID player;
if (_uid == "76561198070956266") then {	  
  //player RemoveAllEventHandlers "Fired";
  //player addAction ["<t color='#ff1111'>Bullet Cam ON</t>",{call INS_bullet_cam}, 0, -9, false];	  
  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
  //player addAction["<t color='#ff1111'>Recruit AI</t>","RecruitAI\Open.sqf",[1],0,false,true,"","vehicle player == player"];

  player addEventHandler ["Respawn", {
	waitUntil {!isNull player && player == player};	
		//player enableFatigue false;
		//_uid = getPlayerUID player;
		//if (wuid == "76561198070956266") then {
		  //player RemoveAllEventHandlers "Fired";
		  //player addAction ["<t color='#ff1111'>Bullet Cam ON</t>",{call INS_bullet_cam}, 0, -9, false];		  
		  player addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
		  //player addAction["<t color='#ff1111'>Recruit AI</t>","RecruitAI\Open.sqf",[1],0,false,true,"","vehicle player == player"];
		//};
    }];
};

//};