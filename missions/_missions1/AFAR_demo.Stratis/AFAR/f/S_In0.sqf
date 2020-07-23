if(!(currentChannel in[(ch6+5),(ch7+5),(ch8+5)]))exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player&&player getUnitTrait"RTO")then{
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{

private _nearPS=[];
{if(alive _x)then{if(_x getUnitTrait"RTO")then{if((side player==side _x)||(_x isKindOf r_PS))then{_nearPS pushBack _x;};}else{
if((side player==side _x)||(_x isKindOf r_PS))then{
private _rtoSeat=[["driver"],["Turret",[0]],["Turret",[0,0]]];
private _myHorn=currentWeapon(objectParent _x);private _myHorn=(inheritsFrom(configFile>>"CfgWeapons">>_myHorn));private _isHorny=["CarHorn",str _myHorn]call BIS_fnc_inString;
if(!(_isHorny || objectParent _x isKindOf"Ship" || objectParent _x isKindOf"StaticWeapon" || objectParent _x isKindOf"ParachuteBase" || "cargo"in assignedVehicleRole _x))then{
if(assignedVehicleRole _x in _rtoSeat)then{_nearPS pushBack _x;};};};};};
}forEach allPlayers-[player];

player call r_alert;
if(count _nearPS>0)then{private _c=([_nearPS,[],{player distance _x},"ASCEND"]call BIS_fnc_sortBy)select 0;private _d1=player distance _c;
if(_d1>r_LRmax)then{{_x enableChannel false}count[(ch6+5),(ch7+5),(ch8+5)];hintSilent"-----------------------------------------------------";playSound"in2";};
if(_d1<=r_LRmax)then{hintSilent"Transmitting...";playSound"in0";
switch(side player)do{
case WEST:{(ch6+5)enableChannel r_sCH;};
case EAST:{(ch7+5)enableChannel r_sCH;};
case INDEPENDENT:{(ch8+5)enableChannel r_sCH;};
};
{_x remoteExec["r_Fuzz3",_x];}forEach _nearPS;};private _c=objNull;private _d1=0;
}else{{_x enableChannel false;}count[(ch6+5),(ch7+5),(ch8+5)];hintSilent"-----------------------------------------------------";playSound"in2";};

private _nearPS=[];call r_anim;
if(r_3DR)then{if(isNull objectParent player)then{private _r="Land_PortableLongRangeRadio_F"createVehicleLocal[0,0,0];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};};
}else{if(!isAbleToBreathe player)then{5 enableChannel false;};call r_allOff;hintSilent"-----------------------------------------------------";playSound"in2";setCurrentChannel 5;};
}else{call r_allOff;setCurrentChannel 5;};

waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpSout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpSin];
kpSout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkSide""<2)})then{if(player getUnitTrait""RTO"")then{call sOut0;}else{call sOut1;};};"];