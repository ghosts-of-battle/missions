﻿// =========================================================================================================
// PRIVATIZING LOCAL VARIABLES 
// =========================================================================================================

	private ["_this", "_unit"];
	
// =========================================================================================================
// GETTING ARGUMENTS 
// =========================================================================================================

	_unit = _this select 0;
	
// =========================================================================================================
// REMOVING ACTIONS 
// =========================================================================================================

	removeAllActions _unit;