private _PLR=_this;
if(side _PLR==CIVILIAN)exitWith{{_x enableChannel false}count[(ch6+5),(ch7+5),(ch8+5)];{_x radioChannelRemove[_PLR];}forEach[ch6,ch7,ch8];};
if("ItemRadio"in assignedItems _PLR&&_PLR getUnitTrait"RTO")exitWith{
switch(side _PLR)do{
case WEST:{ch6 radioChannelAdd[_PLR];(ch6+5)enableChannel r_sCH;};
case EAST:{ch7 radioChannelAdd[_PLR];(ch7+5)enableChannel r_sCH;};
case INDEPENDENT:{ch8 radioChannelAdd[_PLR];(ch8+5)enableChannel r_sCH;};
};};

private _rtoSeat=[["driver"],["Turret",[0]],["Turret",[0,0]]];
private _myHorn=currentWeapon(objectParent _PLR);private _myHorn=(inheritsFrom(configFile>>"CfgWeapons">>_myHorn));private _isHorny=["CarHorn",str _myHorn]call BIS_fnc_inString;
if(!(_isHorny || objectParent _PLR isKindOf"Ship" || objectParent _PLR isKindOf"StaticWeapon" || objectParent _PLR isKindOf"ParachuteBase" || "cargo"in assignedVehicleRole _PLR))then{
if(assignedVehicleRole _PLR in _rtoSeat)exitWith{
switch(side _PLR)do{
case WEST:{ch6 radioChannelAdd[_PLR];(ch6+5)enableChannel r_sCH;};
case EAST:{ch7 radioChannelAdd[_PLR];(ch7+5)enableChannel r_sCH;};
case INDEPENDENT:{ch8 radioChannelAdd[_PLR];(ch8+5)enableChannel r_sCH;};
};};
}else{{_x enableChannel false}count[(ch6+5),(ch7+5),(ch8+5)];{_x radioChannelRemove[_PLR];}forEach[ch6,ch7,ch8];};
{_x enableChannel false}count[(ch6+5),(ch7+5),(ch8+5)];{_x radioChannelRemove[_PLR];}forEach[ch6,ch7,ch8];