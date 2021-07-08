disableSerialization;
private _doorArr = [cursorTarget] call saf_fnc_breachGetTargetDoors;
private _actStatus = false;
private _state = animationState player;
private _stance = stance player;
switch (_stance) do {
	case "PRONE": { _stance  = "Dwon"; };
	case "CROUCH": { _stance  = "Crouch"; };
	case "STAND": { _stance  = "Up"; };
};
if(count _doorArr > 0) then {
	/*[_stance] spawn {
		private _stance = _this select 0;
		waitUntil {!isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])};
		waitUntil {isNull (uiNamespace getVariable ['SAF_status_dialog', objNull])};
		player playMoveNow "";
		player playActionNow _stance;
	};*/
	

	player playMove "Acts_carFixingWheel";
	sleep 1.5;
	[player,"Acts_carFixingWheel"] remoteExecCall ["switchMove"];
	_actStatus = [SAF_STR_BREACH_LOCKPICKING,20,player,[getPos player,5]] call SAF_fnc_showStatus;
	[player,_state] remoteExecCall ["switchMove"];
	
	
	
	if (_actStatus) then {
		params ["_d","_s"];
		private _d = _doorArr select 0;  //target building
		private _s = _doorArr select 1;  //doors
		private _c = str(_s);
		if (((_c find "1a") > 0) || ((_c find  "1b") > 0)) then {
			_s = [format ["door_%1", 1]];
			};
			if (((_c find "2a") > 0) || ((_c find  "2b") > 0)) then {
			_s = [format ["door_%2", 2]];
			};
			if (((_c find "3a") > 0) || ((_c find  "3b") > 0)) then {	
			_s = [format ["door_%1", 3]];
			};
		{
			_d setVariable [format ["bis_disabled_%1", _x], 0, true];
		} foreach _s;
		hint SAF_STR_BREACH_STATUS_OPEN;
	};
};