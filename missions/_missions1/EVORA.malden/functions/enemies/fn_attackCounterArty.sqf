scriptName "EVOR_fnc_attackCounterArty";
if (!isServer) exitWith {};

private _veh = param [0,objNull,[objNull]];
private _ammo = ["R_230mm_fly","Sh_82mm_AMOS"] select (_veh isKindOf "StaticWeapon");
private _count = [8+floor random 8,2+floor random 2] select (_veh isKindOf "StaticWeapon");

for "_i" from 1 to _count do {
	private _shell = createVehicle [_ammo,[0,0,0],[],0,"NONE"];
	_shell setPos ((getPosASL _veh) vectorAdd [random [-75,0,75],random [-75,0,75],3000+random 2000]);
	_shell setVectorDir [0,0,-1];
	_shell setVelocity [0,0,-50];
};

//[[EVOR_var_SideFriendly,"HQ"],format ["Incoming counter-battery fire near grid %1!",mapGridPosition _veh]] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];