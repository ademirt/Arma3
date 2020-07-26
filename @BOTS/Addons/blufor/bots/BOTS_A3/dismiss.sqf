private _unit = _this select 0;
_unit action ["eject",vehicle _unit];
sleep 1;
deleteVehicle _unit;
hint format["%1 %2 has been dismissed",getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayname"),name _unit];
