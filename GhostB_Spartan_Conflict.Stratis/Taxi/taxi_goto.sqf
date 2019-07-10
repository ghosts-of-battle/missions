/*
	Script: Creates waypoint with option to stop
*/

_unit	 		= _this select 0;
_vehicle 		= _this select 1;
_destination	= _this select 2;
_canstop		= _this select 3;

TAXI_ABORT		= false;
TAXI_MOVING 	= true;

// Enable action to abort
TAXI_MENUIDX2 = player addAction ["Stop TRANSPORT",
								 "TAXI_ABORT = true;
								  player removeAction TAXI_MENUIDX2;"];


_wp 		= (group _unit) addwaypoint	[_destination, 0];
_wp 		setWaypointType 		"MOVE";
_wp 		setWaypointBehaviour 	"SAFE";
_wp 		setWaypointStatements 	["true","TAXI_MOVING = false;"];

while {(TAXI_MOVING)} do {
	if (_canstop and TAXI_ABORT) then {
		TAXI_ABORT = false;
		TAXI_MOVING = false;
		_unit disableAI "MOVE";
		// Update waypoint, Wiki dictates removing will not make AI stop
		[(group _unit), (count (waypoints (group _unit))) - 1] setWPPos (Position _unit);
		_unit enableAI "MOVE";
	};
	_handler 	= [_unit,_vehicle] execVM "Taxi\taxi_driving.sqf";
	waitUntil { scriptDone _handler };
	sleep 1.5;
};

// Remove action if unused
if (!TAXI_ABORT) then { player removeAction TAXI_MENUIDX2; };
