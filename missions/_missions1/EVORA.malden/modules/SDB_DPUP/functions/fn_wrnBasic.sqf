scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

params ["_proj","_veh","_ammo","_source"];

if (cameraOn != _veh) exitWith {};

// Display launch direction
private _layer = "DPUP_wrnBasic";
private _dir = 1 + (11 + round ((_veh getRelDir _source)/30)) mod 12;
private _text = format ["<t color='#ffffff' size='2' align='center'>MISSILE<br/>%1 O'clock</t>",_dir];
_layer cutText [_text,"PLAIN DOWN",0.5,true,true];

// Play sound
[] spawn DPUP_fnc_wrnSound;