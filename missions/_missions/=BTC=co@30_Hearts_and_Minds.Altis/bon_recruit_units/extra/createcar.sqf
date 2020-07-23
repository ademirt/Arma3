private _unitAi = _this select 0;
/*
private _veiculo = switch (toLower(worldName)) do {
    case "takistan": { "CUP_B_HMMWV_M2_GPK_USA" };
	default {"I_C_Offroad_02_LMG_F"};
	
};*/

private _veiculo = ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F"] call BIS_fnc_selectRandom;

sleep (random 4);
_unitAi groupChat "Attention base, delivery request!";
_unitAi groupChat "We need a Hunter HMG now!!";

  private _chatter = [
  "I'll save you a seat. Out.",
  "Enjoy the view. Out.",
  "Altis postal en route. Out.",
  "Package delivery. Out.",
  "Party favors inbound. Out",
  "Zeus was busy, so this hook will have to do. Out.",
  "I'll add it to your tab. Out.",
  "Right away. Out.",
  "On your mark. Out.",
  "Landing this hook on your smoke. Out."
  ] call BIS_fnc_selectRandom;

  private _chatterLanded = [
  "I'm gonna need you to sign for this. How copy?",
  "On your mark. How copy?",
  "Landing this bird on your smoke. How copy?"
  ] call BIS_fnc_selectRandom;
  
  
  sleep (random 6);
  [West, "HQ"] sideChat "Request Hunter HMG confirmed.";
  sleep 1;
  [West, "HQ"] sideChat "Dispatching heavy airborne resupply to marked position.";
  [West, "HQ"] sideChat _chatter;

  
  private _posAI = position _unitAi;
  private _lz = "Land_HelipadEmpty_F" createVehicle _posAI;
  sleep 42;
  //hint str ((position _object) distance (position player));
  
  //private _randomPosAroundPlayer = [[[_posAI, 3800]],[]] call BIS_fnc_randomPos;
  private _origin = [_posAI, 3500, floor random 360] call BIS_fnc_relPos;
  private _originActual = [_origin, 5, floor random 360] call BIS_fnc_relPos;
  private _originCargo = [_origin, 5, floor random 360] call BIS_fnc_relPos;

  private _unit = [_origin, 300, "B_Heli_Transport_03_unarmed_F", side player] call BIS_fnc_spawnVehicle;
  private _unitActual = _unit select 0;
  private _unitGroup = _unit select 2;
  _unitActual groupChat "Transport is feet dry. Out.";

  _unitActual flyInHeight 280;
  private _cargo = _veiculo createVehicle _origin; 
  //private _cargo = createVehicle [_veiculo,_originCargo, [], 0, "NONE"];
  //private _cargo = createVehicle [_veiculo,[0,0,0], [], 5000, "NONE"];
  // ClearItemCargoGlobal _cargo;
  // ClearWeaponCargoGlobal _cargo;
  // ClearMagazineCargoGlobal _cargo;
  // ClearBackpackCargoGlobal _cargo;
  
  _cargo DisableCollisionWith _unitActual;
  _unitActual setSlingLoad _cargo;
  
  _unitActual groupChat "Cargo is feet dry. Out.";
  _unitActual groupChat "Cargo is attached. Out.";

  private _wp = _unitGroup addWaypoint [_posAI, 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointCombatMode "GREEN";

  waitUntil {_unitActual distance _posAI < 600};
  
  sleep 1;
  _unitAi forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
  
  _unitActual flyInHeight 55;
  _unitActual move _posAI;
  sleep 1;

  _unitActual land "GET IN";
  waitUntil {_unitActual distance _posAI < 45};
  {
	ropeUnwind [_x, 5, 45, true];
  } forEach ropes _unitActual;

  _unitActual land "NONE";

    sleep 2;
	
  {
	_cargo ropeDetach _x;
	ropeDestroy _x;
  } forEach ropes _unitActual;
  _unitActual groupChat "Package dropped at location. Out.";


   private _wp1 = _unitGroup addWaypoint [_origin, 0];   
  _wp1 setWaypointType "MOVE";  
  //_wp1 setWaypointCombatMode "BLUE";
  _unitActual flyInHeight 270;
  _unitActual groupChat "In position for delivery. Out.";

  private _newposcar = getpos _cargo;
  deleteVehicle _cargo;
  private _cargo = _veiculo createVehicle _newposcar;
  _unitAi moveinDriver _cargo;
  
  waitUntil {_unitActual distance _posAI > 1000};
  
  {deleteVehicle _x} forEach crew _unitActual;
  deleteVehicle _unitActual;
  deleteVehicle _lz;