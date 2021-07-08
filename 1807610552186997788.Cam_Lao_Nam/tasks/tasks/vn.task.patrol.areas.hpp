/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2020-02-11
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
class VN_Task_Patrol_Area {
	scope = 1;
	target = -1;
	typeID = 21;

	areaSize[] = {1000,1000};
	positionSearchTypes[] = {"Clearing","Hill","Farm","Military","Village"};
	positionIsWater = 0;

	class TaskDetails {
		title = "Patrol Area around %5";
		description[] = {
			"<t>Ref: %1</t> | <t>Date: %2<br/>AO: %3 %4 near %5</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>%7 have sent a large patrol into the areas near %5 and pose a significant threat to the %6 scouts covering that area.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%6 forces will move to the area to conduct an ambush to elimiate or drive off any %7 forces in the area.</t>"
			,"<t size='1.1' color='#FFC600'>Enemy:</t> <t>%7 forces are heavily equipped infantry squad operating in that area with small arms and possibly an additional light support.</t>"
			,"<t size='1.1' color='#FFC600'>Intel:</t> <t>After INTEL is gathered, use the Intel Documents to analyse the INTEL and unlock operation details.</t>"
		};
		iconType = "default";
		iconPosition = "position";
		textArguments[] = {"randomCode","datetime","worldRegion","worldName","nearestTown","factionBLUshort","factionOPFshort"};
	};
	
	class Markers {
		class marker_A {
			shape = "ELLIPSE";
			brush = "SolidBorder";
			colour = "ColorOpfor";
			size[] = {1.2,1.2};
			alpha = 0.3;
		};
		class marker_D: marker_A {
			brush = "FDiagonal";
			size[] = {0.9,0.9};
			alpha = 0.8;
		};
	};

	class Groups {
		class EN_Group_1 {
			probability = 1;
			position = "positionOffset";
			faction = "FactionTypeOPF";
			groupTypes[] = {"SquadAmbushINS4","SquadAmbushINS8"};
			isPatrolling = 1;
			radius[] = {300,500};
			dropIntel = 1;
		};
		class EN_Group_2: EN_Group_1 {
			minPlayers = 2;
			distance[] = {100,150};
			radius[] = {150,500};
		};
		class EN_Group_3: EN_Group_1 {
			minPlayers = 4;
			distance[] = {200,350};
			radius[] = {150,500};
		};
		class EN_Group_4: EN_Group_1 {
			minPlayers = 8;
			distance[] = {200,350};
			radius[] = {150,500};
		};
		class EnemyVehicleGroup_1 {
			probability = 0.85;
			position = "positionOffset";
			faction = "FactionTypeOPF";
			vehicleTypes[] = {"CarTurret_INS","Car_INS"};
			createCrew = 1;
			distance[] = {50,100};
			direction[] = {0,360};
			isPatrolling = 0.6;
			radius[] = {150,250};
		};
		class EnemyVehicleGroup_2: EnemyVehicleGroup_1 {
			probability = 0.9;
			minPlayers = 4;
			vehicleTypes[] = {"Armour_APC","Truck_INS"};
			createCrew = 1;
			distance[] = {150,200};
			direction[] = {0,360};
			isPatrolling = 1;
			radius[] = {150,250};
		};
		class EnemyVehicleGroup_3: EnemyVehicleGroup_1 {
			probability = 0.85;
			minPlayers = 6;
			position = "positionOffset";
			vehicleTypes[] = {"Armour_APC","Armour_MBT"};
			distance[] = {100,200};
			direction[] = {0,360};
			isPatrolling = 1;
			radius[] = {150,250};
		};
		class EnemyVehicleGroup_4: EnemyVehicleGroup_1 {
			probability = 0.5;
			minPlayers = 6;
			isPatrolling = 1;
			radius[] = {400,500};
			vehicleTypes[] = {"Transport_Heli"};
		};
	};

	class Objective {
		class Succeeded {
			state = 1; // 0:Created, 1:Succeeded, 2: Failed, 3: Canceled
			condition = "_unitsKilled || _intelPickedUp";
			nextTasks[] = {"Task_Patrol_Area"};
		};
	};
};

class VN_Task_Patrol_Area_1: VN_Task_Patrol_Area {};
class VN_Task_Patrol_Area_2: VN_Task_Patrol_Area {};
class VN_Task_Patrol_Area_3: VN_Task_Patrol_Area {};