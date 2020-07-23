_unit = _this select 0;

 // if(isServer) then{
	// [_unit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
// } else {
	// bon_recruit_newunit = _unit;
	// publicVariable "bon_recruit_newunit";	
// };

if (!isServer) then {
   bon_recruit_newunit = _unit;
   publicVariable "bon_recruit_newunit";	
};

//removeAllActions _unit;
_unit addAction ["<t color='#1d78ed'>Dismiss</t>",BON_RECRUIT_PATH+"dismiss.sqf",[],-10,false,true,""];
_unit setVariable ["BIS_noCoreConversations", true];//_unit setSpeaker "NoVoice";
_unit enableFatigue false;
_unit enableStamina false;
//_unit SetUnitPos "UP";