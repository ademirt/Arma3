if((!isClass(configFile>>"CfgPatches">>"task_force_radio"))&&{(!isClass(configFile>>"CfgPatches">>"acre_main"))})then{
if(isServer)then{
//if(INDEPENDENT getFriend EAST>0.6)then{};
//if(INDEPENDENT getFriend WEST>0.6)then{};
ch6Name="Support channel";publicVariable"ch6Name";
ch7Name="Support channel";publicVariable"ch7Name";
ch8Name="Support channel";publicVariable"ch8Name";
//ch10Name="Allies channel";publicVariable"ch10Name";
//ch11Name="Allies channel";publicVariable"ch11Name";
//ch10=radioChannelCreate[[0.2,0.2,1,0.8],ch10Name,"(Allies) %UNIT_NAME",[]];publicVariable"ch10";//BLU
//ch11=radioChannelCreate[[1,0.2,0.2,0.8],ch11Name,"(Allies) %UNIT_NAME",[]];publicVariable"ch11";//OPF
ch6=radioChannelCreate[[0.2,0.2,1,0.8],ch6Name,"(Support) %UNIT_NAME",[]];publicVariable"ch6";
ch7=radioChannelCreate[[0.2,1,0.2,0.8],ch7Name,"(Support) %UNIT_NAME",[]];publicVariable"ch7";
ch8=radioChannelCreate[[1,0.2,0.2,0.8],ch8Name,"(Support) %UNIT_NAME",[]];publicVariable"ch8";

addMissionEventHandler["HandleDisconnect",{_me=_this select 0;
{if((_x isKindOf"Land_PortableLongRangeRadio_F")||(_x isKindof"Land_HelipadEmpty_F"))then{deleteVehicle _x;};}forEach attachedObjects _me+attachedObjects objectParent _me;}];

if("Spectator"in getMissionConfigValue"respawnTemplates")then{
ch9Name="Spectator channel";publicVariable"ch9Name";
ch9=radioChannelCreate[[0.2,1,1,0.8],ch9Name,"(Spectator) %UNIT_NAME",[]];publicVariable"ch9";
	};
};
if(!isDedicated)then{{_x enableChannel false}count[0,1,2,3,4,6,7,8,9];setCurrentChannel 5;waitUntil{!isNull player};waitUntil{player==player};};
sleep 3;
#include"CFG.sqf"
sleep 3;
if(!isDedicated && hasInterface && isMultiplayer)then{
waitUntil{!isObjectHidden player&&alive player};
r_noVON=compileFinal preprocessFileLineNumbers"AFAR\f\noVON.sqf";
r_allOn=compileFinal preprocessFileLineNumbers"AFAR\f\allOn.sqf";
r_allOff=compileFinal preprocessFileLineNumbers"AFAR\f\allOff.sqf";
r_RTO=compileFinal preprocessFileLineNumbers"AFAR\f\RTO.sqf";
//r_initZ=compileFinal preprocessFileLineNumbers"AFAR\f\initZ.sqf";
r_alert=compileFinal preprocessFileLineNumbers"AFAR\f\alert.sqf";
r_Fuzz=compileFinal preprocessFileLineNumbers"AFAR\f\fuzz.sqf";
r_Fuzz2=compileFinal preprocessFileLineNumbers"AFAR\f\fuzz2.sqf";
r_Fuzz3=compileFinal preprocessFileLineNumbers"AFAR\f\fuzz3.sqf";
r_Hush=compileFinal preprocessFileLineNumbers"AFAR\f\hush.sqf";
r_anim=compileFinal preprocessFileLineNumbers"AFAR\f\anim.sqf";
C_In=compileFinal preprocessFileLineNumbers"AFAR\f\C_In.sqf";
D_In=compileFinal preprocessFileLineNumbers"AFAR\f\D_In.sqf";
G_In=compileFinal preprocessFileLineNumbers"AFAR\f\G_In.sqf";
S_In0=compileFinal preprocessFileLineNumbers"AFAR\f\S_In0.sqf";
S_In1=compileFinal preprocessFileLineNumbers"AFAR\f\S_In1.sqf";
V_In=compileFinal preprocessFileLineNumbers"AFAR\f\V_In.sqf";
cOut=compileFinal preprocessFileLineNumbers"AFAR\f\cOut.sqf";
dOut=compileFinal preprocessFileLineNumbers"AFAR\f\dOut.sqf";
gOut=compileFinal preprocessFileLineNumbers"AFAR\f\gOut.sqf";
sOut0=compileFinal preprocessFileLineNumbers"AFAR\f\sOut0.sqf";
sOut1=compileFinal preprocessFileLineNumbers"AFAR\f\sOut1.sqf";
vOut=compileFinal preprocessFileLineNumbers"AFAR\f\vOut.sqf";
nextCH=compileFinal preprocessFileLineNumbers"AFAR\f\nextCH.sqf";
prevCH=compileFinal preprocessFileLineNumbers"AFAR\f\prevCH.sqf";
r_useRadio=compileFinal preprocessFileLineNumbers"AFAR\f\useRadio.sqf";
execVM"AFAR\f\init.sqf";};};