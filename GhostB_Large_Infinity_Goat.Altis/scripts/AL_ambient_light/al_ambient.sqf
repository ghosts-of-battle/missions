// by ALIAS
// Spot and Ambiental Lights DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[this,[1,.1,.25],300],"scripts\AL_ambient_light\al_ambient.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
// null = [this,[.1,.1,.25],300] execVM "AL_light\al_ambient.sqf";

if (!isServer) exitWith {};

_ob_source 		= _this select 0;
_color_source	= _this select 1;
_bri_source		= _this select 2;

if (isNil {_ob_source getVariable "is_ON"}) exitWith {};
_ob_source setVariable ["is_ON",true,true];

//creez obiect la coordonatele date prin script

//[[[_ob_source,_color_source,_bri_source],"scripts\AL_ambient_light\al_ambient_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

[_ob_source,_color_source,_bri_source],"scripts\AL_ambient_light\al_ambient_effect.sqf"] remoteExec ["execVM",0,true];
