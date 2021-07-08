//

if (_Zen_Is_JIP) then {
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
    _players = Zen_JIP_Args_Server select 10;
    // _playerHeli = Zen_JIP_Args_Server select 11;

    0 = [["overcast", _overcast, _overcastForecast, _startTimeOvercast + _overcastTime - _currentTime], ["fog", _fog, _fogForecast, _startTimeFog + _fogTime - _currentTime], ["packet", false]] spawn Zen_SetWeather;
    0 = [_viewDist, -1, -1, false] call Zen_SetViewDistance;

    {
        0 = [_x select 0, _x select 5, _x select 1, _x select 4] call Zen_InvokeActionClient;
    } forEach Zen_Action_Array_Server;

    if (((missionConfigFile >> "disabledAI") isEqualTo 1) || ((count ([player] call Zen_GetUnitTasks)) == 0)) then {
        0 = [player] call Zen_AddGiveMagazine;
        0 = [player] call Zen_AddRepackMagazines;

        0 = [player, LOADOUTS_BLUFOR, false] call Zen_GiveLoadoutBlufor;

        private ["_refUnit"];
        _refUnitArray = (units group player) - [player];
        if (count _refUnitArray == 0) then {
            _refUnit = (([side player] call Zen_ConvertToObjectArray) - [player]) select 0;
        } else {
            _refUnit = _refUnitArray select 0;
        };

        if (vehicle _refUnit != _refUnit) then {
            player moveInAny (vehicle _refUnit);
            if (vehicle player == player) then {
                player setPosATL ([_refUnit, 2 + random 3, random 360] call Zen_ExtendVector);
            };
        } else {
            player setPosATL ([_refUnit, 2 + random 3, random 360] call Zen_ExtendVector);
        };

        {
            0 = [_x, player] call Zen_ReassignTask;
        } forEach ([_refUnit] call Zen_GetUnitTasks);
    } else {
        {
            0 = [(_x select 1), (_x select 4), (_x select 5), (_x select 3), false, (_x select 0), (_x select 6)] call Zen_InvokeTaskClient;
            0 = [(_x select 0)] call Zen_UpdateTask;
            sleep 0.1;
        } forEach Zen_Task_Array_Global;
    };

    sleep 2;
    {
        _data = [_x] call Zen_GetTaskDataGlobal;
        _dest = _data select 3;
        _marker = [allMapMarkers, _dest] call Zen_FindMinDistance;
        if ((([_marker, _dest] call Zen_Find2dDistance) < 2) && {(markerShape _marker == "ICON")}) then {
            _marker setMarkerAlphaLocal 1;
        };
    } forEach ([player] call Zen_GetUnitTasks);
};

if (isServer) then {
    Zen_SyncJIPServer = {
        Zen_JIP_Args_Server set [0, time];
        Zen_JIP_Args_Server set [1, overcast];
        Zen_JIP_Args_Server set [2, overcastForecast];
        Zen_JIP_Args_Server set [5, fog];
        Zen_JIP_Args_Server set [6, fogForecast];

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
