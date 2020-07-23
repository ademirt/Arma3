#include"CFG.sqf";

CRS_AT=compileFinal preprocessFile"CRS\f\AT.sqf";
CRS_BB=compileFinal preprocessFile"CRS\f\BB.sqf";
CRS_BBlasted=compileFinal preprocessFile"CRS\f\BBlasted.sqf";
CRS_FB=compileFinal preprocessFile"CRS\f\FB.sqf";
CRS_Flashed=compileFinal preprocessFile"CRS\f\flashed.sqf";
CRS_Holster=compileFinal preprocessFile"CRS\f\holster.sqf";

if(isClass(configFile>>"cfgPatches">>"ace_common"))exitWith{};
sleep 6;
execVM"CRS\f\CRS.sqf";