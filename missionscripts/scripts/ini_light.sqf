// by ALIAS
// Spot and Ambient Lights DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

================================================================================================================================
>>>>> Ambient Light Parameters
================================================================================================================================

[[[ob_source, color_source, bri_source],"scripts\AL_ambient_light\al_ambient_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

ob_source		- string, name of the object which servers as emitter
color_source	- array, defines the color of the light, there are 3 parameters taking values from 0 to 1, first is the red component of the light, second is yellow component, third is the blue component
bri_source		- number, sets the brightness if the light

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EXAMPLES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

When running the script from the init field of the object
- Moon Light
null=[this,[0.15,0.15,0.25],500] execvm "scripts\AL_ambient_light\al_ambient_effect.sqf";

- Alien light
null=[this,[0.1,0.5,0.4],500] execvm "scripts\AL_ambient_light\al_ambient_effect.sqf";

///////////////////////////////////////////////////////////////////////////////////////////////////
When running the script from init.sqf or another script, in any case it has to be executed in global space
- Moon Light
null=[name_my_objec,[0.15,0.15,0.25],500] execvm "scripts\AL_ambient_light\al_ambient_effect.sqf";

- Alien light
null=[name_my_objec,[0.1,0.5,0.4],500] execvm "scripts\AL_ambient_light\al_ambient_effect.sqf";

================================================================================================================================
>>>>> Spot Light Parameters
================================================================================================================================

[[[ob_atas_to, light_coord, color_spot, bri_spot, type_spot],"scripts\AL_ambient_light\al_spot_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

ob_atas_to		- string, name of the object to which we attach the light source
light_coord		- array, coordinates x,y,z relative to the center of the object
color_spot		- array, defines the color of the spot light, there are 3 parameters taking values from 0 to 1, first is the red component of the light, second is yellow component, third is the blue component
bri_spot		- number, sets the brightness if the light
type_spot		- boolean, if true the spot light will have a hot spot if is false will not have a hot spot


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EXAMPLE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Script executed from init field of the object
- Light source with hot spot
null=[this,[0,0,0],[0.3,0.2,0.8],3000,true] execvm "scripts\AL_ambient_light\al_spot.sqf";

- Light source without hot spot
null=[this,[0,1,-1],[0,0,1],1000,false] execvm "scripts\AL_ambient_light\al_spot.sqf";

- Light in a building
null=[this,[0,0,0],[1,1,0.8],20000,true] execvm "scripts\AL_ambient_light\al_spot.sqf";

///////////////////////////////////////////////////////////////////////////////////////////////////
Script executed from init.sqf or another script, in any case it has to be executed in global space
- Light source with hot spot
null=[name_my_objec,[0,0,0],[0.3,0.2,0.8],3000,true] execvm "scripts\AL_ambient_light\al_spot.sqf";

- Light source without hot spot
null=[name_my_objec,[0,1,-1],[0,0,1],1000,false] execvm "scripts\AL_ambient_light\al_spot.sqf";

- Light in a building
null=[name_my_objec,[0,0,0],[1,1,0.8],20000,true] execvm "scripts\AL_ambient_light\al_spot.sqf";
