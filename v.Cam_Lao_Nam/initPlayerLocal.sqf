/*
 * File: initPlayerLocal.sqf
 * Project: v.Cam_Lao_Nam
 * File Created: Tuesday, 6th July 2021 7:29:18 pm
 * Author: YonV (yonv@gmail.com)
 * -----
 * Last Modified: Wednesday, 7th July 2021 5:59:23 pm
 * Modified By: YonV (yonv@gmail.com>)
 */

/************************************
 * THIS FILE IS EXECUTED ON CLIENTS *
 ************************************/
#include "script_component.hpp"

/* --------------------------- INITIALIZING PLAYER -------------------------- */


/* ---------------------- INITIALIZING PLAYER'S STANCE ---------------------- */
player setVariable ["isSitting", false, true];
player switchMove "";


/* --------------------------- INITIALIZING PLAYER -------------------------- */

/* --------------- Shut the hell up  - Mute Orders and Reports -------------- */
{_x setSpeaker "NoVoice"} forEach allUnits;

enableSentences false;

/*************************************************************************************
 *          MMF_CORE/DEFINES/START/START_PLAYER --> "MMF_FNC_START_PLAYER"           *
 * THIS FILE ESTABLISHES CLIENT NAMESPACE VARIABLES AND BEGINS VARIOUS LOCAL EFFECTS *
 *************************************************************************************/


params ["_player", "_didJIP"];

[]call MMF_fnc_start_default;						//default arrays-- required


/* ------------------------------ local effects ----------------------------- */
/* ------------------------ configure as per comments ----------------------- */

_player call MMF_fnc_handle_damage;									//damage effects, **to disable call on objNull**
[] call MMF_fnc_colorSpace;											//dynamic color space
_player call MMF_fnc_car_controls;									//start radio on vehicle enter
[_player, 0, 0, false, 0] call MMF_fnc_start_random;				//random location / start up routine (see functions instructions)
_player setVariable ["MMF_can_build", true];						//enable build menu (MP/SP) --> false to disable

/******************************************************************************
 * CUSTOM CODE BLOCK, SCHEDULED BEGINS AT MISSION START -- "_THIS" IS _PLAYER *
 *                               MMF_INJ_PLAY={                               *
 ******************************************************************************/

MMF_inj_play={
	[_this, side _this] spawn MMF_fnc_startCompanion;			//start companion (disabled in MP)
};

/* -------------------------------- SP start -------------------------------- */
[
	[
	_player,											//unit is a player
	"DA 991",											//group ID (can be empty string)
	[true, _player, 0, 300, [10000, 10], "OFF"]			//[enable base, base object, loot box #, loot area, [$, res], auto-crew]
	]													//base object may be static, unit, veh // auto-crew "OFF", "ON", "PER"	
] call MMF_fnc_start_player;							//base services disabled in MP


