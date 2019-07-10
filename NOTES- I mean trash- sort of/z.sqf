this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","Hawk One"];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];this addEventHandler [""Hit"", {Unit setDamage (0.50 + getDammage Unit)}]';"]



this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","Hawk One"];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];this addEventHandler [""Hit"", {Unit setDamage (0.50 + getDammage Unit)}]';"]


Optional:

this setvariable ["CS_CALLSIGN","Your Callsign"]; //Callsign of the unit
this setvariable ["CS_HEIGHT",_height]; //Altitude of the landing site
this setvariable ["CS_CODE","persistent _code as 'string';"] //custom init line code
this setVariable ["CS_SLINGLOADING", false]; //disables sling loading on transport helis
this setVariable ["CS_CONTAINERS",0];  //number of crates to spawn around a transport heli (0 to disable)



this addEventHandler ["HandleDamage", {false}];
this addEventHandler ["Hit", {Unit setDamage (0.50 + getDammage Unit)}];
0 = ["AmmoboxInit",[this,true]] spawn BIS_fnc_arsenal;

null = [this, 25, 3000, 1.1, 0.15, 0.30, 0.55, 24] execVM "trindisplay\diverstats.sqf";this addItem "optic_NVS";


this addItem "optic_NVS";



this addItem "optic_Nightstalker";



this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","Hawk One"];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];
this addEventHandler [""Hit"", {Unit setDamage (0.50 + getDammage Unit)}]';"];


this setvariable ["CS_CODE","persistent _code as '

this addEventHandler ["HandleDamage", {false}]; this addEventHandler ["Hit", {Unit setDamage (0.01 + getDammage Unit)}];


"];







////////////////////////////////////////////////////////////////////////////////
// Spot and Ambiental Lights (loading to memory)					  									//
// http://www.armaholic.com/forums.php?m=posts&q=35875 				 								//
////////////////////////////////////////////////////////////////////////////////

compile preprocessFileLineNumbers "scripts\AL_ambient_light\al_spot_effect.sqf";
compile preprocessFileLineNumbers "scripts\AL_ambient_light\al_spot.sqf";








------------------------------

myLight setLightAmbient [0.5,0,0]; //produces red light around the origin source

light = "#lightpoint" createVehicleLocal position this;
light setLightBrightness 0.2;
light setLightAmbient[0, 0.2, 0];
light setLightColor[0, 3, 1];
light lightAttachObject [this, [0,0,0]];


--------------------------------




_lhd = create3DENEntity ["Object", "ATLAS_B_LHD_helper", screenToWorld [0.5, 0.5]];
_pos = (_lhd get3DENAttribute "position") select 0;
_pos set [2, 0];
_pos = ASLToATL _pos;
_lhd set3DENAttribute ["position", _pos];


this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.50 + getDammage Unit)}]



this setPos [getPos this select 0, getPos this select 1, 20]; this land "LAND";


this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","Stray Cat One"];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit"", {Unit setDamage (0.50 + getDammage Unit)}]';"]



this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];
this addEventHandler ["Hit", {Unit setDamage (0.50 + getDammage Unit)}]';"];

gk0,gk1,gk2,gk3,gk4,gk5,gk6,gk7,gk8,gk9,gk10,gk11,ADR07,ADR04,ADR02


[B_UAV_02_F,B_UAV_02_CAS_F,B_T_UAV_03_F,B_T_UAV_03_dynamicLoadout_F,B_UAV_05_F,B_UAV_02_dynamicLoadout_F]

@CBA_A3;@DPSO_ACE3;@DPSO_alive;@DPSO_ALIVE_adds;@DPSO_Core;@DPSO_ShackTAC;@DPSO_TFAR;@DPSO_Gear;@DPSO_Air;@DPSO_Maps;@DPSO_NAVY


@ALiVE;@Spyder;@ACE3_DPSO_version;@DPSO_Gear;@ShackTac;@task_force_radio;@DPSO_Core;@DPSO_AIR_NAVY;@ATLAS;@F-14D;@FA-18;@FIR_AWS;@Nimitz;@DPSO_Maps


@JSRS4Server;


@CBA_A3;@DPSO_ACE3;@DPSO_alive;

@DPSO_ALIVE_adds;@DPSO_Core;@DPSO_ShackTAC;
@DPSO_TFAR;@DPSO_Gear;@DPSO_Air;

@DPSO_Maps;@DPSO_Navy



[heli,"type4","black"] call fir_fnc_ghosthawk_acc_set; this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.50 + getDammage Unit)}]
