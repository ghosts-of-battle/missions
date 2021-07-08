class CfgFunctions {
    #include "scripts\CBA3\hpp_functions.hpp"

    class ADDON {
        tag = QUOTE(ADDON);
        class functions {
            file = "functions";
            class initArsenalCrate;
            class vehicleSpawnerair;
            class vehicleSpawnerland;
            class vehicleSpawnersea;
            class Patches;
            class timemarkers {postInit = 1;};
            class arsenal{postInit = 1;};
            class MedicalSupplies;
        };
    };
    class DOUBLES(ADDON,player) {
        class functions {
            file = "functions";
            class ConfigPlayer;
        };
    };
    class SAF {
        #define SAF_FNCS
            #include "scripts\sushi_scripts\core\init.cpp"
            #include "scripts\sushi_scripts\breach\init.cpp"
        #undef SAF_FNCS
    };
};

/* 
preInit = 1;		// (formerly known as "forced") 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
postInit = 1;		// 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit", didJIP]
preStart = 1;		// 1 to call the function upon game start, before title screen, but after all addons are loaded (config.cpp only)
*/