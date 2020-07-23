scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (!vehicleCargoEnabled _veh) exitWith {};

private _loadTypes = ["LandVehicle","Ship","Air","ReammoBox_F"];
private _loadSize = ceil (0.5*sizeOf typeOf _veh);
private _actionCond = format [
	"
		(_this isEqualTo driver _target)
		and {(vectorMagnitude velocity _target < 1)
		and {((_target nearEntities [%1,%2]) findIf {(_target canVehicleCargo _x) select 0} >= 0)}}
	",
	_loadTypes,
	_loadSize
];

private _actionScript = {
	params ["_carrier","_caller","_id","_params"];
	
	private _loadTypes = _params param [0,[],[[]]];
	private _loadSize = _params param [1,0,[0]];
	
	private _allCargo = _carrier nearEntities [_loadTypes,_loadSize];
	_allCargo = _allCargo select {(_carrier canVehicleCargo _x) select 0};
	_allCargo = [_allCargo,[_carrier],{_input0 distance2D _x}] call BIS_fnc_sortBy;
	private _cargo = _allCargo param [0,objNull,[objNull]];
	
	if (!isNull _cargo) then {_carrier setVehicleCargo _cargo;};
};

private _actionID = _veh addAction ["",_actionScript,[_loadTypes,_loadSize],20,true,true,"",_actionCond];
_veh setUserActionText [_actionID,"Load cargo","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa'/></t>"];