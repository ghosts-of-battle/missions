/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2020-02-09
    
    Description:
        Reconstruction Task Force Set Up Comms Network
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
class VN_OP_RTF_CommsNetwork {
	summary = "Operation to restore part of the communications network and gather intel an HVT";
	scope = 1;
	target = -1;
	typeID = 9;
	minIntelScore = 5;

	class TaskDetails {
		title = "%1";
		description[] = {
			"<t>Ref: %2</t> | <t>Date: %3</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>%6 have taken out a large portion of the comms network, and driven recon elements from areas around %4 where our network was destroyed. Command has identified 2 key areas that would be ideal sites for setting up new communications relays.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%5 Forces are tasked with transporting the relay packages left at the 'Return Point' to the identified locations, securing the areas and deploying the relay towers.<br/>Secondary Actions: Any lethal aid, such as weapons caches, should be destroyed and any discovered Intel gathered for further analysis.</t>"
			,"<t size='1.1' color='#FFC600'>Intel:</t> <t>%6 are likely to have forces in the area, however it is unlikely that they would be aware of our intents and interfere heavily. Just don't give them a reason.</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>This is a hearts and minds issue and killing civilians will undermine this whole operation. Excersize extreme caution when moving around and do not engage unless fired upon.</t>"
		};
		iconType = "container";
		textArguments[] = {"operationName","randomCode","datetime","worldName","factionBLUshort","factionOPFshort"};
	};

	class ChildTasks {
		childtasks[] = {"OP_RTF_CommsNetwork_Task1"};
	};

	class Objective {
		class Succeeded {
			state = 1;
			condition = "_childTasksComplete";
		};
	};
};

class OP_RTF_CommsNetwork_Task1: VN_Task_Deploy_Tower {
	positionNearLast = 1;
	class Objective {
		class Succeeded {
			state = 1;
			condition = "_targetsDeployed";
			nextTask[] = {"OP_RTF_CommsNetwork_Task2"};
		};
		class Failed {
			state = 2;
			condition = "_targetsDestroyed";
			nextTask[] = {"OP_RTF_CommsNetwork_Task2"};
		};
	};
};

class OP_RTF_CommsNetwork_Task2: VN_Task_Deploy_Tower {
	positionNearLast = 1;
	class Objective {
		class Succeeded {
			state = 1;
			condition = "_targetsDeployed";
			nextTask[] = {};
		};
		class Failed {
			state = 2;
			condition = "_targetsDestroyed";
			nextTask[] = {};
		};
	};
};