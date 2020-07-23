scriptName _fnc_scriptName;

private _veh = param [0,objNull,[objNull]];
private _skin = param [1,[],[[]]];

if (!alive _veh) exitWith {};

// Magazines and inventory
if (local _veh) then {
	_veh enableWeaponDisassembly false;
	_veh setAmmoCargo 0;
	_veh setFuelCargo 0;
	_veh setRepairCargo 0;
	
	// ACE logistics
	if (EVOR_var_EnabledAceMedic) then {_veh setVariable ["ace_medical_isMedicalFacility",1,true];};
	if (EVOR_var_EnabledAceRearm) then {[_veh,0] call ace_rearm_fnc_setSupplyCount;};
	if (EVOR_var_EnabledAceRefuel) then {[_veh,-1] call ace_refuel_fnc_makeSource;};
	if (EVOR_var_EnabledAceRepair) then {_veh setVariable ["ACE_isRepairVehicle",0,true];};
	
	[_veh,_skin] call EVOR_fnc_setVehSkin;
	[_veh] call EVOR_fnc_setVehMags;
	[_veh] call EVOR_fnc_setVehInventory;
	[_veh] call EVOR_fnc_initAmmobox;
};

// Scroll actions
if (hasInterface) then {
	private _owner = _veh getVariable ["EVOR_var_VehOwner",""];
	private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
	private _cfgBox = missionConfigFile >> "CfgAmmobox" >> typeOf _veh;
	
	if (profileName == _owner) then {[_veh] call EVOR_fnc_actLock;};
	if (getNumber (_cfgBox >> "hasArsenal") > 0) then {[_veh] call EVOR_fnc_actArsenal;};
	if (getNumber (_cfgVeh >> "transportAmmo") > 0) then {[_veh] call EVOR_fnc_actServiceRearm;};
	if (getNumber (_cfgVeh >> "transportFuel") > 0) then {[_veh] call EVOR_fnc_actServiceRefuel;};
	if (getNumber (_cfgVeh >> "transportRepair") > 0) then {[_veh] call EVOR_fnc_actServiceRepair;};
};