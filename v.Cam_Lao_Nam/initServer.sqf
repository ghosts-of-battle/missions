/*
 * File: initServer.sqf
 * Project: v.Cam_Lao_Nam
 * File Created: Tuesday, 6th July 2021 7:29:18 pm
 * Author: YonV (yonv@gmail.com)
 * -----
 * Last Modified: Wednesday, 7th July 2021 6:02:56 pm
 * Modified By: YonV (yonv@gmail.com>)
 */


#include "script_component.hpp"

/****************************************************************************************
 *   INITSERVER --> MMF_CORE/DEFINES/START/START_MISSION --> "MMF_FNC_START_MISSION"    *
 * THIS FILE ESTABLISHES MISSION NAMESPACE VARIABLES AND BEGINS VARIOUS SERVER FEATURES *
 ****************************************************************************************/
[]call MMF_fnc_start_default;						//default arrays-- required


[objNull, 1, 0, true] call MMF_fnc_start_random;			//random time

/* ------------------------------ debug / misc ------------------------------ */
missionNameSpace setVariable ["MMF_unitLimit", 144];			//nemesis unit limit
missionNameSpace setVariable ["MMF_drawPath", true];			//show nemesis path / created path
missionNameSpace setVariable ["MMF_call_monitor", true];		//show common call vars, function names, FPS and Scripts 	(WIP)
missionNameSpace setVariable ["MMF_mil_pop", true];				//add mil units to autopop (uses nemesis type)
missionNameSpace setVariable ["MMF_dynamic_sim", true];			//do dynamic simulation (must be enabled in mission)

/* ---------- custom code block, scheduled begins at mission start ---------- */
MMF_injector={

//add custom script...

};

/*************************************************************************************
 * CENTER CAN BE PLAYER, (ALLPLAYERS SELECT 0), OBJECT, VEHICLE, TRIGGER, NOT MARKER *
 *************************************************************************************/
private _text= format ["DPSO MISSION MAKER FRAMEWORK version %1", "0081"];
[
_BADGUYS,													//object treated as center
[_text, "BLACK FADED", 0.3],								//intro message, type, time (0.1 = 1 second)
[true, 5000, [], MMF_PAVN, [false, 500], true], 			//nemesis [enable, area, array, enemy, [killpnts, val], wounding]
true,														//dynamic weather
[true, 3, 300],												//[flaming wrecks, amount, area]
true														//auto population
] call MMF_fnc_start_mission;
