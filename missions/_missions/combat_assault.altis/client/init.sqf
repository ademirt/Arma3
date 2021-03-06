	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014 Nicolas BOITEUX
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	private ["_action", "_body", "_dir", "_index", "_position", "_mark", "_group", "_units", "_view"];

	diag_log "Waiting BIS_fnc_init ...";
	waitUntil {BIS_fnc_init;};

	diag_log "Waiting Time over 0 ...";
	waitUntil {time > 0};

	diag_log "Waiting client read briefing ...";
	waitUntil {getClientState == "BRIEFING READ"};

	diag_log "Waiting player is alive ...";
	waitUntil {alive player && !(isNull player);};

	startLoadingScreen ["Loading Mission"];	
	while { (getMarkerPos "globalbase") isEqualTo [0,0,0] } do { 
		sleep 0.1; 
	};
	
	//progressLoadingScreen 1;
	_position = ((getMarkerPos "globalbase") findEmptyPosition [2,100]);
	player setpos _position;

	WC_fnc_spawndialog 	= compilefinal preprocessFileLineNumbers "client\scripts\spawndialog.sqf";
	WC_fnc_spawnvehicle 	= compilefinal preprocessFileLineNumbers "client\scripts\spawnvehicle.sqf";
	WC_fnc_paradrop	= compilefinal preprocessFileLineNumbers "client\scripts\paradrop.sqf";
	WC_fnc_keymapperup 	= compilefinal preprocessFileLineNumbers "client\scripts\WC_fnc_keymapperup.sqf";
	WC_fnc_keymapperdown = compilefinal preprocessFileLineNumbers "client\scripts\WC_fnc_keymapperdown.sqf";
	WC_fnc_introcam 	= compileFinal preprocessFileLineNumbers "client\scripts\intro_cam.sqf";
	WC_fnc_spawncam 	= compileFinal preprocessFileLineNumbers "client\scripts\spawn_cam.sqf";

	rollmessage = [];
	killzone = [];
	rollprintmessage = "";
	endLoadingScreen;
	sleep 0.5;

	[] spawn {
		[] call compilefinal preprocessFileLineNumbers "client\BME\init.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\scripts\task.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_circularlist.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_marker.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_inventory.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_hud.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_reloadplane.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_scoreboard.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_playersmarker.sqf";
		[] call compilefinal preprocessFileLineNumbers "client\objects\oo_camera.sqf";
		[] call compilefinal preprocessFileLineNumbers "warcontext\objects\oo_grid.sqf";
		[] call compilefinal preprocessFileLineNumbers "warcontext\objects\oo_hashmap.sqf";
		[] call compilefinal preprocessFileLineNumbers "warcontext\scripts\paramsarray_parser.sqf";
	};
	
	[] call WC_fnc_introcam;

	// config variables
	wcblacklist = [name player];
	wcfriendlist = [];
	wcbannerserver = "Teste";
	wcboard = false;
	wcwithrollmessages = true;
	wcwithfriendsmarkers = true;
	wcearplugs = false;

	wcticket = 0;
	playerkill = 0;
	playerdeath = 0;
	wccandeploy = true;
	
	scoreboard = ["new", []] call OO_SCOREBOARD;
	_size = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
	client_grid = ["new", [0,0, _size, _size,100,100]] call OO_GRID;
	
	playersmarkers = ["new", []] call OO_PLAYERSMARKER;
	"start" spawn playersmarkers;

	rollmessage = ["<br/>", "<br/>","<br/>", "<br/>","<br/>", "<br/>", "<br/>", "<br/>", "<br/>", "<br/>", "<br/>", "<t size='1.2'>"+(localize "STR_INTRO_WELCOME")+"</t><br/>", (localize "STR_INTRO_WEBSITE")+"<br/>","<br/>", (localize "STR_INTRO_TRAIN")+"<br/>", (localize "STR_INTRO_RANK")+"<br/>", (localize "STR_INTRO_WINWAR")+"<br/> ", "<br/>", "<br/>", (localize "STR_INTRO_GOODLUCK")+"<br/>",  (localize "STR_INTRO_AUTHOR")+"<br/><br/>"];
	rollprintmessage = "";

	hud = ["new", []] call OO_HUD;
	"drawAll" spawn hud;
	"rollMessage" spawn hud;
	"bottomHud" spawn hud;
	"scoreboardHud" spawn hud;

	inventory = ["new", []] call OO_INVENTORY;
	["save", player] call inventory;

	[] execVM "real_weather\real_weather.sqf";

	setGroupIconsVisible [false,false];
	disableUserInput false;	
	disableUserInput true;
	disableUserInput false;	

	if(wcambiant == 2) then {
		enableEnvironment false;
		enableSentences false;
		player disableConversation true;
		enableRadio false;
		showSubtitles false;
		player setVariable ["BIS_noCoreConversations", true];
	};

	player addEventHandler ['Killed', {
		killer = _this select 1;
		wcdeath = [(_this select 0), (_this select 1)];
		["wcdeath", "all"] call BME_fnc_publicvariable;
	}];

	player addEventHandler ['HandleDamage', {
		if(side(_this select 3) in [east, resistance]) then {
			if(alive (_this select 0)) then {
				_damage = 1 - damage(_this select 0);
				(_this select 0) setdamage (damage(_this select 0) + random(_damage));
			};
		};
	}];
	
	
	playertype = "ammobox";
	[] spawn {
		private ["_action", "_script", "_oldplayertype", "_hug", "_earplug"];
		_oldplayertype = playertype;

		while { true} do {
			if(_oldplayertype != playertype) then {
				_oldplayertype = playertype;
				if(!isnil "_action") then {
					player removeAction _action;
					_action = nil;
				};
			};
			if(vehicle player == player) then {
				if(isnil "_action") then {
					_action = player addAction [localize "STR_AIRDROPREQUEST_TITLE", "client\scripts\popvehicle.sqf", nil, 1.5, false];
				};
				//if(isnil "_hug") then {
				//	_hug = player addAction ["Friends Management", "client\scripts\givehug.sqf", nil, 1.5, false];
				//};
				if(isnil "_earplug") then {
					_earplug = player addAction ["Add/Remove earplugs", "client\scripts\earplugs.sqf", nil, 1.5, false, true];	
				};
			} else {
				if(!isnil "_action") then {
					player removeAction _action;
					_action = nil;
				};
				if(!isnil "_earplug") then {
					player removeAction _earplug;
					_earplug = nil;
				};				
				//if(!isnil "_hug") then {
				//	player removeAction _hug;
				//	_hug = nil;
				//};
			};
			if(!alive player) then {_action = nil; _hug = nil; _earplug = nil;};
			sleep 1;
		};
	};
	
	[] spawn {
		while { true } do {
			//if((damage player > 0) and (damage player  < 1.01)) then {
			//	player setDamage (damage player - 0.01); 
			//	player setBleedingRemaining 30;
			//};
			switch (true) do {
				case (damage player < 0.40) : {
					player setDamage (damage player - 0.01); 
					player setBleedingRemaining 30;
					sleep 0.5;
				};

				case (damage player < 0.60) : {
					player setDamage (damage player - 0.01); 
					player setBleedingRemaining 30;
					sleep 0.6;
				};

				case (damage player < 0.70) : {
					player setDamage (damage player - 0.01); 
					player setBleedingRemaining 30;
					sleep 0.7;
				};

				case (damage player < 0.80) : {
					player setDamage (damage player - 0.01); 
					player setBleedingRemaining 30;
					sleep 0.8;
				};			

				case (damage player < 1.01) : {
					player setDamage (damage player - 0.01); 
					player setBleedingRemaining 30;
					sleep 0.9;
				};			
			};

		};
	};

	if(wcredeployement isEqualTo 1) then {
		[] spawn {
			private ["_list", "_list2", "_counter", "_text", "_candeploy", "_teleport"];
			
			_counter = 10;
			_teleport = nil;

			while { true } do {
				_list = position player nearEntities [["Man"], 1000];
				_list2 = position player nearEntities [["Tank"], 1000];
				sleep 1;
				{
					_list = _list + crew _x;
					sleep 0.001;
				}foreach _list2;

				_candeploy = false;
				//if(player distance getmarkerpos "respawn_west" > 1300) then {
					if((alive player) and (vehicle player == player)) then {		
						if( (east countSide _list == 0) and (resistance countSide _list == 0) ) then {
							//_title = localize "STR_REDEPLOY_TITLE";
							//_text = localize "STR_REDEPLOY_STANCE";
							//["hint", [_title, _text]] call hud;
							_candeploy = true;
						} else {
							hint "";
						};
					};
				//};

				if(_candeploy) then {
					if(isnil "_teleport") then {
						_teleport = player addAction [localize "STR_REDEPLOY_TITLE", "client\scripts\deployment.sqf", nil, 1.5, false];
						wccandeploy = true;
					};
				} else {
					if(!isnil "_teleport") then {
						player removeAction _teleport;
						_teleport = nil;
						wccandeploy = false;
					};
				};
			};
		};
	};

	[] spawn {
		sleep 5;
		findDisplay 46 displayAddEventHandler ["KeyDown", {_this call WC_fnc_keymapperdown;}];
		findDisplay 46 displayAddEventHandler ["KeyUp", {_this call WC_fnc_keymapperup;}];
	};


	_body = player;
	_view = cameraView;
	_mark = ["new", [position player, true]] call OO_MARKER;


	// set viewdistance
	[] spawn {
		while { true} do {
			if(vehicle player == player) then {
				setviewdistance wcviewdistance;
			} else {
				setviewdistance wcvehicleviewdistance;
			};
			sleep 10;
		};
	};

	// MAIN LOOP
	while {true} do {
	    player enableFatigue false;
		player enableStamina false;
		player setCustomAimCoef 0.3;
		player setUnitRecoilCoefficient 0.4;
	   
		/*if(wcspeedcoeef == 1) then {
			player setAnimSpeedCoef 1.2;
		};
		
		// Should be here to be effective each respawn
		if(wcfatigue == 2) then { 
			player enableFatigue false; 
			player enableStamina false;
			player allowSprint true;
		} ;

		if(wcsway == 2) then { player setCustomAimCoef 0;};*/

		_index = player addEventHandler ["HandleDamage", {false}];

		["load", player] spawn inventory;	
		(position _body) call WC_fnc_spawndialog;

		 player switchCamera _view;

		// debug end	
		player removeEventHandler ["HandleDamage", _index];
		["attachTo", player] spawn _mark;
		["setText", name player] spawn _mark;
		["setColor", "ColorGreen"] spawn _mark;
		["setType", "mil_arrow2"] spawn _mark;
		["setSize", [0.5,0.5]] spawn _mark;
		
		_body = player;
		_group = group player;

		waituntil {!alive player};
		_view = cameraView;

		if(isnil "killer") then { killer = _body;};
		wccam = "camera" camCreate (position killer);
		wccam cameraEffect ["internal","back"];
	
		wccam camsettarget killer;
		wccam camsetrelpos [-10,-10,5];
		wccam CamCommit 0;

		wccam camsettarget _body;
		wccam camCommand "inertia on";
		wccam camSetPos [((position _body) select 0) + 5, ((position _body) select 1) + 5, 10];
		wccam CamCommit 5;

		"detach" spawn _mark;
		["setColor", "ColorRed"] spawn _mark;
		["setPos", position _body] spawn _mark;
		["setType", "mil_flag"] spawn _mark;
		["draw", "ColorRed"] spawn _mark;

		waituntil {alive player};
		deletevehicle _body;

		wccam cameraEffect ["terminate","back"];
		camDestroy wccam;
	};