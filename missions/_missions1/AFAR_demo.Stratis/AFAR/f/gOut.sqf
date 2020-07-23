if(currentChannel!=3)exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player)then{
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
private _nearPG=[];
{if((alive _x)&&(group player==group _x)&&(player distance _x<=r_SRmax))then{_nearPG pushBack _x;};}forEach allPlayers-[player];
if(count _nearPG>0)then{
3 enableChannel r_grCH;
{_x remoteExec["r_Hush",_x];}forEach _nearPG;}else{3 enableChannel false;};
private _nearPG=[];hintSilent"";playSound"out1";
{if(_x isKindOf"Land_PortableLongRangeRadio_F")then{deleteVehicle _x;};}forEach attachedObjects player+attachedObjects objectParent player;}else{
3 enableChannel false;};}else{3 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpGout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpGin];
kpGin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{call G_In;};"];

//Zeus
/*waitUntil{!(isNull(findDisplay 312))};
(findDisplay 312)DisplayRemoveEventHandler["KeyUp",zkpGout];
(findDisplay 312)DisplayRemoveEventHandler["KeyDown",zkpGin];
zkpGin=(findDisplay 312)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{_this call G_In;};"];