MODE:		1, 2 or 3;
		Mode 1 is minor injured patient.
		Mode 2 is severe injured patient. 
		Mode 3 is patient with cardiac arrest.

Example: null = [spawnPos, 10, 1] execVM "scripts\Tib_medical.sqf";

You can use this script freely as long as you give credits.
Good luck with it and I hope it will help.


this addAction ["<t color='#551A8B'>Combat Drop</t>", "scripts\para.sqf"];

this addAction ["<t color='#2bf000'>minor injured patient</t><br/>", "null = [spawnPos, 10, 1] execVM "scripts\Tib_medical.sqf"];
this addAction ["<t color='#2bf000'>severe injured patient</t><br/>", "null = [spawnPos, 10, 2] execVM "scripts\Tib_medical.sqf"
this addAction ["<t color='#2bf000'>patient with cardiac arrest</t><br/>", "null = [spawnPos, 10, 3] execVM "scripts\Tib_medical.sqf"
