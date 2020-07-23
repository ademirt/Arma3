/*
Author: SENSEI

Last modified: 10/3/2015
__________________________________________________________________*/
#define EXIT_TASK(ID) call SEN_fnc_setTask; ["Exit task, %1", ID] call SEN_fnc_log;
#define EXIT_TASKCIV call SEN_fnc_setTaskCiv;

#define GET_DEBUG (SEN_debug isEqualTo 1)
#define GET_HC (!isNil "SEN_HC")
#define GET_SPAWNDIST 500
#define GET_MINDIST 15
#define GET_MAXDIST 50
#define GET_STRENGTH(LOW,HIGH) ((call SEN_fnc_setStrength) max LOW) min HIGH
#define GET_APPROVAL(INDEX) (random 100 <= ((call SEN_fnc_getApproval) select INDEX))
#define GET_TRANSPORTREADY ((missionNameSpace getVariable ["SEN_transportReady",0]) isEqualTo 1)
#define GET_FOBDEPLOYED (!(getMarkerColor "sen_fob_mrk" isEqualTo ""))
#define GET_FOBLOCK (missionNameSpace getVariable ["SEN_fobLock", false])

#define SET_TASK(ID,DESCRIPTION,TEXT,ICON) [WEST,[ID],[DESCRIPTION, TEXT, ""],objNull,false,0,true,ICON,false] call BIS_fnc_taskCreate;
#define SET_TASKWPOS(ID,DESCRIPTION,TEXT,POS,ICON) [WEST,[ID],[DESCRIPTION, TEXT, ""],POS,false,0,true,ICON,false] call BIS_fnc_taskCreate;
#define SET_TASKCIVREBEL ["rebel"] call SEN_fnc_setTaskCiv;
#define SET_TRANSPORTREADY missionNameSpace setVariable ["SEN_transportReady", 1];
#define SET_TRANSPORTNOTREADY missionNameSpace setVariable ["SEN_transportReady", 0];
#define SET_FOBLOCK missionNameSpace setVariable ["SEN_fobLock", true, true];
#define SET_FOBUNLOCK missionNameSpace setVariable ["SEN_fobLock", false, true];
#define SET_SAD(GROUP,TARGET) _wp = GROUP addWaypoint [(leader GROUP) modeltoWorld [0,500,0], 0]; _wp setWaypointType "SAD"; _wp setWaypointSpeed "FULL"; _wp setWaypointCombatMode "RED"; [GROUP,_wp,TARGET] call SEN_fnc_setWaypointPos;