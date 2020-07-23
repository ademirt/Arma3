//Spawn frequency ± variance in minutes
#define SPAWN_FREQUENCY 40
#define SPAWN_VARIANCE 15
//The higher the number, the more accurate the timer is.
//Must be positive and non-zero.
#define TIMER_RESOLUTION 10
//Chance to spawn a crash site
#define SPAWN_CHANCE 0.60
//Parameters for finding a suitable position to spawn the crash site
#define SEARCH_CENTER [7049,9241]
#define SEARCH_RADIUS 5200
#define SEARCH_DIST_MIN 20
#define SEARCH_SLOPE_MAX 2
#define SEARCH_BLACKLIST [[[2092,14167],[10558,12505]]]

private _cdmg = 0.4;
private _erng = 195;
//private _frequency	= 1;
//private _variance	= 2;
private _i = 0;
private _safetyPoint = [8450.08,20240,0];
private _nloot = [];
private _hls = [["Exile_Plane_AN2_Green", "CUP_A2_an2wreck"],
				["Exile_Chopper_Huey_Armed_Green", "CUP_A2_wreck_uh60"],
				["B_T_VTOL_01_vehicle_blue_F","Land_UWreck_MV22_F"]];


_vSpawnCrashes2 = {
		diag_log ">>>     HELI CRASH 2.......... START";
		
		//Create an Invisibile Landingpad at the Crashside-Coordinates
		//_hEnd = [_centerPOS,_minDistCenter,_maxDist,_minDist,_waterMode,20,_landMode] call BIS_fnc_findSafePos;
		_hEnd = [SEARCH_CENTER, 0, SEARCH_RADIUS, SEARCH_DIST_MIN, 0, SEARCH_SLOPE_MAX, 0, SEARCH_BLACKLIST] call BIS_fnc_findSafePos;
	    //_hEnd set [2, 0];
		//_lzn = createVehicle ["HeliHEmpty", [], [], 0, "CAN_COLLIDE"];
		_lzn = "HeliHEmpty" createVehicle [0,0,0];
		_lzn setPos _hEnd;
		
		//_marker1 = createMarker [format["mark_0%1",_i], _hEnd];
		//_marker1 setMarkerType "mil_objective";//"mil_destroy";
		//_i = _i + 1;

		//_hstrt = [_centerPOS,_minDistCenter,_maxDist,_minDist,_waterMode,20,_landMode] call BIS_fnc_findSafePos;
		_hstrt = [[1324.5992,797.98096,500],[12087.144,1397.6597,500],[14358.261,8360.5039,500]] call BIS_fnc_selectRandom;
		
		private _elm = _hls call BIS_fnc_selectRandom;	
		private _hMdl = (_elm select 0);
		private _cMdl = (_elm select 1);
		
		//_startTime = time;
		_agrp = creategroup west;
		_hplt = _agrp createUnit ["I_G_Soldier_A_F",[0,0,0],[],0,"NONE"];
		
		diag_log "HELI CRASH 2.......... unit ok";
		
		_cwrk = createVehicle [_hMdl,[0,0,0], [], 0, "FLY"];
		_cwrk setPos _hstrt;
		
		//_marker2 = createMarker [format["amark_0%1",_i], _hstrt];
		//_marker2 setMarkerType "hd_warning";//"mil_destroy";
		//_i = _i + 1;
		
		_hplt moveindriver _cwrk;
		_hplt assignAsDriver _cwrk;	

		_cwrk engineOn true;
		_cwrk flyInHeight 200;
		_cwrk forceSpeed 100;
		//_cwrk setspeedmode "LIMITED";		
		
		diag_log "HELI CRASH 2.......... vehicle ok";

		_wp2 = _agrp addWaypoint [position _lzn, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";

		diag_log "HELI CRASH 2.......... move 1";
		
		//Even when the Heli flys to high, it will burn when reaching its Waypoint
		_wp2 setWaypointStatements ["true", "_cwrk setdamage 1;"];

		//Adding a last Waypoint up in the North, so the Heli doesnt Hover at WP1 (OR2)
		//and would also come back to WP1 if somehow it doesnt explode.
		_wp3 = _agrp addWaypoint [_safetyPoint, 0];
		_wp3 setWaypointType "CYCLE";
		_wp3 setWaypointBehaviour "CARELESS";
		
		diag_log "HELI CRASH 2.......... move 2";
		
		//sleep 0.3;

		//Get some more Speed when close to the Crashpoint and go on even if Heli died or hit the ground
		waituntil {(_cwrk distance _hEnd) < 1000 || not alive _cwrk || (getPosATL _cwrk select 2) < 5 || (damage _cwrk) >= _cdmg};
		
		_cwrk flyInHeight 97;
		_cwrk forceSpeed 70;
		_cwrk setspeedmode "NORMAL";
		
		uiSleep 3;
		_cwrk setDamage 0.52;
diag_log "HELI CRASH 2.......... move 3";
		//BOOOOOOM!
		waituntil {(_cwrk distance _hEnd) <= _erng || not alive _cwrk || (getPosATL _cwrk select 2) < 5 || (damage _cwrk) >= _cdmg};
		//Taking out the Tailrotor would be more realistic, but makes the POC not controllable
		//_cwrk setHit ["mala vrtule", 1];	
		
		_cwrk setdamage 1;
		_cwrk setfuel 0;
		//diag_log(format["CRASHSPAWNER: %1 just exploded at %2!, ", _crashName, str(getPosATL _cwrk)]);

		//She cant survive this :(
	    //_hplt setdamage 1;
		waitUntil {isTouchingGround _cwrk};	

		//Get position of the helis wreck, but make sure its on the ground;
		private _pos = [getpos _cwrk select 0, getpos _cwrk select 1,0];
		
		//Clean Up the Crashsite
		deletevehicle _cwrk;
		deletevehicle _hplt;
		deletevehicle _lzn;

		//Animation is done, lets create the actual Crashside
		_crash = createVehicle [_cMdl, [0,0,0], [], 0, "CAN_COLLIDE"];
		_crash setPos _pos;
		_crash enableSimulationGlobal true;
		//_marker1 setMarkerPos position _crash;
		
		_fire = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
		_fire setPos _pos;
		_fire attachto [_crash, [0,0,-1]];
		_fire enableSimulationGlobal true;
	    //_num        = round(random 4) + 4;

		//Adding 5 dead soldiers around the wreck, poor guys
		for "_x" from 1 to 2 do {
			_dp = [_pos, ((random 3)+5), random 360] call BIS_fnc_relPos;
			private _u = ["I_G_Soldier_A_F","O_G_medic_F","B_G_Soldier_lite_F","O_G_officer_F","O_G_Soldier_M_F","C_man_hunter_1_F","B_G_engineer_F"] call BIS_fnc_selectRandom;
			_unit = _agrp createUnit [_u,[0,0,0],[],0,"NONE"];			
			_unit setPos _dp;
			_unit setdamage 1;
			_unit setDir (random 360);
		};
		
		uiSleep 5;
		_nloot pushBack (netId _crash);
		_crash setVariable ["ExileLastLootRequestedAt", time];		
		["spawnLootRequest", [_nloot]] call ExileClient_system_network_send;
		
		diag_log "HELI CRASH 2.......... loot crash!";
	//};
};

 for "_j" from 1 to 3 do
{
	//_time = time + 60 * ((SPAWN_FREQUENCY) + ((round random 1) * 2 - 1) * random (SPAWN_VARIANCE));
	uiSleep 120;
	call _vSpawnCrashes2;
	uiSleep 600;
	
};

while {true} do
{
	//Pick a time to attempt spawning
	//currentTime + frequency + ±1 * variance
	_time = time + 60 * ((SPAWN_FREQUENCY) + ((round random 1) * 2 - 1) * random (SPAWN_VARIANCE));
	
	//Wait until the previously decided time
	while {time < _time} do
	{
	    //diag_log(format["HELI CRASH 2, while time:%1, time next:%2",time,_time]);
		uiSleep (60 * (SPAWN_FREQUENCY) / (TIMER_RESOLUTION));
	};
	
	//try to spawn
	if ((SPAWN_CHANCE) > random 1) then
	{
		call _vSpawnCrashes2;
	};
};