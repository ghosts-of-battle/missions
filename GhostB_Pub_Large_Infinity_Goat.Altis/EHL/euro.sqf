//////Enhanced High&Low Script Ver2.1 by Rodeostar42//////    ///adviced by Halal///


if (!isDedicated) then {
while {true} do {

_now = date;
_month = _now select 1;
_hour = _now select 3;
_unit = player;
_uniform = uniform player;
_gear = [

///Wet suit///
"U_B_Wetsuit",
"U_I_Wetsuit",
"U_O_Wetsuit"

];

if ((uniform player in _gear)&&(!(underwater player)&&(eyePos player select 2 > 1))&&(vehicle player == player)) then
      {

         player setFatigue 1;
      };
      sleep 1;


/// Water Enhanced///
if (!(uniform player in _gear)&&(underwater player)&&(eyePos player select 2 < 0.5)) then {

    if ((_month in [1,2,11,12])&&(_hour <= 24)) then {

   hint parseText format["<t size='1' color=""#1E90FF"">Very cold water temp!! %1 Limit the 5minute</t>"];

   dethcount = 0;

   private ["_blur"];
   _blur = ppEffectCreate ["DynamicBlur", 10];
   _blur ppEffectEnable true;
   _blur ppEffectAdjust [3];
   _blur ppEffectCommit 120;

   while {dethcount < 120} do{

   if (!(underwater player)&&(eyePos player select 2 > 1)or(!(vehicle player == player))) then {

   hint parseText format["<t size='1' color=""#FFFFFF"">Away from water %1 Status OK</t>"];

   player setFatigue 1;
   uiSleep 1;
   _blur ppEffectAdjust [0];
   _blur ppEffectCommit 10;

   dethcount = 120;
};

   sleep 1;
   dethcount = dethcount + 1;
};

if ((underwater player)&&(eyePos player select 2 < 0.5)) then {
   player setDamage 1;
};

}
else
{
   if ((_month in [3,4,9,10])&&(_hour in [01,02,03,04,05,06,19,20,21,22,23,24]) ) then {

   hint parseText format["<t size='1' color=""#00FFFF"">cold water temp %1 Limit the 10minute</t>"];

   dethcount = 0;

   private ["_blur"];
   _blur = ppEffectCreate ["DynamicBlur", 10];
   _blur ppEffectEnable true;
   _blur ppEffectAdjust [3];
   _blur ppEffectCommit 500;

   while {dethcount < 500} do{

   if (!(underwater player)&&(eyePos player select 2 > 1)or(!(vehicle player == player))) then {

   hint parseText format["<t size='1' color=""#FFFFFF"">Away from water %1 Status OK</t>"];

   player setFatigue 1;
   uiSleep 1;
   _blur ppEffectAdjust [0];
   _blur ppEffectCommit 10;

   dethcount = 500;
   };


   sleep 1;
   dethcount = dethcount + 1;
};


if ((underwater player)&&(eyePos player select 2 < 0.5)) then {
   player setDamage 1;
};

}
else
{
if ((underwater player)&&(eyePos player select 2 < 0.5)) then {
 hint parseText format["<t size='1' color=""#FFDEAD"">Warm water temp %1 no limit time </t>"];
};

};

};

};

};

};