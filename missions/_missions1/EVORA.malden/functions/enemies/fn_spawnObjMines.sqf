scriptName _fnc_scriptName;
if (hasInterface and {!isServer}) exitWith {};

private _objActive	= param [0,[],[[]]];
private _objPos		= _objActive select 1;
private _objRadius	= [0,0.8] apply {_x*(_objActive select 2)};
private _nMineField	= param [1,0,[0]];
private _nMineMine	= param [2,0,[0]];
private _allMines	= [];

if ((_nMineField isEqualTo 0) or {_nMineMine isEqualTo 0}) exitWith {[[],_allMines];};

private _classesMines	= ["APERSMine","APERSBoundingMine","ATMine","ATMine"];

if (_classesMines isEqualTo []) exitWith {[[],_allMines];};

private ["_fieldPos","_fieldCount","_fieldDensity","_fieldSize"];
for "_i" from 1 to _nMineField do {
	// Create minefield and fill with mines
	_fieldPos = [_objPos,_objRadius] call EVOR_fnc_findRandPos;
	_fieldCount = round random ([2/3,1,3/2] vectorMultiply _nMineMine);
	_fieldDensity = 0.01; // mines*m^-2
	_fieldSize = sqrt((_fieldCount/_fieldDensity)/pi);
	
	for "_i" from 1 to _fieldCount do {
		_allMines pushBack (createMine [selectRandom _classesMines,_fieldPos,[],_fieldSize]);
		
		sleep 0.5;
	};
	
	sleep 0.5;
};

{EVOR_var_SideEnemy revealMine _x;} forEach _allMines;

[[],_allMines];