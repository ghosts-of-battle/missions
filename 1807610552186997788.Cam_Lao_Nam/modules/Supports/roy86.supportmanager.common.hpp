/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2020-12-21
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
class CfgMissionSupports {
	class AvailableSupports {
		class Divional_Guns {
			scope = 2;
			displayName = "D44 85mm Divisional Guns";
			classname = "vn_o_nva_static_d44_01";
			delay = "(_dist/1000*0.96)";
			availableForSupportTypes[] = {"Artillery"};
			size = 3;
		};
		class BatteryMk6Mortar {
			scope = 2;
			displayName = "Type 53 82mm Mortars";
			classname = "vn_o_nva_65_static_mortar_type53";
			availableForSupportTypes[] = {"Artillery"};
			delay = "(_dist/1000*0.66)";
			size = 5;
		};
	};
	class Supplydrops {
		//vehicles[] = {"O_T_VTOL_02_vehicle_dynamicLoadout_F","B_T_VTOL_01_vehicle_F","B_T_VTOL_01_vehicle_F"};
		//ammoboxes[] = {"O_supplyCrate_F","B_supplyCrate_F","I_supplyCrate_F"};
		//UAVs[] = {"O_UGV_01_rcws_F","B_UGV_01_rcws_F","I_UGV_01_rcws_F"};
		//UGVs[] = {"O_UGV_01_rcws_F","B_UGV_01_rcws_F","I_UGV_01_rcws_F"};
		/* class Vehicles {
			west[] = {"B_T_VTOL_01_vehicle_F"};
			east[] = {"O_T_VTOL_02_vehicle_dynamicLoadout_F"};
			guer[] = {"B_T_VTOL_01_vehicle_F"};
		};
		class Ammoboxes {
			west[] = {"B_supplyCrate_F"};
			east[] = {"O_supplyCrate_F"};
			guer[] = {"I_supplyCrate_F"};
		}; */
	};
};

#include "ui\roy86.gear.amreltablet.rsc.control.support.cas.hpp"
#include "ui\roy86.gear.amreltablet.rsc.control.support.firemission.hpp"
#include "ui\roy86.gear.amreltablet.rsc.control.support.map.hpp"
#include "ui\roy86.gear.amreltablet.rsc.control.support.showofforce.hpp"
#include "ui\roy86.gear.amreltablet.rsc.control.support.supplydrop.hpp"
#include "ui\roy86.gear.amreltablet.rsc.control.support.uav.hpp"
#include "ui\roy86.gear.amreltablet.rsc.display.support.hpp"