#define checkDead	(!alive _veh) or {(!alive _pilot) or {!alive _gunner}}

scriptName _fnc_scriptName;
if (hasInterface and {!isServer}) exitWith {};

private _group = param [0,grpNull,[grpNull]];
private _target = waypointPosition [_group,1+currentWaypoint _group];
private _vehicles = [];

{if ((vehicle _x) isKindOf "Air") then {_vehicles pushBackUnique (vehicle _x);};} forEach units _group;

{
	[_x,_target] spawn {
		private _veh = _this select 0;
		private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
		private _target = AGLToASL ([_this select 1,100] call EVOR_fnc_findRandPos);
		
		private _pilot = driver _veh;
		private _gunner = gunner _veh;
		if (isNull _gunner) then {_gunner = _pilot;};
		
		private _velMax = (getNumber (_cfgVeh >> "maxSpeed"))/3.6;
		private _distanceApproach = 10*_velMax;
		private _distanceTurn = 300;
		
		// Determine usable weapons (Gun & FFAR)
		private _cfgWeapons = configFile >> "CfgWeapons";
		private _weaponTypes = ["machinegun","rocketlauncher","missilelauncher"];
		private _weaponsAll = (weapons _veh) apply {[_x,toLower ((_x call BIS_fnc_itemType) select 1)]} select {(_x select 1) in _weaponTypes};
		private _weaponsFire = [];
		{
			_mode = (getarray (_cfgWeapons >> (_x select 0) >> "modes")) param [0,"this",[""]];
			_weaponsFire pushBackUnique [_x select 0,[_mode,_x select 0] select (_mode == "this")];
		} forEach _weaponsAll;
		
		// Approaching the target
		waitUntil {sleep 1; (_veh distance2D _target < _distanceApproach) or {checkDead}};
		if (checkDead) exitWith {};
		
		// Turning into approach vector
		private _pos0	= getPosASL _veh;
		private _dir0	= vectorDir _veh;
		private _dir1	= _pos0 vectorFromTo _target;
		private _pos1	= _pos0 vectorAdd (_dir1 vectorMultiply _distanceTurn);
		private _up0	= vectorUp _veh;
		private _up1	= [0,0,1];
		private _vel0	= velocity _veh;
		private _vel1	= _dir1 vectorMultiply (0.75*_velMax);
		private _dur	= _distanceTurn/vectorMagnitude _vel0;
		private _time0	= time;
		private _time1	= _time0 + _dur;
		
		waitUntil {
			_veh setVelocityTransFormation [_pos0,_pos1,_vel0,_vel1,_dir0,_dir1,_up0,_up1,(time - _time0)/_dur];
			(time > _time1) or {checkDead}
		};
		if (checkDead) exitWith {};
		
		// Start firing the aircraft's weapons
		private _firingHandle = [_gunner,_weaponsFire] spawn {
			while {true} do {{(_this select 0) forceWeaponFire _x;} forEach (_this select 1); sleep 1;};
		};
		
		// Holding approach vector
		_pos0	= getPosASL _veh;
		_dir0	= vectorDir _veh;
		_dir1	= _pos0 vectorFromTo _target;
		_pos1	= _pos0 vectorAdd ((_target vectorDiff _pos0) vectorMultiply 0.5);
		_up0	= vectorUp _veh;
		_up1	= [0,0,1];
		_vel0	= velocity _veh;
		_vel1	= _dir1 vectorMultiply (0.75*_velMax);
		_dur	= (_pos0 distance _pos1)/vectorMagnitude _vel1;
		_time0	= time;
		_time1	= _time0 + 0.5*_dur;
		
		waitUntil {
			_veh setVelocityTransFormation [_pos0,_pos1,_vel0,_vel1,_dir0,_dir1,_up0,_up1,(time - _time0)/_dur];
			(time > _time1) or {checkDead}
		};
		
		// Stop Firing
		terminate _firingHandle;
	};
} forEach _vehicles;