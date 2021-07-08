/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2021-04-18
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
#include "defines.inc"

params [["_mode","",[""]],["_params",[],[[],false]]];

switch (_mode) do {
	case "Initialise" : {
		if !(isServer) exitWith {};

		_params params [
			["_registerInitialPlayerGroups", false, [true]],
			["_maxUnitsPerGroup", 99, [0]],
			["_minimalInteraction", false, [true]],
			["_forcedInsignia", "", [""]]
		];

		// Center of each side
		{ createCenter _x } forEach [WEST, EAST, RESISTANCE, CIVILIAN];

		// Block multiple execution
		if (["IsInitialised"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])) exitWith {
			"Dynamic groups was already initialised, terminate in order to be able to re-initialise" call BIS_fnc_error;
		};

		// Handle requests from clients
		VAR_ON_CLIENT_MESSAGE addPublicVariableEventHandler [missionnamespace,{
			["OnClientMessage", _this] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		}];

		// Initialised flag
		missionNamespace setVariable ["BIS_dg_ini", true, IS_PUBLIC];

		// Group unit count limit
		if (_maxUnitsPerGroup < 99) then {
			missionNamespace setVariable ["BIS_dg_mupg", _maxUnitsPerGroup, IS_PUBLIC];
		};

		// Initialise initial player groups
		if (_registerInitialPlayerGroups) then {
			["RegisterInitialPlayerGroups", []] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		};

		// Minimal interaction, only allows group leader to promote another team member to leader
		// No other actions are allowed
		if (_minimalInteraction) then {
			missionNamespace setVariable ["BIS_dg_mii", _minimalInteraction, IS_PUBLIC];
		};

		// The forced insignia if any
		if (_forcedInsignia != "") then {
			missionNamespace setVariable ["BIS_dg_fia", _forcedInsignia, IS_PUBLIC];
		};

		// Log
		if (LOG_ENABLED) then {
			"Initialised" call BIS_fnc_log;
		};
	};

	/**
	 * Terminates the dynamic groups system, and deletes all current data
	 * Runs only on the server
	 */
	case "Terminate" : {
		if !(isServer) exitWith {};

		// Clear client message event handler
		VAR_ON_CLIENT_MESSAGE addPublicVariableEventHandler [missionnamespace, {}];

		// Public variables
		missionNamespace setVariable ["BIS_dg_ini", nil, IS_PUBLIC];

		// Log
		if (LOG_ENABLED) then {
			"Terminated" call BIS_fnc_log;
		};
	};

	/**
	 * Returns whether the dynamic groups system is initialised
	 */
	case "IsInitialised" : {
		missionNamespace getVariable ["BIS_dg_ini", false];
	};

	/**
	 * Receives and handles client requests on the server
	 */
	case "OnClientMessage" : {
		if !(isServer) exitWith {};

		_params params [["_variable", "", [""]],["_message", [], [[]]]];
		_message params [["_inMode", "", [""]],["_inParams", [], [[]]],["_player", objNull, [objNull]]];

		// Call requested function
		[_inMode, _inParams] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

		// Log
		if (LOG_ENABLED) then {
			["OnClientMessage: Message (%1) received from client (%2 / %3) with data (%4) at time (%5)", _variable, _player, name _player, _message, time] call BIS_fnc_logFormat;
		};
	};
	case "RegisterInitialPlayerGroups" : {
		{
			if (isPlayer leader _x && {count units _x > 0}) then {
				["RegisterGroup", [_x, leader _x]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};
		}
		forEach (allGroups - (["GetAllGroups"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])));
	};
	case "RegisterGroup" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_leader",objNull,[objNull]],["_data",[],[[]]]];

		if (!isNull _group && {!isNull _leader} && {_leader == leader _group}) then {
			_data params [["_insignia","",[""]],["_name",groupId _group,[""]],["_private",false,[true]]];
			if (_insignia isEqualTo "") then {
				_insignia = ["LoadRandomInsignia"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};

			// Flag as registered
			_group setVariable ["BIS_dg_reg", true, IS_PUBLIC];

			// Set the creator of this group
			_group setVariable ["BIS_dg_cre", _leader, IS_PUBLIC];

			// Set random insignia
			_group setVariable ["BIS_dg_ins", _insignia, IS_PUBLIC];

			// Set lock status, unlocked by default
			_group setVariable ["BIS_dg_pri", _private, IS_PUBLIC];

			// Set unique var
			_group setVariable ["BIS_dg_var", format ["%1_%2_%3", _name, getPlayerUID _leader, time], IS_PUBLIC];

			// Set the default name of the group
			_group setGroupIdGlobal [_name];

			// Set insignia for all members of the group
			{
				["OnPlayerGroupChanged", [_x, _group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			} forEach units _group;

			if (LOG_ENABLED) then {
				["RegisterGroup: Group (%1) registered with leader (%2)", _group, _leader] call BIS_fnc_logFormat;
			};
		};
	};
	case "UnregisterGroup" : {
		_params params [["_group",grpNull,[grpNull]],["_keep",false,[false]]];

		if (!isNull _group && {["IsGroupRegistered", [_group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])}) then {
			if (_keep || {count units _group > 0}) then {
				_group setVariable ["BIS_dg_reg", nil, IS_PUBLIC];
				_group setVariable ["BIS_dg_cre", nil, IS_PUBLIC];
				_group setVariable ["BIS_dg_ins", nil, IS_PUBLIC];
				_group setVariable ["BIS_dg_pri", nil, IS_PUBLIC];
				_group setVariable ["BIS_dg_var", nil, IS_PUBLIC];
			} else {
				["DeleteGroup", [_group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};

			if (LOG_ENABLED) then {
				["UnregisterGroup: Group (%1) unregistered and deleted (%2)", _group, _keep] call BIS_fnc_logFormat;
			};
		};
	};
	case "IsGroupRegistered" : {
		private _group = _params param [0, grpNull, [grpNull]];
		_group getVariable ["BIS_dg_reg", false];
	};
	case "DeleteGroup" : {
		private _group = _params param [0, grpNull, [grpNull]];
		if (local _group) then {
			["DeleteGroupLocal", [_group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		} else {
			[["DeleteGroupLocal", [_group]], "BIS_fnc_dynamicGroups", groupOwner _group] call BIS_fnc_mp;
		};
	};
	case "DeleteGroupLocal" : {
		private _group = _params param [0, grpNull, [grpNull]];
		if (!isNull _group && {local _group}) then {
			deleteGroup _group;
		};
	};
	case "SetName" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_name","",[""]]];
		if (!isNull _group && {_name != ""}) then {
			_group setGroupIdGlobal [_name];
		};
	};
	case "SetPrivateState" : {
		if !(isServer) exitWith {};

		_params params [["_group", grpNull, [grpNull]],["_state", true, [true]]];
		if (!isNull _group) then {
			_group setVariable ["BIS_dg_pri", _state, IS_PUBLIC];
		};
	};
	case "CreateGroupAndRegister" : {
		if !(isServer) exitWith {};

		_params params [["_player", objNull, [objNull]]];

		if (!isNull _player) then {
			// Create the new group in which we will put player
			private _newGroup = createGroup (side group _player);
			// Join player to new group
			[_player] joinSilent _newGroup;
			// Register
			["RegisterGroup", [_newGroup, _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			// Log
			if (LOG_ENABLED) then {
				["CreateNewGroupFor: %1 / %2 / %3 / %4 / %5", _newGroup, _player, units _newGroup, leader _newGroup, _group] call BIS_fnc_logFormat;
			};
		};
	};
	case "SwitchLeader" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (!isNull _group && {!isNull _player} && {_group == group _player}) then {
			// Select new leader
			[_group, _player] remoteExec ["selectLeader", groupOwner _group];
			// Log
			if (LOG_ENABLED) then {
				["SwitchLeader: %1 / %2", _group, _player] call BIS_fnc_logFormat;
			};
		};
	};
	case "AddGroupMember" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (!isNull _player && {!isNull _group} && {group _player != _group}) then {
			private _oldGroup = group _player;
			private _units = units _oldGroup - [_player];

			// Join player to new group
			[_player] joinSilent _group;

			// Trigger event
			["OnPlayerGroupChanged", [_player, _group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

			// Delete old group
			if (count _units < 1) then {
				["DeleteGroup", [_oldGroup]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};
		};
	};
	case "RemoveGroupMember" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (!isNull _player && {!isNull _group} && {group _player == _group}) then {
			private _units = units _group - [_player];
			// Join player to his own group
			[_player] joinSilent grpNull;
			// Trigger event
			["OnPlayerGroupChanged", [_player, group _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			// Delete registered group
			if (count _units < 1) then {
				["DeleteGroup", [_group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};
		};
	};

	/**
	 * Switches a player from a group to another
	 */
	case "SwitchGroup" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (!isNull _player && {!isNull _group} && {group _player != _group}) then {
			private _oldGroup 	= group _player;
			private _units		= units _oldGroup - [_player];

			// Join player to new group
			[_player] joinSilent _group;
			// Trigger event
			["OnPlayerGroupChanged", [_player, _group]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

			if (count _units < 1) then {
				["DeleteGroup", [_oldGroup]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			};
		};
	};

	/**
	 * Kicks a player out of a group
	 */
	case "KickPlayer" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_leader",objNull,[objNull]],["_player",objNull,[objNull]]];

		if (!isNull _group && {!isNull _leader} && {!isNull _player} && {leader group _leader == _leader} && {group _player == _group}) then {
			// Make player leave group
			["RemoveGroupMember", [_group, _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			// The current list of group kicks this player has
			private _kicks = _player getVariable ["BIS_dg_kic", []];
			// Add new id
			_kicks pushBack _group;
			// Store this event, we want to be able to see if player was kicked out of a group
			_player setVariable ["BIS_dg_kic", _kicks, IS_PUBLIC];
		};
	};

	/**
	 * Un-kicks a player from a group
	 */
	case "UnKickPlayer" : {
		if !(isServer) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (!isNull _group && {!isNull _player} && {["WasPlayerKickedFrom", [_group, _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])}) then {
			// The current list of group kicks this player has
			private _kicksOld = _player getVariable ["BIS_dg_kic", []];
			// Remove given id from list if it exists
			private _kicks = _kicksOld - [_group];
			// Store this event, we want to be able to see if player was kicked out of a group
			if !(_kicksOld isEqualTo _kicks) then {
				_player setVariable ["BIS_dg_kic", _kicks, IS_PUBLIC];
			};
		};
	};
	case "WasPlayerKickedFrom" : {
		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];
		_group in (_player getVariable ["BIS_dg_kic", []]);
	};

	/**
	 * Returns all abstract groups
	 */
	case "GetAllGroups" : {
		private _groups = [];
		{
			if (isPlayer leader _x && {count units _x > 0} && {["IsGroupRegistered", [_x]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])}) then {
				_groups pushBack _x;
			};
		} forEach allGroups;
		_groups;
	};

	/**
	 * Returns all abstract groups belonging to a side
	 */
	case "GetAllGroupsOfSide" : {
		_params params [["_side",sideUnknown,[sideUnknown]]];
		if (_side isEqualTo sideUnknown) exitWith {[]};
		private _groups = [];
		{
			if (side _x == _side) then {
				_groups pushBack _x;
			};
		} forEach (["GetAllGroups"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]));
		_groups;
	};

	/**
	 * Returns group with given name
	 */
	case "GetGroupByName" : {
		_params params [["_name","",[""]],["_side",sideUnknown,[sideUnknown]]];

		private _groups = ["GetAllGroups"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		private _group  = grpNull;
		{
			if (_name == groupId _x && {side _x == _side}) then {
				_group = _x;
			};
		} forEach allGroups;
		_group;
	};

	/**
	 * Returns group with given unique id
	 */
	case "GetGroupByUniqueId" : {
		_params params [["_id","",[""]],["_side",sideUnknown,[sideUnknown]]];

		private _groups = ["GetAllGroups"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		private _group  = grpNull;
		{
			if (_id == _x getVariable ["BIS_dg_var", ""] && {side _x == _side}) then {
				_group = _x;
			};
		} forEach allGroups;
		_group;
	};

	/**
	 * Gets the list of all friendly players
	 */
	case "GetFriendlyPlayers" : {
		_params params [["_side",sideUnknown,[sideUnknown]]];
		// Validate params
		if !(_side in [WEST, EAST, RESISTANCE, CIVILIAN]) exitWith {
			["GetFriendlyPlayers: Invalid side (%1), please use on of the supported (WEST, EAST, RESISTANCE, CIVILIAN)"] call BIS_fnc_error;
			[];
		};

		private _friendlies = [];
		{
			if ((isPlayer _x || !isMultiplayer) && {side group _x == _side}) then {
				_friendlies pushBack _x;
			};
		} forEach (playableUnits + switchableUnits + allUnits + allDeadMen);

		_friendlies;
	};

	/**
	 * Return whether a player has group
	 */
	case "PlayerHasGroup" : {
		private _player = _params param [0, objNull, [objNull]];
		["IsGroupRegistered", [group _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
	};

	/**
	 * Return whether a player is leader of group
	 */
	case "PlayerIsLeader" : {
		private _player = _params param [0, objNull, [objNull]];
		_player == leader group _player && ["PlayerHasGroup", [_player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
	};

	/**
	 * Initialises a player
	 * Can only be run on machines which have a player
	 */
	case "InitialisePlayer" : {
		if !(hasInterface) exitWith {};

		_params params [["_player", player, [objNull]],["_registerInitialGroup", false, [true]]];

		if (isNull _player) exitWith {
			["InitialisePlayer: Player provided is NULL", _player] call BIS_fnc_error;
		};

		if (!local _player) exitWith {
			["InitialisePlayer: Player (%1) is not local", _player] call BIS_fnc_error;
		};

		if (!isNil { _player getVariable "BIS_dg_ini" }) exitWith {
			["InitialisePlayer: Player (%1) already initialised, terminate to be able to re-initialise", _player] call BIS_fnc_error;
		};

		// Flag as initialised
		_player setVariable ["BIS_dg_ini", true, IS_PUBLIC];

		// Add key events for opening the Dynamic Groups interface and for invitation handling
		["AddKeyEvents"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

		// When in the respawn screen, detect when we want to open dynamic groups
		missionNamespace setVariable ["BIS_dynamicGroups_respawnKeyDown",[
			missionnamespace,
			"RscDisplayRespawnKeyDown",
			{
				private "_key";
				_key = _this param [1, -1, [0]];
				if (_key in actionKeys UI_OPEN_KEY && {missionNamespace getVariable ["BIS_dynamicGroups_allowInterface", true]}) then {
					(_this select 0) createDisplay "RscDisplayDynamicGroups";
				};
			}
		] call bis_fnc_addscriptedeventhandler, IS_LOCAL];

		// The updating function
		missionNamespace setVariable ["BIS_dynamicGroups_draw3D", addMissionEventHandler ["EachFrame",{
			private _timeLastUpdate = missionNamespace getVariable ["BIS_dynamicGroups_lastUpdateTime", 0];
			private _timeNow = time;
			private _timeSinceLastUpdate = _timeNow - _timeLastUpdate;

			if (_timeSinceLastUpdate >= INTERFACE_UPDATE_DELAY) then {
				// Get the interface display
				private _display = uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
				// If we have a valid display, update it's contents
				if (!isNull _display) then {
					["Update", [false]] call DISPLAY;
				};
				// Store current time
				missionNamespace setVariable ["BIS_dynamicGroups_lastUpdateTime", _timeNow, IS_LOCAL];
			};
		}],IS_LOCAL];

		// Register player group if requested, not already registered and player is leader
		if (_registerInitialGroup && {leader group _player == _player} && {!(["IsGroupRegistered", [group _player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]))}) then {
			["SendClientMessage", ["RegisterGroup", [group _player, _player]]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		};
	};

	/**
	 * Un-initialises player
	 * Can only be run on machines which have a player
	 */
	case "TerminatePlayer" : {
		if !(hasInterface) exitWith {};

		_params params [["_player",player,[objNull]]];

		if !(local _player) exitWith {
			["TerminatePlayer: Player (%1) is not local", _player] call BIS_fnc_error;
		};

		if (isNil { _player getVariable VAR_INITIALIZED }) exitWith {
			["TerminatePlayer: Player (%1) is not initialised yet", _player] call BIS_fnc_error;
		};

		// Remove key events for opening the Dynamic Groups interface and for invitation handling
		["RemoveKeyEvents"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		// Remove respawn screen key down event handling
		[missionnamespace, "RscDisplayRespawnKeyDown", missionNamespace getVariable ["BIS_dynamicGroups_respawnKeyDown", []]] call bis_fnc_removescriptedeventhandler;
		// Stop the updating function
		removeMissionEventHandler ["EachFrame", missionnamespace getVariable ["BIS_dynamicGroups_draw3D", -1]];
	};

	/**
	 * Sends a message to server from a client machine
	 */
	case "SendClientMessage" : {
		if !(hasInterface) exitWith {};
		_params params [["_inMode","",[""]],["_inParams",[],[[]]]];
		// If we are on the server, we execute directly otherwise we send to the server to be executed
		if (isServer) then {
			[_inMode, _inParams] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		} else {
			missionNamespace setVariable [VAR_ON_CLIENT_MESSAGE,[_inMode,_inParams,player],IS_PUBLIC];
		};
	};

	/**
	 * Adds key down/up events for opening interface or invitation interaction
	 */
	case "AddKeyEvents" : {
		disableSerialization;
		if !(hasInterface) exitWith {};

		_params params [["_display",displayNull,[displayNull]]];

		[_display] spawn {
			scriptName "DynamicGroups: AddKeyEvents";
			disableSerialization;

			private _display = _this select 0;
			private _varName = "BIS_dynamicGroups_keyMain";

			// Wait for display to become available
			if (isNull _display) then {
				waitUntil{ !isNull (findDisplay 46) };
				_display = (findDisplay 46);
				_varName = "BIS_dynamicGroups_key";
			};

			// Exit in case event is already registered
			if (!isNil { missionNamespace getVariable _varName }) then {
				private _index = missionNamespace getVariable _varName;
				private _down = _index select 0;
				private _up = _index select 1;
				// Reset event handlers
				_display displayRemoveEventHandler ["KeyDown", _down];
				_display displayRemoveEventHandler ["KeyUp", _up];
				missionNamespace setVariable [_varName, nil];
			};

			// Add event handlers to display
			private _down   = _display displayAddEventHandler ["KeyDown", "['OnKeyDown', _this] call MPSF_fnc_dynamicGroups;"];
			private _up     = _display displayAddEventHandler ["KeyUp", "['OnKeyUp', _this] call MPSF_fnc_dynamicGroups;"];

			// Store in ui namespace
			missionNamespace setVariable [_varName, [_down, _up]];

			// Log
			if (LOG_ENABLED) then {
				["AddKeyEvents: Key down event added for (%1)", _varName] call BIS_fnc_logFormat;
			};
		};
	};

	/**
	 * Removes input event handling
	 */
	case "RemoveKeyEvents" : {
		disableSerialization;
		if !(hasInterface) exitWith {};

		_params params [["_display",displayNull,[displayNull]]];

		[_display] spawn {
			scriptName "DynamicGroups: RemoveKeyEvents";
			disableSerialization;

			private _display = _this select 0;
			private _varName = "BIS_dynamicGroups_keyMain";

			// Wait for display to become available
			if (isNull _display) then {
				waitUntil{ !isNull (findDisplay 46) };
				_display = (findDisplay 46);
				_varName = "BIS_dynamicGroups_key";
			};

			// Exit in case event is already registered
			if (!isNil { missionNamespace getVariable _varName }) then {
				private _index = missionNamespace getVariable _varName;
				private _down = _index select 0;
				private _up = _index select 1;
				// Reset event handlers
				_display displayRemoveEventHandler ["KeyDown", _down];
				_display displayRemoveEventHandler ["KeyUp", _up];
				missionNamespace setVariable [_varName, nil];
			};

			// Log
			if (LOG_ENABLED) then {
				["RemoveKeyEvents: Key down event removed for (%1)", _varName] call BIS_fnc_logFormat;
			};
		};
	};

	/**
	 * Handles a key down event
	 */
	case "OnKeyDown" : {
		disableSerialization;
		if !(hasInterface) exitWith {};

		private _key  = _params param [1, -1, [0]];
		private _ctrl = _params param [3, false, [false]];

		if (_key in actionKeys UI_OPEN_KEY && !_ctrl) then {
			if (isNil { uiNamespace getVariable "BIS_dynamicGroups_keyDownTime" }) then {
				uiNamespace setVariable ["BIS_dynamicGroups_keyDownTime", time];
				uiNamespace setVariable ["BIS_dynamicGroups_ignoreInterfaceOpening", nil];
			};
			["UpdateKeyDown"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
			true;
		} else {
			false;
		};
	};

	/**
	 * Handles a key up event
	 */
	case "OnKeyUp" : {
		disableSerialization;
		if !(hasInterface) exitWith {};

		private _key  = _params param [1, -1, [0]];
		private _ctrl = _params param [3, false, [false]];

		uiNamespace setVariable ["BIS_dynamicGroups_keyDownTime", nil];

		if (!_ctrl && {_key in actionKeys UI_OPEN_KEY} && {isNil { uiNamespace getVariable "BIS_dynamicGroups_ignoreInterfaceOpening" }}) then {
			if (isNull (findDisplay 60490) && {missionNamespace getVariable ["BIS_dynamicGroups_allowInterface", true]}) then {
				([] call BIS_fnc_displayMission) createDisplay "RscDisplayDynamicGroups";
			} else {
				if (isNil { uiNamespace getVariable "BIS_dynamicGroups_hasFocus" }) then {
					(["GetDisplay"] call DISPLAY) closeDisplay IDC_CANCEL;
				};
			};
			true;
		} else {
			false;
		};
	};

	/**
	 *
	 */
	case "UpdateKeyDown" : {
		if !(hasInterface) exitWith {};

		if (!isNil { uiNamespace getVariable "BIS_dynamicGroups_keyDownTime" } && {count (["GetPlayerInvites", [player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])) > 0}) then
		{
			private ["_timestamp", "_timeHolding"];
			_timestamp      = uiNamespace getVariable "BIS_dynamicGroups_keyDownTime";
			_timeHolding    = time - _timestamp;

			if (_timeHolding >= HOLD_DOWN_TIME_FOR_INVITE_ACCEPT) then {
				private _invites = ["GetPlayerInvites", [player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

				if (count _invites > 0) then {
					private _invite = _invites select (count _invites - 1);
					private _group = _invite select 0;

					// Do not allow opening interface
					uiNamespace setVariable ["BIS_dynamicGroups_ignoreInterfaceOpening", true];

					// Remove invite
					["RemoveInvite", [_group, player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);

					// Make sure group is not full
					if (count units _group < missionNamespace getVariable ["BIS_dg_mupg", 99]) then {
						if !(["PlayerHasGroup", [player]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])) then {
							["SendClientMessage", ["AddGroupMember", [_group, player]]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
						} else {
							["SendClientMessage", ["SwitchGroup", [_group, player]]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
						};

						// Notification
						["LocalShowNotification", ["DynamicGroups_Joined", [groupId _group]]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
						// Log
						if (LOG_ENABLED) then {
							["UpdateKeyDown: Invite accepted from %1", _group] call BIS_fnc_logFormat;
						};
					} else {
						// Notification
						["LocalShowNotification", ["DynamicGroups_PlayerJoinFailed", [_group]]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
						// Log
						if (LOG_ENABLED) then {
							["UpdateKeyDown: Invite cannot be accepted, %1 is full", _group] call BIS_fnc_logFormat;
						};
					};
				};
			};

			//hintSilent format ["Holding key down for %1 seconds", _timeHolding];
		};
	};

	/**
	 * Adds a invitation/request to a player
	 * Invitations are stored within unique player
	 */
	case "AddInvite" : {
		_params params [["_group", grpNull, [grpNull]],["_from",objNull,[objNull]],["_to",objNull,[objNull]]];

		// Validate params
		if (isNull _group) exitWith { "AddInvite: Group is null" call BIS_fnc_error; };
		if (isNull _from) exitWith { "AddInvite: Invite sender is null" call BIS_fnc_error; };
		if (isNull _to) exitWith { "AddInvite: Invite receiver is null" call BIS_fnc_error; };

		// Get current invites and requests
		private _invitations = _to getVariable ["BIS_dg_inv", []];
		// The index if group already in list
		private _index = -1;

		{
			if (_x select 0 == _group) exitWith {
				_index = _forEachIndex;
			};
		} forEach _invitations;

		// Store new info
		if (_index != -1) then {
			_invitations set [_index, [_group, _from, _to, time]];
		} else {
			_invitations pushBack [_group, _from, _to, time];
		};

		// Broadcast changes
		_to setVariable ["BIS_dg_inv", _invitations, IS_PUBLIC];

		// Fire event on target computer
		//["OnInvitationReceived", [_group, _to, _from]] remoteExecCall ["BIS_fnc_dynamicGroups", _to];
		[["OnInvitationReceived", [_group, _to, _from]], "BIS_fnc_dynamicGroups", _to] call BIS_fnc_mp;

		// If player was kicked from group we unkick since he was invited
		//["UnKickPlayer", [_group, _to]] remoteExecCall ["BIS_fnc_dynamicGroups", 2];
		[["UnKickPlayer", [_group, _to]], "BIS_fnc_dynamicGroups", false] call BIS_fnc_mp;

		// Log
		if (LOG_ENABLED) then {
			["AddInvite: %1 / %2 / %3", _group, _from, _to] call BIS_fnc_logFormat;
		};
	};

	/**
	 * Remove an invite from a player
	 */
	case "RemoveInvite" : {
		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];

		if (isNull _group) exitWith { "RemoveInvite: Group is null" call BIS_fnc_error; };
		if (isNull _player) exitWith { "RemoveInvite: Invite holder is null" call BIS_fnc_error; };

		// Get current invites and requests
		private _invitations    = _player getVariable ["BIS_dg_inv", []];
		private _container      = [] + _invitations;

		// Go through the container, find matching group id, get index within container and delete it
		private _index = -1;
		{
			if (_group == _x select 0 && {_player == _x select 2}) exitWith {
				_index = _forEachIndex;
			};
		} forEach _container;

		if (_index < 0) exitWith {
			["RemoveInvite: Not found for group (%1)", _group] call BIS_fnc_error;
		};

		_container deleteAt _index;
		_player setVariable ["BIS_dg_inv", _container, IS_PUBLIC];

		// Log
		if (LOG_ENABLED) then {
			["RemoveInvite: %1", _this] call BIS_fnc_logFormat;
		};
	};

	/**
	 * Whether player has an invite from a private group
	 */
	case "HasInvite" : {
		_params params [["_group",grpNull,[grpNull]],["_player",objNull,[objNull]]];
		private _invitations = _player getVariable ["BIS_dg_inv", []];
		private _hasInvitation = false;
		{
			private ["_inviteGroup", "_inviteFrom", "_inviteTo", "_inviteTime"];
			_inviteGroup 	= _x select 0;
			_inviteFrom 	= _x select 1;
			_inviteTo 		= _x select 2;
			_inviteTime 	= _x select 3;

			if (_group == _inviteGroup && {_player == _inviteTo} && {time <= _inviteTime + INVITE_LIFETIME}) exitWith {
				_hasInvitation = true;
			};
		} forEach _invitations;
		_hasInvitation;
	};

	/**
	 * Returns all invites player has received
	 **/
	case "GetPlayerInvites" : {
		_params params [["_player",objNull,[objNull]],["_maxLifeTime",99999999,[0]]];
		private _invites        = _player getVariable ["BIS_dg_inv", []];
		private _validInvites   = [];
		{
			if (!isNull (_x select 0) && {time - (_x select 3) < _maxLifeTime}) then {
				_validInvites pushBack _x;
			};
		} forEach _invites;
		_validInvites;
	};

	/**
	 * Event for player joining a group
	 */
	case "OnGroupJoin" : {
		_params params [["_group",grpNull,[grpNull]],["_leader",objNull,[objNull]],["_who",objNull,[objNull]]];
		if (!isNull _leader && {!isNull _who} && {_leader != _who}) then {
			[["LocalShowNotification", ["DynamicGroups_PlayerJoined", [name _who], _leader]], "BIS_fnc_dynamicGroups", _leader] call BIS_fnc_mp;
		};
	};

	/**
	 * Event for player joining a group failed
	 */
	case "OnGroupJoinFailed" : {
		_params params [["_group",grpNull,[grpNull]],["_who",objNull,[objNull]]];
		if (!isNull _who) then {
			[["LocalShowNotification", ["DynamicGroups_PlayerJoinFailed", [], _who]], "BIS_fnc_dynamicGroups", _who] call BIS_fnc_mp;
		};
	};

	/**
	 * Event for player leaving a group
	 */
	case "OnGroupLeave" : {
		_params params [["_group",grpNull,[grpNull]],["_leader",objNull,[objNull]],["_who",objNull,[objNull]]];
		if (!isNull _leader && {!isNull _who} && {_leader != _who}) then {
			[["LocalShowNotification", ["DynamicGroups_PlayerLeft", [name _who], _leader]], "BIS_fnc_dynamicGroups", _leader] call BIS_fnc_mp;
		};
	};

	/**
	 * Event for invitation received
	 */
	case "OnInvitationReceived" : {
		if !(hasInterface) exitWith {};

		_params params [["_group",grpNull,[grpNull]],["_to",objNull,[objNull]],["_from",objNull,[objNull]]];

		if !(player isEqualTo _to) exitWith {};

		if (!isNull _to && {!isNull _from} && {_to != _from}) then{
			["LocalShowNotification", ["DynamicGroups_InviteReceived", [name _from], _to]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		};
		// Log
		if (LOG_ENABLED) then {
			["OnInvitationReceived: %1 / %2 / %3", _group, _to, _from] call bis_fnc_logFormat;
		};
	};

	/**
	 * Event for player being promoted to leader
	 */
	case "OnPromotedToLeader" : {
		_params params [["_group",grpNull,[grpNull]],["_newLeader",objNull,[objNull]],["_oldLeader",objNull,[objNull]]];
		if (!isNull _oldLeader && {!isNull _newLeader} && {_oldLeader != _newLeader}) then {
			[["LocalShowNotification", ["DynamicGroups_PromotedToLeader", [name _oldLeader], _newLeader]], "BIS_fnc_dynamicGroups", _newLeader] call BIS_fnc_mp;
		};
		// Log
		if (LOG_ENABLED) then {
			["OnPromotedToLeader: %1 / %2 / %3", _group, _newLeader, _oldLeader] call BIS_fnc_logFormat;
		};
	};

	/**
	 * Event for player group being disbanded
	 */
	case "OnGroupDisbanded" : {
		_params params [["_group",grpNull,[grpNull]],["_who",objNull,[objNull]],["_oldLeader",objNull,[objNull]]];
		if (!isNull _oldLeader && {!isNull _who} && {_oldLeader != _who}) then {
			[["LocalShowNotification", ["DynamicGroups_GroupDisbanded", [name _oldLeader], _who]], "BIS_fnc_dynamicGroups", _who] call BIS_fnc_mp;
		};

		// Log
		if (LOG_ENABLED) then {
			["OnGroupDisbanded: %1 / %2 / %3", _group, _who, _oldLeader] call bis_fnc_logFormat;
		};
	};

	/**
	 * Event for player being kicked from his group
	 */
	case "OnKicked" : {
		_params params [["_group",grpNull,[grpNull]],["_who",objNull,[objNull]],["_leader",objNull,[objNull]]];
		if (!isNull _leader && {!isNull _who} && {_who != _leader}) then {
			[["LocalShowNotification", ["DynamicGroups_Kicked", [name _leader], _who]], "BIS_fnc_dynamicGroups", _who] call BIS_fnc_mp;
		};
		// Log
		if (LOG_ENABLED) then {
			["OnKicked: %1 / %2 / %3", _group, _who, _leader] call bis_fnc_logFormat;
		};
	};

	case "LoadInsignias" : {
		(configfile >> "CfgUnitInsignia") call BIS_fnc_getCfgSubClasses;
	};

	case "LoadInsignia" : {
		private _class = _params param [0, "", [""]];
		private _cfg            = configfile >> "CfgUnitInsignia" >> _class;
		private _displayName    = getText (_cfg >> "displayName");
		private _texture        = getText (_cfg >> "texture");
		private _author         = getText (_cfg >> "author");
		[_displayName, _texture, _author];
	};

	case "LoadRandomInsignia" : {
		private _insignias = ["LoadInsignias"] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		_insignias = _insignias - [DEFAULT_INSIGNIA];
		_insignias call bis_fnc_selectRandom;
	};

	case "GetInsigniaDisplayName" : {
		private _class = _params param [0, "", [""]];
		private _insignia = ["LoadInsignia", [_class]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		_insignia select 0;
	};

	case "GetInsigniaTexture" : {
		private _class = _params param [0, "", [""]];
		private _insignia = ["LoadInsignia", [_class]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		_insignia select 1;
	};

	case "GetInsigniaAuthor" : {
		private _class = _params param [0, "", [""]];
		private _insignia = ["LoadInsignia", [_class]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}]);
		_insignia select 2;
	};

	case "LocalShowNotification" : {
		_params params [["_class","",[""]],["_notificationParams",[],[[]]],["_target",objNull,[objNull]]];

		private _actionKeysNames        = actionkeysnamesarray ["TeamSwitch", 1];
		private _keyText                = if (count _actionKeysNames > 0) then { _actionKeysNames select 0 } else { "N/A" };
		private _string                 = format ["<t color = '%2'>[%1]</t>", _keyText, (["GUI", "BCG_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML];

		_notificationParams pushBack _string;

		if (player == _target || {isNull _target}) then {
			[_class, _notificationParams] call BIS_fnc_showNotification;
		};
	};

	case "OnPlayerGroupChanged" : {
		_params params [["_player",objNull,[objNull]],["_newGroup",grpNull,[grpNull]],["_oldGroup",grpNull,[grpNull]]];

		if (["IsGroupRegistered", [_newGroup]] call (missionNamespace getVariable ["MPSF_fnc_dynamicGroups",{}])) then {
			[_player, _newGroup getVariable ["BIS_dg_ins", ""]] call BIS_fnc_setUnitInsignia;
		} else {
			[_player, ""] call BIS_fnc_setUnitInsignia;
		};
	};

	case "GetGroupTexture" : {
		private _group = _params param [0, grpNull, [grpNull]];
		private _availableInsignias = [];

		if (!isNil { uiNamespace getVariable "RscEGSpectator_availableInsignias" }) then {
			_availableInsignias = uiNamespace getVariable "RscEGSpectator_availableInsignias";
		} else {
			_availableInsignias = (configfile >> "CfgUnitInsignia") call BIS_fnc_getCfgSubClasses;
			uiNamespace setVariable ["RscEGSpectator_availableInsignias", _availableInsignias];
		};

		private _lastInsigniaTexture = _group getVariable ["BIS_dynamicGroups_lastinsignia", ""];
		private _insigniaTexture = "";
		if (_lastInsigniaTexture == "") then {
			private _insignia = if (count _availableInsignias > 0) then { selectRandom _availableInsignias } else { "" };
			private _groupPicture 	= leader _group getVariable ["BIS_dg_ins", _insignia];
			_insigniaTexture = ["GetInsigniaTexture", [_groupPicture]] call BIS_fnc_dynamicGroups;
			_group setVariable ["BIS_dynamicGroups_lastinsignia", _insigniaTexture];
		} else {
			_insigniaTexture = _lastInsigniaTexture;
		};

		if (_insigniaTexture != "") then {
			_insigniaTexture;
		} else {
			private _squadParams = squadParams leader _group;
			private _squadPicture = if (count _squadParams > 0) then { ((_squadParams select 0) select 4) } else { "" };
			_squadPicture;
		};
	};

	case "SetAvailableInsignias" : {
		uiNamespace setVariable ["RscEGSpectator_availableInsignias", _params param [0, [], [[]]]];
	};

	case "GetAvailableInsignias" : {
		uiNamespace getVariable ["RscEGSpectator_availableInsignias", []];
	};

	/**
	 * Log error in case of unknown given mode
	 */
	case default {
		["Unknown mode: %1", _mode] call BIS_fnc_error;
	};
};