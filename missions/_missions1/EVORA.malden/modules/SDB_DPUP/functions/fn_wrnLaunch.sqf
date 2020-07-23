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

// Display launch icons
addMissionEventHandler [
	"Draw3D",
	{
		private _veh = cameraOn;
		private _time = time;
		private _dur = getNumber (missionConfigFile >> "DPUP" >> "wrnDuration");
		private _incoming = (_veh getVariable ["DPUP_var_ListIncoming",[]]) select {_time - (_x select 2) < _dur};
		_veh setVariable ["DPUP_var_ListIncoming",_incoming,false];
		
		if (_incoming isEqualTo []) then {
			removeMissionEventHandler ["Draw3D",_thisEventHandler];
		} else {
			private _icon = "\a3\ui_f\data\IGUI\Cfg\Targeting\MarkedTarget_ca.paa";
			private _font = "TahomaB";
			private _align = "center";
			{drawIcon3D [_icon,[1,1,1,1-(_time - (_x select 2))/_dur],_x select 1,2,2,0,"M",0,0.03,_font,_align,true];} forEach _incoming;
		};
	}
];

// Play sound
[] spawn DPUP_fnc_wrnSound;