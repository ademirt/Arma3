class op_2_TargetCommsTower: TaskDefaults {
	scope = 1;
	typeID = 2;
	positionSearchTypes[] = {"Tower"};
	positionSearchRadius = 1000;
	positionNearLast = 1;
	class TaskDetails {
		title = "%1";
		description[] = {
			"<t>Ref: %2</t> | <t>Date: %3<br/>AO: %4 %5 near %6</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>A %7 surveillance drone has detected intermitent %8 radio transmissions near %6. A satellite photo indicates a transmitter has been set up and is likely being used to co-ordinate %8 operations in that area.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%7 forces will move to the area and conduct a sweep to locate and destroy the transmitter tower and eliminate any %8 opposition.</t>"
			,"<t size='1.1' color='#FFC600'>Intel:</t> <t>It is unknown as to the strength or capability of %8 forces operating in that area withonly a few small thermal contacts and no obvious vehicle movement. Further intel is required, proceed with caution..</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>Civilian population are active in the area and are unlikely to be a concern. Keep an eye out for watchers who will track %7 movements and report to the enemy.</t>"
			,"op_2_TargetCommsTower"
		};
		iconType = "Destroy";
		iconPosition = "position";
		textArguments[] = {"operationName","randomCode","datetime","worldRegion","worldName","nearestTown","factionBLUshort","factionOPFshort"};
	};
	class Markers {
		class marker_A {
			shape = "RECTANGLE";
			brush = "SolidBorder";
			colour = "ColorOpfor";
			size[] = {0.99,0.99};
			alpha = 0.2;
		};
		class marker_B: marker_A {
			brush = "Border";
			size[] = {1.2,1.2};
			alpha = 1;
		};
		class marker_C: marker_A {
			brush = "Border";
			size[] = {1.0,1.0};
			alpha = 1;
		};
		class marker_D: marker_A {
			brush = "FDiagonal";
			size[] = {1.2,0.1};
			alpha = 0.9;
			direction = 0;
			distance = 1.1;
		};
		class marker_E: marker_D {
			direction = 180;
		};
		class marker_F: marker_D {
			size[] = {1.0,0.1};
			direction = 90;
			angle = 90;
		};
		class marker_G: marker_F {
			direction = 270;
		};
		class marker_target {
			position = "positionOffset";
			shape = "ICON";
			type = "mil_objective";
			colour = "ColorOpfor";
			size[] = {0.8,0.8};
			alpha = 0.6;
			text = "Target";
		};
	};
	class Compositions {
		class TowerTarget {
			position = "positionOffset";
			radius = 500;
			targets[] = {"Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F","Land_Communication_F"};
		};
	};
	class Groups {
		class EN_Group_1 {
			probability = 0.9;
			position = "positionOffset";
			distance[] = {20,50};
			direction[] = {0,360};
			faction = "FactionTypeOPF";
			groupTypes[] = {"Squad8","Squad8_AA","Squad8_AR","Squad8_AT","Squad8_M","Squad4","Squad4_AA","Squad4_AR","Squad4_AT","Squad4_M"};
			isPatrolling = 0.9;
			radius[] = {50,150};
			isDefending = 1;
			occupyBuildings = 1;
		};
		class EN_Group_2: EN_Group_1 {
			minPlayers = 2;
			distance[] = {100,150};
			radius[] = {150,200};
		};
		class EN_Group_3: EN_Group_1 {
			minPlayers = 6;
			distance[] = {150,200};
			radius[] = {200,250};
		};
		class EN_Vehicle_Group_1 {
			probability = 0.85;
			position = "positionOffset";
			distance[] = {50,100};
			direction[] = {0,360};
			faction = "FactionTypeOPF";
			vehicleTypes[] = {"CarTurret","Car"};
			createCrew = 1;
			isPatrolling = 0.6;
			radius[] = {150,250};
		};
		class EN_Vehicle_Group_2: EN_Vehicle_Group_1 {
			probability = 0.7;
			minPlayers = 8;
			vehicleTypes[] = {"CarTurret","Armour_AA","Armour_APC"};
		};
		class EN_Vehicle_Group_3: EN_Vehicle_Group_1 {
			probability = 0.7;
			minPlayers = 16;
			vehicleTypes[] = {"Armour_AA","Armour_APC"};
		};
	};
	class Objective {
		class Succeeded {
			state = 1; // 0:Created, 1:Succeeded, 2: Failed, 3: Canceled
			condition = "_targetsDestroyed";
		};
	};
};

class op_2_TargetCommsTower_Hill: op_2_TargetCommsTower {
	scope = 1;
	typeID = 2;
	positionSearchTypes[] = {"Hill"};
	positionSearchRadius = 1000;
	positionNearLast = 1;
	class Compositions {
		class TowerTarget {
			position = "positionOffset";
			radius = 500;
			targets[] = {"Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F","Land_Communication_F"};
		};
	};
	class Groups {
		class EN_Group_1 {
			probability = 0.9;
			position = "positionOffset";
			distance[] = {20,50};
			direction[] = {0,360};
			faction = "FactionTypeOPF";
			groupTypes[] = {"Squad8","Squad8_AA","Squad8_AR","Squad8_AT","Squad8_M","Squad4","Squad4_AA","Squad4_AR","Squad4_AT","Squad4_M"};
			isPatrolling = 0.9;
			radius[] = {50,150};
			isDefending = 1;
			occupyBuildings = 1;
		};
		class EN_Group_2: EN_Group_1 {
			minPlayers = 2;
			distance[] = {100,150};
			radius[] = {150,200};
		};
		class EN_Group_3: EN_Group_1 {
			minPlayers = 6;
			distance[] = {150,200};
			radius[] = {200,250};
		};
	};
	class Objective {
		class Succeeded {
			state = 1; // 0:Created, 1:Succeeded, 2: Failed, 3: Canceled
			condition = "_targetsDestroyed";
		};
	};
};

class op_2_TargetCommsTower_INS: op_2_TargetCommsTower {
	scope = 1;
	typeID = 2;
	positionSearchTypes[] = {"Hill"};
	positionSearchRadius = 1000;
	positionNearLast = 1;
	class Compositions {
		class TowerTarget {
			position = "positionOffset";
			radius = 500;
			targets[] = {"Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F","Land_Communication_F"};
		};
	};
	class Groups {
		class EN_Group_1 {
			probability = 0.9;
			position = "positionOffset";
			distance[] = {20,50};
			direction[] = {0,360};
			faction = "FactionTypeOPF";
			groupTypes[] = {"Squad8_INS","Squad4_INS"};
			isPatrolling = 0.9;
			radius[] = {50,150};
			isDefending = 1;
			occupyBuildings = 1;
		};
		class EN_Group_2: EN_Group_1 {
			minPlayers = 2;
			distance[] = {100,150};
			radius[] = {150,200};
		};
		class EN_Group_3: EN_Group_1 {
			probability = 0.9;
			minPlayers = 6;
			distance[] = {150,200};
			radius[] = {200,250};
		};
		class EN_Group_4: EN_Group_1 {
			probability = 0.9;
			minPlayers = 10;
			distance[] = {150,200};
			radius[] = {200,250};
		};
		class EN_Group_5: EN_Group_1 {
			probability = 0.8;
			minPlayers = 12;
			distance[] = {150,200};
			radius[] = {200,250};
		};
	};
	class Objective {
		class Succeeded {
			state = 1; // 0:Created, 1:Succeeded, 2: Failed, 3: Canceled
			condition = "_targetsDestroyed";
		};
	};
};