/*
Author: Killzone_Kid

Last modified: 8/17/2015

Description: checks if file exists

Return: boolean
__________________________________________________________________*/
private ["_ctrl", "_fileExists"];
disableSerialization;
_ctrl = findDisplay 0 ctrlCreate ["RscHTML", -1];
_ctrl htmlLoad _this;
_fileExists = ctrlHTMLLoaded _ctrl;
ctrlDelete _ctrl;
_fileExists