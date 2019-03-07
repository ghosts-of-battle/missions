// by ALIAS
// Spot and Ambiental Lights DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// null = [obj_name,[x_coord, y_coord, z_coord],[r,g,b],brightness,focused] execvm "scripts\AL_ambient_light\al_spot.sqf";
// [car,[0,0,-1.1],[0,0,1],1000,false] execvm "scripts\AL_ambient_light\al_spot_diffuse.sqf";
// [car,[0,0,-1.1],[0,0,1],1000,true] execvm "scripts\AL_ambient_light\al_spot_diffuse.sqf";

if (!isServer) exitWith {};

_ob_atas_to = _this select 0;
_ob_coord	= _this select 1;
_color_spot	= _this select 2;
_bri_spot	= _this select 3;
_type_spot	= _this select 4;

if (!isNil {_ob_atas_to getVariable "is_ON"}) exitWith {};
_ob_atas_to setVariable ["is_ON",true,true];

//[[[_ob_atas_to,_ob_coord,_color_spot,_bri_spot,_type_spot],"scripts\AL_ambient_light\al_spot_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
[[_ob_atas_to,_ob_coord,_color_spot,_bri_spot,_type_spot],"scripts\AL_ambient_light\al_spot_effect.sqf"] remoteExec ["execVM",0,true];
