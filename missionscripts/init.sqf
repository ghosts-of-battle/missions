////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                           DESCRIPTION.EXT                                  //
//              this file is executed on both server and clients              //
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// radom start time																														//
////////////////////////////////////////////////////////////////////////////////
if (isServer) then
{
myNewTime = random 24;
publicVariable "myNewTime";
};
waitUntil{not isNil "myNewTime"};
skipTime myNewTime;

////////////////////////////////////////////////////////////////////////////////
// kill the rabbits 																													//
////////////////////////////////////////////////////////////////////////////////

enableEnvironment [false, true];

////////////////////////////////////////////////////////////////////////////////
// VCOM AI 																																		//
// https://github.com/genesis92x/VcomAI-3.0      			  											//
////////////////////////////////////////////////////////////////////////////////

//Exec Vcom AI function
_vcom = [] execVM "Vcom\VcomInit.sqf";
waitUntil {scriptDone _vcom};


//Globally disable VCOM_AI for Air units including Combat Support and Logistics. Put the following in init.sqf
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

////////////////////////////////////////////////////////////////////////////////
// UAV Marker Script 																													//
// http://www.armaholic.com/page.php?id=24026 																//
////////////////////////////////////////////////////////////////////////////////

//  execVM "scripts\PrykUav.sqf";

/*
Script can be added to any vehicle or unit by putting the following syntax in its init line:
_null = this spawn {While {isNil "PrykUavInit"} do {sleep 2};  _this spawn PrykUavInit;}
*/

////////////////////////////////////////////////////////////////////////////////
// Inter 	lights not needed with rhs											  									//
// http://www.armaholic.com/page.php?id=25598 																//
////////////////////////////////////////////////////////////////////////////////

_intlight =[] execVM "scripts\IntLight.sqf";
waitUntil {scriptDone _intlight};
// not needed with rhs
compile preprocessFileLineNumbers "scripts\IntLight.sqf";

////////////////////////////////////////////////////////////////////////////////
// towing											  																							//
// https://forums.bohemia.net/forums/topic/188980-advanced-towing/ 						//
////////////////////////////////////////////////////////////////////////////////

_tow =[] execVM "scripts\fn_advancedTowingInit.sqf"
waitUntil {scriptDone _tow};
compile preprocessFileLineNumbers "scripts\fn_advancedTowingInit.sqf";
////////////////////////////////////////////////////////////////////////////////
// Helicopter-door-opening-script by Delta8.																	//
// http://www.armaholic.com/page.php?id=27385																	//
////////////////////////////////////////////////////////////////////////////////

0 = execVM "scripts\msk\[MSK]_HD.sqf";
compile preprocessFileLineNumbers "scripts\msk\[MSK]_HD.sqf";

////////////////////////////////////////////////////////////////////////////////
// Taxi script																																//
// http://www.armaholic.com/page.php?id=31797																	//
////////////////////////////////////////////////////////////////////////////////

call compile preprocessFileLineNumbers "Taxi\taxi_init.sqf";

////////////////////////////////////////////////////////////////////////////////
//   brief																																		//
////////////////////////////////////////////////////////////////////////////////

_brief1 =[] execVM "brief\briefing.sqf";
waitUntil {scriptDone _brief1};

_brief2 =[] execVM "brief\howtoo.sqf";
waitUntil {scriptDone _brief2};

////////////////////////////////////////////////////////////////////////////////
//   enjured AI    																														//
// http://www.armaholic.com/page.php?id=31843 																//
////////////////////////////////////////////////////////////////////////////////
inCap = compile preprocessfilelinenumbers "scripts\inCap.sqf";

/*//parameters
_this select 0, true or false, ais war voices,ais will talk with radio or yelling while firing, (default = true)
_this select 1, true or false, drop smoke around injured ai, (default = true)
_this select 2, true or false, drag to cover, dragger will drag injured to covers like bushes or rocks, for longer distance drag set this false, (default = true)
_this select 3, unconscious and drag chance, determine chance unit unconscious if got hit, min 0%-100% max (default = 50%)
_this select 4, hit react chance, determine chance unit have react animation if got hit, min 0%-100% max (default = 20%)
*** Important Note: if you increase hit react chance, it also decrease unconscious and drag chance ***
*/
_iai = [true, true, false, 40, 20] execvm "scripts\injured.sqf";
waitUntil {scriptDone _iai};

////////////////////////////////////////////////////////////////////////////////
// add on free radio 																													//
// will dectect acer and tfar and disable
////////////////////////////////////////////////////////////////////////////////

_afar = [] execVM "AFAR\init.sqf";
waitUntil {scriptDone _afar};

////////////////////////////////////////////////////////////////////////////////
// Alive        																															//
////////////////////////////////////////////////////////////////////////////////

waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};

waitUntil {!isNil "ALIVE_profileSystemInit"};

waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};

////////////////////////////////////////////////////////////////////////////////
// Fleeing AI    																															//
// I need to add a link																												//
// this is long so nothing after it 																					//
////////////////////////////////////////////////////////////////////////////////
//THIS FINDS OUT WHAT MAP IS RUNNING AND WHAT SET OF HOUSES TO CHECK FOR
//MAPS SUPPORTED: Stratis, Altis, Tanoa, Takistan, Zargabad, and Chernarus
//You can easily add more maps to list by adjusting examples below
if(isServer)then{
switch(worldName)do{
case "Stratis":{//IF map is Stratis = Altis/Stratis Houses
nH_List=["Land_CarService_F","Land_Chapel_Small_V1_F","Land_Chapel_Small_V2_F","Land_Chapel_V1_F","Land_Chapel_V2_F","Land_d_Stone_Shed_V1_F","Land_FuelStation_Build_F","Land_FuelStation_Shed_F","Land_Hospital_main_F","Land_Hospital_side1_F","Land_Hospital_side2_F","Land_i_Addon_02_V1_F","Land_i_Addon_03mid_V1_F","Land_i_Addon_03_V1_F","Land_i_Addon_04_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Shed_Ind_F","Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V2_F","Land_i_Stone_Shed_V3_F","Land_Metal_Shed_F","Land_MilOffices_V1_F","Land_Offices_01_V1_F","Land_Slum_House01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_u_Addon_01_V1_F","Land_u_Addon_02_V1_F","Land_u_Barracks_V2_F","Land_u_House_Big_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_Shed_Ind_F","Land_u_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_WIP_F"];
};

case "Altis":{//IF MAP IS ALTIS = Altis/Stratis Houses
nH_List=["Land_CarService_F","Land_Chapel_Small_V1_F","Land_Chapel_Small_V2_F","Land_Chapel_V1_F","Land_Chapel_V2_F","Land_d_Stone_Shed_V1_F","Land_FuelStation_Build_F","Land_FuelStation_Shed_F","Land_Hospital_main_F","Land_Hospital_side1_F","Land_Hospital_side2_F","Land_i_Addon_02_V1_F","Land_i_Addon_03mid_V1_F","Land_i_Addon_03_V1_F","Land_i_Addon_04_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F","Land_i_Shed_Ind_F","Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseBig_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V2_F","Land_i_Stone_Shed_V3_F","Land_Metal_Shed_F","Land_MilOffices_V1_F","Land_Offices_01_V1_F","Land_Slum_House01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_Unfinished_Building_01_F","Land_Unfinished_Building_02_F","Land_u_Addon_01_V1_F","Land_u_Addon_02_V1_F","Land_u_Barracks_V2_F","Land_u_House_Big_01_V1_F","Land_u_House_Big_02_V1_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F","Land_u_Shed_Ind_F","Land_u_Shop_01_V1_F","Land_u_Shop_02_V1_F","Land_WIP_F"];
};

case "Tanoa":{//IF MAP IS TANOA = Tanoa Houses
nH_List=["Land_Airport_02_terminal_F","Land_House_Big_04_F","Land_House_Small_04_F","Land_House_Small_05_F","Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Addon_04_F","Land_Shop_City_05_F","Land_School_01_F","Land_House_Big_03_F","Land_House_Native_01_F","Land_House_Native_02_F","Land_Temple_Native_01_F","Land_SM_01_shed_F","Land_Warehouse_03_F","Land_Barracks_01_dilapidated_F","Land_Barracks_01_grey_F","Land_Barracks_01_camo_F","Land_Cathedral_01_F","Land_GuardHouse_01_F","Land_FuelStation_01_shop_F","Land_FuelStation_01_workshop_F","Land_FuelStation_02_workshop_F","Land_Hotel_01_F","Land_Hotel_02_F","Land_Supermarket_01_F","Land_House_Small_02_F","Land_House_Big_02_F","Land_House_Small_03_F","Land_House_Small_06_F","Land_House_Big_01_F","Land_Shed_07_F","Land_Shed_05_F","Land_Shed_02_F","Land_Slum_05_F","Land_Slum_02_F","Land_Slum_01_F","Land_GarageShelter_01_F","Land_Shop_Town_03_F","Land_Shop_Town_05_F","Land_Shop_Town_01_F","Land_House_Small_01_F","Land_Slum_03_F","Land_Slum_04_F","Land_Shed_01_F","Land_Shed_04_F"];
};

case "Takistan":{//IF MAP IS TAKISTAN = Middle Eastern Houses
nH_List=["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1","Land_House_K_8_EP1","Land_House_L_1_EP1","Land_House_L_2_EP1","Land_House_L_3_EP1","Land_House_L_4_EP1","Land_House_L_6_EP1","Land_House_L_7_EP1","Land_House_L_8_EP1","Land_House_L_9_EP1","Land_House_C_1_EP1","Land_House_C_1_v2_EP1","Land_House_C_2_EP1","Land_House_C_3_EP1","Land_House_C_4_EP1","Land_House_C_5_EP1","Land_House_C_5_V1_EP1","Land_House_C_5_V2_EP1","Land_House_C_5_V3_EP1","Land_House_C_10_EP1","Land_House_C_11_EP1","Land_House_C_12_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_2_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1"];
};

case "Zargabad":{//IF MAP IS ZARGABAD = Middle Eastern Houses
nH_List=["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1","Land_House_K_8_EP1","Land_House_L_1_EP1","Land_House_L_2_EP1","Land_House_L_3_EP1","Land_House_L_4_EP1","Land_House_L_6_EP1","Land_House_L_7_EP1","Land_House_L_8_EP1","Land_House_L_9_EP1","Land_House_C_1_EP1","Land_House_C_1_v2_EP1","Land_House_C_2_EP1","Land_House_C_3_EP1","Land_House_C_4_EP1","Land_House_C_5_EP1","Land_House_C_5_V1_EP1","Land_House_C_5_V2_EP1","Land_House_C_5_V3_EP1","Land_House_C_10_EP1","Land_House_C_11_EP1","Land_House_C_12_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_2_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1"];
};

case "Chernarus":{//IF MAP IS CHERNARUS = Chernarus buildings
nH_List=["Land_A_BuildingWIP","Land_A_FuelStation_Build","Land_A_GeneralStore_01","Land_A_GeneralStore_01a","Land_A_Hospital","Land_A_Pub_01","Land_a_stationhouse","Land_Barn_Metal","Land_Barn_W_01","Land_Church_03","Land_Farm_Cowshed_a","Land_Farm_Cowshed_b","Land_Farm_Cowshed_c","Land_Hlidac_budka","Land_HouseBlock_A1","Land_HouseB_Tenement","Land_HouseV2_01A","Land_HouseV2_02_Interier","Land_HouseV2_04_interier","Land_HouseV_1I1","Land_HouseV_1I4","Land_HouseV_1L1","Land_HouseV_1L2","Land_HouseV_2L","Land_Ind_Garage01","Land_Ind_Workshop01_01","Land_Ind_Workshop01_02","Land_Ind_Workshop01_04","Land_Ind_Workshop01_L","Land_kulna","Land_Mil_Barracks_i","Land_Mil_ControlTower","Land_Panelak","Land_Panelak2","Land_Rail_House_01","Land_rail_station_big","Land_Shed_Ind02","Land_Shed_W01","Land_stodola_old_open","Land_Tovarna2","Land_vez"];
};

default{//If any of the above maps aren't detected, default select A2 Takistan houses
nH_List=["Land_House_K_1_EP1","Land_House_K_3_EP1","Land_House_K_5_EP1","Land_House_K_6_EP1","Land_House_K_7_EP1","Land_House_K_8_EP1","Land_House_L_1_EP1","Land_House_L_2_EP1","Land_House_L_3_EP1","Land_House_L_4_EP1","Land_House_L_6_EP1","Land_House_L_7_EP1","Land_House_L_8_EP1","Land_House_L_9_EP1","Land_House_C_1_EP1","Land_House_C_1_v2_EP1","Land_House_C_2_EP1","Land_House_C_3_EP1","Land_House_C_4_EP1","Land_House_C_5_EP1","Land_House_C_5_V1_EP1","Land_House_C_5_V2_EP1","Land_House_C_5_V3_EP1","Land_House_C_10_EP1","Land_House_C_11_EP1","Land_House_C_12_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_2_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1"];
};
publicVariable "nH_List";
};


//THIS IS THE EVENTHANDLER THAT MAKES THE CIVILIANS FLEE
{if(side _x==civilian)then{
_x addEventHandler["FiredNear",{
_civ=_this select 0;

	switch(round(random 2))do{
		case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};};

//nearestObjects[ PositionOrTarget, ["List","Of","Classnames","To","Look","For"], MaxDistanceToSearchAroundTarget ];
_nH=nearestObjects[_civ,nH_List,100];


_H=selectRandom _nH;//Pick an object found in the above nearestObjects array

_HP=_H buildingPos -1;//Finds list of all available building positions in the selected building

_HP=selectRandom _HP;//Picks a building position from the list of building positions

_civ doMove _HP;//Orders the civilian to move to the building position

//Remove the eventHandler to prevent spamming
_civ removeAllEventHandlers "FiredNear";}];};
}forEach allUnits-switchableUnits-playableUnits
};