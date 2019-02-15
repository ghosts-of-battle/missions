/*
Version 0.2.6 (beta)
Helicopter-door-opening-script by [MSK]Delta8.
You may use it at your own risk.
To use this script, simply put it in your mission-folder and type "0 = execVM "[MSK]_HD\[MSK]_HD.sqf";" into your "init.sqf"
*/

//gets all the helicopters
MSK_HD_Heli1 = nearestObjects [getPos player,["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F","O_Heli_Attack_02_black_F","O_Heli_Attack_02_F"],20000];
MSK_HD_Heli2 = nearestObjects [getPos player,["I_Heli_Transport_02_F"],20000];
MSK_HD_Heli3 = nearestObjects [getPos player,["B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F"],20000];
MSK_HD_Heli4 = nearestObjects [getPos player,["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F"],20000];
MSK_HD_Heli5 = nearestObjects [getPos player,["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],20000];

//Function to move the doors
Fn_MSK_Doors = 
{
   private ["_Copper","_HD_OC","_door"];
   _Copper = _this select 0;
   _HD_OC  = _this select 1;
   _door = _this select 2;
   
   _Copper animateDoor [_door,_HD_OC,false];
   
};

//Adding the door-actions to the different helicopters
Fn_MSK_HD1 = 
{
   private ["_obj"];
   _obj = _this select 0;
   
   _obj addAction [localize "STR_[MSK]_RightDoorOpen",{[(_this select 0),1,'door_R'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'door_R' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_RightDoorClose",{[(_this select 0),0,'door_R'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'door_R' == 1) && (_target distance player < 5))"];
   
   _obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'door_L'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'door_L' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'door_L'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'door_L' == 1) && (_target distance player < 5))"];
};

Fn_MSK_HD2 =
{
   private ["_obj"];
   _obj = _this select 0;

/*   _obj addAction ["Cargorampe öffnen",{[(_this select 0),1,'CargoRamp_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'CargoRamp_Open' == 0) && (_target distance player < 5))"];

   _obj addAction ["Cargorampe schließen",{[(_this select 0),0,'CargoRamp_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'CargoRamp_Open' == 1) && (_target distance player < 5))"]; */
   
      _obj addAction [localize "STR_[MSK]_RightDoorOpen",{[(_this select 0),1,'Door_Back_R'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'Door_Back_R' == 0) && (_target distance player < 8))"];

   _obj addAction [localize "STR_[MSK]_RightDoorClose",{[(_this select 0),0,'Door_Back_R'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'Door_Back_R' == 1) && (_target distance player < 8))"];
   
   _obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'Door_Back_L'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'Door_Back_L' == 0) && (_target distance player < 8))"];

   _obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'Door_Back_L'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'Door_Back_L' == 1) && (_target distance player < 8))"];
};

Fn_MSK_HD3 = 
{
   private ["_obj"];
   _obj = _this select 0;
   _obj setVariable ["[MSK]_Closed_RD", true, true];
   _obj setVariable ["[MSK]_Closed_LD", true, true];

   _obj addAction [localize "STR_[MSK]_RightDoorOpen",{[(_this select 0),1,'Door_R_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_RD", false, true];},
      [],3,false,true,"",
      "((_target distance player < 10) && (_target getVariable '[MSK]_Closed_RD'))"];

   _obj addAction [localize "STR_[MSK]_RightDoorClose",{[(_this select 0),0,'Door_R_source'] call Fn_MSK_Doors;(_this select 0)setVariable ["[MSK]_Closed_RD", true, true];},
      [],3,false,true,"",
      "((_target distance player < 10) && !(_target getVariable '[MSK]_Closed_RD'))"];
   
   _obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'Door_L_source'] call Fn_MSK_Doors;(_this select 0)setVariable ["[MSK]_Closed_LD", false, true];},
      [],3,false,true,"",
      "((_target distance player < 10) && (_target getVariable '[MSK]_Closed_LD'))"];

   _obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'Door_L_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_LD", true, true];},
      [],3,false,true,"",
      "((_target distance player < 10) && !(_target getVariable '[MSK]_Closed_LD'))"];
};
 
/*Although it would be much more realistic only being able to open a door of the "CH-67 Huron"  standing in front of this door, this term is simply too big:
"[((getPos _target select 0) + 5*(sin getDir _target)),((getPos _target select 1) + 5*(cos getDir _target)),(getPos _target select 2)]"
It would slow down the server too much, I think. So I sacrificed realism for speed.
You may change it... but don't say, I didn't warn you^^*/

Fn_MSK_HD4 = 
{
	private ["_obj"];
	_obj = _this select 0;
	_obj setVariable ["[MSK]_Closed_PD", true, true];
	_obj setVariable ["[MSK]_Closed_CD", true, true];
	_obj setVariable ["[MSK]_Closed_LMD", true, true];

	_obj addAction [localize "STR_[MSK]_CoPilotDoorOpen",{[(_this select 0),1,'Door_2_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_CD", false, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && (_target getVariable '[MSK]_Closed_CD'))"];

	_obj addAction [localize "STR_[MSK]_CoPilotDoorClose",{[(_this select 0),0,'Door_2_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_CD", true, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_CD'))"];
   
	_obj addAction [localize "STR_[MSK]_PilotDoorOpen",{[(_this select 0),1,'Door_1_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_PD", false, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && (_target getVariable '[MSK]_Closed_PD'))"];

	_obj addAction [localize "STR_[MSK]_PilotDoorClose",{[(_this select 0),0,'Door_1_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_PD", true, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_PD'))"];
	  
	_obj addAction [localize "STR_[MSK]_LoadMasterDoorOpen",{[(_this select 0),1,'Door_3_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_LMD", false, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && (_target getVariable '[MSK]_Closed_LMD'))"];

	_obj addAction [localize "STR_[MSK]_LoadMasterDoorClose",{[(_this select 0),0,'Door_3_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_LMD", true, true];},
      [],3,false,true,"",
      "((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_LMD'))"];

	switch (typeOf _obj) do 
	{
		case "O_Heli_Transport_04_covered_F": 
			{
				_obj setVariable ["[MSK]_Closed_D4", true, true];
				_obj setVariable ["[MSK]_Closed_D5", true, true];
				
				_obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'Door_4_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D4", false, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && (_target getVariable '[MSK]_Closed_D4'))"];
				
				_obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'Door_4_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D4", true, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_D4'))"];
	  
				_obj addAction [localize "STR_[MSK]_RightDoorOpen",{[(_this select 0),1,'Door_5_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D5", false, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && (_target getVariable '[MSK]_Closed_D5'))"];

				_obj addAction [localize "STR_[MSK]_RightDoorClose",{[(_this select 0),0,'Door_5_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D5", true, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_D5'))"];
			}; //door_4_source; door_5_source;
		
		case "O_Heli_Transport_04_medevac_F": 
			{
				_obj setVariable ["[MSK]_Closed_D4", true, true];
				
				_obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'Door_4_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D4", false, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && (_target getVariable '[MSK]_Closed_D4'))"];

				_obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'Door_4_source'] call Fn_MSK_Doors; (_this select 0)setVariable ["[MSK]_Closed_D4", true, true];},
				[],3,false,true,"",
				"((_target distance player < 6) && !(_target getVariable '[MSK]_Closed_D4'))"];
			}; //door_4_source
		
		default {};
	}; 
};

Fn_MSK_HD5 = 
{
   private ["_obj"];
   _obj = _this select 0;
   
   _obj addAction [localize "STR_[MSK]_PilotDoorOpen",{[(_this select 0),1,'DoorL_Front_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorL_Front_Open' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_PilotDoorClose",{[(_this select 0),0,'DoorL_Front_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorL_Front_Open' == 1) && (_target distance player < 5))"];
   
   _obj addAction [localize "STR_[MSK]_CoPilotDoorOpen",{[(_this select 0),1,'DoorR_Front_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorR_Front_Open' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_CoPilotDoorClose",{[(_this select 0),0,'DoorR_Front_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorR_Front_Open' == 1) && (_target distance player < 5))"];
	  
   _obj addAction [localize "STR_[MSK]_RightDoorOpen",{[(_this select 0),1,'DoorR_Back_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorR_Back_Open' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_RightDoorClose",{[(_this select 0),0,'DoorR_Back_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorR_Back_Open' == 1) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_LeftDoorOpen",{[(_this select 0),1,'DoorL_Back_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorL_Back_Open' == 0) && (_target distance player < 5))"];

   _obj addAction [localize "STR_[MSK]_LeftDoorClose",{[(_this select 0),0,'DoorL_Back_Open'] call Fn_MSK_Doors;},
      [],3,false,true,"",
      "((_target animationPhase 'DoorL_Back_Open' == 1) && (_target distance player < 5))"];
};

//calls the different action-giving functions
MSK_HD_Init = 
{
	{
		[_x] call Fn_MSK_HD1;
	} forEach MSK_HD_Heli1;
	sleep 0.1;
	{
		[_x] call Fn_MSK_HD2;
	} forEach MSK_HD_Heli2;
	sleep 0.1;
	{
		[_x] call Fn_MSK_HD3;
	} forEach MSK_HD_Heli3;
	sleep 0.1;
	{
		[_x] call Fn_MSK_HD4;
	} forEach MSK_HD_Heli4;
	sleep 0.1;
	{
		if ((_x animationPhase "AddDoors")==1) then {
			[_x] call Fn_MSK_HD5;
		};
	} forEach MSK_HD_Heli5;
};

call MSK_HD_Init;

waitUntil {time > 0};
sleep 1;
cutText ["MSK_HD-Script fully loaded.","PLAIN",1];

/*while (true) {
sleep (5 + random 10);
};*/