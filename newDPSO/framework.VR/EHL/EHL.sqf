//////Enhanced High&Low Script Ver2.1 by Rodeostar42//////    ///adviced by Halal///

///World index///
_mediterranean = [
"Altis",
"Stratis",
"Koplic",
"bozcaada",
"evergreen",
"SugarLake",
"Gorgona"
];
_middleeast = [
"Takistan",
"Zargabad",
"pja310",
"Shapur_BAF"
];
_winter_maps = [
"Chernarus_winter",
"utes_winter",
"anim_helvantis_v2",
"ThirskW"
];
_euro = [
"Panthera3",
"Chernarus",
"Chernarus_Summer",
"Woodland_ACR",
"ProvingGrounds_PMC",
"utes",
"Bornholm",
"Thirsk",
"sfp_wamako",
"Napf",
"sfp_sturko",
"imrali",
"imralispring"
];
_tropical = [
"pja305",
"Sara_dbe1",
"SaraLite",
"Sara",
"Porto",
"Intro",
"IslaDuala3",
"Mog",
"lingor3",
"wake",
"Atlantis"
];
_Southern = [
"abramia",
"australia"
];
_World = [
"Altis",
"Stratis",
"bozcaada",
"Takistan",
"Zargabad",
"pja310",
"Shapur_BAF",
"Chernarus_winter",
"utes_winter",
"ThirskW",
"anim_helvantis_v2",
"Panthera3",
"Chernarus",
"Chernarus_Summer",
"Woodland_ACR",
"ProvingGrounds_PMC",
"utes",
"Bornholm",
"Thirsk",
"pja305",
"Sara_dbe1",
"SaraLite",
"Sara",
"Porto",
"Intro",
"IslaDuala3",
"Mog",
"lingor3",
"abramia",
"australia",
"Koplic",
"sfp_wamako",
"Napf",
"evergreen",
"sfp_sturko",
"SugarLake",
"imrali",
"imralispring",
"wake",
"Atlantis",
"Gorgona"
];

if (!isDedicated) then {

   if ((worldName in _World )) then {

if (worldName in _mediterranean) then {

   nul=[] execVM "EHL\mediterranean.sqf";
};

if (worldName in _middleeast) then {

   nul=[] execVM "EHL\middleeast.sqf";
};

if (worldName in _winter_maps) then {

   nul=[] execVM "EHL\winter_maps.sqf";
};

if (worldName in _euro) then {

   nul=[] execVM "EHL\euro.sqf";
};

if (worldName in _tropical) then {

   nul=[] execVM "EHL\equator.sqf";
};

if (worldName in _Southern) then {

   nul=[] execVM "EHL\Southern.sqf";
};

   cuttext ["Water Temp Status Start.  World Index OK","PLAIN",2];
}
else{

   nul=[] execVM "EHL\Standard_temp.sqf";

   cuttext ["Water Temp Status Start. Standard Temp Index","PLAIN",2];
};

