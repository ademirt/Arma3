scriptName "EVOR_fnc_objCreate";
if (!isServer) exitWith {};

private _objIndex	= EVOR_list_ObjectiveQueue findIf {!(_x select 5)};
if (_objIndex < 0) exitWith {};
private _objActive	= EVOR_list_ObjectiveQueue select _objIndex;
private _objName	= _objActive select 0;
private _objPos		= _objActive select 1;
private _objRadius	= _objActive select 2;
private _objFlags	= _objActive select 3;
private _objDiff	= _objActive select 4;

// Create marker
private _objMarker = createMarker [format ["objective_%1",_objName],_objPos];
_objMarker setMarkerShape "ELLIPSE";
_objMarker setMarkerSize [_objRadius,_objRadius];
_objMarker setMarkerBrush "SolidBorder";
_objMarker setMarkerColor ([EVOR_var_SideEnemy,true] call BIS_fnc_sideColor);
_objMarker setMarkerAlpha 0.5;

// Create attack task
private _taskName = if ([_objFlags,1] call BIS_fnc_bitflagsCheck) then {_objName + " Airfield"} else {_objName};
[
	EVOR_var_SideFriendly,
	"task_"+_objName,
	[
		format ["Find and destroy the radio tower in %1 to prevent the enemy from calling in reinforcements, then clear the town from remaining opposition.",_taskName],
		"Capture "+_taskName,
		_taskName
	],_objPos,"Assigned",1,true,"Attack",true
] call BIS_fnc_taskCreate;

// First delete pre-existing radio towers and remove the RT message from JIP list to avoid confusion
{hideObjectGlobal _x;} forEach (nearestObjects [_objPos,["Land_TTowerSmall_1_F","Land_TTowerSmall_2_F",EVOR_var_ObjRTType],_objRadius+500]);
remoteExecCall ["","JIP_ObjRT"]; 

// Then create the radio tower objective
private _objRT = createVehicle [EVOR_var_ObjRTType,[_objPos,[0.2*_objRadius,0.6*_objRadius],360,0,5] call EVOR_fnc_findRandPos,[],0,"NONE"];
_objRT setVectorUp [0,0,1];
_objRT addEventHandler [
	"HandleDamage",{
		params ["_target","_selection","_damage","_source","_proj"];
		if  (_proj isKindOf ["PipeBombBase",configFile >> "CfgAmmo"]) then {
			if (_damage >= 1) then {
				[
					[EVOR_var_SideFriendly,"HQ"],
					format ["Well done! %1 has taken down the enemy's radio tower, preventing them from calling in further reinforcements!",[name _source,"Somebody"] select isNull _source]
				] remoteExecCall ["sideChat",EVOR_var_SideFriendly,false];
				if (isMultiplayer and {!isNull _source}) then {_source addScore EVOR_var_ScoreObjRT;};
				
				_target removeAllEventHandlers "HandleDamage";
			};
			_damage
		} else {0};
	}
];

// Set global objective state (for use in main gui)
missionNamespace setVariable ["EVOR_var_ObjState",[_objIndex+1,count EVOR_list_ObjectiveQueue,_taskName,_objRT],true];

[_objActive,_objRT] spawn EVOR_fnc_objPopulate; 
[_objActive,_objRT] spawn EVOR_fnc_objCheck;