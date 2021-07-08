_this spawn {
params ["_d","_s",["_force",false]];
private _d = _this select 0;  //target building
private _s = _this select 1;  //doors
private _b = _s;
	private _o = if (saf_mission_setting_breach_closeFix > 0) then { 0 } else { 1 };
	private _c = str(_s);
	if (((_c find "1a") > 0) || ((_c find  "1b") > 0)) then {
		_b = [format ["door_%1", 1]];
	};
	if (((_c find "2a") > 0) || ((_c find  "2b") > 0)) then {
		_b = [format ["door_%1", 2]];
	};
	if (((_c find "3a") > 0) || ((_c find  "3b") > 0)) then {
		_b = [format ["door_%1", 3]];
	};
{
	_d setVariable [format ["bis_disabled_%1", _x], 0, true];
} foreach _b;
{
	_d animate [_x, _o];
	_d setVariable [format ["bis_disabled_%1", _x], 0,true];
	sleep 0.1;
	if (_force) then {
		_d animate [_x,_o];
		sleep 0.5;
		_d animate [_x, _o];
	};
} foreach _s; //for each door
};
