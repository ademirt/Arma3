scriptName _fnc_scriptName;
if ((!hasInterface) or {!isMultiplayer}) exitWith {};

private _unit = param [0,player,[objNull]];

_unit addEventHandler [
	"Hit",
	{
		params ["_unit","_source","_damage","_gunner"];
		
		if (
			(isNull _source)
			or {!([side group _unit,side group _source] call BIS_fnc_sideIsFriendly)
			or {(vehicle _unit isEqualTo vehicle _source)
			or {(_damage < 0.1)}}}
		) exitWith {};
		
		if (!isNull _gunner) then {
			_source = _gunner;
			if (!isPlayer _source) then {_source = leader _source;};
			[_source,[currentWeapon _source,0]] remoteExecCall ["setAmmo",_source,false];
		};
		
		[_unit,format ["Cease fire, %1, you're hitting friendlies!",name _source]] remoteExecCall ["sideChat",side group _unit,false];
		
		nil;
	}
];