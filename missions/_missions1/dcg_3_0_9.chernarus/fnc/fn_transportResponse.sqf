/*
Author: SENSEI

Last modified: 9/20/2015

Description: clientside transport response

Return: nothing
__________________________________________________________________*/
private ["_classname","_size","_pos","_isEmpty"];

_classname = _this select 0;
_size = _this select 1;
hintSilent "Open your map and select a HLZ.";
missionNamespace setVariable ["SEN_transportResponse", nil];

[player,_classname,_size] onMapSingleClick "
	private ['_pos','_isEmpty'];
	hintSilent '';
	if !((_this select 0) getVariable ['SEN_inProgress',false]) then {
		(_this select 0) setVariable ['SEN_inProgress',true];
		if (surfaceIsWater _pos) then {
			hintSilent 'Selected HLZ must be on land.';
			(_this select 0) setVariable ['SEN_inProgress',false];
		} else {
			_isEmpty = _pos isFlatEmpty [(_this select 2), 50, 0.6, (_this select 2), 0, false, (_this select 0)];
			if !(count _isEmpty isEqualTo 0) then {
				_isEmpty set [2,0];
				missionNamespace setVariable ['SEN_transportResponse', _isEmpty];
				publicVariableServer 'SEN_transportResponse';
				onMapSingleClick '';
				hintSilent 'HLZ selected.';
				(_this select 0) setVariable ['SEN_inProgress',false];
			} else {
				hintSilent 'Unsuitable terrain for transport. Select another HLZ.';
				(_this select 0) setVariable ['SEN_inProgress',false];
			};

		};
	};
";

[{
	params ["_args","_id"];
	_args params ["_time"];

	if !(isNil "SEN_transportResponse") exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
	if (diag_tickTime >= _time && {isNil "SEN_transportResponse"}) exitWith {
		[_id] call CBA_fnc_removePerFrameHandler;
		hintSilent "Transport request canceled.";
		player setVariable ['SEN_inProgress',false];
		missionNamespace setVariable ['SEN_transportResponse', []];
		publicVariableServer 'SEN_transportResponse';
		onMapSingleClick "";
	};
}, 1, [diag_tickTime + 90]] call CBA_fnc_addPerFrameHandler;