// by ALIAS
// Spot and Ambiental Lights DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[_ob_source,_color_source,_bri_sourcet],"scripts\AL_ambient_light\al_ambient_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

private [];

If (!hasInterface) exitWith {};

_sursa_ob		= _this select 0;
_sursa_color	= _this select 1;
_sursa_lumin	= _this select 2;

_alight = "#lightpoint" createvehicle getPosATL _sursa_ob;
_alight setLightDayLight true;
_alight setlightbrightness _sursa_lumin;
_alight setlightcolor _sursa_color;
_alight setlightambient _sursa_color;
