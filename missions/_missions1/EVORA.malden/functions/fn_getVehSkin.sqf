scriptName _fnc_scriptname;

private _veh = param [0,objNull,[objNull]];
private _cfgVeh = configfile >> "CfgVehicles" >> typeOf _veh;

// Get textures
private _textures = [];
private _texturesList = getArray (_cfgVeh >> "textureList");
private _texturesCurrent = (getObjectTextures _veh) apply {toLower _x};
{
	if ("" != getText (_x >> "displayName")) then {
		private _texturesConfig = (getarray (_x >> "textures")) apply {toLower _x};
		private _selected = true;
		
		if (count _texturesCurrent > count _texturesConfig) then {
			{
				if (_x find (_texturesCurrent select _forEachIndex) < 0) exitWith {_selected = false};
			} forEach _texturesConfig;
		} else {
			{
				if ((_texturesConfig select _forEachIndex) find _x < 0) exitWith {_selected = false};
			} forEach _texturesCurrent;
		};
		
		if (_selected) exitWith {
			private _texture = configName _x;
			private _index = _texturesList find _texture;
			if ((_index < 0) or {_texturesList select (_index+1) == 0}) then {_textures = [_texture,1];};
		};
	};
} foreach configProperties [_cfgVeh >> "textureSources","isClass _x"];

// Get animations
private _animations = [];
private _animationsList = getArray (_cfgVeh >> "animationList");
{
	if (("" != getText (_x >> "displayName")) and {!isNumber (_x >> "scope")}) then {
		private _animation = configname _x;
		private _index = _animationsList find _animation;
		private _phase = _veh animationPhase _animation;
		if (((_index < 0) or {_animationsList select (_index+1) == 1-_phase}) and {_phase != getNumber (_x >> "initPhase")}) then {_animations append [_animation,_phase];};
	};
} foreach configProperties [_cfgVeh >> "animationSources","isClass _x"];

[_textures,_animations];