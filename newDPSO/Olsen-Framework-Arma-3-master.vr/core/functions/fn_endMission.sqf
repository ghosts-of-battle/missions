/*
 * Author: Olsen
 *
 * Ends mission in orderly fashion and displays end screen.
 * Sends the team stats, time limit, scenario and executes "GVAR(EndMission)" on all players machines.
 *
 * Arguments:
 * 0: text to display in end screen <string>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_endText"];

if (CBA_missionTime > 0) then {

	SETMPVAR(MissionEnded,true);

	private _ammoInfo = [] call FUNC(shotDisplay);
	
	GVAR(Teams) apply {
		private _team = (_x select 0);
		private _assets = _team call FUNC(GetDamagedAssets);
		_assets params ["_damaged", "_destroyed"];
		[_team, 5, _damaged] call FUNC(SetTeamVariable);
		[_team, 6, _destroyed] call FUNC(SetTeamVariable);
	};

	[QGVAR(EndMission), [_endText, GVAR(TimeLimit), GVAR(Teams), _ammoInfo]] call CBA_fnc_globalEvent;
	
} else {
	"End Conditions have just been triggered. Mission will have to be ended manually." remoteExec ["systemChat", 0, false];
};