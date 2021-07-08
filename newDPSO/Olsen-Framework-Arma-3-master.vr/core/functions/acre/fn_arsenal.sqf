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
    ["ACRE_PRC117F","ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_VHF30108SPIKE","ACRE_VHF30108","ACRE_VHF30108MAST","ItemAndroid","ACE_microDAGR","ACE_DAGR","ItemcTabHCam","ItemMicroDAGR","ItemcTab"],
    "ACRE 2",
    "\z\ace\addons\arsenal\data\iconPublic.paa"
] call ace_arsenal_fnc_addRightPanelButton;