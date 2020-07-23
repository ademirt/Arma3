scriptName "EVOR_fnc_formatLoadout";

private _unit = param [0,player,[objNull]];

private _formatFunction = {
	private _result = [];
	{
		if (_x isEqualType []) then {
			_result append (_x call _formatFunction);
		} else {
			if (
				(_x isEqualType "")
				and {(_x != "")
				and {(!isClass (configFile >> "CfgMagazines" >> _x))}}
			) then {
				_result pushBackUnique toLower _x;
			};
		};
	} forEach _this;
	_result;
};

(getUnitLoadout _unit) call _formatFunction;