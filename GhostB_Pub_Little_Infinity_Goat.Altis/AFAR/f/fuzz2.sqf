private _s0=[];private _d0=0;private _f=objNull;private _atTo=objNull;
if("ItemRadio"in assignedItems player&&alive player)then{
{if((alive _x)&&(player distance _x<=r_LRmax))then{if((side _x==side player)||(_x isKindOf r_PS))then{if(leader(group(vehicle _x))==_x)then{_s0 pushBack _x;};};};}forEach allPlayers-[player];
if(count _s0<1)exitWith{};
private _s1=([_s0,[],{player distance _x},"ASCEND"]call BIS_fnc_sortBy)select 0;private _d0=player distance _s1;

if(_d0<=r_LRmax)then{
if(!isNull objectParent player)then{
_f="Land_HelipadEmpty_F"createVehicleLocal[0,0,0];_f attachTo[vehicle player,[0,0,0.5]];}else{
_f="Land_HelipadEmpty_F"createVehicleLocal[0,0,0];_f attachTo[player,[-0.08,0.35,0.005],"Neck"];};
_atTo=attachedTo _f;

switch(true)do{
case(_d0<(r_LRmax/9)):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz0";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/9)&&{_d0<(r_LRmax/8)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz1";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/8)&&{_d0<(r_LRmax/7)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz2";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/7)&&{_d0<(r_LRmax/6)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz3";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/6)&&{_d0<(r_LRmax/5)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz4";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/5)&&{_d0<(r_LRmax/4)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz5";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/4)&&{_d0<(r_LRmax/3)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz6";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/3)&&{_d0<(r_LRmax/2)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz7";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/2)&&{_d0<(r_LRmax/1.1)}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz8";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
case(_d0>(r_LRmax/1.1)&&{_d0<=r_LRmax}):{playSound"in0";while{!isNull _f&&!isNull _atTo}do{_f say2D"fuz9";sleep 5;if(player distance _s1>r_LRmax)then{deleteVehicle _f;};};};
};};};