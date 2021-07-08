private _seat=[["driver"], ["Turret", [0]], ["Turret", [0, 0]]];
private _p=[];
{
    private _y=_x;
    if((r_RtoBP findif{
        unitBackpack _y isKindOf _x
    }>=0)||{
        (assignedvehicleRole _x in _seat && objectParent _x isKindOf"Air"&& !(objectParent _x isKindOf"ParachuteBase"))
    })then{
        _p pushBack _x
    }
}forEach((allplayers-[r_p]select{
    playerside==side _x
}));
if (count _p>0) then {
    if ((r_incap)&&(lifeState r_p=="inCAPACITATED")) then {
        [currentChannel, [r_p]]call r_out2;
        {
            (_x#0)enableChannel[false, false];
            (_x#1)radioChannelRemove[r_p]
        }forEach[[(ch6+5), ch6], [(ch7+5), ch7], [(ch8+5), ch8]];
        setCurrentChannel 5;{
            r_p remoteExecCall["r_out", _x]
        }forEach _p
    } else {
        switch(playerside)do{
            case west:{
                (ch6+5)enableChannel r_mCH
            };
            case east:{
                (ch7+5)enableChannel r_mCH
            };
            case independent:{
                (ch8+5)enableChannel r_mCH
            };
        };
        {
            r_p remoteExec["r_out", _x]
        }forEach _p
    }
};
if (r_vol>0) then {
    playSound("out"+str(call rVolu))
};
_eh=["Keydown", "if (!r_dn_ && _this#1 in(actionKeys'pushtoTalk'+actionKeys'pushtoTalkDirect'+actionKeys'pushtoTalkgroup'+actionKeys'pushtoTalkvehicle'+actionKeys'pushtoTalkside'+actionKeys'pushtoTalkCommand')) then {
    call r_dn
}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;
kpDnZ=(findDisplay 312)displayAddEventHandler _eh;