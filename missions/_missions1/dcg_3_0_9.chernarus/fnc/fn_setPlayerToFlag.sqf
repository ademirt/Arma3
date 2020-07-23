/*
Author: SENSEI

Last modified: 9/5/2015

Description: move player to flag

Return: nothing
__________________________________________________________________*/
private "_flag";

_flag = objNull;
if (getMarkerColor "sen_fob_mrk" isEqualTo "") exitWith {hintSilent "FOB Pirelli is not deployed."};

if ((_this select 0) isEqualTo 0) then {_flag = SEN_flagMOB} else {_flag = SEN_flagFOB};

titleText ["", "BLACK OUT", 2];
sleep 0.5;
playSound "SEN_transportFlyby";
sleep 3;
player setDir ([getPosASL player, getposASL _flag] call BIS_fnc_dirTo) + 180;
player setPosASL (getPosASL _flag);
titleText ["", "BLACK IN", 4];