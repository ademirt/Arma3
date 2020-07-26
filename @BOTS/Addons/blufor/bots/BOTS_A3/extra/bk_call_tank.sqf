private _unC = _this select 0;
private _pos = (getPosWorld _unC);		   

sleep 4;

_unC playMove "Acts_listeningToRadio_In";

//sleep 2;

_unC groupChat "Papa Novembro 1 , Papa Novembro 1 , aqui é Papa Novembro 9. Câmbio!"; 
//sleep 3;		   

_unC playMove "Acts_listeningToRadio_Loop";

_unC groupChat "Solicito um pequeno pacote, rápido!!!  Câmbio!"; 
//sleep 3;

_unC playMove "Acts_listeningToRadio_Loop";

sleep 1;
_unC playMove "Acts_listeningToRadio_Out";

//
//sleep (18 + random 10);
//

private _ba = side player;

[_ba, "HQ"] sideChat "Aqui é Papa Novembro 1,  Ok, entendemos sua solicitação. Câmbio!"; sleep 5;		   
[_ba, "HQ"] sideChat "Solicitando sua ordem com o centro de logística. Câmbio!"; sleep 3;
//sleep 25;
[_ba, "HQ"] sideChat "Papa Novembro 9, centro de logística confirmou o despacho. Câmbio!"; sleep 5;
[_ba, "HQ"] sideChat "Papa Novembro 9, pacote a caminho aguarde entrega! Câmbio!"; sleep 3;

//sleep 65;
[_ba, "HQ"] sideChat "Papa Novembro 9,  despachando sua carga!!!  Câmbio desligo!";
//sleep 10;

private _tank = (["I_MBT_03_cannon_F","I_LT_01_cannon_F","I_LT_01_AT_F","I_APC_Wheeled_03_cannon_F","I_APC_tracked_03_cannon_F"] call BIS_fnc_selectRandom) createVehicle [0,0,0];

//IRStrobe
private _irStr = "NVG_TargetC" createVehicle [0,0,0];
_irStr attachTo [_tank,[0,0,2],""]; //0,0,2

_tank setDir random 360;		   		   

_tank setPos [(_pos select 0) + random 99 ,(_pos select 1) + 80 ,560];
_tank call KK_fnc_paraDrop;

//SmokeShellRed
private _smkA = "SmokeShellRed" createVehicle [0,0,0];
_smkA attachTo [_tank,[0,0,2],""]; //0,0,2

waitUntil {getPos _tank select 2 < 10};

detach _irStr;
detach _smkA;
sleep 3;

deleteVehicle _irStr;
deleteVehicle _smkA;
