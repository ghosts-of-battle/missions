/*
	Script: Make AI wait for player to get in
*/

_vehicle 		= _this select 0;
_showarrow		= _this select 1;

if (_showarrow) then {
	_base			= 3;
	_factor			= 0;
	_offset			= 0.01;
	_switch			= true;
	_arrow			= "Sign_Arrow_Green_F" createVehicle (Position _vehicle);
	while {(!(Player in _vehicle) and !TAXI_ABORT)} do {
		_arrow setPos [Position _vehicle select 0, Position _vehicle select 1, (Position _vehicle select 2) + (_base + _factor)];
		if (_switch) then { _factor = _factor + _offset; } else { _factor = _factor - _offset; };
		if (_factor > 3) then { _switch = false; };
		if (_factor < 0) then { _switch = true; };
	};
	deleteVehicle _arrow;
} else { 
	waitUntil {((Player in _vehicle) and !TAXI_ABORT)};
};

if (TAXI_ABORT) then { TAXI_ABORT = false; };

