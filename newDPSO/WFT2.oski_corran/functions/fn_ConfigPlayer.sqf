/*
Function: DPSO_fnc_ConfigPlayer

name:
	Used to configure basic player attributes and equipment.

Arguments:
	_unit - Player the setup is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>
	_Traits - Which Traits the player has, can be more than one. <ARRAY>
	_Loadout - Name of Loadout to call. Changes player equipment to Loadout from DPSO Funmentals. <STRING>

Examples:
	(begin example)
		[this] call DPSO_fnc_ConfigPlayer;
		["1 Section"] call DPSO_fnc_ConfigPlayer;
		[999"] call DPSO_fnc_ConfigPlayer;

choices:
		- DS990
		- bolo
		- DA991
		- DA992
		- DA993
		- DA994
		- DA995
		- DA996
		- DA997
		- DA998
		- DS999

	(end)

Author:
	MitchJC
*/

params ["_Section"];
waitUntil {alive player};

//==========let there be BIS_fnc_exportCfgPatches
[_Section] call DPSO_Mission_fnc_Patches;

//========ACE Player Traits
// Establish GOD NCO Mode!

player setVariable ["ace_medical_medicclass",1, true];
player setVariable ["ACE_isEOD",1, true];
player setVariable ["ace_isEngineer",1, true];
player setUnitTrait ["Medic",true];
player setUnitTrait ["Engineer",true];


//=========== Set Section
player setVariable ["DPSO_Section", _Section, true];



