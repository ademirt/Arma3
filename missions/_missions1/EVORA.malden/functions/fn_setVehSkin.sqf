scriptName _fnc_scriptname;

private _veh = param [0,objNull,[objNull]];
private _skin = param [1,[false,false],[[]]];

if (!alive _veh) exitWith {};

// Set textures
private _textureMode = _skin param [0,false,[false,"",[]]];

if (!(_textureMode isEqualTo false)) then {
	private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
	private _textureList = switch (typeName _textureMode) do {
		case (typeName true):	{getArray (_cfgVeh >> "textureList")};	// Random texture source from config
		case (typeName []):		{_textureMode};							// Random texture source from array
		case (typeName ""):		{[_textureMode,1]};						// Predetermined texture source
		default {[]};
	};
	
	// Set textures & materials
	if (count _textureList >= 2) then {
		private _cfgTextureSources = _cfgVeh >> "TextureSources";
		
		private _cfgTexture = _cfgTextureSources >> selectRandomWeighted _textureList;
		{_veh setObjectTextureGlobal [_forEachIndex,_x];} forEach getArray(_cfgTexture >> "textures");
		{_veh setObjectMaterialGlobal [_forEachIndex,_x];} forEach getArray(_cfgTexture >> "materials");
	};
};

// Set animations
private _animationMode = _skin param [1,false,[false,"",[]]];

if (!(_animationMode isEqualTo false)) then {
	private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
	private _animationList = switch (typeName _animationMode) do {
		case (typeName true):	{getArray (_cfgVeh >> "animationList")};
		case (typeName []):		{_animationMode};
		case (typeName ""):		{[_animationMode,1]};
	};
	
	if (count _animationList >= 2) then {
		private _cfgAnimationSources = _cfgVeh >> "AnimationSources";
		
		for "_i" from 0 to (count _animationList-1) step 2 do {
			private _cfgAnimation = _cfgAnimationSources >> (_animationList select _i);
			
			private _phase = _animationList select (_i+1);
			_phase = [0,1] select (_phase > random 1);
			
			// Lock cargo slots
			private _lockCargoAnimationPhase = getNumber (_cfgAnimation >> "lockCargoAnimationPhase");
			private _lockCargoSlots = getArray (_cfgAnimation >> "lockCargo");
			{_veh lockCargo [_x,_phase == _lockCargoAnimationPhase];} forEach _lockCargoSlots;
			
			// Set animations
			_veh animate [configName _cfgAnimation,_phase,true];
			
			private _forceAnimatePhase = getNumber (_cfgAnimation >> "forceAnimatePhase");
			private _forceAnimate = getArray (_cfgAnimation >> "forceAnimate");
			if (_phase == _forceAnimatePhase) then {
				for "_j" from 0 to (count _forceAnimate-1) step 2 do {
					_veh animate [_forceAnimate select _j,_forceAnimate select (_j+1),true];
				};
			};
			
			[_veh,_phase] call compile getText (_cfgAnimation >> "onPhaseChanged");
		};
	};
};