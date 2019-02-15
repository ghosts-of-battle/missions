/*
	Script: Executed while vehicle is on the move
*/

_unit			= _this select 0;
_vehicle		= _this select 1;


/*
	Little test snipplet to make AI abide by traffic laws and rules
	
*/

_seenObjects	= [];
_trafficSigns	= ["CUP_sign_speed20","CUP_signT_SpeedLimit50","CUP_signT_SpeedLimit80"];

{ _seenObjects pushBack (typeOf _x); } forEach (nearestObjects [_vehicle, _trafficSigns, 25]); 
if ("CUP_sign_speed20" in _seenObjects) then { _vehicle limitSpeed 20; };
if ("CUP_SignT_SpeedLimit50" in _seenObjects) then { _vehicle limitSpeed 50; };
if ("CUP_SignT_SpeedLimit80" in _seenObjects) then { _vehicle limitSpeed 80; };


