// by Xeno

if (d_with_ace) then {
	private _ace_med_items = [["ACE_atropine",10,true], ["ACE_fieldDressing",10,true], ["ACE_elasticBandage",10,true], ["ACE_quikclot",10,true], ["ACE_bloodIV",10,true], ["ACE_bloodIV_500",10,true], ["ACE_bloodIV_250",10,true],
	["ACE_bodyBag",10,true], ["ACE_bodyBagObject",10,true], ["ACE_epinephrine",10,true], ["ACE_morphine",10,true], ["ACE_packingBandage",10,true], ["ACE_personalAidKit",10,true], ["ACE_plasmaIV",10,true], ["ACE_plasmaIV_500",10,true], \
	["ACE_plasmaIV_250",10,true], ["ACE_salineIV",10,true], ["ACE_salineIV_500",10,true], ["ACE_salineIV_250",10,true], ["ACE_surgicalKit",10,true], ["ACE_tourniquet",10,true]];
#ifndef __TT__
	private _tmp_ar_i = (_all_weapons_items # 8) # 2;
	_tmp_ar_i append _ace_med_items;
#else
	private _tmp_ar_i = (_all_weapons_items_opfor # 8) # 2;
	_tmp_ar_i append _ace_med_items;
	
	_tmp_ar_i = (_all_weapons_items_blufor # 8) # 2;
	_tmp_ar_i append _ace_med_items;
#endif
};

{d_misc_store setVariable [_x, []]} forEach ["PRIVATE_RIFLES","CORPORAL_RIFLES","SERGEANT_RIFLES","LIEUTENANT_RIFLES","CAPTAIN_RIFLES","MAJOR_RIFLES","COLONEL_RIFLES",
	"PRIVATE_LAUNCHERS","CORPORAL_LAUNCHERS","SERGEANT_LAUNCHERS","LIEUTENANT_LAUNCHERS","CAPTAIN_LAUNCHERS","MAJOR_LAUNCHERS","COLONEL_LAUNCHERS",
	"PRIVATE_PISTOLS","CORPORAL_PISTOLS","SERGEANT_PISTOLS","LIEUTENANT_PISTOLS","CAPTAIN_PISTOLS","MAJOR_PISTOLS","COLONEL_PISTOLS",
	"PRIVATE_OPTICS","CORPORAL_OPTICS","SERGEANT_OPTICS","LIEUTENANT_OPTICS","CAPTAIN_OPTICS","MAJOR_OPTICS","COLONEL_OPTICS",
	"PRIVATE_MUZZLES","CORPORAL_MUZZLES","SERGEANT_MUZZLES","LIEUTENANT_MUZZLES","CAPTAIN_MUZZLES","MAJOR_MUZZLES","COLONEL_MUZZLES",
	"PRIVATE_UNIFORMS","CORPORAL_UNIFORMS","SERGEANT_UNIFORMS","LIEUTENANT_UNIFORMS","CAPTAIN_UNIFORMS","MAJOR_UNIFORMS","COLONEL_UNIFORMS",
	"PRIVATE_ITEMS","CORPORAL_ITEMS","SERGEANT_ITEMS","LIEUTENANT_ITEMS","CAPTAIN_ITEMS","MAJOR_ITEMS","COLONEL_ITEMS"
];
if (d_with_ranked) then {
	{d_misc_store setVariable [_x, []]} forEach ["PRIVATE_ONED","CORPORAL_ONED","SERGEANT_ONED","LIEUTENANT_ONED","CAPTAIN_ONED","MAJOR_ONED","COLONEL_ONED"];
	
	d_non_check_items = ["ItemGPS", "ItemRadio", "ItemMap", "Rangefinder", "NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP"] apply {toUpper _x};
	
	if (d_with_ace) then {
		private _ttacer = ["ACE_atropine", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_quikclot", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250",
			"ACE_bodyBag", "ACE_bodyBagObject", "ACE_epinephrine", "ACE_morphine", "ACE_packingBandage", "ACE_personalAidKit", "ACE_plasmaIV", "ACE_plasmaIV_500",
			"ACE_plasmaIV_250", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_surgicalKit", "ACE_tourniquet"] apply {toUpper _x};
		d_non_check_items append _ttacer;
	};
};

private _dd_add_gearf = {
	params ["_ranks", "_curarx", "_typeu"];
	private _arw = [];
	private _ari = [];
	private _oned = [];
	{
		private _ccx = count _x;
		if (_ccx == 2) then {
			private _cnmu = toUpper (_x # 0);
			_arw pushBack [_cnmu, _x # 1];
			if (d_with_ranked) then {
				_oned pushBack _cnmu;
			};
		} else {
			if (_ccx == 3) then {
				private _cnmu = toUpper (_x # 0);
				_ari pushBack [_cnmu, _x # 1];
				if (d_with_ranked) then {
					_oned pushBack _cnmu;
				};
			};
		};
	} forEach (_curarx select {!(_x isEqualTo [])});
	__TRACE_2("_dd_add_gearf","_arw","_ari")
	if !(_arw isEqualTo []) then {
		{
			(d_misc_store getVariable format ["%1_%2", _x, _typeu]) append _arw;
		} forEach _ranks;
	};
	if !(_ari isEqualTo []) then {
		{
			(d_misc_store getVariable format ["%1_%2", _x, _typeu]) append _ari;
		} forEach _ranks;
	};
	if (d_with_ranked && {!(_oned isEqualTo [])}) then {
		{
			(d_misc_store getVariable (_x + "_ONED")) append _oned;
		} forEach _ranks;
	};
};

{
	__TRACE_1("","_x")
	private _typeu = _x # 1;
	__TRACE_1("","_typeu")
	if (_x # 0 == 1) then {
		for "_i" from 2 to 8 do {
			__TRACE_1("","_i")
			private _ranks = switch (_i - 2) do {
				case 0: {["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]};
				case 1: {["CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]};
				case 2: {["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]};
				case 3: {["LIEUTENANT","CAPTAIN","MAJOR","COLONEL"]};
				case 4: {["CAPTAIN","MAJOR","COLONEL"]};
				case 5: {["MAJOR","COLONEL"]};
				case 6: {["COLONEL"]};
			};
			[_ranks, _x # _i, _typeu] call _dd_add_gearf;
		};
	} else {
		[["PRIVATE","CORPORAL","SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"], _x # 2, _typeu] call _dd_add_gearf;
	};
} forEach _all_weapons_items;
