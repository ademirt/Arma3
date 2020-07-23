while {true} do 
{
    {
     if (side _x != WEST) then 
        {
		 //diag_log format [ "side X: %1", side _x ];	
         if (_x isKindOf "Man") then
         {
     	     _x removeAllEventHandlers "HandleDamage";
	         _x addEventHandler ["HandleDamage",{_damage = (_this select 2)*2; _damage}];
			 //diag_log format [ "OK FOI: side x: %1", side _x ];	
         };
     };
    } forEach allUnits;
 sleep 160;
};