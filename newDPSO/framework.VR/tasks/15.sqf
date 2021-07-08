// =========================================================================================================
// TASK ID : 			15
// TASK OBJECTIVE :		CAPTURE OR KILL THE ATTACKS INSTIGATOR
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
// LOOKING FOR TASK POSITION(S)
// =========================================================================================================

	// LOOKING FOR A RANDOM BUILDING
	private _buildingPos = ["building", DPSO_mapCenter, 0, DPSO_mapRadius] call Gemini_fnc_findPos;
	private _building = nearestBuilding _buildingPos;
	private _instigatorPos = if (count ([_building] call BIS_fnc_buildingPositions) > 0) then {selectRandom ([_building] call BIS_fnc_buildingPositions)} else {["hint", "STR_hint_noTaskPos"] remoteExec ["Gemini_fnc_globalHint"]; [] remoteExec ["Gemini_fnc_taskReset"]};
	if (_instigatorPos isEqualTo [0,0,0]) exitWith {["hint", "STR_hint_noTaskPos"] remoteExec ["Gemini_fnc_globalHint"]; [] remoteExec ["Gemini_fnc_taskReset"]};

// =========================================================================================================
// CREATING MARKERS
// =========================================================================================================

	// MARKER AREA
	"TaskMarker_A" setMarkerPos [(_buildingPos select 0) + random 100 - random 100, (_buildingPos select 1) + random 100 - random 100];
	"TaskMarker_A" setMarkerShape "ellipse";
	"TaskMarker_A" setMarkerBrush "FDiagonal";
	"TaskMarker_A" setMarkerSize [125,125];
	"TaskMarker_A" setMarkerColor "colorRed";
	"TaskMarker_A" setMarkerAlpha 0.75;

	// MARKER TYPE & TEXT
	"TaskMarker_B" setMarkerPos (getMarkerPos "TaskMarker_A");
	"TaskMarker_B" setMarkerType "mil_destroy";
	"TaskMarker_B" setMarkerSize [1,1];
	"TaskMarker_B" setMarkerColor "colorRed";
	"TaskMarker_B" setMarkerAlpha 1;
	["TaskMarker_B", (format ["STR_taskObjective_" + DPSO_taskID])] remoteExec ["Gemini_fnc_setMarkerText"];

// =========================================================================================================
// UPDATING DIARY
// =========================================================================================================

	[DPSO_taskID, "kill", "TaskMarker_A"] remoteExec ["Gemini_fnc_taskAssigned"];

// =========================================================================================================
// PLAYING AMBIENT MUSIC
// =========================================================================================================

	["stealth"] remoteExec ["Gemini_fnc_playMusic"]; // music type can be: "punchy", "calm", "stealth", "sad", "oriental", "jungle" or a specific music classname

// =========================================================================================================
// SPAWNING OBJECTIVE
// =========================================================================================================

	// SPAWNING INSTIGATOR
	private _instigator = [DPSO_enemy_side1, grpNull, [DPSO_enemy_rifleman], _instigatorPos, DPSO_enemy_AIskill, false, "task"] call Gemini_fnc_createUnit;
	instigator = _instigator;
	_instigator spawn
		{
			[_this] spawn Gemini_fnc_civilianInteractions;
			_this setDir (random 360);
			sleep 3;
			_this setVariable ["sympathy", -100, true];
			_this setVariable ["recorded", true, true];
			_this setVariable ["name", "Yourek Zaouri", true];
			_this setVariable ["known_realName", true, true];
			_this setVariable ["nationality", localize "STR_nationality_saoudia", true];
			_this setVariable ["known_realNationality", true, true];
			_this setVariable ["birthdate", "24/10/1981", true];
			_this setVariable ["known_realBirthdate", true, true];
			_this setVariable ["polyglot", true, true];
			_this setVariable ["intel", "STR_civilian_intel_terroActivity", true];
			_this setVariable ["heldIntel", 10, true];
			[_this, "GreekHead_A3_03"] remoteExec ["setFace", 0, _this];
			[_this, ["Yourek Zaouri", "Yourek", "Zaouri"]] remoteExec ["setName", 0, _this];
			removeAllWeapons _this;
			[_this, "hgun_Pistol_heavy_02_F", 2] call BIS_fnc_addWeapon;
			removeHeadGear _this;
			removeGoggles _this;
			removeBackpack _this;
			sleep 5;
			_this setBehaviour "safe";
			_this action ["SwitchWeapon", _this, _this, 100];
			if (random 1 > 0.5) then {_this setCombatMode "red"; _this setVariable ["side", "hostile", false]} else {_this setCaptive true; removeAllWeapons _this; _this setVariable ["side", "friendly", false]};
		};

// =========================================================================================================
// SPAWNING ENEMIES
// =========================================================================================================

	if (random 100 < 85) then
		{
			// SPAWNING EMPTY VEHICLES
			[DPSO_enemy_motorizedVehicles, DPSO_enemy_side1, _instigatorPos, 50, [DPSO_enemy_commonUnits, selectRandom [1,2,3]], 50, "task"] call Gemini_fnc_spawnVehicle;

			// SPAWNING ENEMIES
			[_instigatorPos, 50, selectRandom [0,1,2,3,4,5], DPSO_enemy_side1, DPSO_enemy_units, DPSO_enemy_AIskill, "task"] call Gemini_fnc_spawnUnitsStandingInside;
			[_instigatorPos, 50, selectRandom [0,1,2,3], DPSO_enemy_side1, DPSO_enemy_units, DPSO_enemy_AIskill, "task"] call Gemini_fnc_spawnUnitsStandingOutside;
			[DPSO_enemy_side1, ["infantry"], selectRandom [2,3], _instigatorPos, [10, 20], "talk", _instigatorPos, DPSO_enemy_AIskill, 75, "task"] call Gemini_fnc_spawnSquad;

			// SPAWNING PATROL
			[DPSO_enemy_side1, ["infantry"], selectRandom [2,3,5], _instigatorPos, [50, 250], "patrol", _instigatorPos, DPSO_enemy_AIskill, 50, "task"] call Gemini_fnc_spawnSquad;
		};

// =========================================================================================================
// DEFINING CONDITIONS OF VICTORY
// =========================================================================================================

	// SUCCEEDING TASK IF INSTIGATOR IS DEAD - NO BONUS
	[
		_instigatorPos,
		[0, 0, 0, false],
		["any", "present", true],
		["(DPSO_assignedTask) && (!alive instigator)", "[] remoteExec ['Gemini_fnc_taskSucceeded']", ""],
		[0, 0, 0, false],
		"task"
	] call Gemini_fnc_createTrigger;

	// SUCCEEDING TASK IF INSTIGATOR IS IN JAIL - INTEL BONUS
	[
		_instigatorPos,
		[0, 0, 0, false],
		["any", "present", true],
		["(DPSO_assignedTask) && (alive instigator) && (instigator getVariable ['isJailed', false])", "[] remoteExec ['Gemini_fnc_taskSucceeded']; ['intel', 50] call Gemini_fnc_bonus", ""],
		[0, 0, 0, false],
		"task"
	] call Gemini_fnc_createTrigger;

// =========================================================================================================
// DEFINING CONDITIONS OF DEFEAT
// =========================================================================================================

	// there is now way to fail this task...

// =========================================================================================================
// DEBUGGING
// =========================================================================================================

	if (_debug) then {[_instigatorPos, "mil_objective", "colorRed", "INSTIGATOR", "task"] call Gemini_fnc_createMarker};