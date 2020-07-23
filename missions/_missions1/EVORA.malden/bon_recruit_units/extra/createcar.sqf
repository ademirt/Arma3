private _unitAi = _this select 0;

private _ve = switch (toLower(worldName)) do {
    case "takistan": { "CUP_B_HMMWV_M2_GPK_USA" };
	default {"B_MRAP_01_hmg_F"};
};

_unitAi addMagazine "SmokeShellGreen";

sleep (random 4);
_unitAi groupChat "Attention base, delivery request!";
_unitAi groupChat "We need a Hunter HMG now!!";

//_type = _this select 4;

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

  private _object = _unitAi;

  sleep 30;
  private _position = position _object;
  //hint str ((position _object) distance (position player));

  private _lz = "Land_HelipadEmpty_F" createVehicle _position;
  sleep 5;
  
  private _origin = [_position, 3000, floor random 360] call BIS_fnc_relPos;
  private _originActual = [_origin, 5, floor random 360] call BIS_fnc_relPos;
  private _originCargo = [_origin, 5, floor random 360] call BIS_fnc_relPos;

  private _unit = [_originActual, 350, "B_Heli_Transport_03_F", side player] call BIS_fnc_spawnVehicle;
  private _unitActual = _unit select 0;
  private _unitGroup = _unit select 2;
  _unitActual groupChat "Transport is feet dry. Out.";

  _unitActual flyInHeight 350;
  private _cargo = _ve createVehicle _originCargo; 
  //private _cargo = createVehicle [_ve,_originCargo, [], 0, "NONE"];
  //private _cargo = createVehicle [_ve,[0,0,0], [], 5000, "NONE"];
  ClearItemCargoGlobal _cargo;
  ClearWeaponCargoGlobal _cargo;
  ClearMagazineCargoGlobal _cargo;
  ClearBackpackCargoGlobal _cargo;
  
  _cargo DisableCollisionWith _unitActual;
  _unitActual setSlingLoad _cargo;
  
  _unitActual groupChat "Cargo is feet dry. Out.";
  _unitActual groupChat "Cargo is attached. Out.";

  private _wp = _unitGroup addWaypoint [_position, 0];
  _wp setWaypointType "MOVE";
  _wp setWaypointCombatMode "GREEN";

  waitUntil {_unitActual distance _position < 500};
  
  sleep (random 3);
  _unitAi forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
  
  _unitActual flyInHeight 48;
  _unitActual move _position;
  sleep 2;

  _unitActual land "GET IN";
  waitUntil {_unitActual distance _position < 40};
  {
	ropeUnwind [_x, 5, 45, true];
  } forEach ropes _unitActual;

  sleep 2;
  _unitActual land "NONE";

  {
	_cargo ropeDetach _x;
	ropeDestroy _x;
  } forEach ropes _unitActual;
  _unitActual groupChat "Package dropped at location. Out.";

  private _wp1 = _unitGroup addWaypoint [_origin, 0];
  _wp1 setWaypointType "MOVE";
  _wp1 setWaypointCombatMode "BLUE";
  _unitActual flyInHeight 150;
  _unitActual groupChat "In position for delivery. Out.";
  _unitAi moveinDriver _cargo;
  
  waitUntil {_unitActual distance _position > 1950};
  
  {deleteVehicle _x} forEach crew _unitActual;
  deleteVehicle _unitActual;
  deleteVehicle _lz;