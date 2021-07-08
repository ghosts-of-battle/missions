/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2020-02-09
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
class VN_OP_AIR_Superiority {
	summary = "Regional Superiority Mission locating and destroying enemy airsupport sites and handling counter reponse from enemy";
	scope = 1;
	target = -1;
	typeID = 9;
	minIntelScore = 5;

	class TaskDetails {
		title = "%1";
		description[] = {
			"<t>Ref: %2</t> | <t>Date: %3</t>"
			,"<t size='1.1' color='#FFC600'>Brief:</t> <t>%6 radio signals are being detected and appear to be directing recent air support activity.<br/>Several recon elements has been driven back and a report indicates supply drops to %6 forces linked to the radio chatter.</t>"
			,"<t size='1.1' color='#FFC600'>Action:</t> <t>%5 Task Force is tasked with identifing the location of the Radars or helipads and destroying the units and equipment.<br/>Secondary Actions: Retrieve any intel for further analysis of %6 air capability.</t>"
			,"<t size='1.1' color='#FFC600'>Intel:</t> <t>The exact location is unknown, therefore possible intel points have been identified to triangulate the origin points.<br/>Also well equiped units have been spotted indicating support from nearby bases so be alert for more formalised units.</t>"
			,"<t size='1.1' color='#FFC600'>Note:</t> <t>Speak with civilians who may have intel on the target or enemy positions.<br/>Recovering intel from %6 forces may provide leads on a location or target of opportunity.</t>"
		};
		iconType = "target";
		textArguments[] = {"operationName","randomCode","datetime","worldName","factionBLUshort","factionOPFshort"};
	};

	class ChildTasks {
		childtasks[] = {
			"VN_OP_AIR_Superiority_Task1",
			"VN_OP_AIR_Superiority_Task2",
			"VN_OP_AIR_Superiority_Task3"
		};
	};

	class Objective {
		class Succeeded {
			state = 1;
			condition = "_childTasksComplete";
		};
	};
};

class VN_OP_AIR_Superiority_Task1: VN_Task_Clear_Radar {
	class TaskDetails: TaskDetails {
		iconType = "A";
	};
};

class VN_OP_AIR_Superiority_Task2: VN_Task_Destroy_Helipad {
	class TaskDetails: TaskDetails {
		iconType = "B";
	};
};

class VN_OP_AIR_Superiority_Task3: VN_Task_Destroy_Helipad {
	class TaskDetails: TaskDetails {
		iconType = "C";
	};
};