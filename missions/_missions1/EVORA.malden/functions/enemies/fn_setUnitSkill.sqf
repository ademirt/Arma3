scriptName _fnc_scriptName;
if (hasInterface and {!isServer}) exitWith {};

private _units = param [0,[],[[],objNull]];
private _skill = 0.1*param [1,0,[0]];

if (_units isEqualType objNull) then {_units = [_units];};

{
	_x setskill ["aimingAccuracy",	0.2 + 0.5*_skill];
	_x setskill ["aimingShake",		0.3 + _skill];
	_x setskill ["aimingSpeed",		0.2 + _skill];
	_x setSkill ["commanding",		0.3 + _skill];
	_x setskill ["courage",			0.5 + _skill];
	_x setskill ["general",			0.2 + _skill];
	_x setskill ["reloadSpeed",		0.1 + _skill];
	_x setskill ["spotDistance",	0.1 + _skill];
	_x setskill ["spotTime",		0.1 + _skill];
} forEach _units;