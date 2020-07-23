//layer addAction ["<t color='#FF0000'>NPC</t>", {call addnpctte;}];
//player addAction ["<t color='#FF0000'>ZOMBIE</t>", {call spaw_zombie;}];
player addAction ["Teleport", "openMap true;onMapSingleClick 'player setPos _pos; onMapSingleClick ''''; openMap false; true;'; waitUntil{!(visibleMap)}; "];
