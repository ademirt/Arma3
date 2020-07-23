scriptName "EVOR_fnc_detectVehEnter";
if (!hasInterface) exitWith {};

addMissionEventHandler [
	"PlayerViewChanged",
	{
		params ["_unitOld","_unitNew","_veh","_camOld","_camNew","_uav"];
		
		if (_camNew == _camOld) exitWith {};
		
		if ((_camNew == _uav) or {(_camOld == _unitNew) and {_camNew == _veh}}) then {
			if ((_camNew isKindOf "StaticWeapon") and {!local _camNew}) then {[_camNew,clientOwner] remoteExecCall ["setOwner",2];};

			if (_camNew getVariable ["EVOR_var_VehEntered",false]) exitWith {};
			
			if (local _camNew) then {
				// Datalink
				_x setVehicleReceiveRemoteTargets true;
				_x setVehicleReportOwnPosition true;
				_x setVehicleReportRemoteTargets true;
			};

			[_camNew] call EVOR_fnc_actBuild;
			[_camNew] call EVOR_fnc_actCamoToggle;
			[_camNew] call EVOR_fnc_actCargoLoad;
			[_camNew] call EVOR_fnc_actEject;
			[_camNew] call EVOR_fnc_actServiceFull;
			[_camNew] call EVOR_fnc_actServiceStatic;
			[_camNew] call EVOR_fnc_detectArtillery;
			
			_camNew setVariable ["EVOR_var_VehEntered",true,false];
		};
	}
];

player addEventHandler [
	"GetInMan",
	{
		params ["_unitNew","_role","_camNew","_path"];
		
		if ((_camNew isKindOf "StaticWeapon") and {!local _camNew}) then {[_camNew,clientOwner] remoteExecCall ["setOwner",2];};
		
		if (_camNew getVariable ["EVOR_var_VehEntered",false]) exitWith {};
		
		if (local _camNew) then {
			// Datalink
			_x setVehicleReceiveRemoteTargets true;
			_x setVehicleReportOwnPosition true;
			_x setVehicleReportRemoteTargets true;
		};
		
		[_camNew] call EVOR_fnc_actBuild;
		[_camNew] call EVOR_fnc_actCamoToggle;
		[_camNew] call EVOR_fnc_actCargoLoad;
		[_camNew] call EVOR_fnc_actEject;
		[_camNew] call EVOR_fnc_actServiceFull;
		[_camNew] call EVOR_fnc_actServiceStatic;
		[_camNew] call EVOR_fnc_detectArtillery;

		_camNew setVariable ["EVOR_var_VehEntered",true,false];
	}
];