private _arr = _this select 3;
private _c4 = _arr select 0;
private _doorArr = _arr select 1;
private _b = _doorArr select 0;
private _s = _doorArr select 1;

/*
drop [
["\A3\data_f\ParticleEffects\Universal\Universal",16,2,32], 
"","Billboard", 1,(0.3 + random 0.1),
[0, 1,1],
[0, 0, 0],
0, 2, 1, 5,
[0.7,1.3],
[[1, 1, 1, -2],[1, 1, 1, -2],[1, 1, 1, -1],[1, 0.5, 1, -0]],
[5], 
1, 0, "", "", 
_c4];
*/
[getPos _c4] remoteExec ["SAF_fnc_breachStun"];
"SmallSecondary" createVehicle position _c4;
deleteVehicle _c4;
private _c = str(_s);
if (getDammage _b > 0.4) then {_b setDammage 0.4};
	if (((_c find "1a") > 0) || ((_c find  "1b") > 0)) then {
		_s = ["door_1a_rot", "door_1b_rot", "door_1a", "door_1b"];
	};
	if (((_c find "2a") > 0) || ((_c find  "2b") > 0)) then {
		_s = ["door_2a_rot", "door_2b_rot", "door_2a", "door_2b"];
	};
	if (((_c find "3a") > 0) || ((_c find  "3b") > 0)) then {	
		_s = ["door_3a_rot", "door_3b_rot", "door_3a", "door_3b"];
	};	
[_b,_s,true] spawn SAF_fnc_breachOpenDoor;