scriptName "EVOR_fnc_initBaseArsenal";

private _box = param [0,objNull,[objNull]];

if (local _box) then {
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	_box enableRopeAttach false;
	_box enableVehicleCargo false;
};

if (hasInterface) then {[_box] call EVOR_fnc_actArsenal;};