/*
	Script: Remove vehicle and driver
*/

_vehicle	= _this select 0;
{ deleteVehicle _x; } forEach crew _vehicle;deleteVehicle _vehicle;
