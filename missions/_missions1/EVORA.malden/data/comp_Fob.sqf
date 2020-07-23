// Defines the FOB composition for EVOR_var_SideFriendly (NATO)

// ["Class",[modelCentre above ground],azi,"name",simple,allowDamage,useSurfaceNormal]
private _string = param [0,"",[""]];

[
	["Land_HelipadSquare_F",			[0.0,0.0,0.0],180,format ["%1_service",_string],true,true,true],	
	["Land_HelipadEmpty_F",				[0.0,0.0,0.0],180,format ["%1_supply",_string],true,true,true],
	["Land_HelipadEmpty_F",				[0.0,0.0,0.0],180,format ["%1_veh",_string],true,true,true],
	["B_CargoNet_01_ammo_F",			[-10.46,3.96,0.83],70,format ["%1_arsenal",_string],false,false,true],
	["Flag_NATO_F",						[-9.36,6.352,3.98],0,format ["%1_teleport",_string],false,false,false],
	["Land_Cargo_House_V1_F",			[-8.99,-3.236,0.69],270,"",false,false,false],
	["Land_Cargo_Patrol_V1_F",			[-1.47,11.22,4.91],180,"",false,false,false],
	["Land_PortableLight_double_F" ,	[-11.67,8.87,1.08],315,"",false,false,true],
	["Land_PortableLight_double_F",		[5.95,-7.45,1.08],135,"",false,false,true],
	["Land_PortableLight_double_F",		[-6.87,-9.13,1.08],315,"",false,false,true],
	
	["Land_Cargo10_grey_F",				[4.54,9.21,1.35],315,"",true,true,true],
	["Land_MetalBarrel_F",				[6.23,8.46,0.42],164,"",true,true,true],
	["Land_MetalBarrel_F",				[7.04,7.71,0.42],311,"",true,true,true],
	["Land_Sign_WarningMilitaryArea_F",	[-8.00,-11.54,1.04],0,"",true,true,true],
	["Land_HBarrier_5_F",				[-8.71,-10.54,0.74],180,"",true,true,true],
	["Land_HBarrier_5_F",				[-12.82,-8.88,0.74],45,"",true,true,true],
	["Land_HBarrier_5_F",				[-14.47,-4.54,0.74],270,"",true,true,true], 
	["Land_HBarrier_5_F",				[-14.46,0.97,0.74],90,"",true,true,true], 
	["Land_HBarrier_5_F",				[-14.47,6.46,0.74],270,"",true,true,true],
	["Land_HBarrier_5_F",				[-12.64,10.79,0.74],135,"",true,true,true],
	["Land_HBarrier_5_F",				[-8.47,12.47,0.74],0,"",true,true,true], 
	["Land_HBarrier_5_F",				[-2.96,12.46,0.74],180,"",true,true,true],
	["Land_HBarrier_5_F",				[2.54,12.46,0.74],0,"",true,true,true],
	["Land_HBarrier_5_F",				[6.91,10.54,0.74],45,"",true,true,true],
	["Land_HBarrier_5_F",				[8.53,6.46,0.74],270,"",true,true,true],
	["Land_HBarrier_5_F",				[8.54,0.96,0.74],90,"",true,true,true],
	["Land_HBarrier_5_F",				[8.53,-4.54,0.74],270,"",true,true,true],
	["Land_HBarrier_5_F",				[6.89,-8.88,0.74],135,"",true,true,true]
];