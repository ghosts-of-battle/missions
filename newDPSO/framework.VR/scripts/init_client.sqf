/* ==================================================== */
/* ===      Script for Arma3 by Whiplash.           === */
/* ===  This script is open-source and can be used. === */
/* ===  See comments below for how-to-use.          === */
/* ==================================================== */

// Initiates client-side scripts and sets other things like view distance etc.
// JIP and non-JIP are defined separately.

/* ==================================================== */





/* ************************************************************************************************************************************************************************************* */
/* ****		Client Commands	    ******************************************************************************************************************************************************** */
/* ************************************************************************************************************************************************************************************* */


// ***************************** //
// ****		non-JIP		******** // ********************************************************************************************************************************** //
// ***************************** //

if (!(isNull player)) then {

	// Radios!
	0 fadeRadio 0;		//mute in-game radio commands
	enableRadio false;
	enableSentences false;
		
	//Execute Game Scripts
//	nonJIP = [] execVM "scripts\acre_init.sqf";
	nonJIP = [] execVM "scripts\acre.sqf";
};

// ***************************** //
// ****		JIP		************ // ********************************************************************************************************************************** //
// ***************************** //

if (!isServer && isNull player) then {
	
	waitUntil {!isNull player};



	//Misc. Radio/Weapon
	0 fadeRadio 0;		//mute in-game radio commands
	enableRadio false;
	enableSentences false;
		
	//Execute Game Scripts
//	JIP = [] execVM "scripts\acre_init.sqf";
	JIP = [] execVM "scripts\acre.sqf";
};
