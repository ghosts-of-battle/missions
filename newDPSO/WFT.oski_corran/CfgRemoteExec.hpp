class CfgRemoteExec {
	class Functions
		{
				mode = 2;
				allowedTargets = 0;
				jip = 1;
		};
	class Commands
		{
				mode = 2;
				allowedTargets = 0;
				jip = 1;
		};
};



class tinter_furniture_pre_init {
        init = "call compile preprocessFileLineNumbers 'scripts\furniture\XEH_preInit.sqf'";
    };