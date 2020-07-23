/*
Author: SENSEI, Eightysix

Last modified: 8/21/2015

Description: sets param code

Return: boolean
__________________________________________________________________*/
if !(isServer) exitWith {};

private["_pname","_pval","_pcode","_var"];

{
	_pname = configName ((missionConfigFile >> "Params") select _ForEachIndex);
	_pCode = getText (missionConfigFile >> "Params" >> _pname >> "SEN_paramCode");
	_pBoolean = getNumber (missionConfigFile >> "Params" >> _pname >> "SEN_paramBoolean");
	_pPublic = getNumber (missionConfigFile >> "Params" >> _pname >> "SEN_paramPublic");
	if !( _pcode isEqualTo "" ) then {
		_pval = paramsArray select _ForEachIndex;
		if (_pBoolean isEqualTo 1) then {
			_pval = if (_pval isEqualTo 0) then {false} else {true};
		};
		_var = format[_pCode, _pval];
		call compileFinal _var;
		["Compiling parameter: %1", _var] call SEN_fnc_log;
		if (_pPublic isEqualTo 1) then {
			SEN_PVArray pushback _var;
		};
	};
} forEach paramsArray;

true