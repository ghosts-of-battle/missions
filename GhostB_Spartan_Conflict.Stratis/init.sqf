////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                           DESCRIPTION.EXT                                  //
//              this file is executed on both server and clients              //
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// radom start time																														//
////////////////////////////////////////////////////////////////////////////////
if (isServer) then
{
myNewTime = random 24;
publicVariable "myNewTime";
};
waitUntil{not isNil "myNewTime"};
skipTime myNewTime;

setTimeMultiplier 6;

////////////////////////////////////////////////////////////////////////////////
// build a base 																													//
////////////////////////////////////////////////////////////////////////////////

_base1 = [] execVM "simple\base1.sqf";
waitUntil {scriptDone _base1};

_base2 = [] execVM "simple\base2.sqf";
waitUntil {scriptDone _base2};



////////////////////////////////////////////////////////////////////////////////
// VCOM AI 																																		//
// https://github.com/genesis92x/VcomAI-3.0      			  											//
////////////////////////////////////////////////////////////////////////////////

//Exec Vcom AI function
_vcom = [] execVM "Vcom\VcomInit.sqf";
waitUntil {scriptDone _vcom};

//Globally disable VCOM_AI for Air units including Combat Support and Logistics. Put the following in init.sqf
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;

////////////////////////////////////////////////////////////////////////////////
// UAV Marker Script 																													//
// http://www.armaholic.com/page.php?id=24026 																//
////////////////////////////////////////////////////////////////////////////////
/*
// needs more testing
execVM "scripts\PrykUav.sqf";
compile preprocessFileLineNumbers "scripts\PrykUav.sqf";

Script can be added to any vehicle or unit by putting the following syntax in its init line:
_null = this spawn {While {isNil "PrykUavInit"} do {sleep 2};  _this spawn PrykUavInit;}
*/

////////////////////////////////////////////////////////////////////////////////
// Inter 	lights not needed with rhs											  									//
// http://www.armaholic.com/page.php?id=25598 																//
////////////////////////////////////////////////////////////////////////////////

_intlight =[] execVM "scripts\IntLight.sqf";
waitUntil {scriptDone _intlight};
// not needed with rhs
compile preprocessFileLineNumbers "scripts\IntLight.sqf";

////////////////////////////////////////////////////////////////////////////////
// towing											  																							//
// https://forums.bohemia.net/forums/topic/188980-advanced-towing/ 						//
////////////////////////////////////////////////////////////////////////////////

_tow =[] execVM "scripts\fn_advancedTowingInit.sqf";
waitUntil {scriptDone _tow};
compile preprocessFileLineNumbers "scripts\fn_advancedTowingInit.sqf";

////////////////////////////////////////////////////////////////////////////////
// Taxi script																																//
// http://www.armaholic.com/page.php?id=31797																	//
//	onActivation = _null = [this] execVM "Taxi\taxi_show.sqf";								//
//	onDeactivation = _null = [this] execVM "Taxi\taxi_hide.sqf";							//
// taxi start point marker = transport
////////////////////////////////////////////////////////////////////////////////

//call compile preprocessFileLineNumbers "Taxi\taxi_init.sqf";

////////////////////////////////////////////////////////////////////////////////
//   brief																																		//
////////////////////////////////////////////////////////////////////////////////

_brief1 =[] execVM "brief\briefing.sqf";
waitUntil {scriptDone _brief1};

_brief2 =[] execVM "brief\howtoo.sqf";
waitUntil {scriptDone _brief2};

////////////////////////////////////////////////////////////////////////////////
// Alive        																															//
////////////////////////////////////////////////////////////////////////////////

waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};

waitUntil {!isNil "ALIVE_profileSystemInit"};

waituntil {(player getvariable ["alive_sys_player_playerloaded",false])};
