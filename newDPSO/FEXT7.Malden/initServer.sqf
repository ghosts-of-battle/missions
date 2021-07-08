#include "script_component.hpp"

GVAR(spawnedVehiclesNamespace) = true call CBA_fnc_createNamespace;
publicVariable QGVAR(spawnedVehiclesNamespace);

// {_x disableAI "RADIOPROTOCOL"} forEach allUnits;