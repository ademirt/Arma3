scriptName _fnc_scriptName;
if ((!hasInterface) or {!EVOR_var_Mark3DAllowed}) exitWith {};

private _enabled		= param [0,true,[false]];
EVOR_var_Mark3DRange	= missionNamespace getVariable ["EVOR_var_Mark3DRange",2000];
EVOR_var_Mark3DColor	= missionNamespace getVariable ["EVOR_var_Mark3DColor",[playerSide,false] call BIS_fnc_sideColor];
EVOR_var_Mark3DArray	= [];

if (_enabled) then {
	// Draw 3D markers
	EVOR_var_Mark3DEH = addMissionEventHandler [
		"Draw3D",{
			private _cursor = cursorTarget;
			{
				drawIcon3D [
					"a3\ui_f\data\igui\cfg\cursors\select_ca.paa",
					EVOR_var_Mark3DColor,
					_x modelToWorldVisual (_x selectionPosition "Spine3"),
					0.5,
					0.5,
					0,
					["",name _x] select ((_cursor isEqualTo _x) and {!unitIsUav _x}),
					0,
					0.025
				];
				false;
			} count EVOR_var_Mark3DArray;
		}
	];
	
	// Recalculate which 3D markers to draw
	EVOR_var_Mark3DHandle = [] spawn {
		scriptName "EVOR_fnc_mark3Dloop";
		private ["_camPos","_array"];
		while {true} do {
			_camPos = positionCameraToWorld [0,0,0];
			_array = (allPlayers apply {vehicle _x}) + allUnitsUAV;
			_array = _array arrayIntersect _array;
			
			EVOR_var_Mark3DArray = _array select {
				(playerside isEqualTo side group _x)
				and {(_camPos distance2D _x < EVOR_var_Mark3DRange)
				and {(!(cameraOn isEqualTo _x))}}
			};
			
			uiSleep 2;
		};
	};
} else {
	if (!isNil "EVOR_var_Mark3DEH") then {removeMissionEventHandler ["Draw3D",EVOR_var_Mark3DEH]; EVOR_var_Mark3DEH = nil;};
	if ((!isNil "EVOR_var_Mark3DHandle") and {!isNull EVOR_var_Mark3DHandle}) then {terminate EVOR_var_Mark3DHandle; EVOR_var_Mark3DHandle = nil;};
};