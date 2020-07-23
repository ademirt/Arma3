scriptName _fnc_scriptName;
private _target = param [0,objNull,[objNull]];
private _damage = param [1,0,[0]];

if (!alive _target) exitWith {};

{_target setHitIndex [_forEachIndex,_x min _damage];} forEach ((getAllHitPointsDamage _target) select 2);