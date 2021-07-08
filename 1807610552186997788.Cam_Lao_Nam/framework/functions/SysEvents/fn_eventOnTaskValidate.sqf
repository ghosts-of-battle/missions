/*
    Author: RoyEightySix (https://www.roy86.com.au)
    Date: 2021-01-20
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/
params [["_taskID","",[""]]];

[_taskID] spawn {
	sleep (1 + random 1);
	_this call MPSF_fnc_processCfgTask
};