this addEventHandler ["HandleDamage", {(_this select 2)*0.05)}];
(group this) setVariable ["Vcm_Disable",true];
this setVariable ["ace_medical_medicClass", 1];
clearWeaponCargoGlobal this;
clearMagazineCargoGlobal this;
clearItemCargoGlobal this;
this addItemCargoGlobal ["ACE_adenosine", 40];
this addItemCargoGlobal ["ACE_atropine", 40];
this addItemCargoGlobal ["ACE_fieldDressing", 80];
this addItemCargoGlobal ["ACE_elasticBandage", 80];
this addItemCargoGlobal ["ACE_bloodIV", 40];
this addItemCargoGlobal ["ACE_bodyBag", 20];
this addItemCargoGlobal ["ACE_CableTie", 60];
this addItemCargoGlobal ["ACE_epinephrine", 40];
this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];
this addItemCargoGlobal ["ACE_morphine", 40];
this addItemCargoGlobal ["ACE_packingBandage", 80];
this addItemCargoGlobal ["ACE_personalAidKit", 40];
this addItemCargoGlobal ["ACE_plasmaIV", 40];
this addItemCargoGlobal ["ACE_salineIV", 40];
this addItemCargoGlobal ["ACE_tourniquet", 40];
this addItemCargoGlobal ["ACE_surgicalKit", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 10];


this call ace_fastroping_fnc_equipFRIES;(group this) setVariable ["Vcm_Disable",true];


this addeventhandler ["handledamage",{ (_this select 2) /1.005}];

this addEventHandler ["handledamage",{(_this select 2) *0.05}];

this setObjectTexture [0, "textures\Heli_Transport_03_ext01_md.paa"];
this setObjectTexture [1, "textures\Heli_Transport_03_ext02_md.paa"];
this addEventHandler ["HandleDamage", {((_this select 2)/4)}];
(group this) setVariable ["Vcm_Disable",true];
this setVariable ["ace_medical_medicClass", 1];
this addItemCargoGlobal ["ACE_adenosine", 40];
this addItemCargoGlobal ["ACE_atropine", 40];
this addItemCargoGlobal ["ACE_fieldDressing", 80];
this addItemCargoGlobal ["ACE_elasticBandage", 80];
this addItemCargoGlobal ["ACE_bloodIV", 40];
this addItemCargoGlobal ["ACE_bodyBag", 20];
this addItemCargoGlobal ["ACE_CableTie", 60];
this addItemCargoGlobal ["ACE_epinephrine", 40];
this addItemCargoGlobal ["ACE_Flashlight_XL50", 6];
this addItemCargoGlobal ["ACE_morphine", 40];
this addItemCargoGlobal ["ACE_packingBandage", 80];
this addItemCargoGlobal ["ACE_personalAidKit", 40];
this addItemCargoGlobal ["ACE_plasmaIV", 40];
this addItemCargoGlobal ["ACE_salineIV", 40];
this addItemCargoGlobal ["ACE_tourniquet", 40];
this addItemCargoGlobal ["ACE_surgicalKit", 8];
this addItemCargoGlobal ["ACE_EarPlugs", 10];
