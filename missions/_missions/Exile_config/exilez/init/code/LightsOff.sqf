{
	{
		_x setDamage 0.95;
	}foreach(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition") nearObjects [_x,20000]);
}foreach[

"Land_Lampa_vysoka",
"Land_Lampa_valec",
"Land_Vo_zlut",
"Land_Lamp_Street1_EP1",
"Land_Lamp_Street2_EP1",
"Land_Lampa_Ind_EP1",
"Land_Lamp_Small_EP1",
"Land_PowLines_ConcL",
"Land_PowLines_Conc2L_EP1",
"Land_Lampa_ind_b",
"Land_Lampa_ind",
"Land_Lampa_cut",
"Land_Lampa_sidl_3",
"Land_Lampa_sidl_2"

];





/* these are apparently on client side... they don't make much difference anyway
{   
	{    
		_x setDamage 1;   
	}foreach(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition") nearObjects [_x,20000]);
}foreach["Land_runway_edgelight","Land_Flush_Light_yellow_F","Land_Flush_Light_green_F","Land_NavigLight"];
*/