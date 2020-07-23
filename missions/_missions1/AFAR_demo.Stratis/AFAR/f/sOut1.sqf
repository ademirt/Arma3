if(!(currentChannel in[(ch6+5),(ch7+5),(ch8+5)]))exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player)then{
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{

private _nearPS=[];
{if(alive _x)then{if("ItemRadio"in items _x)then{if((side player==side _x)||(_x isKindOf r_PS))then{_nearPS pushBack _x;};}else{
if((side player==side _x)||(_x isKindOf r_PS))then{
private _rtoSeat2=[["driver"],["Turret",[0]],["Turret",[0,0]]];
private _myHorn2=currentWeapon(objectParent _x);private _myHorn2=(inheritsFrom(configFile>>"CfgWeapons">>_myHorn2));private _isHorny2=["CarHorn",str _myHorn2]call BIS_fnc_inString;
if(!(_isHorny2 || objectParent _x isKindOf"Ship" || objectParent _x isKindOf"StaticWeapon" || objectParent _x isKindOf"ParachuteBase" || "cargo"in assignedVehicleRole _x))then{
if(assignedVehicleRole _x in _rtoSeat2)then{_nearPS pushBack _x;};};};};};
}forEach allPlayers-[player];

if(count _nearPS>0)then{
switch(side player)do{
case WEST:{(ch6+5)enableChannel r_sCH;};
case EAST:{(ch7+5)enableChannel r_sCH;};
case INDEPENDENT:{(ch8+5)enableChannel r_sCH;};
};
{if(player distance _x<=r_LRmax)then{_x remoteExec["r_Hush",_x];};}forEach _nearPS;}else{{_x enableChannel false}count[(ch6+5),(ch7+5),(ch8+5)];};
hintSilent"";playSound"out1";private _nearPS=[];}else{call r_allOff;hintSilent"-----------------------------------------------------";playSound"in2";setCurrentChannel 5;};
{if(_x isKindOf"Land_PortableLongRangeRadio_F")then{deleteVehicle _x;};}forEach attachedObjects player+attachedObjects objectParent player;}else{call r_allOff;setCurrentChannel 5;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpSout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpSin];
kpSin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkSide"">0))then{if(""ItemRadio""in items player)then{call S_In0;}else{call S_In1;};};"];