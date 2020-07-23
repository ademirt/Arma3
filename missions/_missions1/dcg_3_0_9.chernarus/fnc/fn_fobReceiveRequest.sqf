/*
Author: SENSEI

Last modified: 9/15/2015

Description:  receive request for FOB control

Return: nothing
__________________________________________________________________*/
private ["_requestor","_time","_id1","_id2"];

_requestor = _this select 0;
_time = time;
SEN_fobResponse = -1;

hintSilent format["%1" + " requests control of FOB construction. Reply via ACE interaction menu.",name _requestor];

_action = ["SEN_FOBRequestAccept","Accept Request","",{SEN_fobResponse = 1},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["SEN_FOBRequestDeny","Deny Request","",{SEN_fobResponse = 0},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","SEN_DCG","SEN_FOB"], _action] call ace_interact_menu_fnc_addActionToObject;

waitUntil {sleep 0.1; !(SEN_fobResponse isEqualTo -1) || time > (_time + 90)};

[player,1,["ACE_SelfActions","SEN_DCG","SEN_FOB","SEN_FOBRequestAccept"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","SEN_DCG","SEN_FOB","SEN_FOBRequestDeny"]] call ace_interact_menu_fnc_removeActionFromObject;

missionNamespace setVariable ["SEN_fobRequest",[_requestor,SEN_fobResponse]];
publicVariableServer "SEN_fobRequest";