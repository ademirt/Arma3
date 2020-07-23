while {true} do 
{
    {
     if ( side _x == EAST) then 
            {
                    if (_x isKindOf "Man") then
                    {
     	              _x removeAllEventHandlers "HandleDamage";
	              _x addEventHandler ["HandleDamage",{_damage = (_this select 2)*1.8; _damage}];
                    };
     };
    }forEach allUnits;
sleep 280;
};