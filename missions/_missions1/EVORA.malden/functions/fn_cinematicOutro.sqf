scriptName "EVOR_fnc_cinematicOutro";

if (hasInterface) then {
	private _music = param [0,"",[""]];
	private _rscName1 = "title";
	private _rscName2 = "black";
	
	player removeAllEventHandlers "Hit";
	player allowDamage false;
	vehicle player allowDamage false;
	
	playMusic _music;
	
	uiSleep 50;	// 50 s in music
	
	if (vehicle player isKindOf "Helicopter") then {player action ["autoHover",vehicle player];};
	if (vehicle player isKindOf "Plane") then {player action ["Land",vehicle player];};
	
	private _pos0 = player modelToWorldVisual (player selectionPosition "head");
	private _pos1 = _pos0 vectorAdd [0,-2,0];
	private _pos2 = _pos1 vectorAdd [0,0,100];
	
	private _cam = "camera" camCreate _pos1;
	_cam camSetDir (_pos1 vectorFromTo _pos0);
	_cam camCommand "inertia on";
	_cam cameraEffect ["internal","back"];
	_cam camCommitPrepared 0;
	waitUntil {camCommitted _cam};	// 50 s in music
	
	_cam camPreparePos _pos2;
	_cam camSetDir (_pos0 vectorFromTo _pos1); 
	_cam camCommitPrepared 30;
	
	uiSleep 5;	// 55 s in music
	_rscName1 cutRsc ["EVOR_rsc_titleOutro","PLAIN"];
	uiSleep 5;	// 60 s in music
	waitUntil {camCommitted _cam};	// 80 s in music	
	
	_rscName2 cutText ["","BLACK",1];
	
	uiSleep 5;	// 85 s in music
} else {
	uiSleep 85;
};

if (isServer) then {"EveryoneWon" call BIS_fnc_endMissionServer;};