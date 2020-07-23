/*
Author: SENSEI

Last modified: 6/25/2015

Description:  adds radios to player inventory

Return: nothing
__________________________________________________________________*/
if !(hasInterface) exitWith {};

if (SEN_acreEnabled) exitWith {
	[] spawn SEN_fnc_setRadioACRE;
};

if (SEN_tfarEnabled) exitWith {
	[] spawn SEN_fnc_setRadioTFAR;
};

hintSilent "Cannot issue radio. You do not have ACRE2 or TFR enabled.";