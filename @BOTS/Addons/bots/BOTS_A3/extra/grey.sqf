private _unit = _this select 0;
sleep 30;  

private _pos = [position _unit, 3500, floor random 360] call BIS_fnc_relPos;
private _posfinal = [_pos, 5, floor random 360] call BIS_fnc_relPos;

private _uavl1 = ["I_UAV_02_CAS_F","I_UAV_02_F","I_UAV_02_dynamicLoadout_F"];

private _myUAV = [_posfinal, 1000, (_uavl1 call BIS_fnc_selectRandom), (group _unit)] call BIS_fnc_spawnVehicle; 
createVehicleCrew (_myUAV select 0);