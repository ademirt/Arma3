/*
Author: SENSEI

Last modified: 9/19/2015

Description: logs message to RPT

Return: nothing
__________________________________________________________________*/
#include "..\data\define.hpp"

diag_log text ("SEN_LOG: " + (format _this));

if (GET_DEBUG) then {
	if (isDedicated) then {
		("SEN_LOG: " + (format _this)) remoteExecCall ["hintSilent",-2,false];
	} else {
		hintSilent ("SEN_LOG: " + (format _this));
	};
};