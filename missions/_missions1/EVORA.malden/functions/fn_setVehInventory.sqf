scriptName _fnc_scriptname;

private _veh = param [0,objNull,[objNull]];
private _clear = param [1,true,[false]];
private _cfgVeh = configFile >> "CfgVehicles" >> typeOf _veh;
private _cfgBox = missionConfigFile >> "CfgAmmobox" >> typeOf _veh;

if (isClass _cfgBox) exitWith {};

if (_clear) then {
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
} else {
	private _items = getItemCargo _veh;
	clearItemCargoGlobal _veh;
	{
		if (!(_x in ["FirstAidKit","ToolKit"])) then {
			_veh addItemCargoGlobal [_x,_items select 1 select _forEachIndex]; 
		};
	} forEach (_items select 0);	
};

private _nFaksDefault	= getNumber (_cfgVeh >> "TransportItems" >> "_xx_FirstAidKit" >> "count");
private _nToolsDefault	= getNumber (_cfgVeh >> "TransportItems" >> "_xx_ToolKit" >> "count");
private _nToolsCustom	= [3,1] select (_clear and {isNil {_veh getVariable "EVOR_var_VehOwner"}});
_veh addItemCargoGlobal ["FirstAidKit",_nFaksDefault];
_veh addItemCargoGlobal ["ToolKit",_nToolsDefault + _nToolsCustom];