WEST setFriend [EAST,0];
//Bandits
EAST setFriend [RESISTANCE,0];
EAST setFriend [WEST,0];
//AI Units

RESISTANCE setFriend [EAST,0];

zz = compile preprocessFileLineNumbers "z_init.sqf";


gpz = creategroup east;
gpz setCombatMode "BLUE";
gpz allowFleeing 0;
gpz enableAttack false;

Ryanzombieslimit = 12;
NightStartTime = 18;
NightEndTime = 6;
Ryanzombiesdamagecar = 0.0001;
Ryanzombiesdamagecarstrenth = 0.0001;

for "_i" from 1 to 2 do
{ 
	"RyanZombieC_man_w_worker_Fmedium" createUnit 
	[
		//getmarkerpos "teste"
		
		[(getmarkerpos "teste" select 0) + random 50 - random 50, (getmarkerpos "teste" select 1) + random 50 - random 50],
		gpz,
		"		
		this disableAI 'FSM';
		this enableAI 'ANIM';
		this disableConversation true;		 
		this setCaptive true;		
		this addRating -2000;
		nul = [this] spawn zz;
		",
		0.1		
	];
 
  sleep 0.2;
};
/*
 for "_i" from 1 to 1 do
 {   
 

	"RyanZombieC_man_w_worker_Fmedium" createUnit 
	// "RyanZombieC_man_pilot_FslowOpfor" createUnit
	 [
		//getmarkerpos "teste"
		
		 [(getmarkerpos "teste" select 0) + random 10 - random 10, (getmarkerpos "teste" select 1) + random 10 - random 10],
		 gpz,
		 "		
		 this disableAI 'FSM';
		 this enableAI 'ANIM';
		 this disableConversation true;
		 this addRating -2000;
		 this setCaptive true;
		 nul = [this] spawn zz;		 
		 ",
		 0		
	 ];
	
   sleep 6;
 };


for "_i" from 1 to 2 do
{   
 

	//"RyanZombieC_man_w_worker_Fmedium" createUnit 
	"RyanZombieC_man_pilot_FslowOpfor" createUnit
	[
		//getmarkerpos "teste"
		
		[(getmarkerpos "teste" select 0) + random 10 - random 10, (getmarkerpos "teste" select 1) + random 10 - random 10],
		gpz,
		"		
		this disableAI 'FSM';
		this enableAI 'ANIM';
		this disableConversation true;
		this setCaptive true;
		nul = [this] spawn zz;
		",
		0		
	];
	
  sleep 0.7;
};*/

spaw_zombie = {

"RyanZombieC_man_w_worker_Fmedium" createUnit 
	// "RyanZombieC_man_pilot_FslowOpfor" createUnit
	 [
		//getmarkerpos "teste"
		
		 [(getmarkerpos "teste" select 0) + random 10 - random 10, (getmarkerpos "teste" select 1) + random 10 - random 10],
		 gpz,
		 "		
		 this disableAI 'FSM';
		 this enableAI 'ANIM';
		 this disableConversation true;
		 this addRating -2000;
		 this setCaptive true;
		 nul = [this] spawn zz;		 
		 ",
		 0		
	 ];
};

addnpctte = {
	_g = createGroup west;
	_g setCombatMode "RED";
	_u = (group player) createunit ["B_G_Soldier_M_F", [(getmarkerpos "teste" select 0) + random 10 - random 10, (getmarkerpos "teste" select 1) + random 10 - random 10], [], 0, "NONE"];
	[_u] join (group player);
	
	

	//_g allowFleeing 1;
    //_g enableAttack true;
	_marker1 = createMarker [format["mark_0%1",time], getpos _u];
	_marker1 setMarkerType "hd_objective";
	[_u,_marker1] spawn {
	  _a = _this select 0;
	  _mrk = _this select 1;
	  while {alive _a} do { _mrk setmarkerpos getpos _a; sleep 0.3; };
	};
};