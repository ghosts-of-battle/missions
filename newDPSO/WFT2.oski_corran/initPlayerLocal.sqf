////////////////////////////////////////////////////////////////////////////////
//                           initPlayerLocal.sqf                              //
//                     this file is executed on clients                       //
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////==
// INITIALIZING PLAYER
////////////////////////////////////////////////////////////////////////////////==

// INITIALIZING PLAYER'S STANCE
player setVariable ["isSitting", false, true];
player switchMove "";

// INITIALIZING DYNAMIC GROUPS
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

////////////////////////////////////////////////////////////////////////////////
// kill the rabbits 
////////////////////////////////////////////////////////////////////////////////

// Disable Ambient Animals
[{time > 0}, {enableEnvironment [false, true];}] call CBA_fnc_waitUntilAndExecute;

////////////////////////////////////////////////////////////////////////////////
// INITIALIZING PLAYER
////////////////////////////////////////////////////////////////////////////////
// Shut the hell up  - Mute Orders and Reports
{_x setSpeaker "NoVoice"} forEach allUnits;

enableSentences false;

#include "script_component.hpp"
/*
* Author: DPSO
* Initialization of scripts local to player
* Executed locally when player joins mission (includes both mission start and JIP)
* Executed after initServer and before initPlayerServer and init.
*
* Arguments:
* 0: Player <OBJECT>
* 1: Did JIP <BOOL>
*
* Return Value:
* None
*
* Example:
* None
*/

params ["_player", "_didJIP"];

player setUnitRank "SERGEANT";
player setVariable ["ace_medical_medicclass",1, true];
player setVariable ["ACE_isEOD",1, true];
player setVariable ["ace_isEngineer",1, true];
player setUnitTrait ["Medic",true];
player setUnitTrait ["Engineer",true];


#include "scripts\helotaxi\helotaxi.sqf"