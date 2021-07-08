// Search and Destroy Weapons Cache
class VN_OP_SAD_WeaponsCache {
	summary = "Mission locating and capture of enemy supplies and handling counter reponse from enemy";
	scope = 1;
	target = -1;
	typeID = 9;
	minIntelScore = 5;

	class TaskDetails {
		title = "%1";
		description[] = {
			"<t>Ref: %2</t> | <t>Date: %3</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t><br/>%6 have been moving weapon supplies and distributing across %4 to resupply their forces. This has significantly increased the risk to %5 forces in the area and is likely to inhibit operations if not dealt with.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%5 is tasked with identifing locations of the weapon caches and capturing them.<br/>Secondary Actions: Locate any intel on targets of opportunity and keep civilian casualties to a minimum.</t>"
			,"<t size='1.1' color='#FFC600'>Intel:</t> <t>The location of the caches has not been determined. Additional intel from local civilians, enemy forces and bases should be sought to provide a more accurate location.</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>Speak with civilians who may have intel on the target or enemy positions.<br/>Recovering intel from %6 forces may provide leads on a location or target of opportunity.</t>"
		};
		iconType = "Destroy";
		textArguments[] = {"operationName","randomCode","datetime","worldName","factionBLUshort","factionOPFshort"};
	};

	class ChildTasks {
		childtasks[] = {"SAD_WeaponsCache_IntelSearch"};
	};

	class Objective {
		class Succeeded {
			state = 1;
			condition = "_childTasksComplete";
		};
	};
};

class SAD_WeaponsCache_IntelSearch: VN_Task_Clear_Outpost {
	class TaskDetails: TaskDetails {
		description[] = {
			"<t>Ref: %1</t> | <t>Date: %2<br/>AO: %3 %4 near %5</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>%7 squads have been moving weapons and supplies from the outpost near %5 and are likely to have intel on their locations.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%6 forces will move to the area to conduct an assault on the outpost to eliminate the operating squads and gather intel to identify the locations of the intel.</t>"
			,"<t size='1.1' color='#FFC600'>Enemy:</t> <t>%7 forces are heavy with a likelyhood of additional squads operating in that area with small arms and possibly an additional heavy vehicles. They are likely to call in support when engaged so move quickly.</t>"
		};
		iconType = "A";
	};
	class Objective {
		class Succeeded {
			state = 1; // 0:Created, 1:Succeeded, 2: Failed, 3: Canceled
			condition = "_targetsKilled && _intelPickedUp";
			nextTasks[] = {"SAD_WeaponsCache_Cache1","SAD_WeaponsCache_Cache2"};
		};
	};
};

class SAD_WeaponsCache_Cache1: VN_Task_Capture_Cache {
	class TaskDetails: TaskDetails {
		title = "Capture Weapon Supplies";
		description[] = {
			"<t>Ref: %1</t> | <t>Date: %2<br/>AO: %3 %4 near %5</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>Intel places weapons caches moved near %5 and amounts to significant Weapons and Ammunition into the AO and would be great to capture.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%6 forces will move to the area to conduct a sweep in order to locate and capture any weapons caches discovered.</t>"
			,"<t size='1.1' color='#FFC600'>Enemy:</t> <t>%7 forces are minimal with a likelyhood of only one small squad operating in that area with small arms and possibly an additional light technical.</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>Civilian population are neutral and are unlikely to be a concern. Keep an eye out for watchers who will track %6 movements and report to the enemy.</t>"
		};
		iconType = "B";
		iconPosition = "position";
		textArguments[] = {"randomCode","datetime","worldRegion","worldName","nearestTown","factionBLUshort","factionOPFshort"};
	};
};
class SAD_WeaponsCache_Cache2: SAD_WeaponsCache_Cache1 {
	class TaskDetails: TaskDetails {
		title = "Capture Weapon Supplies";
		description[] = {
			"<t>Ref: %1</t> | <t>Date: %2<br/>AO: %3 %4 near %5</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>Intel places weapons caches moved near %5 and amounts to significant Weapons and Ammunition into the AO and would be great to capture.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%6 forces will move to the area to conduct a sweep in order to locate and capture any weapons caches discovered.</t>"
			,"<t size='1.1' color='#FFC600'>Enemy:</t> <t>%7 forces are minimal with a likelyhood of only one small squad operating in that area with small arms and possibly an additional light technical.</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>Civilian population are neutral and are unlikely to be a concern. Keep an eye out for watchers who will track %6 movements and report to the enemy.</t>"
		};
		iconType = "C";
		iconPosition = "position";
		textArguments[] = {"randomCode","datetime","worldRegion","worldName","nearestTown","factionBLUshort","factionOPFshort"};
	};
};
