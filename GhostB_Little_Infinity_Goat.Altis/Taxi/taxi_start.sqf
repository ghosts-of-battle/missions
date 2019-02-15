/*
	Script: Process Caller
	
*/

_object 		= _this select 0;
_caller 		= _this select 1;
_idx 			= _this select 2;
_spawn			= getMarkerPos TAXI_MARKERNAME;

// Remove action entry
player removeAction TAXI_MENUIDX1;

// getMarkerPos returns 0,0,0 if no marker present
// Now if only someone was actually at 0,0,0 ... :P
if (!(_spawn isEqualTo [0,0,0])) then {
	TAXI_BUSY	= true;
	_driver		= TAXI_DRIVERS select (floor random (count TAXI_DRIVERS));
	_vehicle	= TAXI_VEHICLES select (floor random (count TAXI_VEHICLES));
	_null		= [_object,_spawn,_vehicle,_driver] execVM "Taxi\taxi_loop.sqf";
} else {
	hint "Could not find taxi marker!";
};
