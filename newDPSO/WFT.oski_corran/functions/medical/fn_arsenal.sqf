/*
Arguments:
0: items only misc items <ARRAY of STRING>
1: tooltip <STRING> (Optional)
2: picture path <STRING> (Optional)
3: override a spezific button (0-9) <NUMBER> (Optional)

Return Value:
successful: number of the slot; error: -1 <NUMBER>

Example:
[["ACE_bloodIV_500","ACE_Banana"],"MedicalStuff","\z\ace\addons\arsenal\data\iconCustom.paa",5] call ace_arsenal_fnc_addRightPanelButton

Public: Yes
*/

[
    ["ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","kat_aatKit","ACE_quikclot","ACE_tourniquet","ACE_splint","ACE_morphine","ACE_adenosine","ACE_atropine","ACE_epinephrine","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_personalAidKit","ACE_surgicalKit","ACE_bodyBag","AFMED_apap","kat_X_AED","kat_Painkiller","kat_chestSeal","kat_larynx","kat_guedel","kat_accuvac","kat_AED","kat_Pulseoximeter","DPSO_MedicKit","DPSO_FirstAid","DPSO_MedicArea","DPSO_Stethoscope"],
    "Medical",
    "\z\ace\addons\medical_gui\data\categories\medication.paa"
] call ace_arsenal_fnc_addRightPanelButton;