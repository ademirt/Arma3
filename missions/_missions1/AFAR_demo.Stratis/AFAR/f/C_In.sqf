if(currentChannel!=2)exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player)then{
if(leader(group(vehicle player))!=player)exitWith{2 enableChannel false;setCurrentChannel 5;titleText["You are not the group leader","PLAIN DOWN"];titleFadeOut 5;};
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
private _nearPC=[];
{if((alive _x)&&(leader(group(vehicle _x))==_x))then{if((side _x==side player)||(_x isKindOf r_PS))then{_nearPC pushBack _x;};};}forEach allPlayers-[player];
if(count _nearPC>0)then{private _c=([_nearPC,[],{player distance _x},"ASCEND"]call BIS_fnc_sortBy)select 0;private _d1=player distance _c;
2 enableChannel r_cCH;player call r_alert;
if(_d1<=r_LRmax)then{hintSilent"Transmitting...";playSound"in0";{_x remoteExec["r_Fuzz2",_x];}forEach _nearPC;}else{if(_d1>r_LRmax)then{2 enableChannel false;hintSilent"-----------------------------------------------------";playSound"in2";};
private _c=objNull;private _d1=0;};
private _nearPC=[];}else{2 enableChannel false;hintSilent"-----------------------------------------------------";playSound"in2";};
}else{if(!isAbleToBreathe player)then{5 enableChannel false;};call r_allOff;};
call r_anim;
if(r_3DR)then{if(isNull objectParent player)then{private _r="Land_PortableLongRangeRadio_F"createVehicleLocal[0,0,0];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};};}else{2 enableChannel false;setCurrentChannel 5;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpCout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpCin];
kpCout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkCommand""<2)})then{call cOut;};"];