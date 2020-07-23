scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if (configName (configFile >> "CfgVehicles" >> EVOR_var_FOBTruckType) != typeOf _veh) exitWith {};

private _actionCond = "(isNull objectParent _this) and {(alive _target) and {(crew _target findIf {alive _x} < 0)}}";

private _actionScript = {
	params ["_veh","_caller","_id","_params"];
	private _fobPos	= getPos _veh;
	
	private _baseMarkers = EVOR_list_BaseCore apply {_x select 0};
	if (_baseMarkers findIf {_fobPos distance2D getMarkerPos _x < EVOR_var_FOBDistance} >= 0) exitWith {hint "Too close to an existing base!";};
	
	private _obstructions = [
		"TREE","SMALL TREE","BUILDING","HOUSE","CHURCH","CHAPEL","CROSS",
		"ROCK","BUNKER","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE",
		"QUAY","FUELSTATION","HOSPITAL","FENCE","WALL","HIDE","BUSSTOP",
		"TRANSMITTER","STACK","RUIN","TOURISM","WATERTOWER","ROCKS","POWERSOLAR",
		"POWERWAVE","POWERWIND","SHIPWRECK"
	];
	
	if (surfaceIsWater _fobPos) exitWith {hint "Location is on water!";};
	if (_fobPos isFlatEmpty [-1,-1,0.3,10,-1,false] isEqualTo []) exitWith {hint "Location is too steep!";};
	if (!(nearestTerrainObjects [_fobPos,_obstructions,10,false,true] isEqualTo [])) exitWith {hint "Location is obstructed!";};

	[_veh] remoteExec ["EVOR_fnc_createFob",2,false];
};

private _actionID = _veh addAction ["",_actionScript,nil,-6,true,true,"",_actionCond,15];
_veh setUserActionText [_actionID,"Construct FOB","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\takeflag_ca.paa'/></t>"];