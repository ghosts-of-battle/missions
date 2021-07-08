/*
* File: init.sqf
* Project: v.Cam_Lao_Nam
* File Created: Tuesday, 6th July 2021 7:29:18 pm
* Author: YonV (yonv@gmail.com)
* -----
* Last modified: Wednesday, 7th July 2021 6:06:29 pm
* modified By: YonV (yonv@gmail.com>)
*/

/****************************************************
* THIS FILE IS execUTED ON BOTH SERVER and CLIENTS *
****************************************************/

#include "script_component.hpp"

/* ----------------------------- inITIALIZATION ----------------------------- */

enableSaving [false, false];

/* -------------------------------------------------------------------------- */
/* inITIALIZinG MISSION */
/* -------------------------------------------------------------------------- */

/* ---------------------------------- DUDA ---------------------------------- */
/* execVM "scripts\duda\fn_advancedtowinginit.sqf";  // towing script
execVM "scripts\duda\fn_advancedSlingloadinginit.sqf";  // slingload script */

/* ----------------------------- addonfree radio ---------------------------- */
[]spawn compileFinal(preprocessFile"scripts\AFAR\init.sqf");

/* --------------- Shut the hell up - Mute orders and Reports -------------- */
{
    _x setspeaker "NoVoice"
} forEach playableunits;

enableSentences false;

/* ----------------------------------- HAS ---------------------------------- */
if (isServer) then {
    call compile preprocessFile "scripts\HAS\userConfig.sqf";
    call compile preprocessFile "scripts\HAS\HAS_fnc.sqf";
    [] call RYD_HAS_init;
};

/* ---------------------------------- ranks --------------------------------- */
private _ranks_CAPTAin = ["76561198412358897", "76561198028995919"];
private _ranks_COLONEL = [];
private _ranks_CorPorAL = ["76561198059703779", "76561198314980112", "76561198139809145", "76561198317296929", "76561198161159515", "76561198002245906", "76561198118045077", "76561198221746940", "76561197979314380"];
private _ranks_SERGEANT = ["76561197983622925", "76561198126006606", "76561198027195894", "76561198137829399"];
private _ranks_LIEUTENANT = ["76561198092031720", "76561198412358897"];
private _ranks_MAJor = ["76561198049209102", "76561198000002705", "76561198002438570", "76561198354925237"];

if (isDedicated) exitwith {};

if (hasinterface) then {
    _playerUID = getplayerUID player;
    
    switch (true) do {
        case (_playerUID in _ranks_CorPorAL) : {
            player setRank "CorPorAL";
        };
        case (_playerUID in _ranks_SERGEANT) : {
            player setRank "SERGEANT";
        };
        case (_playerUID in _ranks_LIEUTENANT) : {
            player setRank "LIEUTENANT";
        };
        case (_playerUID in _ranks_CAPTAin) : {
            player setRank "CAPTAin";
        };
        case (_playerUID in _ranks_MAJor) : {
            player setRank "MAJor";
        };
        case (_playerUID in _ranks_COLONEL) : {
            player setRank "COLONEL";
        };
        default {
            player setRank "private";
        };
    };
};