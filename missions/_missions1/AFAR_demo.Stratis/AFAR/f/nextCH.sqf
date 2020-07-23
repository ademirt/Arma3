switch(currentChannel)do{
case (ch6+5):{if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))!=player))then{3 enableChannel r_grCH;setCurrentChannel 3;}else{
		if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))==player))then{2 enableChannel r_cCH;setCurrentChannel 2;}else{
		if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;setCurrentChannel 2;}else{3 enableChannel r_grCH;setCurrentChannel 3;};};};};

case (ch7+5):{if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))!=player))then{3 enableChannel r_grCH;setCurrentChannel 3;}else{
		if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))==player))then{2 enableChannel r_cCH;setCurrentChannel 2;}else{
		2 enableChannel r_cCH;setCurrentChannel 2;};};};

case (ch8+5):{if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))!=player))then{3 enableChannel r_grCH;setCurrentChannel 3;}else{
		if((r_cCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))==player))then{2 enableChannel r_cCH;setCurrentChannel 2;}else{
		2 enableChannel r_cCH;setCurrentChannel 2;};};};

case 2:{if((r_grCH isEqualTo[FALSE,FALSE]))then{4 enableChannel r_vCH;setCurrentChannel 4;}else{3 enableChannel r_grCH;setCurrentChannel 3;};};

case 3:{if(r_vCH isEqualTo[FALSE,FALSE])then{
		if(player getUnitTrait"RTO")then{
		if(side player==WEST)then{if(channelEnabled ch6 isEqualTo[False,False])then{ch6 radioChannelAdd[player];};(ch6+5)enableChannel r_sCH;setCurrentChannel(ch6+5);};
		if(side player==EAST)then{if(channelEnabled ch7 isEqualTo[False,False])then{ch7 radioChannelAdd[player];};(ch7+5)enableChannel r_sCH;setCurrentChannel(ch7+5);};
		if(side player==INDEPENDENT)then{if(channelEnabled ch8 isEqualTo[False,False])then{ch8 radioChannelAdd[player];};(ch8+5)enableChannel r_sCH;setCurrentChannel(ch8+5);};
		}else{if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;setCurrentChannel 2;}else{4 enableChannel r_vCH;setCurrentChannel 4;};};}else{
		4 enableChannel r_vCH;setCurrentChannel 4;};};

case 4:{if((r_sCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))==player))then{2 enableChannel r_cCH;setCurrentChannel 2;}else{
		if((r_sCH isEqualTo[FALSE,FALSE])&&(leader(group(vehicle player))!=player))then{3 enableChannel r_grCH;setCurrentChannel 3;}else{

		if(player getUnitTrait"RTO")then{
		if(side player==WEST)then{if(channelEnabled ch6 isEqualTo[False,False])then{ch6 radioChannelAdd[player];};(ch6+5)enableChannel r_sCH;setCurrentChannel(ch6+5);};
		if(side player==EAST)then{if(channelEnabled ch7 isEqualTo[False,False])then{ch7 radioChannelAdd[player];};(ch7+5)enableChannel r_sCH;setCurrentChannel(ch7+5);};
		if(side player==INDEPENDENT)then{if(channelEnabled ch8 isEqualTo[False,False])then{ch8 radioChannelAdd[player];};(ch8+5)enableChannel r_sCH;setCurrentChannel(ch8+5);};}else{
		private _rtoSeat=[["driver"],["Turret",[0]],["Turret",[0,0]]];
		private _myHorn=currentWeapon(objectParent player);private _myHorn=(inheritsFrom(configFile>>"CfgWeapons">>_myHorn));private _isHorny=["CarHorn",str _myHorn]call BIS_fnc_inString;
		if(!(_isHorny || objectParent player isKindOf"Ship" || objectParent player isKindOf"StaticWeapon" || objectParent player isKindOf"ParachuteBase" || "cargo"in assignedVehicleRole player))then{
		if(assignedVehicleRole player in _rtoSeat)then{
		if(side player==WEST)then{if(channelEnabled ch6 isEqualTo[False,False])then{ch6 radioChannelAdd[player];};(ch6+5)enableChannel r_sCH;setCurrentChannel(ch6+5);};
		if(side player==EAST)then{if(channelEnabled ch7 isEqualTo[False,False])then{ch7 radioChannelAdd[player];};(ch7+5)enableChannel r_sCH;setCurrentChannel(ch7+5);};
		if(side player==INDEPENDENT)then{if(channelEnabled ch8 isEqualTo[False,False])then{ch8 radioChannelAdd[player];};(ch8+5)enableChannel r_sCH;setCurrentChannel(ch8+5);};}else{
		if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;setCurrentChannel 2;}else{3 enableChannel r_grCH;setCurrentChannel 3;};};};};};};};

case 5:{if(r_cCH isEqualTo[FALSE,FALSE])then{3 enableChannel r_grCH;setCurrentChannel 3;}else{
		if(leader(group(vehicle player))==player)then{2 enableChannel r_cCH;setCurrentChannel 2;}else{
		if(leader(group(vehicle player))!=player)then{3 enableChannel r_grCH;setCurrentChannel 3;};};};};
};