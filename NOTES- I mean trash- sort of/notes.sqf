				init="clearItemCargoGlobal this;   clearMagazineCargoGlobal this;   clearWeaponCargoGlobal this;   clearBackpackCargoGlobal this; this flyInHeight 2000; {this animateDoor [_x, 1]} forEach [""door_L"",""door_R""];
				this attachTo [heliHolder,[0,0,0]]; this allowDamage false;

				this addAction [""<t color='#2bf000'>HALO JUMP</t><br/><img size='3' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa'/>"", ""scripts\heliHALO.sqf"", [], 1, false, true, """", ""_this in _target""];      " \n "};
				";


	init="clearItemCargoGlobal this; clearMagazineCargoGlobal this; clearWeaponCargoGlobal this; clearBackpackCargoGlobal this; {this animateDoor [_x, 1]} forEach [""door_L"",""door_R""]; this allowDamage false; _light = this spawn {while {alive _this} do { player action [""collisionlightOn"", _this];  player action [""lightOn"", _this]; sleep 0.1;};}; this addAction [""<t color='#2bf000'>GET IN - PARADROP</t><br/><img size='3' image='\a3\ui_f\data\gui\cfg\Hints\takeoff_ca'/>"", ""scripts\heliPARA.sqf""];";



this addAction [ "Medic", { [ "Medic", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Engineer", { [ "Eng", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Missle", { [ "AntiTank", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Demo", { [ "Demo", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "JTAC", { [ "JTAC", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Auto RifleMan", { [ "AR", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Marksman", { [ "Marksman", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];



this addAction ["<t color='#2bf000'>HALO JUMP</t><br/>", "scripts\heliHALO.sqf", [], 1, false, true, "", "_this in _target"];     this addAction ["<t color='#2bf000'>HAHO JUMP</t><br/><img size='1' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa'/>", {[player, vehicle player, true] call COB_fnc_paradrop}, [], 1, false, true, "", "_this in _target"];


this addAction ["<t color='#551A8B'>Halo Insertion</t>", "scripts\HaloJump.sqf"];


(isFormationLeader player) && ([player, 'ACRE_PRC117F'] call acre_api_fnc_hasKindOfRadio)

_hasLR = call TFAR_fnc_haveLRRadio;
B_Static_Designator_01_weapon_F
player = call TFAR_fnc_haveLRRadio;
_Uniform = ["U_I_pilotCoveralls"];
_HeadGear = ["H_PilotHelmetFighter_I"];
_Chute = ["MRH_AADEquippedParachute","B_Parachute"];

if (_elapsedTime < _timeout) exitWith {_caller groupchat format["Next HALO flight will be ready in %1 seconds.", (round(_timeout - _elapsedTime))];};
if (not ((backpack _caller) in _Chute)) exitwith {_caller groupchat "You will need a parachute, Burn Baby Burn.";};
if (not ((uniform _caller) in _Uniform)) exitwith {_caller groupchat "You will need a proper uniform, Not Dressed Like that, this is not your high school prom.";};
if (not ((headgear _caller) in _HeadGear)) 	exitwith {_caller groupchat "You will need Oxygen, Well arn't you special, not needing to breath and all.";};





[this,10,true,true] call MRH_fnc_AmmoCrate;
[this,1] call BIS_fnc_dataTerminalAnimate;
[this,red,red,purple] call BIS_fnc_DataTerminalColor;


"\a3\Ui_f\data\GUI\Cfg\GameTypes\unknown_ca.paa"

this setFlagTexture 'ghostmission-flag2.paa'; this addAction ["<t color='#551A8B'>Halo Insertion</t>", "scripts\halo.sqf"];

this addAction ["<t color='#751A8B'>para Insertion</t>", "scripts\para.sqf"];

MGITerminal1 = this;
[MGITerminal1,"red","orange","green"] call BIS_fnc_dataTerminalColor;
MGITerminal1 addAction ["Activate terminal",{
 MGITerminal1 removeAction (_this select 2);
 MGITerminal1 spawn {
   [_this,3] call BIS_fnc_dataTerminalAnimate;
   sleep 10;
   firstTask = ["task0", true, ["Description here","Title here",""],nil, "ASSIGNED", 0, true, true,"",true] call BIS_fnc_setTask;
  [MGITerminal1,0] call BIS_fnc_dataTerminalAnimate
 }
}];
