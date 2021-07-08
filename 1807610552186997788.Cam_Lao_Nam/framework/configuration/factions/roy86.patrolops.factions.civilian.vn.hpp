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
class PatrolOps_VN_Civilian {
	displayName = "Civilian";
	displayLongName = "Vietnamese Civilians";
	displayColour = "ColorCivilian";
	side = 3;
	class Groups {
		class Observer {
			classNames[] = {"vn_c_men_01"};
		};
		class Informants {
			classNames[] = {"vn_c_men_01"};
		};
		class Crowd4 {
			classNames[] = {
				"vn_c_men_02",
				"vn_c_men_24",
				"vn_c_men_25",
				{"vn_c_men_26","vn_o_men_vc_local_26"}
			};
		};
		class Crowd6 {
			classNames[] = {
				"vn_c_men_02",
				{"vn_c_men_28","vn_o_men_vc_local_12"},
				"vn_c_men_29",
				{"vn_c_men_30","vn_o_men_vc_local_26"},
				"vn_c_men_31",
				"vn_c_men_32"
			};
		};
		class Crowd12 {
			classNames[] = {
				"vn_c_men_02",
				{"vn_c_men_22","vn_o_men_vc_local_12"},
				"vn_c_men_04",
				"vn_c_men_13",
				"vn_c_men_25",
				"vn_c_men_26",
				{"vn_c_men_27","vn_o_men_vc_local_26"},
				"vn_c_men_07",
				"vn_c_men_29",
				{"vn_c_men_30","vn_o_men_vc_local_26"},
				"vn_c_men_05",
				"vn_c_men_32"
			};
		};
		class Crowd24 {
			classNames[] = {
				"vn_c_men_01",
				"vn_c_men_02",
				"vn_c_men_03",
				"vn_c_men_04",
				"vn_c_men_05",
				"vn_c_men_06",
				"vn_c_men_07",
				{"vn_c_men_08","vn_o_men_vc_local_12"},
				"vn_c_men_09",
				"vn_c_men_10",
				"vn_c_men_11",
				"vn_c_men_12",
				{"vn_c_men_13","vn_o_men_vc_local_12"},
				"vn_c_men_14",
				{"vn_c_men_15","vn_o_men_vc_local_12"},
				"vn_c_men_16",
				"vn_c_men_17",
				"vn_c_men_18",
				{"vn_c_men_19","vn_o_men_vc_local_26"},
				"vn_c_men_20",
				{"vn_c_men_21","vn_o_men_vc_local_26"},
				"vn_c_men_22",
				{"vn_c_men_23","vn_o_men_vc_local_26"},
				"vn_c_men_24"
			};
		};
		class Journo {
			classNames[] = {"vn_c_men_01"};
		};
	};
	class Vehicles {
		class Helicopters {
			classNames[] = {};
		};
		class Boats {
			classNames[] = {"vn_c_boat_01_00","vn_c_boat_02_00","vn_c_boat_01_02","vn_c_boat_07_01","vn_c_boat_08_01"};
		};
		class Cars {
			classNames[] = {"vn_c_bicycle_01","vn_c_bicycle_02","vn_c_wheeled_m151_01","vn_c_wheeled_m151_02"};
		};
		class Trucks {
			classNames[] = {"vn_c_wheeled_m151_01","vn_c_wheeled_m151_02"};
		};
	};
};
