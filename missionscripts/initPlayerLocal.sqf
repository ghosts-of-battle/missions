////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                           initPlayerLocal.sqf                              //
//                     this file is executed on clients                       //
////////////////////////////////////////////////////////////////////////////////

if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

sleep 2;

////////////////////////////////////////////////////////////////////////////////
// Enhanced High & Low Script														   										//
// https://forums.bohemia.net/forums/topic/189776-enhanced-high-low-script/		//
////////////////////////////////////////////////////////////////////////////////

_ehls = [] execVM "EHL\EHL.sqf";
waitUntil {scriptDone _ehls};
////////////////////////////////////////////////////////////////////////////////
// TFAR Radio jammer1       														   										//
// https://forums.bohemia.net/forums/topic/203810-release-radio-jamming-script-for-task-force-radio/		//
////////////////////////////////////////////////////////////////////////////////

//radioJammer = [[jammer1, jammer2, jammer3], 1000, 50, TRUE] execVM "scripts\TFARjamRadios.sqf";

////////////////////////////////////////////////////////////////////////////////
// adds blue 4 inventory									   										//
////////////////////////////////////////////////////////////////////////////////

_blufi = []  execVM "scripts\blueaiinv.sqf";
waitUntil {scriptDone _blufi};