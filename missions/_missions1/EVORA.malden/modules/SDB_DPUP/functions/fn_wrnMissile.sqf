scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

params ["_proj","_veh","_ammo","_source"];

private _incoming = _veh getVariable ["DPUP_var_ListIncoming",[]];

// Add launch to list of incoming
if (isNil "_proj") then {
	_proj = nearestObject [_source,_ammo];
	_this set [0,_proj];
	_incoming pushBackUnique [_proj,_source modelToWorldVisual (_source selectionPosition 'Spine3'),time];
	_veh setVariable ['DPUP_var_ListIncoming',_incoming,false];
};

if ((cameraOn != _veh) or {count _incoming > 1}) exitWith {};

// Display missile icons
addMissionEventHandler [
	"Draw3D",
	{
		private _veh = cameraOn;
		
		
		private _incoming = (_veh getVariable ["DPUP_var_ListIncoming",[]]) select {!isNull (_x select 0)};
		_veh setVariable ["DPUP_var_ListIncoming",_incoming,false];
		
		if (_incoming isEqualTo []) then {
			removeMissionEventHandler ["Draw3D",_thisEventHandler];
		} else {
			private _icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\MarkedTarget_ca.paa";
			private _font = "TahomaB";
			private _align = "center";
			{drawIcon3D [_icon,[1,1,1,1],(_x select 0) modelToWorldVisual [0,0,0],2,2,0,format ["M: %1",round ((_x select 0) distance _veh)],0,0.03,_font,_align,true];} forEach _incoming;
		};
	}
];

// Play sound
[] spawn DPUP_fnc_wrnSound;