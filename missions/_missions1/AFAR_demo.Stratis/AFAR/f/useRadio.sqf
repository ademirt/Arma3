if(alive player&&"ItemRadio"in assignedItems player)then{
player playAction"Gear";
if(leader(group(vehicle player))==player)exitWith{createDialog"AFAR_UI2";ctrlEnable[90909,false];};

if("ItemRadio"in items player)exitWith{createDialog"AFAR_UI2";ctrlEnable[90909,false];};

private _rtoSeat=[["driver"],["Turret",[0]],["Turret",[0,0]]];
private _myHorn=currentWeapon(objectParent player);private _myHorn=(inheritsFrom(configFile>>"CfgWeapons">>_myHorn));private _isHorny=["CarHorn",str _myHorn]call BIS_fnc_inString;
if(!(_isHorny || objectParent player isKindOf"Ship" || objectParent player isKindOf"StaticWeapon" || objectParent player isKindOf"ParachuteBase" || "cargo"in assignedVehicleRole player))then{
if(assignedVehicleRole player in _rtoSeat)exitWith{createDialog"AFAR_UI2";ctrlEnable[90909,false];};};

createDialog"AFAR_UI";ctrlEnable[90909,false];
titleText["Press 'Esc' key to put away radio","PLAIN"];titleFadeOut 5;};