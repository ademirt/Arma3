scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

waitUntil {(!isNull player) and {!isNil "EVOR_var_ObjNumber"}};

// Fix actions
player createDiaryRecord ["Diary",["Service & Triage",
"
Service<br />
Vehicles can be serviced at a base or at appropriate trucks/containers. 
Servicing at base repairs, rearms and refuels a vehicle completely while servicing at a truck or container does only one of those.
A gravely damaged vehicle can also be repaired in the field. This takes time and consumes a tool-kit from either the vehicle's or soldier's inventory.
Performing a field service only repair the vehicle to a working state, a full repair needs to be done at base or at a repair vehicle.
<br />
<br />
Triage<br />
Injured soldiers can be patched up in the field using a FAK the usual way. 
It is also possible to completely heal a wounded soldier by performing triage. 
This process takes some time and is risky to perform without cover. 
Both the standard treatment and triage consume a FAK.
"
]];

// Support network
player createDiaryRecord ["Diary",["Support Network",
format ["
The Support Network is the main interface during your mission, but can only be accessed from one of our bases. 
The interface gives access to various sections which are explained below:
<br />
<br />
Fast Travel<br />
This menu allows you to teleport from one base to another. When a new base is acquired, you can also travel there. 
You can perform HALO-jumps to your squad leader if available. 
Depending on the mission parameters, you may have to capture an airfield before HALO becomes possible. 
It does not matter whether your squad leader is a player, but a parachute is always required for a HALO-jump.
<br />
<br />
Arsenal<br />
Weapons and equipment can be purchased in the this menu. 
Purchased equipment will be added to the virtual arsenal boxes that are present in our bases. 
Each piece of equipment has an indication of which DLC it was last affected by. 
This means that some weapons that aren't actually DLC-restriced have a DLC logo, while every DLC-restricted item has the correct logo.
<br />
<br />
Motorpool<br />
The motorpool allows you to purchase different types of vehicles. 
Which kind of vehicles is available in which base is detailed in the facilities tab of the briefing. 
The motorpool does not allow you to purchase vehicles when their spawning spot is occupied. 
Please remove your vehicle from the spawning spot ASAP after you purchase it.
<br />
<br />
Barracks<br />
It is possible to recruit soldiers from the barracks at any base. 
You will start out with only a small selection of units. Purchasing weapons will unlock soldiers carrying these weapons. 
There are many tactics involving recruited units, so using them wisely could be a significant force-multiplier! 
You may only have %1 mercenaries recruited at any given time.
<br />
<br />
Fund Management<br />
Giving funds to other players is done through this menu. Select a name and an amount and click transfer to do so.
This menu also displays the various sources of funds during the mission.
<br />
<br />
Mission Settings<br />
The mission settings allows you to change the view distances, terrain detail and the 3D marker settings during the mission. 
Turning off the 3D player markers or lowering their range may improve performance, but increases the likelyhood of friendly fire. 
The server forces view distances so these cannot be changed in your game's video options. 
Setting the terrain to low disables grass, which significantly improves performance but makes the game look quite ugly. 
An FPS counter is also present in this menu to show what effects your changes have.
",EVOR_var_MaxUnits]
]];

// Facilities
private _bases = [] call (compileFinal preprocessFileLineNumbers "data\list_BaseCore.sqf");

private _getBaseSpawns = {
	private _spawns = [""];
	{
		private _spawn = _this select 3 select _forEachIndex;
		if (((_spawn isEqualType objNull) and {!isNull _spawn}) or {(_spawn isEqualType []) and {{!isNull _x} count _spawn > 0}}) then {_spawns pushBack _x};
	} forEach ["Supplies","Motorized","Naval","Rotary Wing","Fixed-Wing"];
	_spawns = _spawns joinString "<br />    - ";
	_spawns
};

private _getBaseAttacks = {
	private _attacks = ["air strikes"];
	{
		if ([_this select 4,2^_forEachIndex] call BIS_fnc_bitflagsCheck) then {_attacks pushBack _x};
	} forEach ["artillery barrages","infantry assaults","motorized attacks","amphibious landings"];
	_attacks = _attacks joinString ", ";
	_attacks;
};

private _getBaseDetails = {
	private _mark = _this select 0;
	private _name = markerText _mark;
	private _pos = mapGridPosition markerPos _mark;
	private _spawns = _this call _getBaseSpawns;
	private _attacks = _this call _getBaseAttacks;
	
	[worldName,_mark,_name,_pos,_spawns,_attacks];
};

private _textFacilities = [];

// MOB
_textFacilities pushBack format (["
%3<br />
This facility is our main base on %1 during the mission (grid <marker name='%2'>%4</marker>). 
Arsenal boxes, a medical tent and transport vehicles are available here. 
Defend %3 well, as the enemy will mount %6 against this base. For this purpose, static weapons are scattered throughout the base. 
The following vehicle types can be purchased at this base:%5
"]+((_bases select 0) call _getBaseDetails));

// Camps
private _campCount = -1+count _bases;
if (_campCount > 0) then {
_textFacilities pushBack format ["
Camps<br />
Recently, %2 hidden camps have been constructed on %1 by special operators. 
Arsenal boxes, a medical tent and transport vehicles are available here. 
The following vehicle types can be purchased at each camp:
",worldName,_campCount];

private _textCamps = [];
for "_i" from 1 to _campCount do {
	_textCamps pushBack format (["%3 (grid <marker name='%2'>%4</marker>):%5"]+((_bases select _i) call _getBaseDetails));
};
_textFacilities pushBack (_textCamps joinString "<br />");
};

// FOB
_textFacilities pushBack format ["
Forward Operating Bases<br />
Consider hastening capturing objectives by constructing forward operating bases (FOB) in strategical positions. 
Constructing an FOB is done by buying and driving a construction truck to clear and flat ground, at least %1 meters from the nearest base. 
Vehicles can be serviced at an FOB and supplies and vehicles can be purchased there.<br />
Important: an FOB will allow purchasing and servicing of naval assets when it is constructed close to shore.
",EVOR_var_FOBDistance];

// Airfield
_textFacilities pushBack format ["
Airfields<br />
Airfields allow the acquirement and service of fixed-wing assets. 
An arsenal box and a medical tent are also available here. 
It is also possible to perform HALO-jumps when you have access to an airfield.
"];

player createDiaryRecord ["Diary",["Facilities",_textFacilities joinString "<br /><br />"]];

// Mission
player createDiaryRecord ["Diary",["Mission",
format ["
Objective<br />
In preparation for our attack, enemy regulars have scattered to strategical positions around %1, where they are regrouping with local forces. 
Our intel has identified %2 locations around which these forces are concentrated. 
Clearing these positions thins them out enough to make them abandon %1, completing our mission. 
Striking fast allows us to assault a few positions before the enemy is sufficiently prepared, 
which means that these positions are guarded by local forces only and can be captured easily.
<br />
<br />
Radio Tower<br />
The enemy has constructed a radio tower at each objective. 
This structure allows them to call for reinforcements, air support and attacks on our main base. 
It is necessary to destroy the radio tower when capturing a location, which is only possible using planted explosives. 
<br />
<br />
Airfields<br />
The opportunity to capture an airfield may arise during our mission.
This is done in the same way as normal objectives: destroy the radio tower and clear the location of enemy presence.
Capturing an airfield allows utilizing this facility to deploy fixed-wing assets.
",worldName,EVOR_var_ObjNumber]
]];