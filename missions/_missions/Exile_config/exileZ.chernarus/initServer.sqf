call compile preprocessFileLineNumbers "a3_helicrash\init\code\helicrashes2.sqf";//_h = execVM "a3_helicrash\helicrashes2.sqf";
setTimeMultiplier 5.5;
setTerrainGrid 3.125;
setViewDistance 1500;
_bul = [] execVM "addons\blowout\module\blowout_server.sqf";
diag_log "BLOWOUT SERVER - Loading";