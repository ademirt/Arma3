scriptName "EVOR_fnc_cinematicIntro";
if (!hasInterface) exitWith {};

private _music = param [0,"",[""]];
private _target1 = getMarkerPos "base0";
private _target2 = _target1 vectorAdd [150,-75,75];
private _target3 = player modelToWorldVisual (player selectionPosition "camera");

private _camStart = _target1 vectorAdd [2500,0,200];	// Cam starts east (+X) of base0
_camStart set [0,(_camStart select 0) min worldSize];
while {terrainIntersect [_camStart,_target2]} do {_camStart = _camStart vectorAdd [0,0,25];};

private _rscName1	= "black";
private _rscName2	= "splash";
private _rscName3	= "title";

disableUserInput true;
player allowDamage false;
_rscName1 cutText ["","BLACK",0.001];
0 fadeMusic 1;
playMusic _music;

uiSleep 14.5;	// 14.5 s in music

_rscName2 cutRsc ["EVOR_rsc_splashIntro","PLAIN"];

private _cam = "camera" camCreate _camStart;
_cam camCommand "inertia on";
_cam camPrepareTarget _target1;
_cam camPrepareFOV 2;
_cam cameraEffect ["internal","back"];
_cam camCommitPrepared 0;
waitUntil {camCommitted _cam};	// 14.5 s in music

uiSleep 14;	// 28.5 s in music

_rscName1 cutText ["","BLACK IN",0.5];
_cam camPreparePos _target2;
_cam camPrepareTarget _target1; 
_cam camCommitPrepared 14;

uiSleep 7; // 35.5 s in music

_rscName3 cutRsc ["EVOR_rsc_titleIntro","PLAIN"];

waitUntil {camCommitted _cam};	// 42.5 s in music

_cam camPreparePos (_target3 vectorAdd [0,-5,1]);
_cam camPrepareTarget _target3;
_cam camPrepareFOV 0.7;
_cam camCommitPrepared 7;
waitUntil {camCommitted _cam};	// 49.5 s in music

_cam camPreparePos _target3;
_cam camPrepareTarget (_target3 vectorAdd [0,2,0]);
_cam camCommitPrepared 5;
waitUntil {camCommitted _cam};	// 54.5 s in music

_rscName1 cutText ["","BLACK OUT",1];
uiSleep 1.5;	// 56 s in music
_cam cameraEffect ["terminate","back"];

disableUserInput false;
player allowDamage true;

uiSleep 0.5;	// 56.5 s in music
_rscName1 cutText ["","BLACK IN",1];