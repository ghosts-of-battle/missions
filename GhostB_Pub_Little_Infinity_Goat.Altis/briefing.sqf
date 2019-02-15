// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
YonV
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
The raw mission files will be available on github https://github.com/ghosts-of-battle
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

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
Alive CAS, transport, and Artillery are available.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
This is an environment template, but the Alive task is being generated.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

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

// ====================================================================================
