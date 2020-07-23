/*
Author:
Nicholas Clark (SENSEI)

Description:
mission template included with Dynamic Combat Generator
__________________________________________________________________*/
// disable vanilla saving and unit callouts
enableSaving [false, false];
enableSentences false;
enableRadio false;

[] execVM "bon_recruit_units\init.sqf";
[] execVM "dun.sqf";