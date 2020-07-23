if(currentChannel!=2)exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player)then{
if(leader(group(vehicle player))!=player)exitWith{2 enableChannel false;setCurrentChannel 5;titleText["You are not the group leader","PLAIN DOWN"];titleFadeOut 5;};
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
private _nearPC=[];
{if((alive _x)&&(leader(group(vehicle _x))==_x)&&(player distance _x<=r_LRmax))then{if((side _x==side player)||(_x isKindOf r_PS))then{_nearPC pushBack _x;};};
}forEach allPlayers-[player];
if(count _nearPC>0)then{
2 enableChannel r_cCH;
{_x remoteExec["r_Hush",_x];}forEach _nearPC;}else{2 enableChannel false;};
private _nearPC=[];hintSilent"";playSound"out1";}else{2 enableChannel false;};
{if(_x isKindOf"Land_PortableLongRangeRadio_F")then{deleteVehicle _x;};}forEach attachedObjects player+attachedObjects objectParent player;}else{2 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpCout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpCin];
kpCin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkCommand"">0))then{call C_In;};"];