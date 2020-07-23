/*
Author: SENSEI

Last modified: 9/28/2015

Description: set vehicles on patrol

Return: nothing
__________________________________________________________________*/
private ["_roads","_veh","_d","_r","_pos","_road","_height"];

params ["_driver","_range"];

_veh = vehicle _driver;
_veh addEventHandler ["Fuel",{if !(_this select 1) then {(_this select 0) setFuel 1}}];
_posStart = getPosATL _driver;

if !(_veh isKindOf "AIR") then {
	_driver setBehaviour "SAFE";
	_range = _range min 1000;
	_roads = _posStart nearRoads _range;
	_veh forceSpeed (_veh getSpeed "SLOW");
	if (_roads isEqualTo []) then {
		[{
		    params ["_args","_id"];
		    _args params ["_veh","_posStart","_range"];

		    _driver = driver _veh;

		    if (!alive _veh || {!alive _driver} || {_driver getVariable ["SEN_patrol_exit",false]}) exitWith {
		        [_id] call CBA_fnc_removePerFrameHandler;
		        _veh forceSpeed -1;
		        ["%1 exiting patrol at %2.",typeOf _veh,getPosATL _veh] call SEN_fnc_log;
		    };
		    if !(behaviour _driver isEqualTo "COMBAT") then {
		        if (unitReady _driver) then {
		            _d = random 360;
		            _r = (ceil random _range) max _range*0.3;
		            _pos = [(_posStart select 0) + (sin _d) * _r, (_posStart select 1) + (cos _d) * _r, 0];
		            if !(surfaceIsWater _pos) then {
		                _driver doMove _pos;
		            };
		        };
			};
		}, 20, [_veh,_posStart,_range]] call CBA_fnc_addPerFrameHandler;
	} else {
		[{
		    params ["_args","_id"];
		    _args params ["_veh","_posStart","_range","_roads"];

		    _driver = driver _veh;

		    if (!alive _veh || {!alive _driver} || {_driver getVariable ["SEN_patrol_exit",false]}) exitWith {
		        [_id] call CBA_fnc_removePerFrameHandler;
		        _veh forceSpeed -1;
		        ["%1 exiting patrol at %2.",typeOf _veh,getPosATL _veh] call SEN_fnc_log;
		    };
		    if !(behaviour _driver isEqualTo "COMBAT") then {
		        if (unitReady _driver) then {
		            _road = _roads select floor (random (count _roads));
		            if !(surfaceIsWater (getPosATL _road)) then {
		                _driver doMove (getPosATL _road);
		            };
		        };
			};
		}, 20, [_veh,_posStart,_range,_roads]] call CBA_fnc_addPerFrameHandler;
	};
} else {
	_driver setBehaviour "AWARE";
	_height = 150;
	_veh flyInHeight _height;
	_veh forceSpeed (_veh getSpeed "NORMAL");

	[{
	    params ["_args","_id"];
	    _args params ["_veh","_posStart","_range","_height"];

	    _driver = driver _veh;

	    if (!alive _veh || {!alive _driver} || {_driver getVariable ["SEN_patrol_exit",false]}) exitWith {
	        [_id] call CBA_fnc_removePerFrameHandler;
	        _veh forceSpeed -1;
	        ["%1 exiting patrol at %2.",typeOf _veh,getPosATL _veh] call SEN_fnc_log;
	    };
	    if !(behaviour _driver isEqualTo "COMBAT") then {
	        if (unitReady _driver) then {
	            _d = random 360;
	            _r = (ceil random _range) max _range*0.3;
	            _pos = [(_posStart select 0) + (sin _d) * _r, (_posStart select 1) + (cos _d) * _r, _height];
	            _driver doMove _pos;
	        };
    	};
	}, 20, [_veh,_posStart,_range,_height]] call CBA_fnc_addPerFrameHandler;
};