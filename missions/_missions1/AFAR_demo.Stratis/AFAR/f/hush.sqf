playSound"out1";
private _ATOBJ=attachedObjects player;private _ATOBJ2=attachedObjects objectParent player;_ATOBJ append _ATOBJ2;
{if(_x isKindOf"Land_HelipadEmpty_F")then{deleteVehicle _x;};}forEach _ATOBJ;