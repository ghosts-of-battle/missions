////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                           DESCRIPTION.EXT                                  //
//              this file is executed on both server and clients              //
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
//---------------------headless clients---------------------------------------//
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//---------------------radom weather hop[e it works---------------------------//
////////////////////////////////////////////////////////////////////////////////
execVM "scripts\randomWeather.sqf";

////////////////////////////////////////////////////////////////////////////////
//---------------------radom start time---------------------------------------//
////////////////////////////////////////////////////////////////////////////////
if (isServer) then
{
myNewTime = random 24;
publicVariable "myNewTime";
};
waitUntil{not isNil "myNewTime"};
skipTime myNewTime;

////////////////////////////////////////////////////////////////////////////////
//---------------------VCOM AI      ------------------------------------------//
////////////////////////////////////////////////////////////////////////////////

//Exec Vcom AI function
[] execVM "Vcom\VcomInit.sqf";

//Globally disable VCOM_AI for Air units including Combat Support and Logistics. Put the following in init.sqf
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'Helicopter'});}, 1, []] call CBA_fnc_addPerFrameHandler;

////////////////////////////////////////////////////////////////////////////////
//---------------------Alive        ------------------------------------------//
////////////////////////////////////////////////////////////////////////////////
// waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};
// waitUntil {!isNil "ALIVE_profileSystemInit"};

waituntil {!isnil "ALIVE_autoGeneratedTasks"};
ALIVE_autoGeneratedTasks = ["MilAssault","MilDefence","CivAssault","Assassination","DestroyVehicles","DestroyInfantry","SabotageBuilding"];



////////////////////////////////////////////////////////////////////////////////
//---------------------the rest     ------------------------------------------//
////////////////////////////////////////////////////////////////////////////////

//nul=[] execVM "scripts\IntLight.sqf";
// not needed with rhs

//execVM "scripts\PrykUav.sqf";

//[] execVM "briefing.sqf";
