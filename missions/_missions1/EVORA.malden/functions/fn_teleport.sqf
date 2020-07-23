scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

private _data = param [0,"",[""]];
private _target = [0,0,0];
private _string = "";
private _success = false;

// Determine position and hint for teleport
private _basesMarkers = EVOR_list_BaseCore apply {_x select 0};
private _baseIndex = _basesMarkers findIf {_x == _data};
if (_baseIndex >= 0) then {
	private _flag = EVOR_list_BaseCore select _baseIndex select 2;
	_target = (getPosASL _flag) vectorAdd [-4+random 8,-4+random 8,0];
	_string = markerText _data;
	_success = true;
} else {
	_target = getPosASL leader player;
	if (player distance2D _target < 500) exitWith {hint "You cannot HALO-jump to your own position!";};
	if (!isText (configFile >> "CfgVehicles" >> backpack player >> "ParachuteClass")) exitWith {hint "HALO-jumping requires a parachute!";};
	_target = (_target getPos [random 100,random 360]) vectorAdd [0,0,2000 + random 500];
	_string = format ["GRID: %1",mapGridPosition _target];
	_success = true;
};

if (!_success) exitWith {};

// Play teleport cutscene
private _rscLayer = "blackTeleport";
_rscLayer cutText ["","BLACK OUT",1];

sleep 1.5;

disableUserInput true;

sleep 0.5;

[[["TRAVELLING..."]],safezoneW*0.3+safezoneX,safezoneH*0.7+safezoneY] spawn BIS_fnc_typeText2;

player setPosASL _target;

sleep 5;

_rscLayer cutText ["","BLACK IN",2];

disableUserInput false;

sleep 1;

[[[toUpper _string]],safezoneW*0.3+safezoneX,safezoneH*0.7+safezoneY] spawn BIS_fnc_typeText2;