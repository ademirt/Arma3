dist = nil;
while {true} do {


_smoke = position player nearObjects ["SmokeShellBlue", 50]; 

_nearTargets = position player nearObjects ["SmokeShellOrange", 300];

{
    dist = player distance _x;	
hint format ["  achou (%1) ",dist];	
	
} forEach _nearTargets;

};

