_unit = _this select 0;
sleep (random 5);

if (isClass(configFile >> "CfgPatches" >> "rhs_main")) then {
_auto = createVehicle ["RHS_MELB_AH6M_H", getpos _unit,[],0,""];
}
else
{ _auto = createVehicle ["I_Heli_light_03_F", getpos _unit,[],0,""]; };