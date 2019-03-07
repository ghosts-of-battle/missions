this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","RODEO ONE"];
this setvariable ["CS_CODE",'this addEventHandler ["HIT",{(_this select 0) setDamage (0.25 * damage (_this select 0));}];this setVehicleRadar 1;this setVehicleReceiveRemoteTargets true;this setVehicleReportOwnPosition true;this setVehicleReportRemoteTargets true;  '];

vcm



this setvariable ["CS_TYPE","CAS"];
this setvariable ["CS_CALLSIGN","RAVEN ONE"];
this setvariable ["CS_HEIGHT",_height]; //Altitude of the landing site




(group this)  addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];this setVehicleRadar 1;this setVehicleReceiveRemoteTargets true;this setVehicleReportOwnPosition true;this setVehicleReportRemoteTargets true;










[[[this], "Hover.sqf"], "BIS_fnc_execVM", nil, false, true] call BIS_fnc_MP;

this setvariable ["CS_CODE",""];

this setVariable ["ace_medical_medicClass", 1];clearWeaponCargoGlobal this;clearMagazineCargoGlobal this;clearItemCargoGlobal this;this addItemCargoGlobal ["ACE_adenosine", 40];this addItemCargoGlobal ["ACE_atropine", 40];this addItemCargoGlobal ["ACE_fieldDressing", 40];this addItemCargoGlobal ["ACE_elasticBandage", 40];this addItemCargoGlobal ["ACE_bloodIV", 40];this addItemCargoGlobal ["ACE_bodyBag", 4];this addItemCargoGlobal ["ACE_CableTie", 6];this addItemCargoGlobal ["ACE_DefusalKit", 4];this addItemCargoGlobal ["ACE_epinephrine", 40];this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];this addItemCargoGlobal ["ACE_morphine", 40];this addItemCargoGlobal ["ACE_packingBandage", 40];this addItemCargoGlobal ["ACE_personalAidKit", 40];this addItemCargoGlobal ["ACE_plasmaIV", 40];this addItemCargoGlobal ["ACE_salineIV", 40];this addItemCargoGlobal ["ACE_tourniquet", 10];this addItemCargoGlobal ["ACE_surgicalKit", 4];this addItemCargoGlobal ["ACE_EarPlugs", 4];

this addItemCargoGlobal ["adv_aceCPR_AED", 2];




this call ace_fastroping_fnc_equipFRIES;this addEventHandler ["HIT",{(_this select 0) setDamage (0.25 * damage (_this select 0));}];this setVehicleRadar 1;this setVehicleReceiveRemoteTargets true;this setVehicleReportOwnPosition true;this setVehicleReportRemoteTargets true;











this setvariable ["CS_CODE","[[[this], ""Hover.sqf""], ""BIS_fnc_execVM"", nil, false, true] call BIS_fnc_MP;this setVariable [""ace_medical_medicClass"", 1];this call ace_fastroping_fnc_equipFRIES;clearWeaponCargoGlobal this;clearMagazineCargoGlobal this;clearItemCargoGlobal this;this addItemCargoGlobal [""ACE_adenosine"", 40];this addItemCargoGlobal [""ACE_atropine"", 40];this addItemCargoGlobal [""ACE_fieldDressing"", 40];this addItemCargoGlobal [""ACE_elasticBandage"", 40];this addItemCargoGlobal [""ACE_bloodIV"", 40];this addItemCargoGlobal [""ACE_bodyBag"", 4];this addItemCargoGlobal [""ACE_CableTie"", 6];this addItemCargoGlobal [""ACE_DefusalKit"", 4];this addItemCargoGlobal [""ACE_epinephrine"", 40];this addItemCargoGlobal [""ACE_Flashlight_XL50"", 6];this addItemCargoGlobal [""ACE_morphine"", 40];this addItemCargoGlobal [""ACE_packingBandage"", 40];this addItemCargoGlobal [""ACE_personalAidKit"", 40];this addItemCargoGlobal [""ACE_plasmaIV"", 40];this addItemCargoGlobal [""ACE_salineIV"", 40];this addItemCargoGlobal [""ACE_tourniquet"", 10];this addItemCargoGlobal [""ACE_surgicalKit"", 4];this addItemCargoGlobal [""ACE_EarPlugs"", 4];this addItemCargoGlobal [""MineDetector"", 4];this addItemCargoGlobal [""SmokeShellBlue"", 10];this addItemCargoGlobal [""SmokeShellGreen"", 10];this addItemCargoGlobal [""SmokeShellOrange"", 10];this addItemCargoGlobal [""SmokeShellPurple"", 10];this addItemCargoGlobal [""SmokeShellRed"", 10];this addItemCargoGlobal [""SmokeShellYellow"", 10];this addItemCargoGlobal [""rhs_mag_m67"", 10];this addItemCargoGlobal [""ACE_M14"", 10];this addItemCargoGlobal [""rhsusf_m112_mag"", 5];this addItemCargoGlobal [""DemoCharge_Remote_Mag"", 5];this addItemCargoGlobal [""ACE_Clacker"", 5];this addMagazineCargoGlobal [""20Rnd_762x51_Mag"", 40];this addMagazineCargoGlobal [""10Rnd_338_Mag"", 40];this addMagazineCargoGlobal [""rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green"", 40];this addMagazineCargoGlobal [""rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red"", 40];this addMagazineCargoGlobal [""rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow"", 40];this addMagazineCargoGlobal [""rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange"", 40];"];


[[[this], "Hover.sqf"], "BIS_fnc_execVM", nil, false, true] call BIS_fnc_MP;this setVariable ["ace_medical_medicClass", 1];




this call ace_fastroping_fnc_equipFRIES;clearWeaponCargoGlobal this;clearMagazineCargoGlobal this;clearItemCargoGlobal this;this addItemCargoGlobal ["ACE_adenosine", 40];this addItemCargoGlobal ["ACE_atropine", 40];this addItemCargoGlobal ["ACE_fieldDressing", 40];this addItemCargoGlobal ["ACE_elasticBandage", 40];this addItemCargoGlobal ["ACE_bloodIV", 40];this addItemCargoGlobal ["ACE_bodyBag", 4];this addItemCargoGlobal ["ACE_CableTie", 6];this addItemCargoGlobal ["ACE_DefusalKit", 4];this addItemCargoGlobal ["ACE_epinephrine", 40];this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];this addItemCargoGlobal ["ACE_morphine", 40];this addItemCargoGlobal ["ACE_packingBandage", 40];this addItemCargoGlobal ["ACE_personalAidKit", 40];this addItemCargoGlobal ["ACE_plasmaIV", 40];this addItemCargoGlobal ["ACE_salineIV", 40];this addItemCargoGlobal ["ACE_tourniquet", 10];this addItemCargoGlobal ["ACE_surgicalKit", 4];this addItemCargoGlobal ["ACE_EarPlugs", 4];this addItemCargoGlobal ["MineDetector", 4];this addItemCargoGlobal ["SmokeShellBlue", 10];this addItemCargoGlobal ["SmokeShellGreen", 10];this addItemCargoGlobal ["SmokeShellOrange", 10];this addItemCargoGlobal ["SmokeShellPurple", 10];this addItemCargoGlobal ["SmokeShellRed", 10];this addItemCargoGlobal ["SmokeShellYellow", 10];this addItemCargoGlobal ["rhs_mag_m67", 10];this addItemCargoGlobal ["ACE_M14", 10];this addItemCargoGlobal ["rhsusf_m112_mag", 5];this addItemCargoGlobal ["DemoCharge_Remote_Mag", 5];this addItemCargoGlobal ["ACE_Clacker", 5];this addMagazineCargoGlobal ["20Rnd_762x51_Mag", 40];this addMagazineCargoGlobal ["10Rnd_338_Mag", 40];this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green", 40];this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red", 40];this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow", 40];this addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange", 40];




this setvariable ["ace_medical_isMedicalFacility", true]; this addEventHandler [HIT,{(_this select 0) setDamage (0.00 * damage (this select 0));}];



this addEventHandler ["HandleDamage", {false}]; this setvariable ["ace_medical_isMedicalFacility", true]; this addEventhandler ["HIT",{_this select 0 setDamage (0.00 * damage (this select 0))}];

this setvariable ["ace_medical_isMedicalFacility", true]; this addItemCargoGlobal ["ACE_adenosine", 40];this addItemCargoGlobal ["ACE_atropine", 40];this addItemCargoGlobal ["ACE_fieldDressing", 40];this addItemCargoGlobal ["ACE_elasticBandage", 40];this addItemCargoGlobal ["ACE_bloodIV", 40];this addItemCargoGlobal ["ACE_bodyBag", 4];this addItemCargoGlobal ["ACE_CableTie", 6];this addItemCargoGlobal ["ACE_DefusalKit", 4];this addItemCargoGlobal ["ACE_epinephrine", 40];this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];this addItemCargoGlobal ["ACE_morphine", 40];this addItemCargoGlobal ["ACE_packingBandage", 40];this addItemCargoGlobal ["ACE_personalAidKit", 40];this addItemCargoGlobal ["ACE_plasmaIV", 40];this addItemCargoGlobal ["ACE_salineIV", 40];this addItemCargoGlobal ["ACE_tourniquet", 10];this addItemCargoGlobal ["ACE_surgicalKit", 4];this addItemCargoGlobal ["ACE_EarPlugs", 4];this addItemCargoGlobal ["adv_aceCPR_AED", 2];



(group this)  addeventhandler ["fired", {(_this select 0) setvehicleammo 1}]; (group this)  addEventhandler ["HIT",{_this select 0 setDamage (0.10 * damage (this select 0))}];


this addeventhandler ["handledamage",{ _this setdamage ((damage _this) * 0 )}];

this addEventhandler ["HIT",{_this select 0 setDamage (0.50 * damage (_this select 0))}];
this addeventhandler ["handledamage",{ (_this select 0) /2}];
this addeventhandler ["handledamage",{ (_this) * .5}];
this addEventHandler ["HandleDamage", {(_this select 2)/4)}];
this addeventhandler ["handledamage",{ (_this select 2) /4}];



this addEventHandler ["HandleDamage", {false}]; this addEventHandler ["Hit", {_this setDamage (0.50 + getDammage _this)}];





this addEventHandler ["HandleDamage", {false}]; this addEventHandler ["Hit", {_this setDamage (0.25 + getDammage _this)}];


this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","DPSO Sea Knight"];
this setvariable ["CS_CODE",'this setVariable ["Vcm_Disable",true];']








(group this) setVariable ["Vcm_Disable",true]; this setVariable ["ace_medical_medicClass", 1];clearWeaponCargoGlobal this;clearMagazineCargoGlobal this;clearItemCargoGlobal this;this addItemCargoGlobal ["ACE_adenosine", 40];this addItemCargoGlobal ["ACE_atropine", 40];this addItemCargoGlobal ["ACE_fieldDressing", 40];this addItemCargoGlobal ["ACE_elasticBandage", 40];this addItemCargoGlobal ["ACE_bloodIV", 40];this addItemCargoGlobal ["ACE_bodyBag", 4];this addItemCargoGlobal ["ACE_CableTie", 6];this addItemCargoGlobal ["ACE_DefusalKit", 4];this addItemCargoGlobal ["ACE_epinephrine", 40];this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];this addItemCargoGlobal ["ACE_morphine", 40];this addItemCargoGlobal ["ACE_packingBandage", 40];this addItemCargoGlobal ["ACE_personalAidKit", 40];this addItemCargoGlobal ["ACE_plasmaIV", 40];this addItemCargoGlobal ["ACE_salineIV", 40];this addItemCargoGlobal ["ACE_tourniquet", 10];this addItemCargoGlobal ["ACE_surgicalKit", 4];this addItemCargoGlobal ["ACE_EarPlugs", 4];this addItemCargoGlobal ["adv_aceCPR_AED", 2];


(group this) setVariable ["Vcm_Disable",true]; (group this)  addeventhandler ["fired", {(_this select 0) setvehicleammo 1}]; (group this)  addEventhandler ["HIT",{_this select 0 setDamage (0.10 * damage (this select 0))}];





this removeWeapon "CUP_weapon_mastersafe";
