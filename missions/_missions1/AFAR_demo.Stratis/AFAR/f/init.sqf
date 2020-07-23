r_WS=getNumber(configFile>>"CfgWorlds">>worldName>>"mapSize");
r_PS="";

call r_allOn;setCurrentChannel 5;

//If player drops his radio, disable his radio channels
player addEventHandler["Put",{
if(_this select 2=="ItemRadio")then{if("ItemRadio"in assignedItems player)exitWith{};call r_allOff;{if(_x isKindOf"Land_HelipadEmpty_F")then{deleteVehicle _x;};}forEach attachedObjects player+attachedObjects objectParent player;};
}];

player addEventHandler["Take",{if(_this select 2=="ItemRadio")then{if(alive player&&damage player!=1)then{call r_allOn;};};}];


//Adds inputAction EH to call In and Out functions upon keyPress/keyRelease
waitUntil{!(isNull(findDisplay 46))};
//When player enters Zeus mode, add keyDown eventHandler	TODO: Remove this EH on activation and add a Zeus keyDown EH
/*zkpOn=(findDisplay 46)displayAddEventHandler["KeyDown",{if(isNull(getAssignedCuratorLogic player))exitWith{};
if(inputAction"CuratorInterface">0)then{systemChat"Curator interface has opened";player spawn r_initZ;};
false
}];*/

blockVON=(findDisplay 46)displayAddEventHandler["KeyDown",{call r_noVON}];
kpCin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkCommand"">0))then{call C_In;};"];
kpGin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{call G_In;};"];
kpVin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkVehicle"">0))then{call V_In;};"];
kpDin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkDirect"">0))then{call D_In;};"];
kpSin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkSide"">0))then{if(player getUnitTrait""RTO"")then{call S_In0;}else{call S_In1;};};"];

kpCout=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
kpGout=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
kpVout=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
kpDout=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];
kpSout=(findDisplay 46)displayAddEventHandler["KeyUp","if(inputAction""CopyVersion"">2)then{};"];

//Adds inputAction EH to call radio interface function
r_myRadio=(findDisplay 46)displayAddEventHandler["KeyDown","if(inputAction""Diary"">0)then{call r_useRadio;};"];

//Adds getIn/Out EH to keep radio/static attached to player
player addEventHandler["GetInMan",{private _PLR=_this select 0;_r=_this select 2;4 enableChannel r_vCH;
_PLR call r_RTO;
if(!isNull objectParent _PLR)then{
{if(_x isKindOf"Land_PortableLongRangeRadio_F" || _x isKindOf"Land_HelipadEmpty_F")then{detach _x;_x attachTo[vehicle player,[0,0,0.5]];_x setVectorUp[0,-1,0.005];};}forEach attachedObjects _r+attachedObjects _PLR;}else{
{if(_x isKindOf"Land_PortableLongRangeRadio_F" || _x isKindOf"Land_HelipadEmpty_F")then{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];};}forEach attachedObjects _r+attachedObjects _PLR;};}];

player addEventHandler["GetOutMan",{private _PLR=_this select 0;_r=_this select 2;4 enableChannel false;
_PLR call r_RTO;
if(!isNull objectParent _PLR)then{
{if(_x isKindOf"Land_PortableLongRangeRadio_F" || _x isKindOf"Land_HelipadEmpty_F")then{detach _x;_x attachTo[vehicle player,[0,0,0.5]];_x setVectorUp[0,-1,0.005];};}forEach attachedObjects _r+attachedObjects _PLR;}else{
{if(_x isKindOf"Land_PortableLongRangeRadio_F" || _x isKindOf"Land_HelipadEmpty_F")then{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];};}forEach attachedObjects _r+attachedObjects _PLR;};}];



//Disable all VOIP channels and delete radio + static upon death
player addEventHandler["Killed",{private _PLR=_this select 0;call r_allOff;
if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9 radioChannelAdd[player];(ch9+5)enableChannel true;setCurrentChannel(ch9+5);};
{if((_x isKindOf"Land_HelipadEmpty_F")||(_x isKindOf"Land_PortableLongRangeRadio_F"))then{deleteVehicle _x;};}forEach attachedObjects _PLR+attachedObjects objectParent _PLR;hintSilent"";}];

//Reset radio channels upon respawn
player addEventHandler["Respawn",{if(alive player && !isNull player)then{if("Spectator"in getMissionConfigValue"respawnTemplates")then{ch9 radioChannelRemove[player];};call r_allOn;setCurrentChannel 5;};}];

if(actionKeys"diary"isEqualTo[])then{systemChat"Please set a Diary keybind, via the Common controls!";};
if(actionKeys"PushToTalk"isEqualTo[])then{systemChat"Please set a PushToTalk keybind, via the Multiplayer controls!";};
if(!(actionKeys"VoiceOverNet"isEqualTo[]))then{systemChat"Please unbind your VoiceOverNet keybind via Multiplayer controls!";};
//Helpful information / instructions for AFAR
_AFARtxt=format["
<font face='PuristaMedium' size=30 shadow='5' color='#808000'>ADDON-FREE ARMA RADIO</font></size><b/><br/>Created by Phronk<br/>
<font face='PuristaMedium' size=12 color='#8E8E8E'>__________________________________</font></size><br/><br/>
<font face='PuristaMedium' size=20 color='#808000'>RADIO SETUP</font></size><br/>
     0. Use a PUSH TO TALK key to talk via radio<br/><br/>
     1. Open the in-game menu and go into 'Configure/Controls/Multiplayer'<br/><br/>
     2. Set your PUSH TO TALK key<br/><br/>
     3. Unbind your VoiceOverNet keybind!<br/><br/>
     4. Raise VON volume slider in AUDIO settings<br/><br/>
     5. Cycle radio channels via the radio interface (Diary Key)<br/><br/>

<font face='PuristaMedium' size=20 color='#808000'>OPERATING RADIO</font></size><br/>
• PUSH TO TALK key(s) to use radio<br/><br/>
• Radio channels are <font color='#fffaa3'>COMMAND</font>, <font color='#b6f442'>GROUP</font>, <font color='#f4c542'>VEHICLE</font>, and <font color='#768ce0'>SUPPORT</font><br/><br/>
• DIARY key to look at handheld radio interface<br/><br/>
• Radio must be equipped to send/receive transmissions<br/><br/>
• You must be within %1m of squadmate with a radio to talk in <font color='#b6f442'>GROUP</font><br/><br/>
• Squad leaders must be within %2m of another squad leader with a radio to talk in <font color='#fffaa3'>COMMAND</font><br/><br/>
• Radio static intensifies as distance increases between you and the closest receiving player<br/><br/>
• Only squad leaders can communicate via <font color='#fffaa3'>Command channel</font><br/><br/>
• Only squadmates can communicate via <font color='#b6f442'>Group channel</font><br/><br/>
• Only vehicle passengers can communicate via <font color='#f4c542'>Vehicle channel</font><br/><br/>
• Only RTOs can communicate on <font color='#768ce0'>Support channel</font><br/><br/>
• Only pilots, copilots, gunners, and commanders can use <font color='#768ce0'>Support channel</font><br/><br/>
• Everyone in close proximity can communicate via <font color='#ffffff'>Direct channel</font><br/><br/>
• Cannot speak via <font color='#ffffff'>Direct channel</font> while underwater<br/><br/>
• Cannot communicate if dead or underwater without rebreather<br/><br/>
• Cannot communicate via radio if incapacitated<br/><br/>
• Cannot communicate via radio if outside radio range",(round(r_SRmax/1.1)),r_LRmax];
player createDiarySubject["Arma Radio","ArmA Radio"];
player createDiaryRecord["Arma Radio",["Instructions Manual",_AFARtxt]];

//if(!(isNull(getAssignedCuratorLogic player)))then{
systemChat"[AFAR: Initialized]";
/*
sleep 3;
_r_zeus=false;
_r_ents=[0,0,0]nearEntities["Module_F",r_WS];
{if(_x isKindOf"ModuleCurator_F")then{_r_zeus=true;};}forEach _r_ents;
if(_r_zeus)then{if(isNull(getAssignedCuratorLogic player))then{
	waitUntil{sleep 1;(!(isNull(getAssignedCuratorLogic player)))};
	(getAssignedCuratorLogic player)addEventHandler["CuratorObjectRegistered",{true spawn r_initZ}];
}else{
(getAssignedCuratorLogic player)addEventHandler["CuratorObjectRegistered",{true spawn r_initZ}];};