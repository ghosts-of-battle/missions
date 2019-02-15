				init="clearItemCargoGlobal this;   clearMagazineCargoGlobal this;   clearWeaponCargoGlobal this;   clearBackpackCargoGlobal this; this flyInHeight 2000; {this animateDoor [_x, 1]} forEach [""door_L"",""door_R""];
				this attachTo [heliHolder,[0,0,0]]; this allowDamage false;

				this addAction [""<t color='#2bf000'>HALO JUMP</t><br/><img size='3' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa'/>"", ""scripts\heliHALO.sqf"", [], 1, false, true, """", ""_this in _target""];      " \n "};
				";


	init="clearItemCargoGlobal this; clearMagazineCargoGlobal this; clearWeaponCargoGlobal this; clearBackpackCargoGlobal this; {this animateDoor [_x, 1]} forEach [""door_L"",""door_R""]; this allowDamage false; _light = this spawn {while {alive _this} do { player action [""collisionlightOn"", _this];  player action [""lightOn"", _this]; sleep 0.1;};}; this addAction [""<t color='#2bf000'>GET IN - PARADROP</t><br/><img size='3' image='\a3\ui_f\data\gui\cfg\Hints\takeoff_ca'/>"", ""scripts\heliPARA.sqf""];";



this addAction [ "Medic", { [ "Medic", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Engineer", { [ "Eng", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Missle", { [ "AntiTank", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Demo", { [ "Demo", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "JTAC", { [ "JTAC", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Auto RifleMan", { [ "AR", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];this addAction [ "Marksman", { [ "Marksman", player getPos [ 1, getDir player ], [0,0,0], random 360 ] call LARs_fnc_spawnComp } ];



this addAction ["<t color='#2bf000'>HALO JUMP</t><br/><img size='1' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa'/>", "scripts\heliHALO.sqf", [], 1, false, true, "", "_this in _target"];     this addAction ["<t color='#2bf000'>HAHO JUMP</t><br/><img size='1' image='\a3\ui_f\data\gui\cfg\CommunicationMenu\supplydrop_ca.paa'/>", {[player, vehicle player, true] call COB_fnc_paradrop}, [], 1, false, true, "", "_this in _target"];
