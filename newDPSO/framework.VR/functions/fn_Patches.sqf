/*
Function: DPSO_fnc_Patches

Description:
	Apply Section Patches to Players/Vehicles

Arguments:
	player - Player the Patch is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>

Examples:
	(begin example)
		[this, "1Section"] call DPSO_fnc_Patches;
	(end)

Author:
	MitchJC
*/

params ["_Section"];

private ["_PatchClass"];
call {
	if (_Section == "DS990") exitwith {_PatchClass = "DS990";};
	if (_Section == "DA991") exitwith {_PatchClass = "DA991";};
	if (_Section == "DA992") exitwith {_PatchClass = "DA992";};
	if (_Section == "DA993") exitwith {_PatchClass = "DA993";};
	if (_Section == "DA994") exitwith {_PatchClass = "DA994";};
	if (_Section == "DA995") exitwith {_PatchClass = "DA995";};
	if (_Section == "DA996") exitwith {_PatchClass = "DA996";};
	if (_Section == "DA997") exitwith {_PatchClass = "DA997";};
	if (_Section == "DA998") exitwith {_PatchClass = "DA998";};
	if (_Section == "DS999") exitwith {_PatchClass = "DS999";};
	_PatchClass = "bolo";
};

// ===== Apply the Patch to player.

[BIS_fnc_setUnitInsignia, [player,_PatchClass], 5] call CBA_fnc_waitAndExecute;

// ======= When Player Repsawns, apply the patch they had when they died.
player addEventHandler ["Respawn", {
	params [player, "_corpse"];
	_OldPatch = _corpse call BIS_fnc_getUnitInsignia;

	[player, ""] call BIS_fnc_setUnitInsignia;
	[BIS_fnc_setUnitInsignia, [player,_OldPatch], 5] call CBA_fnc_waitAndExecute;
}];
