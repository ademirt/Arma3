// Include shit in here

/*
include map content.
Call compile preprocess'ing them is MUCH better. 
Creating spawn/execvm's IS BAD unless the script is a long running one.
If you try call compile and it all goes to shit, use execvm =P
*/

//[] execVM "a3_custom\build\init.sqf";
call compile preprocessFileLineNumbers "a3_custom\build\init.sqf";
call compile preprocessFileLineNumbers "a3_custom\build\init_outros.sqf";

private _marker2 = createMarker ["vidnodnoye", [600.625,96242528,13874.875]];
_marker2 setMarkerType "loc_Tourism";//"mil_destroy";
_marker2 setMarkerText "Vidnodnoye";