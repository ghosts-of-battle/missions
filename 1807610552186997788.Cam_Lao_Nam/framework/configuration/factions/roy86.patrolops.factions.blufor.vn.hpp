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
class PatrolOps_VN_Blufor {
	displayName = "MACV";
	displayLongName = "Military Assistance Command Vietnam";
	displayColour = "ColorBlufor";
	side = 1;
	class Groups {
		class SquadAmbushINS4 {
			classNames[] = {"vn_b_men_army_07","vn_b_men_army_15","vn_b_men_army_12","vn_b_men_army_06"};
		};
		class SquadAmbushINS8 {
			classNames[] = {"vn_b_men_army_02","vn_b_men_army_07","vn_b_men_army_12","vn_b_men_army_06","vn_b_men_army_15","vn_b_men_army_07","vn_b_men_army_10","vn_b_men_army_03"};
		};
		class SquadATINS4 {
			classNames[] = {"vn_b_men_army_07","vn_b_men_army_12","vn_b_men_army_12","vn_b_men_army_03"};
		};
		class SquadATINS8 {
			classNames[] = {"vn_b_men_army_02","vn_b_men_army_07","vn_b_men_army_12","vn_b_men_army_12","vn_b_men_army_15","vn_b_men_army_06","vn_b_men_army_10","vn_b_men_army_03"};
		};
		class SquadAAINS4 {
			classNames[] = {"vn_b_men_army_07","vn_b_men_army_15","vn_b_men_army_05","vn_b_men_army_03"};
		};
		class SquadAAINS8 {
			classNames[] = {"vn_b_men_army_02","vn_b_men_army_07","vn_b_men_army_05","vn_b_men_army_15","vn_b_men_army_15","vn_b_men_army_06","vn_b_men_army_10","vn_b_men_army_03"};
		};
		class HVTINS {
			classNames[] = {"vn_b_men_army_28","vn_b_men_army_01"};
		};
		class DrugDealer {
			classNames[] = {"vn_b_men_army_28"};
		};

		class Squad8 {
			classNames[] = {"vn_b_men_army_02","vn_b_men_army_07","vn_b_men_army_12","vn_b_men_army_06","vn_b_men_army_15","vn_b_men_army_07","vn_b_men_army_10","vn_b_men_army_03"};
		};
		class Squad8_INS {
			classNames[] = {"vn_b_men_army_02","vn_b_men_army_07","vn_b_men_army_12","vn_b_men_army_06","vn_b_men_army_15","vn_b_men_army_07","vn_b_men_army_10","vn_b_men_army_03"};
		};
		class Squad4_INS {
			classNames[] = {"vn_b_men_army_07","vn_b_men_army_15","vn_b_men_army_12","vn_b_men_army_06"};
		};
	};
	class Vehicles {
		class VehicleHVT {
			classNames[] = {"vn_b_wheeled_m54_03"};
		};
		class VehicleHVT_INS {
			classNames[] = {"vn_b_wheeled_m54_03"};
		};
		class Car {
			classNames[] = {"vn_b_wheeled_m151_01","vn_b_wheeled_m151_02"};
		};
		class Car_INS {
			classNames[] = {"vn_b_wheeled_m151_01","vn_b_wheeled_m151_02"};
		};
		class CarTurret {
			classNames[] = {"vn_b_wheeled_m151_mg_03","vn_b_wheeled_m151_mg_02"};
		};
		class CarTurret_INS {
			classNames[] = {"vn_b_wheeled_m151_mg_03","vn_b_wheeled_m151_mg_02"};
		};
		class Truck {
			classNames[] = {"vn_b_wheeled_m54_01","vn_b_wheeled_m54_02"};
		};
		class Truck_INS {
			classNames[] = {"vn_b_wheeled_m54_mg_01","vn_b_wheeled_m54_mg_03"};
		};
		class Truck_Support {
			classNames[] = {"vn_b_wheeled_m54_repair","vn_b_wheeled_m54_ammo","vn_b_wheeled_m54_fuel"};
		};
		class Armour_AA {
			classNames[] = {"vn_b_wheeled_m54_mg_02"};
		};
		class Armour_APC {
			classNames[] = {"vn_b_wheeled_m151_mg_04","vn_b_wheeled_m54_mg_01","vn_b_wheeled_m54_mg_03"};
		};
		class Armour_MBT {
			classNames[] = {"vn_b_armor_m41_01_01"};
		};
		class Armour_Art {
			classNames[] = {"vn_b_army_static_m101_02"};
		};
		class CAS_Heli {
			classNames[] = {"vn_b_air_ah1g_04","vn_b_air_ah1g_09","vn_b_air_ah1g_03","vn_b_air_uh1c_02_01","vn_b_air_uh1c_02_02"};
		};
		class CAS_Air {
			classNames[] = {"vn_b_air_f4b_navy_at","vn_b_air_f4b_navy_cas","vn_b_air_f4b_navy_hcas"};
		};
		class CAS_UAV {
			classNames[] = {"vn_b_air_oh6a_01","vn_b_air_oh6a_02","vn_b_air_oh6a_03"};
		};
		class Fighter_Plane {
			classNames[] = {"vn_b_air_f4b_navy_sead","vn_b_air_f4b_navy_cap"};
		};
		class Transport_Heli {
			classNames[] = {"vn_b_air_uh1c_07_01","vn_b_air_uh1d_01_01","vn_b_air_uh1d_02_01"};
		};
		class Transport_Air {
			classNames[] = {"vn_b_air_uh1c_07_01","vn_b_air_uh1d_01_01","vn_b_air_uh1d_02_01"};
		};
		class UAV {
			classNames[] = {"vn_b_air_oh6a_01","vn_b_air_oh6a_02","vn_b_air_oh6a_03"};
		};
		class UGV {
			classNames[] = {"vn_b_wheeled_m151_mg_02"};
		};
		class Boat {
			classNames[] = {"vn_b_boat_06_02","vn_b_boat_05_02"};
		};
		class StaticSAM {
			classNames[] = {"vn_b_army_static_m45"};
		};
		class StatisSAMRadar {
			classNames[] = {"vn_b_army_static_m2_high"};
		};
	};
};