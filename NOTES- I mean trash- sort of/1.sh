Installation / Usage:


Script can be added to any vehicle or unit by putting the following syntax in its init line:
_null = this spawn {While {isNil "PrykUavInit"} do {sleep 2};  _this spawn PrykUavInit;}



Put the following in init.sqf:
execVM "PrykUav.sqf


this setvariable ["CS_TYPE","CAS"]; //Type can be "TRANSPORT" or "CAS" or "HYBRID"

Optional:
this setvariable ["CS_TYPE","TRANSPORT"]; //Type can be "TRANSPORT" or "CAS" or "HYBRID"
this setvariable ["CS_CALLSIGN","Your Callsign"]; //Callsign of the unit
this setVariable ["CS_SLINGLOADING", false]; //disables sling loading on transport helis
this setVariable ["CS_CONTAINERS",0]; //number of crates to spawn around a transport heli (0 to disable)
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler ["HandleDamage", {false}]; this addEventHandler ["Hit", {Unit setDamage (0.10 + getDammage Unit)}];';"]
this setVariable ["NOAI",1,false];

this addItemToBackpack "itemGPS";

B_BLUFCTRG_UH_80_Ghost_Hawk_Camo

this setVariable ["NOAI",1,false]; 
this setVariable [VCOM_NOPATHING_Unit,1,false];

this setvariable ["CS_TYPE","TRANSPORT"];
this setvariable ["CS_CALLSIGN","Ghosthawk ONE"];
this setVariable ["CS_SLINGLOADING", true];
this setVariable ["CS_CONTAINERS",0];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];this addEventHandler [""Hit"", {Unit setDamage (0.10 + getDammage Unit)}]';"];
this setVehicleRadar 1;  
this setVehicleReceiveRemoteTargets true;
this setVehicleReportRemoteTargets true;
this setVehicleReportOwnPosition true;





this setvariable ["CS_TYPE","CAS"];
this setvariable ["CS_CALLSIGN","Hornet"];

this setVehicleRadar 1;  
this setVehicleReceiveRemoteTargets true;
this setVehicleReportRemoteTargets true;
this setVehicleReportOwnPosition true;




this setvariable ["CS_TYPE","HYBRID"];
this setvariable ["CS_CALLSIGN","Spirithawk One"];
this setVariable ["CS_SLINGLOADING", true];
this setVariable ["CS_CONTAINERS",0];
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];this addEventHandler [""Hit"", {Unit setDamage (0.50 + getDammage Unit)}]';"];


this addAction["<t color='#551A8B'>DROP</t>", {[bf1] execVM "get_out.sqf";}];

@CBA_A3;@ALiVE;@task_force_radio;@ARappelling;@DPSO_ACE3;@ESoundscape;@ILBE;@ShackTac;@VcomAI_2_92;@Remove_stamina;

@CBA_A3;@ALiVE;@task_force_radio;@ARappelling;@DPSO_ACE3;@ESoundscape;@ILBE;@ShackTac;@VcomAI_2_92;@Remove_stamina;@ADR97;




          class Mission1
         {
              template="DPSO_test_mp.Altis";
              difficulty="Regular";
          };


this setvariable ["CS_TYPE","TRANSPORT"]; this setvariable ["CS_CALLSIGN","Heaven"];


== arma3server_61998.exe  -name=Arma3AIO -mod=;@CBA_A3;@ALiVE;@ADR97;@task_force_radio;@AdvancedRappelling;@DPSO_ACE3;@ESoundscape;@ShackTac;@remove_stamina;@c2;@spyder; -servermod=; -config=vilayer_active_server_61998\61998_config.cfg -cfg=vilayer_active_server_61998\basic.cfg -profiles=vilayer_active_server_61998 -ip=104.237.196.98 -port=2402 -malloc=tbb4malloc_bi -exThreads=0  -noSound  -autoinit 
 

 _myGroup = group player; _myUnit = _myGroup createUnit ["B_dpso_DPSO_AI_Medic_01", , "sspawn", 2, "NONE"];


 this addAction["<t color='#551A8B'>Medic</t>", { _myGroup = group player; _myUnit = _myGroup createUnit ["B_dpso_DPSO_AI_Medic_01",getMarkerPos "sspawn" , , 1, "NONE"];}]; 


  this addAction["<t color='#551A8B'>Medic</t>", { _myGroup = group player; _myUnit = _myGroup createUnit ["B_dpso_DPSO_AI_Medic_01", [14000,17000,0],["sspawn"], 1, "NONE"];}];


  "dpso"


_myGroup = group player;
this addAction["<t color='#551A8B'>swap</t>", { [_myGroup] call zade_boc_fnc_actionSwap;}];
this addAction["<t color='#551A8B'>onback</t>", { [group player] call zade_boc_fnc_actionOnBack;}];
this addAction["<t color='#551A8B'>onchest</t>", { [group player] call zade_boc_fnc_actionOnChest;}];
this addAction ["<t color='#551A8B'>DROP</t>", { [bf1] execVM "get_out.sqf";} ];


this addAction["<t color='#551A8B'>meonback</t>", {[player] call zade_boc_fnc_actionOnBack;}];
call zade_boc_fnc_actionOnChest;


Trigger_Con;
Player Init: 
this addaction ["Triger",{Trigger_Con = true; publicVariable "Trigger_Con";}];

foreach units group _unit;true] call zade_boc_fnc_actionSwap;


this addAction["<t color='#551A8B'>DROP</t>", [bf1] execVM "get_out.sqf";

isUav=1;



this setvariable ["isUav", "0"];


this setvariable ["CS_TYPE","TRANSPORT"]; 
this setvariable ["CS_CALLSIGN","BLACKFISH ONE"]; 
this setVariable ["CS_SLINGLOADING", true]; 
this setVariable ["CS_CONTAINERS",0]; 
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler [""HandleDamage"", {false}];this addEventHandler [""Hit"", {Unit setDamage (0.10 + getDammage Unit)}]';"]; 
this setVariable ["NOAI",1,false];  
this setVehicleRadar 1; 
this setVehicleReceiveRemoteTargets true; 
this addAction ["<t color='#551A8B'>DROP</t>", {[bf1] execVM "get_out.sqf";}];
this setvariable ["name", "bf1"];

this setCollisionLight false;
this setPilotLight false;


this setvariable [""CS_CODE"",""persistent _code as 'this addEventHandler [""""HandleDamage"""", {false}];this addEventHandler [""""Hit"""", {Unit setDamage (0.10 + getDammage Unit)}]';""]; this setVariable [""NOAI"",1,false]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setCollisionLight false; this setPilotLight false;



	
unit action ["CollisionLightOff", vehicle player];

null=[] spawn { while {canmove this} do { player action ["collisionlightOff", this];sleep 0.01};};

null=[] spawn { while {canmove fal1} do { player action ["collisionlightOff", fal1];sleep 0.01};};



this setvariable [""CS_CODE"",""persistent _code as 'this addEventHandler [""""HandleDamage"""", {false}];this addEventHandler [""""Hit"""", {Unit setDamage (0.10 + getDammage Unit)}]';""]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true;




this setvariable ["ace_medical_preventInstaDeath", true, true];


B_Soldier_SL_F, B_Soldier_TL_F, B_Patrol_Soldier_TL_F, B_diver_TL_F

+




this setVehicleRadar 1;  
this setVehicleReceiveRemoteTargets true;
this setVehicleReportRemoteTargets true;
this setVehicleReportOwnPosition true;

this setvariable [""CS_CODE"",""persistent _code as 'this addEventHandler [""""HandleDamage"""", {false}];this addEventHandler [""""Hit"""", {Unit setDamage (0.10 + getDammage Unit)}]';""]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;



this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;  

this setvariable [""CS_CODE"",""persistent _code as 'this addEventHandler [""""HandleDamage"""", {false}];this addEventHandler [""""Hit"""", {Unit setDamage (0.10 + getDammage Unit)}]';""]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;  

this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.050 + getDammage Unit)}]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;  



This setVelocity [20, 0, 0];



this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.050 + getDammage Unit)}]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;    




this setvariable ["CS_TYPE","TRANSPORT"]; 
this setvariable ["CS_CALLSIGN","Rodeo HHC"]; 
this setVariable ["CS_SLINGLOADING", true]; 
this setVariable ["CS_CONTAINERS",0]; 

this setvariable ["CS_CODE","persistent _code as 'string';"]
this setvariable ["CS_CODE","persistent _code as 'this addEventHandler ["HandleDamage", {false}];this addEventHandler ["Hit", {Unit setDamage (0.050 + getDammage Unit)}]; this setVehicleRadar 1; this setVehicleReceiveRemoteTargets true; this setVehicleReportOwnPosition true; this setVehicleReportRemoteTargets true;';"]; 


 



//turn off collision lights 
[_heli] spawn { 
    private "_heli"; 
    _heli = _this select 0; 
     
    while {alive _heli} do {  
        _heli action ["collisionlightOff", _heli]; 
        sleep 0.01; 
    }; 
}; 


null=[] spawn { while {true} do { this action ["collisionlightOff", this]; sleep 0.01};}; 



-port=2302 "-config=C:\arma\TADST\dpso\TADST_config.cfg" "-cfg=C:\arma\TADST\dpso\TADST_basic.cfg" "-bepath=C:\arma\battleye" "-servermod=@arametrics;@aliveServer;" "-profiles=C:\arma\TADST\dpso" -name=dpso -autoInit -enableHT -filePatching "-mod=@1180533757;@1180534892;@1314370254;@861133494;@863391974;@870212593;@945476727;@1384920358;@911881264;@886857451;@843632231;@843593391;@843577117;@843425103;@1348255647;@1339201462;@1298282761;@1176342693;@1210050323;@333310405;@825179978;@801023307;@753249732;@713709341;@642457233;@800053817;@498740884;@579263829;@894678801;@669962280;@620260972;@450814997;"



-port=2302 "-config=C:\arma\TADST\dpso\TADST_config.cfg" "-cfg=C:\arma\TADST\dpso\TADST_basic.cfg" "-bepath=C:\arma\battleye" "-servermod=@arametrics;@aliveServer;" "-profiles=C:\arma\TADST\dpso" -name=dpso -autoInit -enableHT -filePatching "-mod=@789445589;@1314370254;@911881264;@843632231;@843593391;@843577117;@843425103;@1348255647;@1339201462;@1298282761;@1176342693;@1210050323;@333310405;@753249732;@713709341;@642457233;@800053817;@498740884;@579263829;@669962280;@620260972;@450814997;"


RODEO ALPHA, RODEO BRAVO, RODEO CHARLIE, RODEO DELTA, RODEO ECHO, RODEO HHC, JOLY, STALLLION, LITTLE BIRD TWO, LITTLE BIRD ONE, ANGRY ONE, ANGRY TWO, SNAKE ONE, SNAKE TWO, EAGLE ONE, EAGLE TWO



-port=2302 "-config=C:\arma\TADST\dpso\TADST_config.cfg" "-cfg=C:\arma\TADST\dpso\TADST_basic.cfg" "-bepath=C:\arma\battleye" "-servermod=@arametrics;@aliveServer;" "-profiles=C:\arma\TADST\dpso" -name=dpso -autoInit -enableHT -filePatching 

"-mod=@450814997;@620260972;@1176342693;@1181421524;@945476727;@870212593;@861133494;@789445589;@1314370254;@911881264;@843632231;@843593391;@843577117;@843425103;@1348255647;@1339201462;@1298282761;@1210050323;@333310405;@753249732;@713709341;@642457233;@800053817;@498740884;@579263829;@669962280;"



@1180533757;
@1180534892;


"-mod=@450814997;@1176342693;@620260972;@642457233;@669962280;@713709341;@753249732;@789445589;@800053817;@579263829;@843425103;@843577117;@843593391;@911881264;@498740884;@843632231;@333310405;@1298282761;@1339201462;@1314370254;@1348255647;@1210050323;"


_this addEventHandler ["HandleDamage", {((_this select 2)/2)}];



this setFlagTexture 'ghostmission.paa'; 
this addAction ["<t color='#551A8B'>Halo Insertion</t>", "scripts\HaloJump.sqf"];
ghst_halo = this addAction ["Halo", "scripts\halo.sqf", 6, true, true, "","alive _target"]; 
ghst_jump =this addAction ["Combat Drop", "scripts\halocombat.sqf", 6, true, true, "","alive _target"];



//initPlayLocal.sqf   ; halo is the object name in the editor. TG_fnc_halo is the function name comiled in CFGfunctions
halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='4' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call TG_fnc_halo", nil, 5, true, true, "","alive _target"];



this setFlagTexture 'ghostmission.paa';  
this addAction ["<t color='#551A8B'>Halo Insertion</t>", "scripts\HaloJump.sqf"]; 

<br/>
 <h1>Transport Options</h1>
<br/>

<br/>

Pickup orders a transport heli to move to the selected map location where it will request a smoke or illum to mark a landing zone. The pilot will request confirmation of the marker before landing to pick up troops.<br/><br/>
Land orders the unit to move directly to the selected location and immediately land (and shut down if Eng Off is selected).<br/><br/>
Move orders the unit to move directly to the selected location and hold.<br/><br/>
Circle orders the unit to hold in a circling pattern over the area. This is useful for providing top cover with armed transport aircraft.<br/><br/>
Insertion is similar to Land except the vehicle will hover at the select height. This can be used with fast rope scripts or for pick ups over water. Note that ALiVE does not include a fast rope script so you will need an alternative mod.<br/><br/>
Slingload will order the helicopter to hook the object closest to the location selected. Be sure to provide plenty of clearance around the object or vehicle to give the AI the best chance to grab it.<br/><br/>
Unhook order the transport helicopter to drop off the under slung object. The pilot will then RTB.<br/><br/>




____________________________________________________<br/><br/>


<br/>
 <h1>CAS Options </h1>
<br/>

<br/>
 <h2>SAD </h2> units on Search and Destroy (SAD) will freely engage any enemy units they detect.  They will also engage any laser spot target with missiles and laser guided bombs if they have them equipped. 
<br/>

<br/>
 <h2>Loiter </h2> units will hold position and engage as per the selected Rules of Engagement. 
<br/>

<br/>
 <h2>Attack Run </h2>  orders a single pass of the target area engaging any detected enemy with the selected weapon system, after which the unit will return to it's previous loiter position. 
<br/>

<br/><br/>


____________________________________________________<br/><br/>


<img image='brief\Copy of 2018-09-04_0-35-001.jpg' width='384' height='326'/><br/><br/>
<img image='brief\Copy of 2018-09-04_0-35-002.jpg' width='384' height='590'/><br/><br/>
<img image='brief\Copy of 2018-09-04_0-35-003.jpg' width='384' height='695'/><br/><br/>
<img image='brief\Copy of 2018-09-04_0-35-004.jpg' width='384' height='350'/>
