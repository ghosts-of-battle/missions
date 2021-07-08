/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2020-12-20
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
PatrolOpsVersion = "4.0";
missionDebugMode = 0;
missionRadioName = "PAVN Patrol";

enableNewStarterUI = 1;
enableActionBodyBags = 1;
enableActionBodySearch = 1;

class cfgMission {
    // Player Faction 
	FactionTypeBLU	= "PatrolOps_VN_Opfor";
    // AI Faction
	FactionTypeOPF	= "PatrolOps_VN_Blufor";
    // Civilian Faction
	FactionTypeCIV 	= "PatrolOps_VN_Civilian";

	introText[] = {
		{"Patrol Operations","<t size='2' shadow='0' color='#ffc600' align='center' valign='center'>%1</t><br/>"},
		{"%6","<t size='2' shadow='0' color='#ffc600' align='center' valign='center'>%1</t><br/>"},
		{"People's Army of Vietnam (PAVN)","<t size='0.8' shadow='0' color='#ffffff'>%1</t><br/>"},
		{"The year is 1968 and the Vietnam War is reaching its peak.","<t size='0.8' shadow='0' color='#ffffff'>%1</t><br/>"},
		{" ","<br/>"},
		{"The elite MACV-SOG reconnaissance team is attempting to stop the flow of materials down the Ho Chi Minh Trail by hunting and destroying the PAVN 559th Transportation Group","<t size='0.8' shadow='0' color='#ffffff'>%1</t><br/>"},
		{" ","<br/>"},
		{"As the PAVN, locate targets of opportunity, gather intel to complete key operations and push back the MACV-SOG forces.","<t size='0.8' shadow='0' color='#ffffff'>%1</t><br/>"},
		{" "," "}
	};
	introTextArguments[] = {"factionblushort","factionblulong","factionopfshort","factionopflong","factionopfside","worldname","randomcode","codename","operationname","missionname","briefingname","servername","playername","hh","hh:mm","hh:mm:ss","datetime"};

	ActionBodyBags = 1;
	ActionBodySearch = 1;

	class Encounters {
		// If a squad leader does not move for a number of seconds, an attack will occur on their position
		stationaryEncountersTimer = 240;
		// SVIEDs
		enableSVIDs = 0;
	};
    
    // Other
    allTraits[] = {"Crewman","PilotHeli","PilotPlane","Medic","Engineer","ExplosiveSpecialist","HALO"};
};