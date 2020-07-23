disableSerialization;

scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _ctrlListNBox = param [0,controlNull,[controlNull]];

while {!isNull _ctrlListNBox} do {
	lnbClear _ctrlListNBox;
	
	private _targets = allPlayers - [player];
	{_ctrlListNBox lnbAddRow [name _x,str score _x];} forEach _targets;
	
	uiSleep 0.5;
};