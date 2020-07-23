/*
Author: SENSEI

Last modified: 9/9/2015

Description:  delete fob

Return: nothing
__________________________________________________________________*/
if (!isServer) exitWith {};

SEN_curatorFOB removeCuratorCameraArea 0;
SEN_curatorFOB removeCuratorEditingArea 0;
SEN_flagFOB setposATL SEN_flagFOB_startPos;
SEN_curatorFOBUnitUID = "";
(owner (getAssignedCuratorUnit SEN_curatorFOB)) publicVariableClient "SEN_curatorFOBUnitUID";
[SEN_curatorFOB] remoteExecCall ["SEN_fnc_fobRemoveEH", owner SEN_curatorFOB, false];
{_x call SEN_fnc_cleanup} forEach (curatorEditableObjects SEN_curatorFOB);

deleteMarker "SEN_fob_mrk";
deleteMarker "SEN_fob_border_mrk";
deleteMarker "SEN_fob_recon_mrk";
unassignCurator SEN_curatorFOB;