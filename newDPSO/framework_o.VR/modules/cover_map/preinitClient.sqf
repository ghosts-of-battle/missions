#include "..\..\core\script_macros.hpp"

private _version = 0.3;

["Cover Map", "Covers map except specified area, allows switching between multiple AOs", "Blackhawk, PIZZADOX &amp; StatusRed", _version] call FUNC(RegisterModule);

[] call FUNC(CM_Init);
