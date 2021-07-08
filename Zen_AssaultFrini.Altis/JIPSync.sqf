//

// Some of this is covered in the JIP demonstration, what isn't is commented on here
if (_Zen_Is_JIP) then {
    titleText ["Good Luck", "BLACK FADED", 0.25];

    Zen_Task_Array_Global = 1;
    Zen_MP_Closure_Packet = ["Zen_SyncJIPServer", player];
    publicVariableServer "Zen_MP_Closure_Packet";

    waitUntil {
        (!(isNil "Zen_JIP_Args_Server") && (typeName Zen_Task_Array_Global == "ARRAY"))
    };

    _currentTime = Zen_JIP_Args_Server select 0;
    _overcast = Zen_JIP_Args_Server select 1;
    _overcastForecast = Zen_JIP_Args_Server select 2;
    _startTimeOvercast = Zen_JIP_Args_Server select 3;
    _overcastTime = Zen_JIP_Args_Server select 4;
    _fog = Zen_JIP_Args_Server select 5;
    _fogForecast = Zen_JIP_Args_Server select 6;
    _startTimeFog = Zen_JIP_Args_Server select 7;
    _fogTime = Zen_JIP_Args_Server select 8;
    _viewDist = Zen_JIP_Args_Server select 9;
    // _players = Zen_JIP_Args_Server select 10;
    // _playerVehicle = Zen_JIP_Args_Server select 11;

    0 = [["overcast", _overcast, _overcastForecast, _startTimeOvercast + _overcastTime - _currentTime], ["fog", _fog, _fogForecast, _startTimeFog + _fogTime - _currentTime], ["packet", false]] spawn Zen_SetWeather;

    // we only need the case where the player object did not previously exist
    0 = [_viewDist, -1, -1, false] call Zen_SetViewDistance;

    // we must give the player's machine the action for all other client's objects
    {
        0 = [_x select 0, _x select 5, _x select 1, _x select 4] call Zen_InvokeActionClient;
    } forEach Zen_Action_Array_Server;

    // we must give the action to the player's new object on all machines
    0 = [player] call Zen_AddGiveMagazine;
    0 = [player] call Zen_AddLoadoutDialog;

    // Since this is a fixed value, we can use it to determine which group the new player is in
    if (typeOf player == "B_crew_F") then {
        0 = [player, "crewman", false] call Zen_GiveLoadoutBlufor;
    } else {
        0 = [player, BLUFOR_LOADOUTS, false] call Zen_GiveLoadoutBlufor;
    };

    // This part is new, because there are no AI, we need to put the new player with his teammates
    // We also need to account for vehicles
    if (vehicle leader group player == leader group player) then {
        player setPosATL ([leader group player, 2 + random 3, random 360] call Zen_ExtendVector);
    } else {
        0 = [player, vehicle leader group player, "all"] call Zen_MoveInVehicle;

        if (vehicle player == player) then {
            player setPosATL ([vehicle leader group player, 5 + random 5, random 360] call Zen_ExtendVector);
        };
    };

    // Just use Zen_ReassignTask, as in the JIP demo
    {
        0 = [_x, player] call Zen_ReassignTask;
    } forEach ([(leader group player)] call Zen_GetUnitTasks);

    // new player == new markers
    Zen_MP_Closure_Packet = ["f_ResetTracking", []];
    publicVariableServer "Zen_MP_Closure_Packet";

    // no Zen_CreateObjective is used
    // sleep 2;
    // {
        // _data = [_x] call Zen_GetTaskDataGlobal;
        // _dest = _data select 3;
        // _marker = [allMapMarkers, _dest] call Zen_FindMinDistance;
        // if ((([_marker, _dest] call Zen_Find2dDistance) < 2) && {(markerShape _marker == "ICON")}) then {
            // _marker setMarkerAlphaLocal 1;
        // };
    // } forEach ([player] call Zen_GetUnitTasks);
};

if (isServer) then {
    Zen_SyncJIPServer = {
        Zen_JIP_Args_Server set [0, time];
        Zen_JIP_Args_Server set [1, overcast];
        Zen_JIP_Args_Server set [2, overcastForecast];
        Zen_JIP_Args_Server set [5, fog];
        Zen_JIP_Args_Server set [6, fogForecast];

        // Any command that aught to be executed on the server for an object should be executed here for a JIP client
        _this addMPEventHandler ["MPRespawn", f_HandleRespawn];

        (owner _this) publicVariableClient "Zen_Task_Array_Global";
        (owner _this) publicVariableClient "Zen_Fire_Support_Array_Global";
        (owner _this) publicVariableClient "Zen_Fire_Support_Action_Array_Global";
        (owner _this) publicVariableClient "Zen_Loadout_Array_Global";
        (owner _this) publicVariableClient "Zen_Loadout_Action_Array_Local";
        (owner _this) publicVariableClient "Zen_Damage_Increase";
        (owner _this) publicVariableClient "Zen_Dialog_Classes_Global";
        (owner _this) publicVariableClient "Zen_Control_Classes_Global";
        (owner _this) publicVariableClient "Zen_Fire_Support_Action_Dialog_Data";
        (owner _this) publicVariableClient "Zen_Action_Array_Server";
        (owner _this) publicVariableClient "Zen_AddFireSupportAction_Action_ID";
        (owner _this) publicVariableClient "Zen_JIP_Args_Server";
    };
};
