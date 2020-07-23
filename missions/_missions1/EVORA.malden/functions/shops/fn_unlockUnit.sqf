scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _class = toLower param [0,"init",[""]];
private _count = 0;

if (_class == "init") then {
	{
		_count = _count + ([_x select 0] call EVOR_fnc_unlockUnit);
	} forEach (EVOR_list_ShopGear select 0 select {_x select 2});
} else {
	{
		{
			private _removed = _x select 2;
			private _weapons = (_x select 3) apply {toLower _x};
			
			if (_removed and {_class in _weapons}) then {
				_x set [2,false];
				_count = _count + 1;
			};
		} forEach _x;
	} forEach EVOR_list_ShopUnit;
};

_count;