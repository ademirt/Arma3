/*
Author: SENSEI

Last modified: 8/14/2015

Description:  deploy FOB

Return: nothing
__________________________________________________________________*/
private ["_pos","_anim","_t","_key"];

_pos = player modelToWorld [0,3,0];
_pos set [2,0];


if (_pos distance2D (getMarkerPos "SEN_safezone_mrk") <= ((getMarkerSize "SEN_safezone_mrk") select 0)) exitWith {
	hintSilent "Unsuitable position for FOB. Select an area away from MOB Dodge.";
};

if (count (_pos isFlatEmpty [1, 0, 0.5, 15, 0, false, player]) isEqualTo 0) exitWith {
	hintSilent "Unsuitable position for FOB. Select a flat open area.";
};

[
	10,
	[_pos],
	{
		[player,((_this select 0) select 0),100] remoteExec ["SEN_fnc_fobSetup", 2, false];
		player addEventHandler ["respawn",{
			if ((getPlayerUID (_this select 0)) isEqualTo SEN_curatorFOBUnitUID) then {
				[[(_this select 0)],{(_this select 0) assignCurator SEN_curatorFOB}] remoteExecCall ["BIS_fnc_call", 2, false];
			};
		}];
		_key = (actionKeys "curatorInterface") select 0;
		if (!isNil "_key") then {
			hint format ["Press the Zeus key, %1, to construct FOB Pirelli.",keyName _key];
		} else {
			hint format ["Press the Zeus key, %1, to construct FOB Pirelli.",'UNBOUND'];
		};
	},
	{

	},
	"Deploying FOB Pirelli..."
] call ace_common_fnc_progressBar;