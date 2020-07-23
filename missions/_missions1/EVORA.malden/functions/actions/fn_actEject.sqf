scriptName _fnd_scriptName;
if (!hasInterface) exitWith {};

private _veh = param [0,objNull,[objNull]];

if ((!(_veh isKindOf "Helicopter")) or {unitIsUAV _veh}) exitWith {};	// Should not be used on planes as they use a separate ejection method

// Determine which turret paths (fullCrew notation) prevent ejection
private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cantEjectDriver = getNumber (_cfgVeh >> "driverCanEject") == 0;
private _cantEjectTurret = [];
{
	private _cfgTurret = _cfgVeh;
	{_cfgTurret = (_cfgTurret >> "Turrets") select _x;} forEach _x;
	if (getNumber (_cfgTurret >> "CanEject") == 0) then {_cantEjectTurret pushBack _x;};
} forEach allTurrets _veh;

if ((!_cantEjectDriver) and {_cantEjectTurret isEqualTo []}) exitWith {};

private _condEjectDriver = ["_this == driver _target","false"] select (!_cantEjectDriver);
private _condEjectTurret = [format ["((fullCrew _target) select {(_x select 0) == _this} select 0 select 3) in %1",_cantEjectTurret],"false"] select (_cantEjectTurret isEqualTo []);

private _actionCond = format ["((%1) or {%2}) and {locked _target < 2}",_condEjectDriver,_condEjectTurret];
private _actionScript = {moveOut (_this select 1);};

private _actionID = _veh addAction ["",_actionScript,nil,20,true,false,"",_actionCond,-1,true];
_veh setUserActionText [_actionID,"Eject","<t size='2.5'><img image='a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa'/></t>"];