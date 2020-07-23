if(currentChannel!=5)exitWith{};
if(playersNumber playerside<2)exitWith{call r_allOff;};
if(!isObjectHidden player&&alive player&&isAbleToBreathe player)then{5 enableChannel r_dCH;if(r_alertOn)then{player call r_alert;};}else{
if(!isAbleToBreathe player)then{titleText["I need a rebreather to talk underwater","PLAIN DOWN"];titleFadeOut 6;};5 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpDout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpDin];
kpDout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<1)&&(inputAction""PushToTalkDirect""<1))then{call dOut;};"];