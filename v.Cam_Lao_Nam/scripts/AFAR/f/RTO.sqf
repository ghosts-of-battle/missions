_ch6=(ch6+5);
_ch7=(ch7+5);_ch8=(ch8+5);
if (playerside==civilian) exitwith {
    {
        _x enableChannel[false, false]
    }count[_ch6, _ch7, _ch8];
    {
        _x radioChannelRemove[r_p]
    }forEach[ch6, ch7, ch8]
};
if((r_RtoBP findif{
    unitBackpack r_p isKindOf _x
}>=0)||(assignedvehicleRole r_p in[["driver"], ["Turret", [0]], ["Turret", [0, 0]]]&&{
    (objectParent r_p isKindOf"Air" && !(objectParent r_p isKindOf"ParachuteBase"))
}))exitwith{
    switch(playerside)do{
        case west:{
            ch6 radioChannelAdd[r_p];
            _ch6 enableChannel r_mCH
        };
        case east:{
            ch7 radioChannelAdd[r_p];
            _ch7 enableChannel r_mCH
        };
        case independent:{
            ch8 radioChannelAdd[r_p];
            _ch8 enableChannel r_mCH
        };
    };
};
{
    (_x#0)enableChannel[false, false];
    (_x#1)radioChannelRemove[r_p]
}count[[_ch6, ch6], [_ch7, ch7], [_ch8, ch8]];