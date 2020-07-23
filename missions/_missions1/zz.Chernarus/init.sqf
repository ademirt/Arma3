WEST setFriend [EAST,0];
//Bandits
EAST setFriend [RESISTANCE,0];
EAST setFriend [WEST,0];
//AI Units

RESISTANCE setFriend [EAST,0];

_gp = creategroup east;
_gp setCombatMode "BLUE";
_gp allowFleeing 0;
_gp enableAttack false;
Ryanzombieslimit = 12;
NightStartTime = 18;
NightEndTime = 6;
Ryanzombiesdamagecar = 0.0001;
Ryanzombiesdamagecarstrenth = 0.0001;

zz = compile preprocessFileLineNumbers "z_init.sqf";

for "_i" from 1 to 1 do
{ 
	"RyanZombieC_man_pilot_FslowOpfor" createUnit 
	[
		//getmarkerpos "teste"
		
		[(getmarkerpos "teste" select 0) + random 50 - random 50, (getmarkerpos "teste" select 1) + random 50 - random 50],
		_gp,
		"		
		this disableAI 'FSM';
		this enableAI 'ANIM';
		this disableConversation true;		 
		this setCaptive true;		
		this addRating -2000;
		nul = [this] spawn zz;
		nul = [this] spawn zz;
		",
		0.1		
	];
 
  sleep 0.2;
};
//this domove [(position this select 0) + random 99 - random 99, (position this select 1) + random 99 - random 99];