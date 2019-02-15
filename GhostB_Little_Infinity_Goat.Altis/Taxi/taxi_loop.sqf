/*
	Script: Executes the spawn and waypoints

*/

_source		= _this select 0;
_spawn 		= _this select 1;
_vref		= _this select 2;
_uref		= _this select 3;

hint "TRANSPORT call received, please wait...";

// Setup Vehicle
_vehicle	= _vref createVehicle _spawn;
_vehicle 	setVariable ["BIS_enableRandomization",false];
if (TAXI_SPEEDLIMIT > -1) then { _vehicle 	limitSpeed TAXI_SPEEDLIMIT; };

// Setup unit
_group 		= createGroup civilian;
_driver 	= _group createUnit [_uref, [0,0,0], [], 0, "NONE"];
_group		setBehaviour "SAFE";
_driver 	MoveInDriver _vehicle;

// Give driver destination
_handler 	= [_driver,_vehicle,(Position player),true] execVM "Taxi\taxi_goto.sqf";
waitUntil { scriptDone _handler };

// Wait for player to get in
_handler 	= [_vehicle,true] execVM "Taxi\taxi_getin.sqf";
waitUntil { scriptDone _handler };

// Open map wait for player input
openMap	True;
TAXI_HASLOCATION = false;
onMapSingleClick 	"TAXI_DESTINATION = _pos;
					onMapSingleClick '';
					openMap false;
					TAXI_HASLOCATION = true;
					true";

waitUntil 	{TAXI_HASLOCATION};

// Give AI destination
_handler 	= [_driver,_vehicle,TAXI_DESTINATION,true] execVM "Taxi\taxi_goto.sqf";
waitUntil { scriptDone _handler };

// Wait for player to get out
_handler 	= [_vehicle] execVM "Taxi\taxi_getout.sqf";
waitUntil { scriptDone _handler };

// Enable taxi service again
TAXI_BUSY 	= false;

// You could simulate taxi driving away insead and then removal...

_null 	= [_vehicle] execVM "Taxi\taxi_remove.sqf";
