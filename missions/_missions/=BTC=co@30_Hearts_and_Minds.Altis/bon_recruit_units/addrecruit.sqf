waitUntil {!isNull player && player == player};	

player enableFatigue false;
player setCustomAimCoef 0.3;
player setUnitRecoilCoefficient 0.4;

// player addAction ["<t color=""#2B9E2F""> Weapon BACK</t>", 
                 // {(_this select 3) action ["SwitchWeapon", (_this select 3), (_this select 3), 100]}
				 // , player, 1, false, true, "", "(vehicle _target == player) && (count (weapons _target) > 0) && (currentWeapon player != '')"];

private _uid = getPlayerUID player;
if (_uid == "76561198070956266") then {  
  w_recruitID = player addAction["<t color='#1E90FF'>... Recrutar!!</t>", "bon_recruit_units\open_dialog.sqf", [], 0];  
};

 player addEventHandler ["Respawn", {
	  player enableFatigue false;
	  player setCustomAimCoef 0.3;
	  player setUnitRecoilCoefficient 0.4;
	  
	  private _uid = getPlayerUID player;
      if (_uid == "76561198070956266") then {
		  waitUntil {!isNull player && player == player};	
			//player enableFatigue false;
			//_uid = getPlayerUID player;
			  player removeAction w_recruitID;
			  w_recruitID = player addAction["<t color='#1E90FF'>... Recrutar!!</t>", "bon_recruit_units\open_dialog.sqf", [], 0];
      };	  
}];