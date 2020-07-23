_unit = _this select 0;
sleep (random 25);
_auto = createVehicle ["B_UGV_01_rcws_F", getpos _unit,[],0,""];
createVehicleCrew _auto;