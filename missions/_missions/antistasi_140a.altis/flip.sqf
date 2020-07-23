flipAction =
{
 private ["_caller","_veh"];
_caller = _this select 1;
_veh = nearestObjects [_caller, ["landVehicle"], 5] select 0;
_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];
};

if (!isDedicated) then 
{
 waitUntil {!isNull player && {time > 0}};
	player addAction ["<t color='#0047b3'>Flip Vehicle</t>", 
		"call flipAction", 
		[], 
		0, 
		false, 
		true, 
		"", 
		"_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
	];
	Player AddEventHandler ["Respawn", {
		(_this select 0) addAction [
			"<t color='#0047b3'>Flip Vehicle</t>", 
			"call flipAction", 
			[], 
			0, 
			false, 
			true, 
			"", 
			"_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
		];
	}];
};
