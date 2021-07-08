/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2019-07-06
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
class CfgRespawnMP {

    // Mobile Headquarters (MHQ) Configuration
    MHQenable = 1;
	MHQLimit = 3;
	MHQvehicles[] = {
        "vn_o_wheeled_z157_03",
        "vn_wheeled_btr40_ambulance_base"
	};

    // Rallypoint Configuration
    rallypointsEnable = 1;
    rallypointType[] = {
        "Land_vn_o_trapdoor_01", // East
        "Land_TentSolar_01_olive_F", // West
        "Land_TentSolar_01_bluewhite_F", // Independent
        "Land_TentSolar_01_redwhite_F" // Civilian
    };
};

#include "ui\roy86.respawnmp.rsc.control.halo.hpp"
#include "ui\roy86.respawnmp.rsc.control.map.hpp"
#include "ui\roy86.respawnmp.rsc.control.menu.hpp"
#include "ui\roy86.respawnmp.rsc.display.menu.hpp"