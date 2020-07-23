scriptName "EVOR_fnc_objCheck";
if (!isServer) exitWith {};

private _objActive		= param [0,[],[[]]];
private _objRT			= param [1,objNull,[objNull]];
private _objPos			= _objActive select 1;
private _objRadius		= (_objActive select 2) + 150;
private _combatRadius	= 200;

waitUntil {sleep 15; !alive _objRT};

private _checkEnemy		= {(side _x isEqualTo EVOR_var_SideEnemy) and {_x distance2D _objPos < _objRadius}};
private _checkCombat	= {private _unit = _x; allPlayers findIf {_unit distance2D _x < _combatRadius} >= 0};

while {true} do {
	waitUntil {
		sleep 15;
		
		_checkEnemy count allUnits <= EVOR_var_EnemyUnitEnd
	};
	
	sleep random [20,20,40];
	
	private _units = allUnits select _checkEnemy;
	if ((count _units <= EVOR_var_EnemyUnitEnd) and {_checkCombat count _units < 2}) exitWith {};
};

[_objActive,_objRT] spawn EVOR_fnc_objComplete;