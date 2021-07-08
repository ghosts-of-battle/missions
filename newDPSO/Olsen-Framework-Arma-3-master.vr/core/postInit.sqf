#include "script_macros.hpp"

#define postInit
#define framework

enableSaving [false, false];

if (GETMVAR(testingDisableFriendlyAI,false)) then {
    if !(isMultiplayer) then {
    	switchableUnits select {!isPlayer _x && {side _x isEqualTo side player}} apply {
    		private _unit = _x;
    		_unit disableAI "ALL";
    		_unit forceSpeed 0;
    	};
    };
};

#include "..\customization\inits\PostInitGlobal.sqf" //DO NOT REMOVE
#include "..\modules\modules.sqf" //DO NOT REMOVE


////////////////////////////////////////////////////////////////////////////////
// INITIALIZING MISSION
////////////////////////////////////////////////////////////////////////////////

// R3F
execVM "core\scripts\R3F\LOG\init.sqf"; Server setVariable ["R3F_LOG_disabled", true]; // logistic script

// DUDA
execVM "core\scripts\duda\fn_advancedTowingInit.sqf"; // towing script
execVM "core\scripts\duda\fn_advancedSlingLoadingInit.sqf"; // towing script

// BANGABOB
null = allUnits execVM "core\scripts\BangaBob\dragDeadBody\H8_dragBody.sqf"; // DRAG DEAD BODY SCRIPT

// SHACKTAC
if ((!isClass (configFile >> "CfgPatches" >> "ace_interaction")) && (isMultiplayer)) then {if (isServer) then {execVM "core\scripts\ShackTac\MapGestures\serverInit.sqf"}; if (!isDedicated) then {execVM "core\scripts\ShackTac\MapGestures\clientInit.sqf"}}; // map gestures

////////////////////////////////////////////////////////////////////////////////
// Disable Ambient Animals
////////////////////////////////////////////////////////////////////////////////

[{time > 0}, {enableEnvironment [false, false];}] call CBA_fnc_waitUntilAndExecute;

////////////////////////////////////////////////////////////////////////////////
// Shut the hell up  - Mute Orders and Reports
////////////////////////////////////////////////////////////////////////////////

{_x setSpeaker "NoVoice"} forEach playableUnits;

enableSentences false;

////////////////////////////////////////////////////////////////////////////////
// INITIALIZING ARTILLERY COMPUTER FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

enableEngineArtillery false;

////////////////////////////////////////////////////////////////////////////////
// Werthles Headless Script Parameters v2.3
// 1. Repeating - true/Once - false,
// 2. Time between repeats (seconds),
// 3. Debug available for all - true/Just available for admin/host - false,
// 4. Advanced balancing - true/Simple balancing - false,
// 5. Delay before executing (seconds),
// 6. Additional syncing time between groups transferred to try to reduce bad unit transfer caused by desyncs (seconds)
// 7. Display an initial setup report after the first cycle, showing the number of units moved to HCs,
// 8. Addition phrases to look for when checking whether to ignore.
// Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for these phrases
// Format:
// ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
// E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"] (including ""s)
// Specifying "B_Heli" would stop all units with that class type from transferring to HCs
// However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored
////////////////////////////////////////////////////////////////////////////////

[true,30,false,true,30,3,true,[]] execVM "core\scripts\WerthlesHeadless\WerthlesHeadless.sqf";

////////////////////////////////////////////////////////////////////////////////
// Alive
////////////////////////////////////////////////////////////////////////////////

/*
_alivetask =[] execVM "staticData.sqf";
waitUntil {scriptDone _alivetask};

waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};
waitUntil {!isNil "ALIVE_profileSystemInit"};
waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};
*/

////////////////////////////////////////////////////////////////////////////////
// zbe Cache
////////////////////////////////////////////////////////////////////////////////
//[AiCacheDistance(players),TargetFPS(-1 for Auto),Debug,CarCacheDistance,AirCacheDistance,BoatCacheDistance]execvm "zbe_cache\main.sqf";

if (isServer) then {[2400,-1,DPSO_debug,2400,2400,2400]execvm "core\scripts\zbe_cache\main.sqf"};


////////////////////////////////////////////////////////////////////////////////
// voyagerCompass
////////////////////////////////////////////////////////////////////////////////

_x = [] execVM "core\scripts\voyagerCompass\fn_voyagerCompass1_1.sqf";
