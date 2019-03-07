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



@CBA_A3;@DPSO_ACE3;@DPSO_alive;@DPSO_ALIVE_adds;@DPSO_Core;@DPSO_ShackTAC;@DPSO_TFAR;@DPSO_Gear;@DPSO_Air;@DPSO_Maps;@DPSO_NAVY


@ALiVE;@Spyder;@ACE3_DPSO_version;@DPSO_Gear;@ShackTac;@task_force_radio;@DPSO_Core;@DPSO_AIR_NAVY;@ATLAS;@F-14D;@FA-18;@FIR_AWS;@Nimitz;@DPSO_Maps


@JSRS4Server;


@CBA_A3;@DPSO_ACE3;@DPSO_alive;

@DPSO_ALIVE_adds;@DPSO_Core;@DPSO_ShackTAC;
@DPSO_TFAR;@DPSO_Gear;@DPSO_Air;

@DPSO_Maps;@DPSO_Navy



[heli,"type4","black"] call fir_fnc_ghosthawk_acc_set; this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.50 + getDammage Unit)}]