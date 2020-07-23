scriptName _fnc_scriptName;
if (!hasInterface) exitWith {};

// Constant Values
private _markerType = ["o_unknown","b_unknown","n_unknown"] param [playerSide call BIS_fnc_sideID,"",[""]];
private _markerSize = [0.5,0.5];
private _markerColor = [playerSide,true] call BIS_fnc_sideColor;

while {true} do {
	// Unit Markers
	private _currentUnits = (allPlayers select {playerSide isEqualTo side group _x}) apply {vehicle _x};
	_currentUnits = _currentUnits arrayIntersect _currentUnits;
	private _unitNames = _currentUnits apply {"markerUnit_" + vehicleVarName _x};
	private _unitMarkers = allMapMarkers select {_x find "markerUnit_" != -1};
	
	// Delete unused markers
	{if (!(_x in _unitNames)) then {deleteMarkerLocal _x; uiSleep 0.1;};} forEach _unitMarkers;
	
	// Update marker pos & text if marker exists or create new marker if not
	{
		if ("" == vehicleVarName _x) then {_x setVehicleVarName str _x;};
		private _marker = "markerUnit_" + vehicleVarName _x;
		private _markerPos = getPosASL _x;
		private _markerText = if (_x isKindOf "Man") then {
			format ["%1%2",name _x,[""," [Dying]"] select (_x getVariable ["BIS_revive_incapacitated",false])];
		} else {
			private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
			private _crewNames = ((crew _x select {isPlayer _x}) apply {name _x}) joinString ", ";
			format ["%1 - [%2]",_displayName,_crewNames];
		};
		
		if (!(_marker in _unitMarkers)) then {
			createMarkerLocal [_marker,_markerPos];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "mil_dot";
			_marker setMarkerSizeLocal _markerSize;
			_marker setMarkerColorLocal _markerColor;
		};
		
		_marker setMarkerPosLocal _markerPos;
		_marker setMarkerTextLocal _markerText;

		uiSleep 0.1;
	} forEach _currentUnits;
	
	
	// Vehicle markers
	private _currentVehs = vehicles select {(!isNil {_x getVariable "EVOR_var_VehOwner"}) and {({isPlayer _x} count crew _x == 0) and {alive _x}}};
	private _vehNames = _currentVehs apply {"markerVeh_" + vehicleVarName _x};
	private _vehMarkers = allMapMarkers select {_x find "markerVeh_" != -1};
	
	// Delete unused markers
	{if (!(_x in _vehNames)) then {deleteMarkerLocal _x; uiSleep 0.1;};} forEach _vehMarkers;
	
	// Update marker pos & text if marker exists or create new marker if not
	{
		if ("" == vehicleVarName _x) then {_x setVehicleVarName str _x;};
		private _marker = "markerVeh_" + vehicleVarName _x;
		private _markerPos = getPosASL _x;
		
		if (!(_marker in _unitMarkers)) then {
			private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
			private _ownerName = _x getVariable ["EVOR_var_VehOwner","Unknown"];
			private _markerText = format ["%1 - %2",_displayName,_ownerName];
			
			createMarkerLocal [_marker,_markerPos];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal _markerType;
			_marker setMarkerSizeLocal _markerSize;
			_marker setMarkerColorLocal _markerColor;
			_marker setMarkerTextLocal _markerText;
		};
		
		_marker setMarkerPosLocal _markerPos;
		
		uiSleep 0.1;
	} forEach _currentVehs;	
	
	uiSleep 3;
};