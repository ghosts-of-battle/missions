// by ALIAS
// Spot and Ambient Lights DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// 

private ["_obiect","_obi_coord","_color_lit","_bri_lit","_spot_lit","_lit_type"];

If (!hasInterface) exitWith {};

_obiect		= _this select 0;
_obi_coord	= _this select 1;
_color_lit	= _this select 2;
_bri_lit	= _this select 3;
_lit_type	= _this select 4;

//hint str _lit_type;
_flare_lit = 0;
_tip_lit =0;
_constant_lit=0;
_start_lit=0;
if (!_lit_type) then {
	_flare_lit = 0;
	_start_lit = 1;
	_constant_lit = 20;
	_tip_lit = 100;
	
} else {_flare_lit = 0.5;_start_lit = 0.01;_constant_lit = 0.1;_tip_lit=100};

// lumina
_spot_lit = "#lightpoint" createVehicle (getPosATL _obiect); 
_spot_lit lightAttachObject [_obiect, _obi_coord];
_spot_lit setLightColor _color_lit;
_spot_lit setLightAmbient _color_lit;
_spot_lit setLightIntensity _bri_lit;
//_spot_lit setLightBrightness 1;
_spot_lit setLightUseFlare true;
_spot_lit setLightFlareSize _flare_lit;
_spot_lit setLightFlareMaxDistance 500;
_spot_lit setLightAttenuation [/*start*/ _start_lit, /*constant*/_constant_lit, /*linear*/ _tip_lit, /*quadratic*/ 1000, /*hardlimitstart*/10,/* hardlimitend*/11]; 
_spot_lit setLightDayLight true;

while {!isNull _obiect} do {
sleep 5;
};

deleteVehicle _spot_lit;