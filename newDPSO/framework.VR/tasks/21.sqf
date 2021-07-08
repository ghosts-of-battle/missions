// =========================================================================================================
// TASK ID : 			21
// TASK OBJECTIVE :		PROTECT A CHOPPER WHILE IT'S REPAIRED BY ITS PILOTS
// TASK CREATOR : 		GEMINI (gemini.69@free.fr)
// =========================================================================================================

// =========================================================================================================
// STARTING TASK CREATION
// =========================================================================================================

	private _unit = player;
	["hint", "STR_hint_creatingTask"] remoteExec ["Gemini_fnc_globalHint", _unit];

// =========================================================================================================
// CREATING TASK ON THE SERVER
// =========================================================================================================

	if (!isServer) exitWith {};

// =========================================================================================================
// GETTING MAIN VARIABLES
// =========================================================================================================

	private _debug = DPSO_debug;
	DPSO_taskID = _this select 0; publicVariable "DPSO_taskID";
	DPSO_assignedTask = true; publicVariable "DPSO_assignedTask";

// =========================================================================================================
// DEFINING TASK POSITION(S)
// =========================================================================================================

	// LOOKING FOR AN RANDOM POSITION
	private _chopperPos = ["land", DPSO_mapCenter, 0, DPSO_mapRadius, 12.5] call Gemini_fnc_findPos;
	if (_chopperPos isEqualTo [0,0,0]) exitWith {["hint", "STR_hint_noTaskPos"] remoteExec ["Gemini_fnc_globalHint"]; [] remoteExec ["Gemini_fnc_taskReset"]};

// =========================================================================================================
// SPAWNING OBJECTIVE
// =========================================================================================================

	// CLEARING THE AREA IN CASE ENEMIES ARE ALREADY NEARBY
	{if ((side _x == DPSO_enemy_side1) && (_x distance _chopperPos < 1000)) then {deleteVehicle _x}} forEach allUnits;

	// SPAWNING CHOPPER
	private _chopper = [selectRandom DPSO_friendly_smallCombatHelicopters, _chopperPos, 0, true, "task"] call Gemini_fnc_createVehicle;
	_chopper setDamage 0;
	_chopper lock 3;

	// CREATING SMOKE SFX
	private _smoke = ["test_EmptyObjectForSmoke", _chopperPos, 0, true, "task"] call Gemini_fnc_createVehicle;
	_smoke attachTo [_chopper, [0,0,0]];

	// SPAWNING PILOT
	private _pilot = [DPSO_friendly_side1, grpNull, [DPSO_friendly_chopper_pilot], [(_chopperPos select 0) + 25, _chopperPos select 1, 0], DPSO_friendly_AIskill, false, "task"] call Gemini_fnc_createUnit;
	_pilot disableAI "move";
	//_pilot setPosATL [getPos _pilot select 0, getPos _pilot select 1, 0];
	removeAllAssignedItems _pilot;
	removeBackpack _pilot;
	//removeHeadgear _pilot;

	// SPAWNING COPILOT
	private _copilot = [DPSO_friendly_side1, grpNull, [DPSO_friendly_chopper_pilot], [(_chopperPos select 0) + 25, _chopperPos select 1, 0], DPSO_friendly_AIskill, false, "task"] call Gemini_fnc_createUnit;
	_copilot disableAI "move";
	//_copilot setPosATL [getPos _copilot select 0, getPos _copilot select 1, 0];
	removeAllAssignedItems _copilot;
	removeBackpack _copilot;
	//removeHeadgear _copilot;
	_copilot setUnitPos "middle";

	// ADJUSTING PILOT & COPILOT POSITION
	[_chopper, _pilot, _copilot] spawn
		{
			private _chopper = _this select 0;
			private _pilot = _this select 1;
			private _copilot = _this select 2;
			sleep 1;
			[_chopper, _pilot, [-1.2, -0.25, 0.0], (getDir _chopper) + 90, true, true] call BIS_fnc_relPosObject;
			[_pilot, _copilot, [-2.5, -2.5, 0.0], 180, true, true] call BIS_fnc_relPosObject;
			_pilot setPosATL [getPos _pilot select 0, getPos _pilot select 1, 0];
			_copilot setPosATL [getPos _copilot select 0, getPos _copilot select 1, 0];
			{_x setDamage 0} forEach [_pilot, _copilot];
			0 = _pilot spawn {sleep 3; [[_this, "REPAIR_VEH_STAND"], BIS_fnc_ambientAnim] remoteExec ["call", 0, _this]; waitUntil {!alive _this}; [_this, BIS_fnc_ambientAnim__terminate] remoteExec ["call", 0, _this]};
		};

	// SPAWNING A CHEMLIGHT
	if (DPSO_sunHeight < 0) then
		{
			private _chemlight = createMine ["placed_chemlight_blue", position _pilot, [], 0];
			[_pilot, _chemlight, [-0.5,0.0,0], 0, true, true] call BIS_fnc_relPosObject;
		};

// =========================================================================================================
// SPAWNING ENEMIES
// =========================================================================================================

	_chopperPos spawn
		{
			private _chopperPos = _this;

			// WAIT UNTIL AT LEAST 1 PLAYER REACHES THE CHOPPER POSITION
			waitUntil {(!DPSO_assignedTask) || ({_chopperPos distance _x < 100} count (playableUnits + switchableUnits) > 0)};

			// SPAWNING ENEMY SQUAD(S) AROUND THE CHOPPER, MOVING TO ITS POSITION
			if (DPSO_assignedTask) then
				{
					for "_i" from 1 to (selectRandom [1,2,3,4,5]) do
						{
							[DPSO_enemy_side1, ["infantry", "infantry", "infantry", "infantry", "infantry", "infantry", "infantry", "motorized", "armored"], -1, _chopperPos, [500, 1000], "attack", _chopperPos, DPSO_enemy_AIskill, 75, "task"] call Gemini_fnc_spawnSquad;
						};
				};
		};

// =========================================================================================================
// CREATING MARKERS
// =========================================================================================================

	// MARKER TYPE & TEXT
	"taskMarker_A" setMarkerPos _chopperPos;
	"taskMarker_A" setMarkerType "mil_warning";
	"taskMarker_A" setMarkerSize [1,1];
	"taskMarker_A" setMarkerColor "colorOrange";
	"taskMarker_A" setMarkerAlpha 1;
	["taskMarker_A", (format ["STR_taskObjective_" + DPSO_taskID])] remoteExec ["Gemini_fnc_setMarkerText"];

// =========================================================================================================
// DEFINING CONDITIONS OF VICTORY
// =========================================================================================================

	// TASK SUCCEEDED IF CHOPPER IS ALIVE AND FLYING FAR WITH ITS CREW
	[_chopper, _pilot, _copilot, _smoke, _chopperPos] spawn
		{
			private _chopper = _this select 0;
			private _pilot = _this select 1;
			private _copilot = _this select 2;
			private _smoke = _this select 3;
			private _chopperPos = _this select 4;

			// WAIT UNTIL AT LEAST 1 PLAYER REACHES THE CHOPPER POSITION
			waitUntil {(!DPSO_assignedTask) || ({_chopperPos distance _x < 100} count (playableUnits + switchableUnits) > 0)};

			// REPAIRING
			private ["_timer"];
			if (DPSO_debug) then {_timer = 475} else {_timer = 0};
			while {DPSO_assignedTask && _timer < 500} do {sleep 1; _timer = _timer + 1};

			// TAKING OFF
			if (DPSO_assignedTask && canMove _chopper && canMove _pilot && canMove _copilot) then
				{
					deleteVehicle _smoke;
					_pilot enableAI "move";
					_copilot enableAI "move";
					[_pilot, BIS_fnc_ambientAnim__terminate] remoteExec ["call", 0, _pilot];
					_pilot setUnitPos "up";
					_copilot setUnitPos "up";
					private ["_squad", "_wp1"];
					_squad = group _pilot;
					[_copilot] joinSilent _squad;
					_squad setSpeedMode "full"; _squad setSpeedMode "full";
					_wp1 = _squad addWaypoint [position _chopper, 0];
					_wp1 setWaypointType "getin";
					_wp1 waypointAttachVehicle _chopper;
					[_pilot, _copilot] orderGetIn true;
					waitUntil {!DPSO_assignedTask || !canMove _chopper || !canMove _pilot || !canMove _copilot || (_pilot in _chopper && _copilot in _chopper)};
					if (DPSO_assignedTask && canMove _chopper && canMove _pilot && canMove _copilot && _pilot in _chopper && _copilot in _chopper) then {(units group _pilot) doMove [0,0,250]};
					waitUntil {!DPSO_assignedTask || !canMove _chopper || !canMove _pilot || !canMove _copilot || (getPosATL _chopper select 2 > 50)};
					if (DPSO_assignedTask && (!canMove _chopper)) then {[] spawn Gemini_fnc_taskFailed};
					if (canMove _chopper) then {_chopper allowDamage false};
					waitUntil {!DPSO_assignedTask || (_chopper distance2D _chopperPos > 500)};
					if (DPSO_assignedTask && canMove _chopper && canMove _pilot && canMove _copilot && _pilot in _chopper && _copilot in _chopper && (_chopper distance2D _chopperPos > 500)) then
						{
							[] remoteExec ["Gemini_fnc_taskSucceeded"];
							["support", "airAssistance"] call Gemini_fnc_bonus;
							sleep 10;
							_chopper flyInHeight 250;
							sleep 10;
							deleteVehicle _chopper;
							deleteVehicle _pilot;
							deleteVehicle _copilot;
						};
				};
			};

// =========================================================================================================
// DEFINING CONDITIONS OF DEFEAT
// =========================================================================================================

	// TASK FAILED IF CHOPPER IS DESTROYED OR IF PILOT AND/OR COPILOT ARE DEAD
	_chopper addMPEventHandler ["MPkilled", {if (DPSO_assignedTask) then {[] spawn Gemini_fnc_taskFailed}}];
	_pilot addMPEventHandler ["MPkilled", {if (DPSO_assignedTask) then {[] spawn Gemini_fnc_taskFailed}}];
	_copilot addMPEventHandler ["MPkilled", {if (DPSO_assignedTask) then {[] spawn Gemini_fnc_taskFailed}}];

// =========================================================================================================
// UPDATING DIARY
// =========================================================================================================

	[DPSO_taskID, "move", "taskMarker_A"] remoteExec ["Gemini_fnc_taskAssigned"];

// =========================================================================================================
// PLAYING AMBIENT MUSIC
// =========================================================================================================

	["punchy"] remoteExec ["Gemini_fnc_playMusic"]; // music type can be: "punchy", "calm", "stealth", "sad", "oriental", "tropical" or a specific music classname

// =========================================================================================================
// DEBUGGING
// =========================================================================================================

	if (_debug) then
		{
			pilot_21 = _pilot;
			copilot_21 = _copilot;
			chopper_21 = _chopper;
			[_pilot, "mil_warning", "ColorBlue", "CHOPPER", "task"] call Gemini_fnc_createMarker;
		};