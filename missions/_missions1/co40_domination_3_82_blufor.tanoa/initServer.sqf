// by Xeno
//#define __DEBUG__
#define THIS_FILE "initServer.sqf"
#include "x_setup.sqf"
diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initServer.sqf"];
if (d_with_bis_dynamicgroups == 0) then {
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
};

if (isServer) then {
	d_database_found = false;
	if (!isNil "extDB3_var_loaded" && {extDB3_var_loaded}) then {
		private _uins = uiNamespace getVariable "d_database_init";
		if (isNil "_uins") then {
			private _result = "extdb3" callExtension "9:ADD_DATABASE:Domination";
			if (_result != "[1]" && {_result != "[0,""Already Connected to Database""]"}) exitWith {
				diag_log ["Database:", _result];
			};
			_result = "extdb3" callExtension "9:ADD_DATABASE_PROTOCOL:Domination:SQL_CUSTOM:dom:domination-custom.ini";
			if (_result != "[1]" && {_result != "[0,""Error Protocol Name Already Taken""]"}) exitWith {
				diag_log ["Database:", _result];
			};
			"extDB3" callExtension "9:LOCK";
			uiNamespace setVariable ["d_database_init", true];
			d_database_found = true;
		} else {
			d_database_found = true;
		};
	};
	publicVariable "d_database_found";
};

// Set to true to enable autosave to sql database each time a main target gets cleared (auto save entry in DB will get deleted after last main target)
// Does load the autosave automatically if worldname and briefingName match to those saved at mission start
d_db_auto_save = false;

if (d_database_found) then {
#ifndef __TT__
	d_bonus_vecs_db = [];
	__TRACE_1("","worldname")
	private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:missionsGet:%1", tolower worldname]);
	__TRACE_1("","_dbresult")
	if (_dbresult select 0 == 1) then {
		d_db_savegames = [];
		{
			d_db_savegames pushBack (_x select 0);
			false
		} count (_dbresult select 1);
		publicVariable "d_db_savegames";
		__TRACE_1("","d_db_savegames")
	};
#else
	d_bonus_vecs_db_w = [];
	d_bonus_vecs_db_e = [];
	private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:missionsttGet:%1", tolower worldname]);
	__TRACE_1("","_dbresult")
	if (_dbresult select 0 == 1) then {
		d_db_savegames = [];
		{
			d_db_savegames pushBack (_x select 0);
			false
		} count (_dbresult select 1);
		publicVariable "d_db_savegames";
		__TRACE_1("","d_db_savegames")
	};
#endif

	_dbresult = parseSimpleArray ("extdb3" callExtension "0:dom:getTop10Players");
	__TRACE_1("","_dbresult")
	if (_dbresult select 0 == 1) then {
		{
			_x set [1, (_x select 1) call d_fnc_convtime];
		} forEach (_dbresult select 1);
		missionNamespace setVariable ["d_top10_db_players", _dbresult select 1, true];
	};
	
	0 spawn d_fnc_getplayerscores;
};

// if set to true player total score saved into the external database will be added to the player score at connect (only if d_database_found is true of course)
d_set_pl_score_db = true;
publicVariable "d_set_pl_score_db";

if (d_database_found && {d_db_auto_save}) then {
	["d_dom_db_autosave", objNull] call d_fnc_db_loadsavegame_server;
};

if (isDedicated) then {
	0 spawn {
		waitUntil {time > 0};
		enableEnvironment [false, false];
	};
};


diag_log [diag_frameno, diag_ticktime, time, "MPF initServer.sqf processed"];