/*
	Script: Make AI wait for player to get out
*/

_vehicle 		= _this select 0;

waitUntil {!(player in _vehicle)};

