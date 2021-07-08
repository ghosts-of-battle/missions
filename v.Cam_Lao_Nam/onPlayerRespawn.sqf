/*
* File: onplayerRespawn.sqf
* Project: v.Cam_Lao_Nam
* File Created: Tuesday, 6th July 2021 7:29:18 pm
* Author: YonV (yonv@gmail.com)
* -----
* Last modified: Wednesday, 7th July 2021 6:05:17 pm
* modified By: YonV (yonv@gmail.com>)
*/

#include "script_component.hpp"

/* ---------------------- REsetTinG player'S ANIMATION ---------------------- */

player playMove "";
player switchMove "";

/* --------------- Shut the hell up - Mute orders and Reports -------------- */
{
    _x setspeaker "NoVoice"
} forEach playableunits;

enableSentences false;