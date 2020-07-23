scriptName _fnc_scriptName;
if (!hasInterface) exitWith {[objNull,[]];};

private _veh = cameraOn;
private _unit = player;
private _path = [];

if (_veh == _unit) exitWith {[_veh,_path];};

_path = if (_veh == getConnectedUAV _unit) then {
	switch (UAVControl _veh select 1) do {
		case "DRIVER": {[-1]};
		case "GUNNER": {[0]};
		default {[]};
	};
} else {
	(([[-1]] + allTurrets _veh) select {_unit == _veh turretUnit _x}) param [0,[],[[]]];
};

[_veh,_path];