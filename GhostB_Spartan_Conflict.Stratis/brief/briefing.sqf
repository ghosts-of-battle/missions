////////////////////////////////////////////////////////////////////////////////
//---------------------     ADMINISTRATION         ---------------------------//
//       The code below creates the administration sub-section of notes.      //
////////////////////////////////////////////////////////////////////////////////
_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
The raw mission files will be available on github https://github.com/ghosts-of-battle
"]];

////////////////////////////////////////////////////////////////////////////////
//---------------------     EXECUTION              ---------------------------//
//       The code below creates the execution sub-section of notes.           //
////////////////////////////////////////////////////////////////////////////////

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Your discretion
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Your discretion, but if you want to fly you need to remove from service the enemy's main airfield and supporting AA.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Access through ACE self interact, a Laser Designator (Sand) (Item_Laserdesignator) do not deploy it!, you just have to have it on your back.

"]];

////////////////////////////////////////////////////////////////////////////////
//---------------------       MISSION              ---------------------------//
//       The code below creates the mission sub-section of notes.             //
////////////////////////////////////////////////////////////////////////////////

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
This is an environment template, but the Alive task is being generated.
"]];

////////////////////////////////////////////////////////////////////////////////
//---------------------       SITUATION            ---------------------------//
//       The code below creates the situation sub-section of notes.           //
////////////////////////////////////////////////////////////////////////////////

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
WAR!, NATO forces are invading this island, why to provide you entertainment, sorry I have no back story, so go forth and be shot.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
600 Units, a unit is 1-8, so anywhere from 600 to 4,800 enemy AI. (A Battalion)
<br/>
Including modern Air forces and Armor, Modern AA is also present fly at your own risk.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
400 Units, a unit is 1-8, so anywhere from 600 to 3,200 Friendly AI. (A Battalion)
"]];
