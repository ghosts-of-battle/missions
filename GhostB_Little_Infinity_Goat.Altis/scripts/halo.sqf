/*
V1.3.5 Script by: Ghost put this in an objects init line - halo = host1 addAction ["Halo", "halo.sqf", 6, true, true, "","alive _target"];
*/

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_althalo = 6000; //altitude of halo jump
_timeout = 300;	//change to 30 minutes.
/*
_altchute = 100;//altitude for autochute deployment
*/

_elapsedTime = 86400; //24 hours

if (not alive _host) 												exitwith {hint "Halo Not Available"; _host removeaction _id;};

//special case: first time halo
if !(isNil {_caller getVariable "jump_last_time"}) then
{
	_lastTime 		= _caller getVariable "jump_last_time";
	_elapsedTime 	= time - _lasttime;
};

_Uniform = ["U_I_pilotCoveralls"];
_HeadGear = ["H_PilotHelmetFighter_I"];
_Chute = ["MRH_AADEquippedParachute","B_Parachute"];

if (_elapsedTime < _timeout) exitWith {_caller groupchat format["Next HALO flight will be ready in %1 seconds.", (round(_timeout - _elapsedTime))];};
if (not ((backpack _caller) in _Chute)) exitwith {_caller groupchat "You will need a parachute, Burn Baby Burn.";};
if (not ((uniform _caller) in _Uniform)) exitwith {_caller groupchat "You will need a proper uniform, Not Dressed Like that, this is not your high school prom.";};
if (not ((headgear _caller) in _HeadGear)) 	exitwith {_caller groupchat "You will need Oxygen, Well arn't you special, not needing to breath and all.";};


private ["_pos"];
_caller groupchat "Left click on the map where you want to insert";
openMap true;
mapclick = false;
onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";
waituntil {mapclick or !(visiblemap)};

if !(visibleMap) exitwith {_caller groupchat "Im too scared to jump";};

_pos = clickpos;

_caller setpos [_pos select 0, _pos select 1, _althalo];
_caller spawn bis_fnc_halo;

openMap false;

[_caller] spawn bis_fnc_halo;

sleep 5;

_caller groupchat "Dont forget to open your chute!";
//auto open before impact
//waituntil {(position _caller select 2) <= _altchute};

_caller setVariable ["jump_last_time", time];
