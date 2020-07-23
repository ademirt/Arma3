if ((!isServer) and hasInterface) exitwith {};

private["_zombie","_zdetect_player_target","_zdetect_player","_smokepos","_smoketarget"];

_zombie = _this select 0;
_smokepos = 0;
Zfirednear = 0;
Ryanzombieslimit = 6;
_shellsmoke = ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellYellow","SmokeShellGreen","SmokeShellRed","SmokeShell"];

_zombie addEventHandler["FiredNear", {Zfirednear = 1;zweapon_player = (_this select 4);}];

//fnc_RyanZombies_DoMoveLocalized = compileFinal "_this select 0 domove (_this select 1)"; 
//fnc_RyanZombies_Bleeding = compileFinal "_this select 0 setBleedingRemaining (_this select 1)"; 
fnc_RyanZombies_Velocity = compileFinal "if(local (_this select 0)) then {_this select 0 setvelocity (_this select 1)}"; //fnc_RyanZombies_SetHitIndex = compileFinal "if(local (_this select 0)) then {_this select 0 setHitIndex (_this select 1)}";

_zombie addMPEventHandler ["MPHit", "(_this select 0) setBleedingRemaining 1"];

_sound = 0;
_target = objnull;
_class = getText(configFile >> "CfgVehicles" >> (typeof _zombie) >> "vehicleClass");

private["_pos", "_dir"];

if (isNil "opx_fnc_findZombieTarget") then 
{
    opx_zombie_possibleTargetList = [];
    opx_fnc_addPossibleTarget = {
        _toAdd = param[0, objNull, [objNull]];
        opx_zombie_possibleTargetList pushBack _toAdd;
    };	
	
    opx_fnc_playerNoise = 
	{
        _zombie = param[0, objNull, [objNull]];
        _player = param[1, objNull, [objNull]];

        _rating = 0;

        _speed = speed _player;
        if (_speed < 0) then {
            _speed = _speed * (-1)
        };
        _rating = _rating + _speed * 2.6;

        _surfaceValue = 0;
        if (surfaceType position _player == "#Default"
            AND speed _player > 2) then {
            _surfaceValue = 20
        };
        if (surfaceType position _player in ["#CRGrass1", "#CRField2", "#CRField1"] AND speed _player > 2) then {
            _surfaceValue = 15
        };
        if (surfaceType position _player == "#CRTarmac"
            AND speed _player > 2) then {
            _surfaceValue = 20
        };
        if (surfaceType position _player == "#CRForest1"
            AND speed _player > 2) then {
            _surfaceValue = 15
        };

        _rating = _rating + _surfaceValue;
		
   		if (Zfirednear == 1) then
		{		    
		    Zfirednear = 0;
            _val1 = ((_player distance _zombie) * 0.39);
            if !(lineIntersects[(eyePos _zombie), (eyePos _player), _zombie, vehicle _player]) then {
                _val1 = _val1 + 15;
            };
            if (_val1 < 65) then {
			   
			   _silencers = ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_acp","muzzle_snds_H_MG"];
			   _silenced = false;
				
				if (zweapon_player == primaryWeapon _player) then {
					for "_i" from 0 to ((count _silencers) - 1) do {
						{
							if (_x == (_silencers select _i)) then {
								_silenced = true;
							};
						} forEach (primaryWeaponItems _player);
					};
				} else {
					if (zweapon_player == handgunWeapon _player) then {
						for "_i" from 0 to ((count _silencers) - 1) do {
							{
								if (_x == (_silencers select _i)) then {
									_silenced = true;
								};
							} forEach (handgunItems _player);
						};
					};
				};
				zweapon_player = nil;
				
				if (_silenced) then {
				  if (_player distance _zombie > 15) then {
				      _rating = 8;
				  };
				}
				else {_rating = 999;};
			
                //_player setVariable ["Ffired",false];
            };
        };

		
        if (vehicle _player isKindOf "Car") then {	
		
            if ((isEngineOn(vehicle _player)) && (_player distance _zombie < 80)) then {			    
			    _rating = _rating + (120 - (_player distance _zombie));
            };
			if (daytime >= NightStartTime or daytime < NightEndTime) then {
				if ((isLightOn(vehicle _player)) && (_player distance _zombie < 100)) then {
				   _rating = _rating + (250 - (_player distance _zombie));
				};			
			};
			
        };
		
		_rating = _rating - (_player distance _zombie) * 0.2;
		
        if (_rating > 121) then {
            _rating = 121
        };

        if (_rating < 0) then {
            _rating = 0;
        };

        _rating
    };

    opx_fnc_lineOfSight = {
        _zombie = param[0, objNull, [objNull]];
        _player = param[1, objNull, [objNull]];
        if (isNull _player OR isNull _zombie) exitWith {0};
		
        _rating = 0;

        _eyeDV = eyeDirection _zombie;
        _eyeD = ((_eyeDV select 0) atan2(_eyeDV select 1));
        _dirTo = [_zombie, _player] call BIS_fnc_dirTo;

        _night_rating = 0;
		if (daytime >= NightStartTime or daytime < NightEndTime) then {
		   _night_rating = 10;
		};
		
		if (!lineIntersects [(eyePos _zombie),(eyePos _player),_zombie,vehicle _player] 
		    AND !(abs(_dirTo - _eyeD) >= 125 && (abs(_dirTo - _eyeD) <= 235)) 
			AND !terrainIntersect [(eyePos _zombie),(eyePos _player)]		
		)
		then 
		{			 
			if (stance _player == "STAND") then {_rating = 100};//100
			if (stance _player == "CROUCH") then {_rating = 80};//80
			if (stance _player == "PRONE") then {_rating = 60};//60

			if (surfaceType position _player == "#Default") then {
				_rating = _rating * 1;
			};
			if (surfaceType position _player in ["#CRGrass1","#CRField2","#CRField1"]) then {
				_rating = _rating * 0.85;
			};
			if (surfaceType position _player == "#CRTarmac") then {
				_rating = _rating * 0.9;
			};
			if (surfaceType position _player == "#CRForest1") then {
				_rating = _rating * 0.7;
			};

			_rating = (_rating - _night_rating)  - (_player distance _zombie) * 0.7;
            
			if (_rating < 0) then {_rating = 0;};
		};

		if (!lineIntersects [(eyePos _zombie),(eyePos _player),_zombie,vehicle _player] 
			AND !(abs(_dirTo - _eyeD) >= 125 && (abs(_dirTo - _eyeD) <= 235)) 
			) then 
		{
		    
			if (_player distance _zombie < 4) then {			
				_rating = 136;
			};			
			if (_night_rating > 0) then {
				if (_player isFlashlightOn (currentWeapon _player) && (_player distance _zombie < 80)) then
				{
			        _rating = _rating + (150 - (_player distance _zombie));
					if (_rating < 0) then {_rating = 0;};
				};	
			};	
		}; 

        _rating
    };

    opx_fnc_findZombieTarget = {
        _zombie = param[0, objNull, [objNull]];
        _currentTarget = param[1, objNull, [objNull]];

        _oldTarget = _currentTarget;

        if (_oldTarget distance _zombie < 25) then {
            _oldTarget
        };

        if (isNull _zombie) then {
            objNull
        };

        _targets = [];
		_nearTargets = nearestobjects [_zombie, ["Man","CAmanBase","LandVehicle"], 210];
        //_nearTargets = nearestobjects[_zombie, ["Man"], 200];

        {
            if (isPlayer _x && alive _x) then {

                _v1 = [_zombie, _x] call opx_fnc_playerNoise;
                _v2 = [_zombie, _x] call opx_fnc_lineOfSight;

                //if (_currentTarget == _x) then {
                //	_v2 = _v2 * 2;
                //};

                //_trigger = false;
                //hint format ["%1 | %2 | %3",round _v1,round _v2,round (_v1+_v2)];    
                if ((_v1 + _v2) > 110) then {
                    _targets pushBack _x;
                };

            };
        }
        forEach _nearTargets;

        if (count _targets > 0) then {
            (_targets select 0);
        } else {
            objNull;
        };
    };

    opx_fnc_moveTo = {
        /* if (isNull group (_this select 0)) then {
        	(_this select 0) moveto (_this select 1);
        } else {
        	(_this select 0) domove (_this select 1);
        }; */
        (_this select 0) moveto(_this select 1);
    };
};

_chanceToRoam = 0.02;

scopename "start";
zombieDoWork = true;

while {zombieDoWork} do 
{
    scopename "loop";

    if !(alive _zombie) exitwith {};

    _zombie setFormDir random 360;

    if !(isnil "Ryanzombieslogicroam") then {
        if !(local _zombie) then {
            [
                [_zombie, [(position _zombie select 0) + random 150 - random 150, (position _zombie select 1) + random 150 - random 150]], "opx_fnc_moveTo", _zombie
            ] call BIS_fnc_MP;
        } else {
            _zombie moveto[(position _zombie select 0) + random 99 - random 99, (position _zombie select 1) + random 99 - random 99];
        };
    };

    if !(isnil "ryanzombieswaypoint") then {
        if !(local _zombie) then {
            [
                [_zombie, [(position ryanzombieslogicwaypoint select 0) + random 15 - random 15, (position ryanzombieslogicwaypoint select 1) + random 15 - random 15]], "opx_fnc_moveTo", _zombie
            ] call BIS_fnc_MP;
        } else {
            _zombie domove[(position ryanzombieslogicwaypoint select 0) + random 15 - random 15, (position ryanzombieslogicwaypoint select 1) + random 15 - random 15];
        };
    };

    _a = 0;
    _b = 6 + random 3; //5 + random 3;

    _lastAttackRemoteExec = diag_tickTime;
    _lastSeenTime = 0;
    _newTargetFound = false;

    _oldTarget = objNull;

    while {zombieDoWork} do 
	{
        scopename "findtarget";
        _roam = 0;

        while {zombieDoWork} do 
		{
            if !(alive _zombie) then {breakTo "loop"};

			if (daytime >= NightStartTime or daytime < NightEndTime) then {
				_zdetect_player = 6;
				_zdetect_player_target = 60;
			} 
			else 
			{ 
				_zdetect_player = 10;
				_zdetect_player_target = 120;
			};
			
            _follow = 0;

            _oldTarget = _target;

            if (!isNull _target AND _target distance _zombie < 4) then {
                _target = _target;
            } else {
                _target = [_zombie, _target] call opx_fnc_findZombieTarget;
                if (isNull _target) then {
                    if (diag_tickTime - _lastSeenTime < 6) then {
                        _target = _oldTarget;
                    } else {
                        _lastSeenTime = diag_tickTime;
                    };
                } else {
                    _lastSeenTime = diag_tickTime;
                };
            };
			
            {
				_objsmoke = _zombie nearObjects [_x, 70];
			
				{
					_smokepos = _x distance _zombie;
									
					if (_smokepos > 0) then
					{
						_target = objnull;
						_smoketarget = getposATL _x;					
					};
				} foreach _objsmoke;
			} foreach _shellsmoke;

            if !(isnull _target) then {
			
                Ryanzombieslimit = _zdetect_player_target;
                Sleep 0.7;
                _zombie limitSpeed 20;
                _chanceToRoam = 0.1;
                if (_zombie distance _target < 3) then {
                    _zombie setdir([_zombie, _target] call BIS_fnc_dirTo);
                };
				
                if ((((getPosASL _target) select 2) - ((getPosASL _zombie) select 2)) > 20 AND _target iskindof "AIR") exitwith {
                    Sleep 2
                };
                if (animationState _zombie == "UNCONSCIOUS") exitwith {
                    Sleep 2
                };
                if (_zombie distance _target > Ryanzombieslimit) exitwith {
                    Sleep 2
                };

                //if (_target == _oldTarget) TODO ATTACK SOUNDS TODO

                if !(local _zombie) then {
                    [
                        [_zombie, getposATL _target], "opx_fnc_moveTo", _zombie
                    ] call BIS_fnc_MP
                } else {
                    if (isNull group _zombie) then {
                        _zombie moveto getposATL _target
                    } else {
                        _zombie domove getposATL _target
                    };
                };

                //_zombie dowatch _target;
                _target setsuppression 0;

                if ((vehicle _target iskindof "man") && _zombie distance _target < Ryanzombiesattackdistance) then {
                    _zombie setdir(_zombie getDir _target);

                    Sleep 0.3;
                    //if (_zombie distance _target < Ryanzombiesattackdistance && (alive _target) && (alive _zombie)) then
                    //{

                    //};
                    //Sleep Ryanzombiesattackspeed;
                    if ((alive _target) OR(isnil "Ryanzombiesfeed")) then {
                        breakTo "findtarget";
                    };
                };

                if ((vehicle _target iskindof "car") && _zombie distance _target < 15) then {
                    _zombie setdir([_zombie, _target] call BIS_fnc_dirTo);

                    _pos = position _target;
                    _dir = ((_pos select 0) - (getpos _zombie select 0)) atan2((_pos select 1) - (getpos _zombie select 1));
                    if (speed _target < 5) then {
                        _zombie setpos[(_pos select 0) - 4 * sin _dir, (_pos select 1) - 4 * cos _dir]
                    };

                    _target allowfleeing 1;
                    Sleep 0.3;
                    /* if (_zombie distance _target < 7 && (alive _zombie)) then
                    {
                    	
                    }; */
                    Sleep Ryanzombiesattackspeed;
                    breakTo "findtarget";
                };

                if ((vehicle _target iskindof "air") && _zombie distance _target < 10) then {
                    _zombie setdir([_zombie, _target] call BIS_fnc_dirTo);
                    //[[_zombie, "AwopPercMstpSgthWnonDnon_throw"], "switchMove"] call BIS_fnc_MP;

                    _pos = position _target;
                    _dir = ((_pos select 0) - (getpos _zombie select 0)) atan2((_pos select 1) - (getpos _zombie select 1));
                    _zombie setpos[(_pos select 0) - 4 * sin _dir, (_pos select 1) - 4 * cos _dir];

                    //_attackrandom = _attackarray select floor random count _attackarray;
                    //playsound3d [format ["%1",_attackrandom], _zombie, false, getPosASL _zombie, 1, 1, 100];
                    Sleep 0.3;
                    if (_zombie distance _target < 10 && (alive _zombie)) then {
                        _target setdamage(damage _target + Ryanzombiesdamageair);

                        _collisionrandom = _collisionarray select floor random count _collisionarray;
                       // playsound3d[format["%1", _collisionrandom], _target, false, getPosASL _zombie, 1, 1, 30];

                        _vel = velocity _target;
                        _dir = direction _zombie;
                        [
                            [_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamageairstrenth), (_vel select 1) + (cos _dir * Ryanzombiesdamageairstrenth), (_vel select 2) + random 1]], "fnc_RyanZombies_Velocity"
                        ] call BIS_fnc_MP;
                    };
                    Sleep Ryanzombiesattackspeed;
                    breakTo "findtarget";
                };

                if ((_class == "Ryanzombiesfast") OR(_class == "Ryanzombiesmedium") OR(_class == "Ryanzombiesslow")) then {
                    //if ((_sound < 1) && (isnil "ryanzombiesdisableaggressive")) then {[_zombie] execVM "\ryanzombies\soundsclose.sqf"};
                    _sound = _sound + 1;
                    if (_sound > 5) then {
                        _sound = 0
                    };
                };
                /* if (_class == "Ryanzombiesspider") then {
                    if ((_sound < 1) && (isnil "ryanzombiesdisableaggressive")) then {
                        [_zombie] execVM "\ryanzombies\soundsclosespider.sqf"
                    };
                    _sound = _sound + 1;
                    if (_sound > 5) then {
                        _sound = 0
                    };
                }; */

                //if ((_class == "Ryanzombiescrawler") && (speed _zombie != 0)) then {[_zombie] execVM "\ryanzombies\soundsclosecrawler.sqf"};

                _x = 0.5 + (_zombie distance _target) / 50 min 4;
                Sleep _x;

                if (!(alive _target) && !(isnil "Ryanzombiesfeed") && (vehicle _target iskindof "man")) then {
                    _c = 0;
                    _d = 25 + random 25;
                    if !(isnil "ryanzombiesinfectiontimer") then {
                        _d = ryanzombiesinfectiontimer - 3
                    };
                    _e = 0;

                    while {
                        (_zombie distance _target < 80) && (alive _zombie)
                    }
                    do {
                        _newtarget = _zombie findNearestEnemy _zombie;
                        if ((!(isnull _newtarget) && (_zombie distance _newtarget < _zombie distance _target)) OR(_zombie distance _newtarget < 13) OR(_c > _d)) then {
                            breakTo "findtarget"
                        };
                        if !(isnil "ryanzombiesinfectiontimer") then {
                            _c = _c + 1
                        };
                        if ((_e == 0) OR(_e == 5) OR(_e == 10) OR(_e == 15) OR(_e == 20) OR(_e == 25)) then {
                            if !(local _zombie) then {
                                [
                                    [_zombie, getposATL _target], "opx_fnc_moveTo", _zombie
                                ] call BIS_fnc_MP
                            } else {
                                _zombie domove getposATL _target
                            };
                        };
                        Sleep 1;

                        _e = _e + 1;
                        if (_e > 30) then {
                            breakTo "findtarget"
                        };
                        _damage = damage _zombie;
                        if ((_zombie distance _target < 3) && (_c < _d)) then {
                            _zombie disableAI "ANIM";
                            _zombie setdir([_zombie, _target] call BIS_fnc_dirTo);
                            [
                                [_zombie, "AinvPknlMstpSnonWnonDnon_3"], "switchMove"
                            ] call BIS_fnc_MP;
                            Sleep 1;
                            while {
                                alive _zombie
                            }
                            do {
                                _target = _zombie findNearestEnemy _zombie;
                                Sleep 1;
                                _c = _c + 1;
                                if ((_c > _d) OR(!(isnull _target) && (_zombie distance _target < 13)) OR(_damage != damage _zombie)) exitwith {
                                    _zombie enableAI "ANIM";
                                    [
                                        [_zombie, ""], "playMoveNow"
                                    ] call BIS_fnc_MP;
                                    breakTo "findtarget";
                                };
                            };
                        };
                    };
                };

                if (!(isnil "Ryanzombiescanthrow") && (alive _zombie)) then {

                    _objectcar = nearestObject[_zombie, "car"];
                    if ((_objectcar iskindof "car") && (random 7 < 1)) then {
                        while {
                            (_objectcar distance _target < Ryanzombiescanthrowdistance) && (_zombie distance _objectcar < _zombie distance _target) && (_objectcar distance _target < _zombie distance _target)
                        }
                        do {
                            if !(alive _zombie) then {
                                breakTo "loop"
                            };
                            _target = _zombie findNearestEnemy _zombie;
                            if (isnull _target) then {
                                breakTo "findtarget";
                            };

                            if (_zombie distance _objectcar < 7) then {
                                //[[_zombie, "AwopPercMstpSgthWnonDnon_throw"], "switchMove"] call BIS_fnc_MP;
                                _zombie setdir([_zombie, _objectcar] call BIS_fnc_dirTo);

                                _pos = position _objectcar;
                                _dir = ((_pos select 0) - (getpos _zombie select 0)) atan2((_pos select 1) - (getpos _zombie select 1));
                                _zombie setpos[(_pos select 0) - 4 * sin _dir, (_pos select 1) - 4 * cos _dir];

                                _attackrandom = _attackarray select floor random count _attackarray;
                                //playsound3d[format["%1", _attackrandom], _zombie, false, getPosASL _zombie, 1, 1, 100];
                                Sleep 0.3;
                                if !(alive _zombie) then {
                                    breakTo "loop"
                                };
                                _speed = 20 + random 25;
                                _dir = ((getpos _target select 0) - (getpos _objectcar select 0)) atan2((getpos _target select 1) - (getpos _objectcar select 1));
                                _range = _objectcar distance _target;
                                [
                                    [_objectcar, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]], "fnc_RyanZombies_Velocity"
                                ] call BIS_fnc_MP;

                                _throwrandom = _throwarray select floor random count _throwarray;
                                //playsound3d[format["%1", _throwrandom], _objectcar, false, getPosASL _zombie, 1, 1, 30];

                                //_objectcar setfuel 0;
                                //[_objectcar] exec "\ryanzombies\carland.sqf";
                                Sleep Ryanzombiesattackspeed;
                                breakTo "findtarget";
                            };
                            if !(local _zombie) then {
                                [
                                    [_zombie, position _objectcar], "opx_fnc_moveTo"
                                ] call BIS_fnc_MP
                            } else {
                                _zombie domove position _objectcar
                            };
                            _x = 0.5 + (_zombie distance _objectcar) / 50 min 4;
                            Sleep _x;
                        };
                    };
                };

                if (!(isnil "Ryanzombiescanthrowtank") && (alive _zombie)) then {
                    _objecttank = nearestObject[_zombie, "tank"];
                    if ((_objecttank iskindof "tank") && (random 7 < 1)) then {
                        while {
                            (_zombie distance _objecttank < _zombie distance _target) && (_objecttank distance _target < _zombie distance _target) && (_objecttank distance _target < Ryanzombiescanthrowtankdistance)
                        }
                        do {
                            if !(alive _zombie) then {
                                breakTo "loop"
                            };
                            _target = _zombie findNearestEnemy _zombie;
                            if (isnull _target) then {
                                breakTo "findtarget";
                            };

                            if (_zombie distance _objecttank < 8) then {
                                [
                                    [_zombie, "AwopPercMstpSgthWnonDnon_throw"], "switchMove"
                                ] call BIS_fnc_MP;
                                _zombie setdir([_zombie, _objecttank] call BIS_fnc_dirTo);

                                _pos = position _objecttank;
                                _dir = ((_pos select 0) - (getpos _zombie select 0)) atan2((_pos select 1) - (getpos _zombie select 1));
                                _zombie setpos[(_pos select 0) - 4 * sin _dir, (_pos select 1) - 4 * cos _dir];

                                _attackrandom = _attackarray select floor random count _attackarray;
                                playsound3d[format["%1", _attackrandom], _zombie, false, getPosASL _zombie, 1, 1, 100];
                                Sleep 0.3;
                                if !(alive _zombie) then {
                                    breakTo "loop"
                                };
                                _speed = 20 + random 25;
                                _dir = ((getpos _target select 0) - (getpos _objecttank select 0)) atan2((getpos _target select 1) - (getpos _objecttank select 1));
                                _range = _objecttank distance _target;
                                [
                                    [_objecttank, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]], "fnc_RyanZombies_Velocity"
                                ] call BIS_fnc_MP;

                                _throwrandom = _throwarray select floor random count _throwarray;
                                playsound3d[format["%1", _throwrandom], _objecttank, false, getPosASL _zombie, 1, 1, 30];

                                [_objecttank] exec "\ryanzombies\tankland.sqf";
                                Sleep Ryanzombiesattackspeed;
                                breakTo "findtarget";
                            };
                            if !(local _zombie) then {
                                [
                                    [_zombie, position _objecttank], "opx_fnc_moveTo"
                                ] call BIS_fnc_MP
                            } else {
                                _zombie domove position _objecttank
                            };
                            _x = 0.5 + (_zombie distance _objecttank) / 50 min 4;
                            Sleep _x;
                        };
                    };
                };

                if (!(isnil "Ryanzombiesjump") && (alive _zombie)) then {
                    if ((_zombie distance _target > 45) && (alive _zombie) && (alive _target) && (!surfaceIsWater position _zombie) && (random 15 < 1)) then {
                        _heightzombie = getTerrainHeightASL(position _zombie);
                        _heighttarget = getTerrainHeightASL(position _target);
                        _highzombie = _heightzombie + 20;
                        _hightarget = _heighttarget + 40;

                        if (_highzombie < _heighttarget) then {
                            breakTo "findtarget";
                        };
                        if (_hightarget < _heightzombie) then {
                            breakTo "findtarget";
                        };

                        _zombie disableAI "MOVE";

                        _basespeed = 8 + random 2;
                        _extraspeed = (_zombie distance _target) / 8 min 60;

                        _jumprandom = _jumparray select floor random count _jumparray;
                       // playsound3d[format["%1", _jumprandom], _zombie, false, getPosASL _zombie, 1, 1, 100];
                        Sleep 0.15;
                        _zombie setdir([_zombie, _target] call BIS_fnc_dirTo);
                        _dir = ((getpos _target select 0) - (getpos _zombie select 0)) atan2((getpos _target select 1) - (getpos _zombie select 1));
                        [
                            [_zombie, [(_basespeed + _extraspeed) * (sin _dir), (_basespeed + _extraspeed) * (cos _dir), 12 + random 6]], "fnc_RyanZombies_Velocity"
                        ] call BIS_fnc_MP;

                        Sleep 1;

                        _zombie allowdammage false;
                        waituntil {
                            (getpos _zombie select 2) < 1 OR(speed _zombie < 1)
                        };

                        _zombie enableAI "MOVE";
                        Sleep 0.5;
                        if (isnil "Ryanzombiesinvincible") then {
                            _zombie allowdammage true
                        };
                        breakTo "findtarget";
                    };
                };
                breakTo "findtarget";
            } else {
                //hint format ["____ N A O TARGET  distancia=%1",round(vehicle _zombie distance vehicle _target)];
                //Sleep 0.8;
                //if (_follow > 0) then {
                //	_follow = _follow - 1;
                //	_zombie doMove getPosATL _oldTarget;
                //};
                //_newTargetFound = false;

                // Roam around randomly
                if (_smokepos > 0) then
				{
				   _zombie domove _smoketarget;
				   if (_zombie distance _smoketarget < 3) then  {_smokepos = 0};
				}
				else
				{ 
					_r = random 1;
					
					if (_r < _chanceToRoam) then {
						_radius = 12;//8;
						_pos = [(((getPos _zombie) select 0) - _radius) + (random (_radius*2)),(((getPos _zombie) select 1) - _radius) + (random (_radius*2)),0];
					
						_zombie limitSpeed 2;
						if !(local _zombie) then {
							[[_zombie, _pos], "opx_fnc_moveTo"] call BIS_fnc_MP
						} else {
							if (isNull group _zombie) then {
								_zombie moveto _pos
							} else {
								_zombie domove _pos
							};
						};
						sleep 0.3;
					};
				};
            };            
			
			if (daytime >= NightStartTime or daytime < NightEndTime) then {
				_zdetect_player = 6;
				_zdetect_player_target = 60;
			} 
			else 
			{ 
				_zdetect_player = 10;
				_zdetect_player_target = 120;
			};
			
            if (alive _zombie) then {
                _a = _a + 1;
                Sleep 1;
				
				Ryanzombieslimit = Ryanzombieslimit - _zdetect_player;				
				if (Ryanzombieslimit <= 15) then {
					Ryanzombieslimit = _zdetect_player;                
				};
				Sleep 0.8;
            };
            if (_a > _b) then {
                breakTo "loop"
            };
        };
    };
};