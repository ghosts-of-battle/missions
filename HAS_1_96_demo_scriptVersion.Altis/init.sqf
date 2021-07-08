if (isServer) then 
	{
	call compile preprocessFile "HAS\userConfig.sqf";
	call compile preprocessFile "HAS\HAS_fnc.sqf";
	[] call RYD_HAS_Init;
	};