_unit = _this select 0;

if (isServer) then{  
  [_unit] execFSM ("bots\BOTS_A3\unit_lifecycle.fsm");
} else {
  bon_recruit_newunit = _unit;
  publicVariable "bon_recruit_newunit";	
};

//removeAllActions _unit;
//_unit addAction ["<t color='#1d78ed'>Dismiss</t>",BOTS_A3+"dismiss.sqf",[],-10,false,true,""];
// _unit setVariable ["BIS_noCoreConversations", true];//_unit setSpeaker "NoVoice";
//_unit SetUnitPos "UP";