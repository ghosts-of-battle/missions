/*
	Script: Add Taxi Call manu
*/

if (!TAXI_BUSY) then { TAXI_MENUIDX1 = player addAction ["Call TRANSPORT", "Taxi\taxi_start.sqf"]; };
