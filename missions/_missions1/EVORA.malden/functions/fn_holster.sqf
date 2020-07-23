scriptName "EVOR_fnc_holster";
if (!hasInterface) exitWith {};

private _mainIdd = 46;

waituntil {!isnull (finddisplay _mainIdd)};
(findDisplay _mainIdd) displayAddEventHandler [
	"KeyUp",
	{
		if ((_this select 1) in actionKeys "User2") then {
			if (isNull objectParent player) then {
				player action ["SwitchWeapon",player,player,[100,0] select (currentWeapon player == "")];
			};
		};
		false
	}
];