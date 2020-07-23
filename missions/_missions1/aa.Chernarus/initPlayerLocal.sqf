/* [format ["Requires MOD Tryk 0.9.4!"], "Notice"] spawn BIS_fnc_guiMessage;

if !(isClass (configFile >> "CfgPatches" >> "TRYK_Uniform")) then {
 // ["<t size='1.5'>English:</t><br />Requires MOD Tryk 0.9.4!"] spawn BIS_fnc_guiMessage;
 // [] spawn {_result = ["Requires MOD Tryk 0.9.4!", "OK", true, true] call BIS_fnc_GUImessage; };// Arma 3
  //[format ['The name "%1" is not allowed, please change it or you may get kicked.', name player], "Notice"] spawn BIS_fnc_guiMessage;
  ['Requires MOD Tryk 0.9.4!', "Notice"] spawn BIS_fnc_guiMessage;
};
if !(isClass (configFile >> "CfgPatches" >> "CUP_Chernarus_Data")) then {
  ["<t size='1.5'>English:</t><br />Requires MOD CUP Terrains!"] spawn BIS_fnc_guiMessage;
};
if !(isClass (configFile >> "CfgPatches" >> "Ryanzombies")) then {
  ["<t size='1.5'>English:</t><br />Requires MOD Ryan Zombies"] spawn BIS_fnc_guiMessage;
};  */
// [player,true] execVM "teste.sqf";
/* for "_i" from 0 to (count (configFile / "CfgPatches") - 1) do 

{

	_cfg_entry = (configFile / "CfgPatches") select _i;

	

	if (isClass _cfg_entry) then

	{

		diag_log format [">> %1", _cfg_entry];

	};

}; */