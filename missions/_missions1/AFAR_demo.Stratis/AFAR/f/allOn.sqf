switch(side player)do{
case WEST:{r_PS="SoldierWB"};
case EAST:{r_PS="SoldierEB"};
case INDEPENDENT:{r_PS="SoldierGB"};
case RESISTANCE:{r_PS="SoldierGB"};
case CIVILIAN:{r_PS="Civilian"};};
{_x enableChannel false}count[0,1];5 enableChannel r_dCH;
if("ItemRadio"in assignedItems player)then{3 enableChannel r_grCH;
if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;}else{2 enableChannel false;};
if(isNull objectParent player)then{4 enableChannel false;}else{4 enableChannel r_vCH;};
player call r_RTO;};