_add_recruit = {
	waitUntil {(!isNull player) and (alive player)};
	
	player enableFatigue false;
	player setCustomAimCoef 0.3;
	player setUnitRecoilCoefficient 0.4;
    
    player addAction [
    "<t color='#1E90FF'>...>> Recrutar!!</t>", "bots\BOTS_A3\open_dialog.sqf", 
    //{systemChat format ["DEBUG"]},
    0, 
    -1, 
    false, 
    true, 
    "User20", 
    "true", 
    -1, 
    false];

	//Gray Tone theme
	//"colorCorrections" ppEffectEnable true;
	//"colorCorrections" ppEffectAdjust [1.0, 1.1, 0.0,[1.0, 1.0, 1.0, 0.0],[1.0, 1.0, 0.9, 0.35],[0.3,0.3,0.3,-0.1]];
	//"colorCorrections" ppEffectCommit 0;
};