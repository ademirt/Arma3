/*
Author: SENSEI

Last modified: 9/14/2015

Description: debriefing task

Return: nothing
__________________________________________________________________*/
if !(isServer) exitWith {};

#include "..\data\define.hpp"

private ["_taskID","_taskText","_taskDescription"];

_taskID = "debriefing";
_taskText = "Debriefing (Mission Complete)";
_taskDescription = "Return to MOB Dodge and assess the mission outcome.";

SET_TASKWPOS(_taskID,_taskDescription,_taskText,getPosATL SEN_mob_laptop,"Default")
