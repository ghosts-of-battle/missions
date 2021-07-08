/*
Function: DPSO_fnc_MedicalSupplies

Description:
	Used to configure basic container medical state.

Arguments:
	_container - Container the setup is applied to. <OBJECT>
	_Type - Equipment setup to add. <STRING>
	_purge - Clear the container's inventory before adding supplies? <BOOLEAN>

Examples:
	(begin example)
		[this] call DPSO_fnc_MedicalSupplies;
		[this, "MERT", true] call DPSO_fnc_MedicalSupplies;
	(end)

Author:
	MitchJC
*/
if (!isServer) exitwith {};

params [
	"_container",
	["_Type", "NONE"],
	["_purge", false]
];



if (_Type isEqualTo "NONE") exitWith {};

private ["_ContainerItems"];

call {
	if (_Type isEqualTo "Limited") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["ACE_EarPlugs", 4],
				["ACE_Flashlight_MX991", 1],
				["ToolKit", 1],
				["Chemlight_blue", 1],
				["Chemlight_green", 1],
				["Chemlight_red", 1]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 20]
			];
		};
	};
	if (_Type isEqualTo "Standard") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["ACE_EarPlugs", 4],
				["ACE_Flashlight_MX991", 1],
				["ToolKit", 1],
				["Chemlight_blue", 1],
				["Chemlight_green", 1],
				["Chemlight_red", 1]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 30],
				["Medikit", 2]
			];
		};
	};
	if (_Type isEqualTo "MERT") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["ACE_EarPlugs", 4],
				["ACE_Flashlight_MX991", 1],
				["ToolKit", 1],
				["Chemlight_blue", 1],
				["Chemlight_green", 1],
				["Chemlight_red", 1],
				["kat_accuvac", 2],
				["kat_X_AED", 2],
				["kat_AED", 2],
				["ACE_bodyBag", 8],
				["ACE_tourniquet", 40],
				["ACE_surgicalKit", 2],
				["ACE_splint", 20],
				["ACE_salineIV", 20],
				["ACE_plasmaIV", 20],
				["ACE_personalAidKit", 4],
				["ACE_morphine", 20],
				["kat_guedel", 20],
				["ACE_epinephrine", 20],
				["ACE_EarPlugs", 20],
				["kat_chestSeal", 20],
				["kat_bloodIV_B", 20],
				["kat_bloodIV_AB", 20],
				["kat_bloodIV_A", 20],
				["kat_bloodIV_O", 20],
				["ACE_fieldDressing", 40],
				["ACE_elasticBandage", 40],
				["ACE_packingBandage", 40],
				["ACE_quikclot", 40],
				["ACE_adenosine", 20],
				["kat_Pulseoximeter",4],
				["kat_larynx",20],
				["kat_Painkiller",20],
				["kat_crossPanel",2],
				["kat_stretcherBag",4],
				["kat_aatKit",20],
				["ACE_plasmaIV",20],
				["ACE_HandFlare_Red",20],
				["ACE_Chemlight_HiRed",20]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 50],
				["Medikit", 2]
			];
		};
	};
};

if (_purge) then {
	clearItemCargoGlobal _container;
};

{_container addItemCargoGlobal _x} foreach _ContainerItems;



