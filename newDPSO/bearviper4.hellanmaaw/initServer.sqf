////////////////////////////////////////////////////////////////////////////////
//                           initServer.sqf                                   //
//                     this file is executed on Server                        //
////////////////////////////////////////////////////////////////////////////////

#include "script_component.hpp"

GVAR(spawnedVehiclesNamespace) = true call CBA_fnc_createNamespace;
publicVariable QGVAR(spawnedVehiclesNamespace);

// {_x disableAI "RADIOPROTOCOL"} forEach allUnits;