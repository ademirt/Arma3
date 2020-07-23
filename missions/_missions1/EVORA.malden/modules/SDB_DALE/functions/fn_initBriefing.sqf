scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _briefing = [
	"The Dynamic Aircraft Loadout Editor (DALE) brings BIS' loadout editor into the game.",
	"You can edit the aircraft's pylons when it is at a proper service position.",
	"It is possible to select preset loadouts made by BIS or create your own custom loadout.",
	"It is also possible to set the priority of your pylons.",
	"Single means that for a weapon one pylon is firing at the time, double means that two mirrored pylons fire at the same time and burst means that all pylons of the same kind fire simultaneously.",
	"<br />",
	"Rearming or servicing is required after changing your loadout!"
];


waitUntil {!isNull player};

player createDiaryRecord ["Diary",["DALE",_briefing joinString "<br />"]]