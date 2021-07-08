private _seat=[["driver"], ["Turret", [0]], ["Turret", [0, 0]]];
_p=[];
if((r_RtoBP findif{
    unitBackpack r_p isKindOf _x
}>=0)||{
    (assignedvehicleRole r_p in _seat && objectParent r_p isKindOf"Air" && !(objectParent r_p isKindOf"ParachuteBase"))
})then{
    {
        private _y=_x;
        if((r_RtoBP findif{
            unitBackpack _y isKindOf _x
        }>=0)||{
            (assignedvehicleRole _x in _seat && objectParent _x isKindOf"Air" && !(objectParent _x isKindOf"ParachuteBase"))
        })then{
            _p pushBack _x
        }
    }forEach(allplayers-[r_p]select{
        playerside==side _x
    });
    if (r_alerton) then {
        r_p call r_alert
    };
    if (count _p>0) then {
        if ((r_incap)&&(lifeState r_p=="inCAPACITATED")) then {
            {
                (_x#0)enableChannel[false, false];
                (_x#1)radioChannelRemove[r_p]
            }forEach[[(ch6+5), ch6], [(ch7+5), ch7], [(ch8+5), ch8]];
            setCurrentChannel 5;playSound"inB2"
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
            [2, _p]call r_d;if (r_vol>0) then {
                playSound("inA"+str(call rVolu))
            }
        };
    } else {
        playSound"inB2"
    };
    call r_anm
} else {
    {
        (_x#0)enableChannel[false, false];
        (_x#1)radioChannelRemove[r_p]
    }forEach[[(ch6+5), ch6], [(ch7+5), ch7], [(ch8+5), ch8]];
    setCurrentChannel 5
};
private _eh=["KeyUp", "if (!r_up_ && _this#1 in actionKeys'pushtoTalk') then {
    call r_up
}"];
kpUp=(findDisplay 46)displayAddEventHandler _eh;
kpUpZ=(findDisplay 312)displayAddEventHandler _eh;