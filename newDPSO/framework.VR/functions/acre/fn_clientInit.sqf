/*
 * Author: Kingsley
 * Inits the client radio stuff.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call dpsov2_acre_fnc_clientInit;
 *
 * Public: No
 */



 params ["_Section"];
["ACRE_PRC152", "dpso"] call acre_api_fnc_setPreset;
["ACRE_PRC148", _Section] call acre_api_fnc_setPreset;
["ACRE_PRC117F", "dpso"] call acre_api_fnc_setPreset;
["ItemRadio", "default"] call acre_api_fnc_setPreset;

call {
    if (_Section == "DS990") exitwith {
        if (player canAdd "ACRE_PRC152") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            ["ACRE_PRC152", "DS990"] call acre_api_fnc_setPreset;
            player addItem "ACRE_PRC152";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };

    };
    if (_Section == "DA991") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA992") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA993") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA994") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA995") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA996") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA997") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DA998") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "DS999") exitwith {
        if (player canAdd "ACRE_PRC152") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            ["ACRE_PRC152", "DS999"] call acre_api_fnc_setPreset;
            player addItem "ACRE_PRC152";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    };
    if (_Section == "bolo") exitwith {
        if (player canAdd "ACRE_PRC148") then {
            player removeWeapon ([] call acre_api_fnc_getCurrentRadio);
            player addItem "ACRE_PRC148";
            systemChat "Radio added";
            } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
    } else {
                systemChat "Not enough room in your inventory to add that radio";
            };
};

