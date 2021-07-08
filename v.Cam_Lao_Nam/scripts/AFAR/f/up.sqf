private _ch=currentChannel;
if ((alive r_p)&&(isAbletoBreathe player)&&(!(isObjectHidden r_p))) then {
    switch(_ch)do{
        case 0:{
            [r_p, 0]remoteExecCall["setPlayerVoNVolume"]
        };
        case 1:{
            if (r_sideCH) then {
                1 enableChannel r_sCH
            }
        };
        case 2:{
            2 enableChannel r_cCH
        };
        case 3:{
            3 enableChannel r_grCH
        };
        case 4:{
            4 enableChannel r_vCH
        };
        case 5:{
            5 enableChannel r_dCH
        };
        case(ch6+5):{
            (ch6+5)enableChannel r_mCH
        };
        case(ch7+5):{
            (ch7+5)enableChannel r_mCH
        };
        case(ch8+5):{
            (ch8+5)enableChannel r_mCH
        };
        case(ch9+5):{
            (ch9+5)enableChannel[false, false];
            5 enableChannel r_dCH;setCurrentChannel 5
        };
    };
} else {
    if (!(isAbletoBreathe player)) exitwith {
        [r_p, 0]remoteExecCall["setPlayerVoNVolume"];
        5 enableChannel[false, false];{
            _x enableChannel[false, false]
        }count r_CH+[0];
        if (_ch in r_CH) then {
            playSound"in2"
        };
        titleText["I need a rebreather to talk underwater", "PLAin doWN"];titleFadeOut 6;if ([]call BIS_fnc_admin>0) then {
            setCurrentChannel 5
        };
    };
    if (_ch==(ch9+5)) then {
        _ch enableChannel[true, true]
    } else {
        _ch enableChannel[false, false]
    };
};

{
    (_x#0)displayremoveEventHandler["KeyUp", _x#1]
}forEach[[r_dis, kpUp], [findDisplay 312, kpUpZ]];
r_up_=true;
r_dn_=false;
switch true do{
    case(_this#1 in actionKeys"pushtoTalkside"):{
        call sOut
    };
    case(_this#1 in actionKeys"pushtoTalkCommand"):{
        call cOut
    };
    case(_this#1 in actionKeys"pushtoTalkgroup"):{
        call gOut
    };
    case(_this#1 in actionKeys"pushtoTalkvehicle"):{
        call vOut
    };
    case(_this#1 in actionKeys"pushtoTalkDirect"):{
        call dout
    };
    default{
        switch(_ch)do{
            case 1:{
                call sOut
            };
            case 2:{
                call cOut
            };
            case 3:{
                call gOut
            };
            case 4:{
                call vOut
            };
            case 5:{
                call dout
            };
            case(ch6+5):{
                call mOut
            };
            case(ch7+5):{
                call mOut
            };
            case(ch8+5):{
                call mOut
            };
        };
    };
};