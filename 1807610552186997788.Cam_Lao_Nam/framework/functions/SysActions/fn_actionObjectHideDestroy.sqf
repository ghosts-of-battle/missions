/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2021-04-06
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
params [["_target",objNull,[objNull]]];

if (isNull _target) exitWith {};

// Player Redeploy Menu
["MPSF_Action_bodyBag",_target,format["Recover %1",[_target] call MPSF_fnc_getCfgText],[
	["framework\data\holdactions\holdAction_search_ca.paa",{
		missionNamespace setVariable ["MPSF_Action_hidDestroy_target",cursorTarget];
		player playActionNow "medicStartUp";
	}]
	,["framework\data\holdactions\holdAction_search_ca.paa",{}]
	,{
		private _target = missionNamespace getVariable ["MPSF_Action_hidDestroy_target",objNull];
		if (isNull _target) exitWith {};

		_target setPosASL [0,0,0];
		_target setDamage 1;

		missionNamespace setVariable ["MPSF_Action_hidDestroy_target",nil];
		player playActionNow "medicStop";
	},{
		missionNamespace setVariable ["MPSF_Action_hidDestroy_target",nil];
		player playActionNow "medicStop";
	}
	,6,false,101
],[],"_target distance2D player < 2"
	+ " || !isNull(missionNamespace getVariable ['MPSF_Action_hidDestroy_target',objNull])"
,true] spawn {sleep 2; _this call MPSF_fnc_addAction;};

true;