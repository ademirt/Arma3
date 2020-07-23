scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _briefing = [
	"The Dynamic Protection Upgrade Package (DPUP) enhances countermeasures in various vehicles.",
	"",
	"Incoming Missile Warning",
	"Most vehicles will get some form of incoming missile warning",
	"The basic warning only tells you from which direction an incoming missile was launched.",
	"The launch warning on vehicle  with thermal capability shows the position of the missile launch for quick return-fire.",
	"The missile warning on vehicles with RWR tracks the actual missile and the direction.",
	"",
	"Hard-Kill APS",
	"The configured tracked vehicles get the Hard-Kill Active Protection System.",
	"This system destroys guided and unguided missiles when they get too close by firing pellets at them.",
	"Each vehicles has a different Hard-Kill setup that covers different angles with different amounts of countermeasures.",
	"Some vehicle have the APS mounted to the hull while others have it on their turret.",
	"The system's pellets can cause serious injuries to nearby infantry: operate with care when being escorded by friendly troops!",
	"",
	"Vehicles with APS:"
];

private _cfgVehicles = configFile >> "CfgVehicles";
private _hkpClasses = ("true" configClasses (missionConfigFile >> "DPUP" >> "CfgVehicles")) apply {configName _x};
private _hkpNames = (_hkpClasses select {isClass (_cfgVehicles >> _x)}) apply {" - "+getText (_cfgVehicles >> _x >> "displayName")};
_briefing append (_hkpNames arrayIntersect _hkpNames);

waitUntil {!isNull player};

player createDiaryRecord ["Diary",["DPUP",_briefing joinString "<br />"]]