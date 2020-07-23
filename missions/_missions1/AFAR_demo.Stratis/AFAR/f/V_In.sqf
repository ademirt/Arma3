if(currentChannel!=4)exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;setCurrentChannel 5;};
if("ItemRadio"in assignedItems player&&!isNull objectParent player)then{
if(!isObjectHidden player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
private _nearPV=[];
{if((alive _x)&&{(_x in crew vehicle player)})then{_nearPV pushBack _x;};}forEach allPlayers-[player];
if(count _nearPV>0)then{4 enableChannel r_vCH;hintSilent"Transmitting...";playSound "in1";{_x remoteExec["r_Fuzz",_x];}forEach _nearPV;};private _nearPV=[];}else{
if(!isAbleToBreathe player)then{5 enableChannel false;};4 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};}else{
{_x enableChannel false}count r_CH;setCurrentChannel 5;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpVout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpVin];
kpVout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkVehicle""<2)})then{call vOut;}"];