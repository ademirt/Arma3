params ["_control", "_key", "_shift", "_ctrl", "_alt"];
_handled = false;
if (player getVariable ["inconsciente",false]) exitWith {_handled};
if (player getVariable ["owner",player] != player) exitWith {_handled};
if (_key == 21) then {
	if (_shift) then {
		if (player == stavros) then {
			if (_ctrl) then {
				0 = CreateDialog "com_menu";
			} else {
				[] spawn artySupport;
			};
		};
	} else {
		if (player == stavros) then {
			closedialog 0;
			createDialog "radio_comm_commander";
		} else {
			closedialog 0;
			createDialog "radio_comm_player";
		};
	};
} else {
	if (isMultiplayer) then {
		if (_key == 207) then {
			if (!hayACEhearing) then {
				if (soundVolume <= 0.5) then {
					0.5 fadeSound 1;
					hintSilent "You've taken out your ear plugs.";
				} else {
					0.5 fadeSound 0.1;
					hintSilent "You've inserted your ear plugs.";
				};
			};
		};
	} else {
		if (!hayACEhearing) then {
			if (_key == 207) then {
				0.5 fadeSound 0.1;
				hintSilent "You've inserted your ear plugs.";
			};
			if (_key == 199) then {
				0.5 fadeSound 1;
				hintSilent "You've taken out your ear plugs.";
			};
		};
	};
};

if (server getVariable ["testMode",false]) then {
	if (_key == 76) then {
		if (_ctrl && _shift) then {
			[] spawn teleport;
		};
	};
	if (_key == 80) then {
		if (_ctrl && _shift) then {
			["progress"] remoteExecCall ["fnc_BE_broadcast", 2];
		};
	};
	if (_key == 79) then {
		if (_ctrl && _shift) then {
			["restrictions"] remoteExecCall ["fnc_BE_broadcast", 2];
		};
	};
};
_handled