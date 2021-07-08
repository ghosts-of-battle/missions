/*
	Multiplayer Scripted Framework (MPSF)
	Author: Roy86 (email.me@roy86.com.au)

	File: fn_simulCiv.sqf
	Author(s): see mpsf\credits.txt

	Description:
		Civilian Simulation System

	Parameter(s):
		0: Object - Description

	Returns:
		Bool - True when done
*/
params [["_mode","",[""]],["_params",[],[[],false]]];

//#define CLASSNAMES []
#define CLASSNAMES (["CfgSides","Civilian_Malden","Crowd24"] call BIS_fnc_getCfgDataArray)

switch (_mode) do {
/* TRIGGER AREAS */
	case "createTriggerArea" : {
		if (isServer) then {
			_params params [["_areaID","",[""]],["_areaFactionID","",[""]]];

			if (_areaID isEqualTo "" || _areaFactionID isEqualTo "") exitWith {};

			private _areaLogic = missionNamespace getVariable [_areaID,objNull];
			if (isNull _areaLogic) then {
				private _areaPos = _areaID call BIS_fnc_position;
				_areaLogic = [_areaPos] call MPSF_fnc_createLogic;
				_areaLogic setVariable ["MPSF_Module_Area_F",true,true];
				_areaLogic setVariable ["areaActive",false,true];
				_areaLogic setVariable ["areaType",_areaFactionID,true];
				_areaLogic setVehicleVarName _areaID;
				missionNamespace setVariable [_areaID,_areaLogic];
				publicVariable _areaID;
			};

			private _checkRadius = 1000;
			private _trigger = createTrigger ["EmptyDetector",_areaLogic,false];
			_trigger setTriggerArea [_checkRadius,_checkRadius,getDir _areaLogic,false,50];
			_trigger setTriggerActivation ["ANYPLAYER","PRESENT",true];
			_trigger setTriggerStatements ["this"
				,format["['activateArea',[thisTrigger,%1]] call MPSF_fnc_simulSite;",str _areaFactionID]
				,format["['deactivateArea',[thisTrigger]] call MPSF_fnc_simulSite;"]
			];
			_trigger attachTo [_areaLogic,[0,0,0]];
			_areaLogic setVariable ["VirtualDepot_Trigger",_trigger];
		};
	};
	case "activateArea" : {
		_params params [["_trigger",objNull],["_areaFactionID","",[""]]];

		private _areaLogic = attachedTo _trigger;
		if (isNull _areaLogic) exitWith { ["Unable to retrieve area logic attached to trigger"] call BIS_fnc_error; };

		["createAgentPopulation",[_areaLogic,_areaFactionID]] call MPSF_fnc_simulSite;
	};
	case "deactivateArea" : {
		_params params [["_trigger",objNull]];
		private _areaLogic = attachedTo _trigger;
		if (isNull _areaLogic) exitWith {};
		(_areaLogic getVariable ["MPSF_ActivePop_var_groups",[]]) params ["_groups","_units"];
		{ deleteVehicle _x; } forEach _units;
		{ deleteGroup _x; } forEach _groups;
	};
/* CREATE Fuctions */
	case "createAgentPopulation" : {
		_params params [["_civLogic",objNull,[objNull,""]],["_factionID","",[""]]];

		if (typeName _civLogic isEqualTo typeName "") then { _civLogic = missionNamespace getVariable [_civLogic,objNull]; };
		if (isNull _civLogic) exitWith {[]};

		private _createdGroups = [];
		private _createdUnits = [];
		private _areaPos = _civLogic call BIS_fnc_position;
		private _groupID = [_areaPos,_factionID,selectRandom ["SquadAmbushINS8"]] call MPSF_fnc_createGroup;

		[_groupID,_areaPos,100] spawn MPSF_fnc_setGroupOccupy;

		_createdGroups pushBackUnique _groupID;
		_createdUnits append units _groupID;

		_civLogic setVariable ["MPSF_ActivePop_var_groups",[_createdGroups,_createdUnits],true];
	};
/* Behaviour Functions */
	case "setAgentCrowd" : {
		_params params [["_groupUnits",[],[[]]],["_position",[0,0,0],[[]]],["_radius",0,[0]]];

		if (count _groupUnits == 0) exitWith { /*["Unable to assign waypoints to group %1 in %2",_groupUnits,mapGridPosition _position] call BIS_fnc_error;*/ false };

		private _movePositions = [_position,_radius,true] call MPSF_fnc_getNearbyBuildings;
		if (count _movePositions < 10) then {
			private _wpcount = (round(_radius / 15) max 5) min 10;
			private _inc = 360/_wpcount;
			for "_i" from 0 to _wpcount do {
				private _ang = _inc * _i;
				private _a = (_position select 0)+(sin(_ang)*_radius);
				private _b = (_position select 1)+(cos(_ang)*_radius);
				if !(surfaceIsWater [_a,_b]) then{
					_movePositions pushBack [_a,_b,0];
				};
			};
			if (count _movePositions == 0) exitWith { /*["Unable to assign waypoints to group %1 in %2",_groupUnits,mapGridPosition _position] call BIS_fnc_error;*/ false; };
		};

		{
			_x setVariable ["crowdData",_movePositions];
			_x setPosATL (selectRandom _movePositions);
			_x setSpeedMode "LIMITED";
			_x setBehaviour "CARELESS";
			_x forceSpeed (_x getSpeed "Slow");
			_x action ["WeaponOnBack", _x];
		} forEach _groupUnits;

		["MPSF_SimulCiv_Crowd_EH","onEachFrame",{
			if (count agents > 0) then {
				private _agent = agents select (diag_frameno % count agents);
				if (_agent getVariable ["inConversation",false]) exitWith {
					(agent _agent) moveTo (position agent _agent);
				};
				{
					private _unit = agent _x;// getVariable ["agentObject",objNull];
					_movePositions = _x getVariable ["crowdData",[]];
					if (count _movePositions > 0) then {
						if (currentCommand _unit isEqualTo "") then {
							_unit moveTo (selectRandom _movePositions);
						};
					};
				} forEach [_agent];
			};
		}] call MPSF_fnc_addEventHandler;
	};
	case "setDrive" : {
		_params params [["_groupUnits",[],[[]]],["_position",[0,0,0],[[]]],["_radius",0,[0]]];

		//if (count _groupUnits == 0) exitWith { /*["Unable to assign waypoints to group %1 in %2",_groupUnits,mapGridPosition _position] call BIS_fnc_error;*/ false };

		private _movePositions = [];
		private _wpcount = (round(_radius / 15) max 5) min 10;
		private _inc = 360/_wpcount;
		for "_i" from 0 to _wpcount do {
			private _ang = _inc * _i;
			private _a = (_position select 0)+(sin(_ang)*_radius);
			private _b = (_position select 1)+(cos(_ang)*_radius);
			if !(surfaceIsWater [_a,_b]) then{
				_movePositions pushBack [_a,_b,0];
			};
		};

		if (count _movePositions == 0) exitWith {
			["Unable to assign waypoints to group %1 in %2",_groupUnits,mapGridPosition _position] call BIS_fnc_error;
			false;
		};

		{
			_x setVariable ["crowdData",_movePositions];
			_x setSpeedMode "LIMITED";
			_x forceSpeed (_x getSpeed "NORMAL");
		} forEach _groupUnits;

		["MPSF_SimulCiv_Crowd_EH","onEachFrame",{
			if (count agents > 0) then {
				private _agent = agents select (diag_frameno % count agents);
				if (_agent getVariable ["inConversation",false]) exitWith {
					(agent _agent) moveTo (position agent _agent);
				};
				{
					private _unit = agent _x;// getVariable ["agentObject",objNull];
					_movePositions = _x getVariable ["crowdData",[]];
					if (count _movePositions > 0) then {
						if (currentCommand _unit isEqualTo "") then {
							_unit moveTo (selectRandom _movePositions);
						};
					};
				} forEach [_agent];
			};
		}] call MPSF_fnc_addEventHandler;
	};
/* Initialise */
	case "init" : {
		if (isServer) then {
			{
				["createTriggerArea",[_x,"FactionTypeBLU"]] call MPSF_fnc_simulSite;
			} forEach (allMapMarkers select compile format ["_x select [0, %1] == %2",count "blufor_pos",str "blufor_pos"]);

			{
				["createTriggerArea",[_x,"FactionTypeOPF"]] call MPSF_fnc_simulSite;
			} forEach (allMapMarkers select compile format ["_x select [0, %1] == %2",count "opfor_pos",str "opfor_pos"]);
		};
	};
};