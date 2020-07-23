/*
Author:
Nicholas Clark (SENSEI)

Description:
init order not guaranteed
__________________________________________________________________*/
EAST setFriend [CIVILIAN, 1];
WEST setFriend [CIVILIAN, 1];
INDEPENDENT setFriend [CIVILIAN, 1];

setTimeMultiplier 4.5; //timer

[] execVM "dano.sqf"
