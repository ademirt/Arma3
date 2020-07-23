// Changes data lists when casual mode or ACE is active
// Casual mode unlocks all equipment and reduces enemy difficulty

scriptName _fnc_scriptName;

if (!isNil "EVOR_list_ShopGear") then {
	
	// Create list of ACE items and add them to shop gear
	private _cfgWeapons = configFile >> "CfgWeapons";
	private _cfgPatches = configFile >> "CfgPatches";
	private _acePatches = ["ace_medical","ace_explosives","ace_hearing","ace_huntir","ace_maptools","ace_microdagr","ace_mk6mortar","ace_sandbag","ace_spottingscope","ace_trenches","ace_tripod","ace_dagr","ace_kestrel4500","ace_atragmx","ace_rangecard"];
	private _aceItems = [];
	private _patchItems = [];
	{
		if (isClass (_cfgPatches >> _x)) then {
			_patchItems = getArray (_cfgPatches >> _x >> "weapons");
			_patchItems = _patchItems select {2 == getNumber (_cfgWeapons >> _x >> "scope")};
			_aceItems append _patchItems;
		};
	} forEach _acePatches;
	(EVOR_list_ShopGear # 1) append (_aceItems apply {[_x,0,true]});
	
	// Unlock all equipment
	if (EVOR_var_CasualMode) then {
		{{_x set [2,true];} forEach _x;} forEach EVOR_list_ShopGear;
	};
};

if (!isNil "EVOR_list_ObjectiveQueue") then {
	// Reduce objective difficulty to max 2
	if (EVOR_var_CasualMode) then {
		if (isServer) then {{_x set [4,1 min (_x select 4)];} forEach EVOR_list_ObjectiveQueue};
	};
};
