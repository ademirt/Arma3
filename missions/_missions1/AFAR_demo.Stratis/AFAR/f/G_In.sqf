if(currentChannel!=3)exitWith{};
//systemChat"Talking in Group";
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player)then{
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
private _nearPG=[];
{if((alive _x)&&(group player==group _x))then{_nearPG pushBack _x;};}forEach allPlayers-[player];
if(count _nearPG>0)then{private _c=([_nearPG,[],{player distance _x},"ASCEND"]call BIS_fnc_sortBy)select 0;private _d1=player distance _c;

3 enableChannel r_grCH;if(r_alertOn)then{player call r_alert;};
switch(true)do{
case(_d1<(r_SRmax/1.1)):{hintSilent"Transmitting...";playSound"in1";};
case(_d1>(r_SRmax/1.1)&&{_d1<r_SRmax}):{3 enableChannel false;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";playSound"in1";};
case(_d1>=r_SRmax):{3 enableChannel false;hintSilent"-----------------------------------------------------";playSound"in2";};};
if(_d1>=0&&{_d1<=r_SRmax})then{{_x remoteExec["r_Fuzz",_x];}forEach _nearPG;};
private _c="";private _d1=0;}else{3 enableChannel false;hintSilent"-----------------------------------------------------";playSound"in2";};
private _nearPG=[];}else{if(!isAbleToBreathe player)then{5 enableChannel false;};{_x enableChannel false}count[0,1,2,3,4,(ch7+5),(ch8+5),(ch9+5)];hintSilent"-----------------------------------------------------";playSound"in2";};
call r_anim;
if(r_3DR)then{if(isNull objectParent player)then{private _r="Land_PortableLongRangeRadio_F"createVehicleLocal[0,0,0];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};};}else{3 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpGout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpGin];
kpGout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkGroup""<2)})then{call gOut;}"];

/*Zeus
waitUntil{!(isNull(findDisplay 312))};
(findDisplay 312)displayRemoveEventHandler["KeyUp",zkpGout];
(findDisplay 312)displayRemoveEventHandler["KeyDown",zkpGin];
zkpGout=(findDisplay 312)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkGroup""<2)})then{_this call gOut;}"];