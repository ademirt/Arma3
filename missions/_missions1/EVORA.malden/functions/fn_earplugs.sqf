scriptName "EVOR_fnc_earplugs";
if (!hasInterface) exitWith {};

private _mainIdd = 46;

waituntil {!isnull (finddisplay _mainIdd)};
(findDisplay _mainIdd) displayAddEventHandler [
	"KeyUp",
	{
		if ((_this select 1) in actionKeys "User1") then {
			if (soundVolume < 1) then {
				hint "Earplugs removed";
				0.5 fadeSound 1;
			} else {
				hint "Earplugs inserted";
				0.5 fadeSound 0.2;
			};
		};
		false
	}
];