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
class PatrolOps_VN_Opfor {
	displayName = "PAVN";
	displayLongName = "People's Army of Vietnam";
	displayColour = "ColorOpfor";
	side = 0;
	class Groups {
		// Task Specific
		class SquadAmbushINS4 {
			classNames[] = {"vn_o_men_nva_02","vn_o_men_nva_11","vn_o_men_nva_14","vn_o_men_nva_11"};
		};
		class SquadAmbushINS8 {
			classNames[] = {"vn_o_men_nva_01","vn_o_men_nva_02","vn_o_men_nva_14","vn_o_men_nva_11","vn_o_men_nva_05","vn_o_men_nva_09","vn_o_men_nva_10","vn_o_men_nva_08"};
		};
		class SquadATINS4 {
			classNames[] = {"vn_o_men_nva_02","vn_o_men_nva_14","vn_o_men_nva_14","vn_o_men_nva_08"};
		};
		class SquadATINS8 {
			classNames[] = {"vn_o_men_nva_01","vn_o_men_nva_02","vn_o_men_nva_14","vn_o_men_nva_14","vn_o_men_nva_05","vn_o_men_nva_11","vn_o_men_nva_10","vn_o_men_nva_08"};
		};
		class SquadAAINS4 {
			classNames[] = {"vn_o_men_nva_02","vn_o_men_nva_43","vn_o_men_nva_43","vn_o_men_nva_08"};
		};
		class SquadAAINS8 {
			classNames[] = {"vn_o_men_nva_01","vn_o_men_nva_02","vn_o_men_nva_43","vn_o_men_nva_43","vn_o_men_nva_05","vn_o_men_nva_11","vn_o_men_nva_10","vn_o_men_nva_08"};
		};
		class HVTINS {
			classNames[] = {"vn_o_men_nva_01","vn_o_men_nva_65_01"};
		};
		class DrugDealer {
			classNames[] = {"vn_o_men_nva_01"};
		};
	};
	class Vehicles {
		class VehicleHVT {
			classNames[] = {"vn_o_wheeled_z157_04_nva65"};
		};
		class Car {
			classNames[] = {"vn_o_wheeled_btr40_01_nva65"};
		};
		class Car_INS {
			classNames[] = {"vn_o_wheeled_btr40_01_nva65"};
		};
		class CarTurret {
			classNames[] = {"vn_o_wheeled_btr40_mg_02_nva65","vn_o_wheeled_btr40_mg_01_nva65"};
		};
		class CarTurret_INS {
			classNames[] = {"vn_o_wheeled_btr40_mg_02_nva65","vn_o_wheeled_btr40_mg_01_nva65"};
		};
		class Truck {
			classNames[] = {"vn_o_wheeled_z157_01_nva65","vn_o_wheeled_z157_02_nva65"};
		};
		class Truck_INS {
			classNames[] = {"vn_o_wheeled_z157_01_nva65","vn_o_wheeled_z157_02_nva65"};
		};
		class Truck_Support {
			classNames[] = {"vn_o_wheeled_z157_ammo_nva65","vn_o_wheeled_z157_fuel_nva65","vn_o_wheeled_z157_repair_nva65"};
		};
		class Armour_AA {
			classNames[] = {"vn_o_wheeled_btr40_mg_03_nva65","vn_o_wheeled_z157_mg_02_nva65"};
		};
		class Armour_APC {
			classNames[] = {"vn_o_wheeled_btr40_mg_02_nva65","vn_o_wheeled_btr40_mg_01_nva65"};
		};
		class Armour_MBT {
			classNames[] = {"vn_o_armor_m41_01","vn_o_armor_type63_01"};
		};
		class Armour_Art {
			classNames[] = {"vn_o_nva_65_static_zpu4"};
		};
		class CAS_Heli {
			classNames[] = {"vn_o_air_mi2_04_02","vn_o_air_mi2_04_01"};
		};
		class CAS_Air {
			classNames[] = {"vn_o_air_mi2_05_06"};
		};
		class CAS_UAV {
			classNames[] = {"vn_o_air_mi2_03_02","vn_o_air_mi2_03_05"};
		};
		class Fighter_Plane {
			classNames[] = {"vn_o_air_mi2_05_06"};
		};
		class Transport_Heli {
			classNames[] = {"vn_o_air_mi2_01_01","vn_o_air_mi2_01_03","vn_o_air_mi2_01_02"};
		};
		class Transport_Air {
			classNames[] = {"vn_o_air_mi2_01_01","vn_o_air_mi2_01_03","vn_o_air_mi2_01_02"};
		};
		class UAV {
			classNames[] = {"vn_o_air_mi2_03_02","vn_o_air_mi2_03_05"};
		};
		class UGV {
			classNames[] = {"vn_o_bicycle_02_nva65"};
		};
		class Boat {
			classNames[] = {"vn_o_boat_03_02","vn_o_boat_04_02"};
		};
		class StaticSAM {
			classNames[] = {"vn_o_nva_65_static_zpu4"};
		};
		class StatisSAMRadar {
			classNames[] = {"vn_o_wheeled_z157_03"};
		};
	};
};
