// AUTHOR: StatusRed (EM-Creations.co.uk)
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// This module allows you to use a melee knockdown action in your missions.
//
// Usage:
// 1) Enable the module in "modules.sqf"
// 2) Set the variables below (each is explained)

// TBC_KNOCKDOWN_TEAMS
// A list of all teams which can use the knock down action
TBC_KNOCKDOWN_TEAMS = [blufor];

// TBC_KNOCKDOWN_WEAPONS
// A list of all the primary weapons which can be used for the knock down action
// This stops people being unarmed and still able to knock down for example
TBC_KNOCKDOWN_WEAPONS = [
                        "rhs_weap_akm", "UK3CB_BAF_L85A2_RIS_AFG",
                        "UK3CB_BAF_L1A1_Wood", "UK3CB_BAF_L1A1",
                        "rhs_weap_m4_carryhandle"
                        ];

// TBC_KNOCKDOWN_REVIVE_ACTION
// Whether or not a scroll wheel action will appear to revive a unit after they're knocked down
TBC_KNOCKDOWN_REVIVE_ACTION = true;

// TBC_KNOCKDOWN_KEY
// The key to use to knock down a unit (see DIK codes),
// this keybind can be overridden by each user in their settings.
TBC_KNOCKDOWN_KEY = DIK_F2;

// TBC_KNOCKDOWN_KEY_SHIFT
// Whether or not the shift key needs to be pressed down in combination with the TBC_KNOCKDOWN_KEY
TBC_KNOCKDOWN_KEY_SHIFT = true;

// TBC_KNOCKDOWN_KEY_CONTROL
// Whether or not the control key needs to be pressed down in combination with the TBC_KNOCKDOWN_KEY
TBC_KNOCKDOWN_KEY_CONTROL = false;

// TBC_KNOCKDOWN_KEY_ALT
// Whether or not the alt key needs to be pressed down in combination with the TBC_KNOCKDOWN_KEY
TBC_KNOCKDOWN_KEY_ALT = false;
