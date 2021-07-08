#define COMPONENT FW
#include "script_macros.hpp"

#ifdef description
	#include "dia\rscdefinitions.hpp" //Must have for the end screen to work, if removed Arma 3 will crash on mission load
	cba_settings_hasSettingsFile = 0; // load cba settings from cba_settings.sqf

	forceRotorLibSimulation = 1; // Enable/ disable AFM  0 - options based; 1 - force enable; 2 - force disable

	//disableChannels[] = {0,1,2,3,4,5,6};
	joinUnassigned = 1;		// <!-- Where 0 forces joining players into the first empty slot, 1 leaves them to select their own
	showGPS = 0;

	// Respawn settings
	respawn = "BASE"; //Do not change, spectator script needs people to respawn, to be declared as dead and put into spectator mode
	respawnButton = 1; //Disables the respawn button
	respawndelay = 5; //5 seconds are needed to make sure people properly die and go into spectator
	respawnDialog = 0; //Disables the score screen while respawning
	respawnOnStart = -1;
    respawnTemplates[] = {"Base"}; //Disables respawn countdown

	ReviveMode = 0;                         //0: disabled, 1: enabled, 2: controlled by player attributes
	ReviveUnconsciousStateMode = 0;         //0: basic, 1: advanced, 2: realistic
	ReviveRequiredTrait = 0;                //0: none, 1: medic trait is required
	ReviveRequiredItems = 1;                //0: none, 1: medkit, 2: medkit or first aid kit
	ReviveRequiredItemsFakConsumed = 1;     //0: first aid kit is not consumed upon revive, 1: first aid kit is consumed
	ReviveDelay = 60;                       //time needed to revive someone (in secs)
	ReviveMedicSpeedMultiplier = 4;         //speed multiplier for revive performed by medic
	ReviveForceRespawnDelay = 10;           //time needed to perform force respawn (in secs)
	ReviveBleedOutDelay = 180;              //unconscious state duration (in secs)

	enablePlayerAddRespawn = 1;

	corpseManagerMode = 0;
	wreckManagerMode = 0;

	// AI & debug
	disabledAI = 1;  // <!-- Where 0 Fills empty playable slots with AI, 1 is They Don't fill the empty slots
	enableDebugConsole = 1;		// <!-- Enable the debug console where (0=disabled),(1=Admins Only),(2=Everyone) DO NOT SET AS 2!
	enableTargetDebug = 1;

    #include "core\scripts\R3F\LOG\desc_include.h"



	class CfgDebriefingSections {
		class acex_killTracker {
			title = "Acex Killed Events";
			variable = "acex_killTracker_outputText";
		};
	};

	class Extended_DisplayLoad_EventHandlers {
	    class RscDisplayLoading {
	        GVAR(customLoadingScreen) = QUOTE(_this call FUNC(initLoadingScreen));
	    };
		class RscDisplayEGSpectator {
	        GVAR(customLoadingScreen) = QUOTE(_this call FUNC(initSpectateScreen));
	    };
		class RscDisplayMission {
	        GVAR(missionLoaded) = QUOTE(_this call FUNC(initSafeStart));
	    };
		class RscDisplayCamera {
	        GVAR(startedCamera) = QUOTE(_this call FUNC(initCamera));
	    };
	};

#endif

#ifdef description_titles
	#include "dia\debug\dia_debug.hpp"
	#include "dia\endscreen\dia_endscreen.hpp"
#endif

#ifdef description_functions
	#include "CfgFunctions.hpp"
#endif

#ifdef description_XEH_PreInit
	class Mission {
		serverInit = "call compile preprocessFileLineNumbers 'core\preinitServer.sqf'";
		init = "call compile preprocessFileLineNumbers 'core\preinit.sqf'";
		clientInit = "call compile preprocessFileLineNumbers 'core\preinitClient.sqf'";
	};
#endif

#ifdef description_XEH_PostInit
	class Mission {
		serverInit = "call compile preprocessFileLineNumbers 'core\postInitServer.sqf'";
		init = "call compile preprocessFileLineNumbers 'core\postInit.sqf'";
		clientInit = "call compile preprocessFileLineNumbers 'core\postInitClient.sqf'";
	};
#endif

#ifdef description_XEH_InitPost_CAManBase
	class GVAR(Core) {
		init = QUOTE(_this call FUNC(initCAManBase));
	};
#endif

#ifdef description_XEH_Killed_CAManBase
	class GVAR(Core) {
		killed = QUOTE(_this call FUNC(killedCAManBase));
	};
#endif

#ifdef description_XEH_Respawn_CAManBase
	class GVAR(Core) {
		respawn = QUOTE(_this call FUNC(respawnCAManBase));
	};
#endif
