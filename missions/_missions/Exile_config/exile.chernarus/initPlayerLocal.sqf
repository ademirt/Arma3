waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
uiSleep 0.1;
if !(isClass (configFile >> "CfgPatches" >> "maa_Uniform")) then {
while {true} do {["Requires MOD Tryk 0.9.5 Fix!"] spawn BIS_fnc_guiMessage; sleep 3;}};
if !(isClass (configFile >> "CfgPatches" >> "CUP_Chernarus_Data")) then {
while {true} do {["Requires MOD CUP Terrains!"] spawn BIS_fnc_guiMessage; sleep 3;}};
if !(isClass (configFile >> "CfgPatches" >> "Ryanzombies")) then {
while {true} do {["Requires MOD Ryan Zombies!"] spawn BIS_fnc_guiMessage; sleep 3;}};
if !(isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
while {true} do {["Requires MOD NiArsenal!"] spawn BIS_fnc_guiMessage; sleep 3;}};

[] execVM "statusIcons\statusIcons.sqf";