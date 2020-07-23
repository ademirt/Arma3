/*
Author: SENSEI

Last modified: 9/30/2015

Description: add to cleanup handler

Note: does not support nested arrays

Return: nothing
__________________________________________________________________*/
if (typeName _this isEqualTo "ARRAY") exitWith {
	if (typeName (_this select 0) isEqualTo "STRING") then {
		SEN_markerCleanup append _this;
	} else {
		SEN_objectCleanup append _this;
	};
};
if (typeName _this isEqualTo "STRING") exitWith {
	SEN_markerCleanup pushBack _this;
};
if (typeName _this isEqualTo "OBJECT") exitWith {
	SEN_objectCleanup pushBack _this;
};