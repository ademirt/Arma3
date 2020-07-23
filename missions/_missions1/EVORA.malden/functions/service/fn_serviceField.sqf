scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _target = cursorTarget;
private _caller = param [1,player,[objNull]];

if ((!alive _target) or {!alive _caller}) exitWith {};

private _tool = "ToolKit";
private _itemCargo = itemCargo _target;
private _damage = 0.5;

if (_tool in _itemCargo) then {
	_itemCargo deleteAt (_itemCargo find _tool);
	clearItemCargoGlobal _target;
	{_target addItemCargoGlobal [_x,1];} forEach _itemCargo;
} else {
	_caller removeItem _tool;
};

if (getAllHitPointsDamage _target isEqualTo []) then {
	_target setDamage _damage;
} else {
	[_target,_damage] remoteExecCall ["EVOR_fnc_serviceFieldRemote",_target,false];
};