/* BREACH Settings */

class BREACH 
	{	
		useBreach = 1; //< 0 script off, 1 script on
		LockFrontDoorsOnly = 1; //1<-Will only work on the front doors, will ignore almost all internal doors
		closeFix = 0; //< Only try to use it if script dont work on some maps like N`ziwasogo.  It will break most maps if on, but is necessary for CUP ME buildings, and certain other maps.
		customDoorNames[] = {"vrata1","vrata2"}; //< use to define custom door names if script dont work.  Shouldn't be necessary
		
		/*Allow to lock pick closed doors (player must have ToolKIT item or ACE_key_lockpick item in inventory)*/
		allowLockPick = 1; //< 0-no, 1 -yes
		
		/*Allow to breach doors with gun*/
		allowGunBreach = 1; //< 0-no, 1-yes
		gunClasses[] = {"rhs_weap_M590_5RD"}; //< classes of guns that allowed to breach doors. RHS shotgun default.
		
		/*Allow to breach doors with explosive, (player must have Demolition block item in inventory -works with vanilla, ace3 and RHS)*/
		allowExplosiveBreach = 0; 
		
		
		/* Zones with locked doors */
		class lockDoor {
			
			/*Zone example:*/
			class zone_1 //< custom zone name
			{
				zone = "doorlockall1"; //< marker (rectangle or elipse) that covers zone.  Change this name to the one you made
				closeDoors = 0; //<1- close all doors in zone, 0- do nothing
				lockAll = 2; //< 1- lock all closed doors in zone, 2-lock random (25%) closed doors, 3-lock 50% of doors in the zone, 4-lock 75% of doors in the zone
			};
		};
	};
