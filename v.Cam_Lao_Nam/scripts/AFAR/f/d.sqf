if (((_this#0)==0)&&(_this#1)isEqualto[]) exitwith {};
private _d=[];
{
    _d pushBack[_x distance r_p, _x]
}forEach(_this#1);

switch(_this#0)do{
    case 0:{
        {
            [r_p, 1]remoteExecCall["setPlayerVoNVolume", (_x#1)];
            (_x#1)setPlayerVoNVolume 1
        }forEach _d
    };
    
    case 1:{
        if(({
            (_x#0)<=3200
        }count _d)isEqualto[])exitwith{
            playSound"inB2"
        };
        {
            private _p=(_x#1);
            if((_x#0)>3200||{
                !("Itemradio"in assigneditems _p)&&(r_RtoBP findif{
                    unitBackpack _p isKindOf _x
                }<0)
            })then{
                [r_p, 0]remoteExecCall["setPlayerVoNVolume", _p];
                _p setPlayerVoNVolume 0
            } else {
                [0, r_p]remoteExec["r_fuzz", _p];
                [1, r_p, (_x#0)]remoteExecCall["rVol", _p];_p setPlayerVoNVolume r_vol
            }
        }forEach _d;
        if (r_vol>0) then {
            playSound("in"+str(call rVolu))
        }
    };
    
    case 2:{
        if(({
            (_x#0)<=9600
        }count _d)isEqualto[])exitwith{
            playSound"inB2"
        };
        {
            private _p=(_x#1);
            if((_x#0)>9600||{
                !("Itemradio"in assigneditems _p)&&(r_RtoBP findif{
                    unitBackpack _p isKindOf _x
                }<0)
            })then{
                [r_p, 0]remoteExecCall["setPlayerVoNVolume", _p];
                _p setPlayerVoNVolume 0
            } else {
                [1, r_p]remoteExec["r_fuzz", _p];
                [2, r_p, (_x#0)]remoteExecCall["rVol", _p];_p setPlayerVoNVolume r_vol
            }
        }forEach _d;
        if (r_vol>0) then {
            playSound("inA"+str(call rVolu))
        };
    };
};