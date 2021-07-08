/*	VERSION: 0.97
	AUTHOR: Phronk
	CONTRIBUTIONS:
		1. DirtySanchez reorganized AFAR and improved security
		2. Metalman10 [EXP] optimized initialization of functions
		3. Dedmen added VON script commands to Arma

*///CONFIGURATIONS:
//CHANNEL PERMISSIONS		~		[TEXT,VOIP]			~			! Use all lower-case letters !
r_sideCH=false;//Enable Side Channel											>> Default: false
r_sCH=[true,true];		//Side Channel  										>> Default: [true,true]
r_cCH=[true,true];		//Command Channel  										>> Default: [true,true]
r_grCH=[false,true];	//Group Channel											>> Default: [false,true]
r_vCH=[true,true];		//Vehicle Channel										>> Default: [true,true]
r_dCH=[false,true];		//Direct Channel										>> Default: [false,true]
r_mCH=[false,true];		//Air Channel  											>> Default: [false,true]
r_mCHName="TOC";		//Shown by player name in RTO channel					>> Default: "Air"
r_RTOBP=[
	"vn_b_pack_lw_06", 
	"vn_b_pack_prc77_01", 
	"vn_b_pack_trp_04_02", 
	"vn_b_pack_03", 
	"vn_b_pack_trp_04", 
	"vn_b_pack_03_02"
];						//Add to list of backpacks RTO checks for				>> Default: []

r_incap=true;			//Block incapacitated players from using radios			>> Default: false
r_alertOn=true;			//Talking alerts nearby enemies							>> Default: true
r_chOn=false;			//Allow channel switching keybinds						>> Default: false

//DEFAULT COSMETICS
r_Anim=true;			//Animation when talking								>> Default: true
r_chat=true;			//Hides chat UI if false								>> Default: true