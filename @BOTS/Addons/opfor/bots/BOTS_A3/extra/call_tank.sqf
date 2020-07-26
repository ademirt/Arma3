private _unC = _this select 0;
private _posUn = (getPosWorld _unC);		   

sleep 3;
_unC playMove "Acts_listeningToRadio_In";

sleep 2;

_unC groupChat "Papa Novembro 1 , Papa Novembro 1 , aqui é Papa Novembro 9. Câmbio!"; 
sleep 3;		   

_unC playMove "Acts_listeningToRadio_Loop";

_unC groupChat "Solicito um pequeno pacote, rápido!!!  Câmbio!"; 
sleep 3;

_unC playMove "Acts_listeningToRadio_Loop";

sleep 1;
_unC playMove "Acts_listeningToRadio_Out";

sleep 1;

//
sleep (18 + random 10);
//

private _ba = side player;

[_ba, "HQ"] sideChat "Aqui é Papa Novembro 1,  Ok, entendemos sua solicitação. Câmbio!"; sleep 5;		   
[_ba, "HQ"] sideChat "Solicitando sua ordem com o centro de logística. Câmbio!"; sleep 3;
sleep 25;
[_ba, "HQ"] sideChat "Papa Novembro 9, centro de logística confirmou o despacho. Câmbio!"; sleep 5;
[_ba, "HQ"] sideChat "Papa Novembro 9, pacote a caminho aguarde entrega! Câmbio!"; sleep 3;

sleep 65;
[_ba, "HQ"] sideChat "Papa Novembro 9,  despachando sua carga!!!  Câmbio desligo!";
sleep 10;

[_posUn] spawn {  
 
	 private _pos = _this select 0;
		 
	 private _prqd = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, 'FLY']; 
	 _prqd setPos [(_pos select 0) + random 100 ,(_pos select 1) + 50 ,600]; 
	 
	 private _tank = (["I_MBT_03_cannon_F","I_LT_01_cannon_F","I_LT_01_AT_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F"] call BIS_fnc_selectRandom) createVehicle [0,0,0];  
	 _tank allowdamage false; 
	 
	 _tank attachTo [_prqd, [0, 0, -1.3]]; 
	 _tank setDir random 360;
	 
	 //IRStrobe 
	 private _irStr = "NVG_TargetC" createVehicle [0,0,0]; 
	 _irStr attachTo [_tank,[0,0,2],""]; //0,0,2 
	 
	 waitUntil {getPos _tank select 2 < 450}; 
	 //SmokeShellRed 
	 private _smkA = "SmokeShell" createVehicle [0,0,0]; 
	 _smkA attachTo [_prqd,[0,0,31],""];
	 
	 waitUntil {getPos _tank select 2 < 320}; 
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