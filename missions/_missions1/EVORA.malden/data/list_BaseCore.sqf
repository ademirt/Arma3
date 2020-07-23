/*
	Defines list of bases
	Must be adjusted for each map

	Example: ["baseMarker",baseRadius,teleportObject,[supplySpawn,vehSpawn,boatSpawn,heliSpawn,jetSpawn],attackFlags];
		- xSpawn must be a non-null object or an array containing non-null objects to enable shop.
		- attackFlags handles types of attack on this base (can only happen on first base in list)
			* 0 - No base attacks happen
			* 1 - Mortar attacks (only set this when there is land closer than 2500 m)
			* 2 - Infantry attacks (only set this when base is connected to mainland)
			* 4 - Motorized attacks (only set this when base is connected to mainland)
			* 8 - Naval attacks (only set this when base has a shore!)
*/

// NEEDS TO BE FIXED

[
	["base0",200,base0_teleport,[base0_supply,objNull,base0_boat,[base0_heli0,base0_heli1],base0_jet],0],
	["base3",000,base3_teleport,[objNull,objNull,objNull,objNull,objNull],0],
	["base1",100,base1_teleport,[base1_supply,base1_veh,[base1_boat0,base1_boat1],objNull,objNull],0],
	["base2",100,base2_teleport,[base2_supply,base2_veh,[base2_boat0,base2_boat1],objNull,objNull],0]
];