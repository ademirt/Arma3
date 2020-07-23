if (not local player) exitWith{};

if ( (count (units group player) + count bon_recruit_queue) >= max_ai_recruits ) exitWith {hint "You've reached the max. allowed group size"};

#include "dialog\definitions.sqf"
disableSerialization;

_update_queue = {
	_display = findDisplay BON_RECRUITING_DIALOG;
	_queuelist = _display displayCtrl BON_RECRUITING_QUEUE;
	_queuelist ctrlSetText format["Units queued: %1",count bon_recruit_queue];
};

_display = findDisplay BON_RECRUITING_DIALOG;
_listbox = _display displayCtrl BON_RECRUITING_UNITLIST;
_sel = lbCurSel _listbox; if(_sel < 0) exitWith{};

_unittype = bon_recruit_recruitableunits select _sel;
_typename = lbtext [BON_RECRUITING_UNITLIST,_sel];

_queuepos = 0;
_queuecount = count bon_recruit_queue;
if(_queuecount > 0) then {
	_queuepos = (bon_recruit_queue select (_queuecount - 1)) + 1;
	hint parseText format["<t size='1.0' font='PuristaMedium' color='#ef2525'>%1</t> added to queue.",_typename];
};
bon_recruit_queue pushBack _queuepos;

[] call _update_queue;

WaitUntil{_queuepos == bon_recruit_queue select 0};
sleep (0.5 * (_queuepos min 1));
hint parseText format["Processing your <t size='1.0' font='PuristaMedium' color='#ffd800'>%1</t>.",_typename];
sleep 1;

_unit = group player createUnit [_unittype, [(getPos bon_recruit_barracks select 0) + 10 - random 10,(getPos bon_recruit_barracks select 1) + 10 - random 20,0], [], 0, "NONE"];

//_unit setRank "PRIVATE";

if (_unittype == "B_Helipilot_F") then {
	_unit addAction ["<t color='#ff9900'>Create heli</t>","bon_recruit_units\extra\createheli.sqf",[],1,false,true,""];
	//_unit addAction ["<t color='#ff9900'>Create AHZ1</t>","bon_recruit_units\extra\createheli2.sqf",[],1,false,true,""];
};
if (_sel == 6) then {
  _unit addAction ["<t color='#ff9900'>Request Vehicle</t>","bon_recruit_units\extra\createcar.sqf",[],1,false,true,""];
};
/*if (_sel == 9) then {
  _unit addAction ["<t color='#ff9900'>Call UGV Storm</t>","bon_recruit_units\extra\createauto.sqf",[],1,false,true,""];	
}; */

if (_unittype == "B_officer_F") then {  
	//[ _unit, GRLIB_respawn_loadout ] call F_setLoadout;//cti liberation    
	[_unit, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;//ghost enemy assault	
};
if (_unittype == "B_CTRG_soldier_AR_A_F") then {  
	_saved_loadouts = profileNamespace getVariable "bis_fnc_saveInventory_data";
	_loadouts_data = [];
	_counter = 0;
	if ( !isNil "_saved_loadouts" ) then {
		{
			if ( _counter % 2 == 0 ) then {
				_loadouts_data pushback _x;
			};
			_counter = _counter + 1;
		} foreach _saved_loadouts;
	};
    [_unit, [profileNamespace, _loadouts_data select (random count _loadouts_data) ]] call bis_fnc_loadInventory;
};

[_unit] execVM (BON_RECRUIT_PATH+"init_newunit.sqf");

hint parseText format["Your <t size='1.0' font='PuristaMedium' color='#008aff'>%1</t> %2 has arrived.",_typename,name _unit];
bon_recruit_queue = bon_recruit_queue - [_queuepos];

[] call _update_queue;