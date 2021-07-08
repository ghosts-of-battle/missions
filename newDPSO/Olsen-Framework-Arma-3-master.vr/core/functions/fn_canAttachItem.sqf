/*
 * Author: Olsen
 *
 * Check if accessory can be attached.
 *
 * Arguments:
 * 0: unit <object>
 * 1: type <string>
 *
 * Return Value:
 * can attach <bool>
 *
 * Public: No
 */

#include "script_component.hpp"

params [
	["_weapon", "", [""]],
	["_item", "", [""]]
];

private _result = false;

{
	if (toLower _item isEqualTo toLower _x) exitWith {
		_result = true;
	};
} forEach ([_weapon] call BIS_fnc_compatibleItems);

_result