private ["_unit", "_stand"];
_unit = _this select 0;
_stand = _this select 1;

_unit setUnitPos _stand;
	
// =========================================================================================================
// EXITING SCRIPT
// =========================================================================================================	

	if (true) exitWith {};