private _unitAi = _this select 0;
/*
private _veiculo = switch (toLower(worldName)) do {
    case "takistan": { "CUP_B_HMMWV_M2_GPK_USA" };
	default {"I_C_Offroad_02_LMG_F"};
	
};*/

private _posAI = position _unitAi;
private _lz = "Land_HelipadEmpty_F" createVehicle _posAI;
private _posLz = position _lz;

sleep 3;
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
  
  
  sleep 15;
  [West, "HQ"] sideChat "Request vehicle confirmed!!!";
  sleep 6;
  [West, "HQ"] sideChat "Dispatching heavy airborne resupply to marked position.";
  sleep 5;
  [West, "HQ"] sideChat _chatter;
  
  sleep 30;

  //tipo de veiculo requisitado....
  private _veiculo = ["B_LSV_01_armed_F","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F"] call BIS_fnc_selectRandom;
  
  
  //hint str ((position _object) distance (position player));
  
  //private _randomPosAroundPlayer = [[[_posAI, 3800]],[]] call BIS_fnc_randomPos;
  private _origin = [_posLz, 2500, floor random 360] call BIS_fnc_relPos;
  private _originActual = [_origin, 5, floor random 360] call BIS_fnc_relPos;
  private _originCargo = [_origin, 5, floor random 360] call BIS_fnc_relPos;

  private _unit = [_origin, 280, "I_Heli_Transport_02_F", side player] call BIS_fnc_spawnVehicle;
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

  private _wp = _unitGroup addWaypoint [_posLz, 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointCombatMode "GREEN";

  waitUntil {_unitActual distance _posLz < 680};
  
  sleep 1;
  _unitAi forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
  
  _unitActual flyInHeight 65;
  _unitAi forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
  _unitActual move _posLz;
  sleep 0.5;

  _unitActual land "GET IN";
  waitUntil {_unitActual distance _posLz < 30};
  {
	ropeUnwind [_x, 5, 45, true];
  } forEach ropes _unitActual;

  _unitActual land "NONE";

    sleep 3;
	
  {
	_cargo ropeDetach _x;
	ropeDestroy _x;
  } forEach ropes _unitActual;
  _unitActual groupChat "Package dropped at location. Out.";
  
  private _newposcar = getpos _cargo;
  deleteVehicle _cargo;
  

   _unitActual flyInHeight 250;
   private _wp1 = _unitGroup addWaypoint [_origin, 0];   
  _wp1 setWaypointType "MOVE";  
  _wp1 setWaypointCombatMode "GREEN";    
  _unitActual groupChat "In position for delivery. Out.";
  
  _cargo = _veiculo createVehicle _newposcar;
  
  _unitAi doMove _posLz;
  _unitAi moveinDriver _cargo;  
  
  waitUntil {_unitActual distance _posAI > 1200};
  
  {deleteVehicle _x} forEach crew _unitActual;
  deleteVehicle _unitActual;
  deleteVehicle _lz;