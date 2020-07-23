scriptName _fnc_scriptName;
if (!isServer) exitWith {};

private _buyer		= param [0,objNull,[objNull]];
private _purchase	= param [1,[],[[]]];
private _class		= _purchase param [0,"",[""]];
private _price		= _purchase param [1,100,[0]];

_buyer addScore (-_price);