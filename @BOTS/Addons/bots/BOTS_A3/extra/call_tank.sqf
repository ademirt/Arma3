private _unC = _this select 0;
private _posUn = (getPosWorld _unC);		   

sleep 3;
_unC playMove "Acts_listeningToRadio_In";

sleep 2;
_unC groupChat "Papa Novembro 1 , Papa Novembro 1 , aqui é Papa Novembro 9. Câmbio!"; 

sleep 3;
_unC playMove "Acts_listeningToRadio_Loop";

_unC groupChat "Solicito solicito pacote, rápido!!!  Câmbio!"; 

sleep 3;
_unC groupChat "Segue dados de localização....  Câmbio!"; 

sleep 3;
_unC playMove "Acts_listeningToRadio_Loop";

sleep 1;
_unC playMove "Acts_listeningToRadio_Out";


//////////////////////////////////////////////////////////
sleep (18 + random 15);
//////////////////////////////////////////////////////////

private _ba = side player;

[_ba, "HQ"] sideChat "Aqui é Papa Novembro 1,  Ok, entendemos sua solicitação. Câmbio!"; sleep 5;		   
[_ba, "HQ"] sideChat "Solicitando sua ordem com o centro de logística. Câmbio!"; sleep 3;
sleep 25;
[_ba, "HQ"] sideChat "Papa Novembro 9, centro de logística confirmou o despacho. Câmbio!"; sleep 5;
[_ba, "HQ"] sideChat "Papa Novembro 9, pacote a caminho aguarde entrega! Câmbio!"; sleep 3;

sleep 65;
[_ba, "HQ"] sideChat "Papa Novembro 9,  despachando sua carga!!!  Câmbio desligo!";
sleep 15;

[_unC] spawn {  
     private _unt = _this select 0;
	 private _pos = (getPosWorld _unt); 
		 
	 private _prqd = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, 'FLY']; 
	 _prqd setPos [(_pos select 0) + random 100 ,(_pos select 1) + 55 ,560]; 
	 
	 private _tank = (["I_MBT_03_cannon_F","I_LT_01_cannon_F","I_LT_01_AT_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F"] call BIS_fnc_selectRandom) createVehicle [0,0,0];  
	 _tank allowdamage false; 
	 
	 _tank attachTo [_prqd, [0, 0, -1.3]]; 
	 _tank setDir random 360;
	 
	 _unt forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
	 _unt forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
	 
	 //IRStrobe 
	 private _irStr = "NVG_TargetC" createVehicle [0,0,0]; 
	 _irStr attachTo [_tank,[0,0,2],""]; //0,0,2 
	 
	 waitUntil {getPos _tank select 2 < 430};
	 //SmokeShellRed 
	 private _smkA = "SmokeShell" createVehicle [0,0,0]; 
	 _smkA attachTo [_prqd,[0,0,31],""];
	 
	 waitUntil {getPos _tank select 2 < 280};
	 //SmokeShellBlue 
	 private _smkB = "SmokeShell" createVehicle [0,0,0]; 
	 _smkB attachTo [_prqd,[0,4,31],""]; 
	 
	 waitUntil {getPos _tank select 2 < 180};
	 //SmokeShell white
	 private _smkW = "SmokeShell" createVehicle [0,0,0]; 
	 _smkW attachTo [_prqd,[4,0,31],""];
	 
	 waitUntil {getPos _tank select 2 < 4}; 
	 
	 private _vel = velocity _tank; 
	 detach _tank; 
	 _tank setVelocity _vel; 
	 
	 waitUntil {getPos _tank select 2 < 2}; 
	 _tank allowdamage true;  
	 
	 detach _irStr; 
	 detach _smkA; 
	 detach _smkB; 
	 detach _smkW; 
	 
	 deleteVehicle _irStr; 
	 deleteVehicle _smkA; 
	 deleteVehicle _smkB; 
	 deleteVehicle _smkW; 
};