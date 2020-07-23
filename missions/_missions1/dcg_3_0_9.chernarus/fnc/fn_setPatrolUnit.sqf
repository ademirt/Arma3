/*
Author: SENSEI

Last modified: 9/28/2015

Description: set unit on patrol

Return: nothing
__________________________________________________________________*/
private ["_d","_r","_pos","_house"];

params ["_unit","_range","_houses"];

_unit forceSpeed (_unit getSpeed "SLOW");
_unit setBehaviour "SAFE";
_posStart = getPosATL _unit;

if (_houses isEqualTo []) then {
    [{
        params ["_args","_id"];
        _args params ["_unit","_posStart","_range"];

        if (!alive _unit || {_unit getVariable ["SEN_patrol_exit",false]}) exitWith {
            [_id] call CBA_fnc_removePerFrameHandler;
            _unit forceSpeed -1;
            ["%1 exiting patrol at %2.", typeOf _unit, getPosATL _unit] call SEN_fnc_log;
        };
        if !(behaviour _unit isEqualTo "COMBAT") then {
            if (unitReady _unit) then {
                _d = random 360;
                _r = (ceil random _range) max _range*0.3;
                _pos = [(_posStart select 0) + (sin _d) * _r, (_posStart select 1) + (cos _d) * _r, 0];
                if !(surfaceIsWater _pos) then {
                    _unit doMove _pos;
                };
            };
        };
    }, 20, [_unit,_posStart,_range]] call CBA_fnc_addPerFrameHandler;
} else {
    [{
        params ["_args","_id"];
        _args params ["_unit","_posStart","_range","_houses"];

        if (!alive _unit || {_unit getVariable ["SEN_patrol_exit",false]}) exitWith {
            [_id] call CBA_fnc_removePerFrameHandler;
            _unit forceSpeed -1;
            ["%1 exiting patrol at %2.", typeOf _unit, getPosATL _unit] call SEN_fnc_log;
        };
        if !(behaviour _unit isEqualTo "COMBAT") then {
            if (unitReady _unit) then {
                if (random 1 < 0.35) then {
                    _house = _houses select floor(random (count _houses));
                    _pos = _house buildingPos 0;
                    if !(_pos isEqualTo [0,0,0]) then {
                        _unit doMove _pos;
                    };
                } else {
                    _d = random 360;
                    _r = (ceil random _range) max _range*0.3;
                    _pos = [(_posStart select 0) + (sin _d) * _r, (_posStart select 1) + (cos _d) * _r, 0];
                    if !(surfaceIsWater _pos) then {
                        _unit doMove _pos;
                    };
                };
            };
        };
    }, 20, [_unit,_posStart,_range,_houses]] call CBA_fnc_addPerFrameHandler;
};