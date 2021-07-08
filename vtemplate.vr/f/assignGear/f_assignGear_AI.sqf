// F3 - Assign Gear Script - AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if (hasInterface && !isServer) exitWith {};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_units","_unit","_faction","_known","_unitFactions","_unitClasses"];

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The factions of all units which should be affected
_unitFactions = ["blu_f", "opf_f", "ind_f","blu_g_f","opf_g_f","ind_g_f"];

// The default class picked when no corresponding entry is found in the _unitClasses array
_defaultclass = "rif";

// The unit classes and their corresponding F3 Assign Gear Component type
_unitClasses = [

	["_officer_"	,	"co"	],
	["_colonel_"	,	"co"	],
	["_sl_"			,	"sl"	],
	["_tl_"			,	"ftl"	],
	["_lite_"		,	"car"	],
	["_ar_"			,	"ar"	],
	["_aar_"		,	"aar"	],
	["_a_"			,	"aar"	],
	["_lat_"		,	"lat"	],
	["_medic_"		,	"med"	],
	["_gl_"			,	"gren"	],
	["_exp_"		,	"dem"	],
	["_engineer_"	,	"eng"	],
	["_mg_"			,	"mmg"	],
	["_amg_"		,	"ammg"	],
	["_at_"			,	"mat"	],
	["_aat_"		,	"amat"	],
	["_aa_"			,	"sam"	],
	["_aaa_"		,	"asam"	],
	["_uav_"		,	"uav"	],
	["_m_"			,	"dm"	],
	["_sniper_"		,	"sn"	],
	["_spotter_"	,	"sp"	],
	["_repair_"		,	"vd"	],
	["_crew_"		,	"vd"	],
	["_helipilot_"	,	"pil"	],
	["_helicrew_"	,	"pcc"	],
	["_pilot_"		,	"pil"	]

];

// ====================================================================================

// Interpret parameters
_units = if (count _this == 0) then [{waitUntil {scriptDone f_script_setLocalVars};f_var_men},{_this}];
if !(local (_units select 0)) exitWith {};

// LOOP THROUGH AI UNITS AND ASSIGN GEAR
{
	sleep 0.1;
	_unit = _x;

	// Check if the unit was already touched by the F3 Assign Gear Component
	if (!(_unit getvariable ["f_var_assignGear_done", false]) && {!(_unit in playableUnits) && (_unit isKindOf "Man")}) then {

			_faction = toLower (faction _unit);

			// If the unit's faction is allowed, proceed
			if (_faction in _unitFactions) then {
				_known = false;
				{
					_known = [toLower (_x select 0),toLower (typeOf _unit)] call BIS_fnc_inString;

					// If the unit's classname corresponds to a class in the assignment array, set it's gear accordingly
					if (_known) exitWith {
						[[_x select 1, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
					};
				} forEach _unitClasses;

				// If the class is not in the _unitClasses array
				if (!_known) then {
					[[_defaultclass, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
				};

			} else {
				// If the faction is not allowed, set the assignGear variable to true to ignore the unit from now on
				_x setvariable ["f_var_assignGear_done", true,true];
			};
	};
} foreach _units;
