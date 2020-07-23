private _unit = _this select 0;
sleep 30;  

private _pos = [position _unit, 3500, floor random 360] call BIS_fnc_relPos;
private _posfinal = [_pos, 5, floor random 360] call BIS_fnc_relPos;

//private _awwwa = ["I_UAV_02_F","I_UAV_02_CAS_F"] call BIS_fnc_selectRandom;

private _myUAV = [_posfinal, 1000, "I_UAV_02_dynamicLoadout_F", (group _unit)] call BIS_fnc_spawnVehicle; 
createVehicleCrew (_myUAV select 0);