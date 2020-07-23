/*
Author: SENSEI

Last modified: 9/14/2015

Description:  deletes objects and bodies at MOB

Return: nothing
__________________________________________________________________*/
_mrkPos = (getmarkerpos "SEN_safezone_mrk");
_range = (getmarkersize "SEN_safezone_mrk") select 0;
_cleanArray = nearestObjects [_mrkPos,["LandVehicle","Air","Ship","ReammoBox_F","WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"],_range];

{
	if ((count (crew _x)) isEqualTo 0 && {!(_x getVariable ["SEN_noClean", false])}) then {deleteVehicle _x};
} forEach _cleanArray;

{
	if (getposATL _x distance _mrkPos <= _range) then {deleteVehicle _x};
} forEach allDead;