////////////////////////////////////////////////////////////////////////////////
//---------------------     How Too's              ---------------------------//
//       The code below creates the How Too sub-section of notes.           //
////////////////////////////////////////////////////////////////////////////////
_how2 = player createDiarySubject ["Help","Help"];

_how21 = player createDiaryRecord ["Help", ["Artillery and CAS Support","
<br/>
Access through ACE self interact, a Laser Designator (Sand) (Item_Laserdesignator) do not deploy it!, you just have to have it on your back.
"]];

_how22 = player createDiaryRecord ["Help", ["Unit Role","
<br/>
Go in to the HQ tent the pc with the ? on the screen use ARMA interact (scroll wheel) and select your ACE role, (medic, Engineer, ect.)
"]];

_how23 = player createDiaryRecord ["Help", ["Arsenal","
<br/>
Access through ARMA interact (scroll wheel)
<br/>
<img image='https://community.bistudio.com/wikidata/images/thumb/b/b9/B_Slingload_01_Cargo_F.jpg/150px-B_Slingload_01_Cargo_F.jpg'/>
"]];

_how24 = player createDiaryRecord ["Help", ["Vehicle Spawner","
<br/>
Access through ARMA interact (scroll wheel)
<br/>
<img image='https://community.bistudio.com/wikidata/images/thumb/9/9a/B_Slingload_01_Repair_F.jpg/150px-B_Slingload_01_Repair_F.jpg'/>
"]];

_how25 = player createDiaryRecord ["Help", ["Crashes","
<br/>
You should Survive a crash (fingers crossed) but you will be injured, and loss some gear, so remember one is none, two is one
"]];

_halosl = player createDiaryRecord ["Help", ["Halo and Static Line","
<br/>
<font size='18'>Halo</font>
<br/>
Halo is the flag pole use ARMA interact (scroll wheel), you have to have the proper gear, pilot helmet (aaf) pilot jump suit (aaf) and a parachute
the halo drop starts at 6000 asl and can only be used once every 30 minutes.
<br/><br/>
<font size='18'>Static Line</font>
<br/>
Static Line laptop is in the HQ tent, and will drop the whole squad , this will move backpack to the check and automatically give a parachute
"]];
////////////////////////////////////////////////////////////////////////////////
//---------------------       Medical               ---------------------------//
//       The code below creates the Medical sub-section of notes.             //
////////////////////////////////////////////////////////////////////////////////
_med = player createDiarySubject ["MedicalHelp","Medical Help"];
_med1 = player createDiaryRecord ["MedicalHelp", ["Wounds","
<br/>
<font size='18'>Abrasions (or scrapes)</font>
<br/>
They occur when the skin is rubbed away by friction against another rough surface (e.g. rope burns and skinned knees).<br/>
Sources: falling, rope burn, vehicle crashes.<br/>
Effects: pain - extremely light, bleeding - extremely slowly.<br/>
<br/>

<font size='18'>Avulsions</font>
<br/>
Occur when an entire structure or part of it is forcibly pulled away, such as the loss of a permanent tooth or an ear lobe. Explosions, gunshots, and animal bites may cause avulsions.<br/>
Sources: explosions, vehicle crashes, grenades, artillery shells, bullets, backblast, bites.<br/>
Effects: pain - extremely high, bleeding - extremely fast (depends on wound size).<br/>
<br/>

<font size='18'>Contusions</font>
<br/>
Also called bruises, these are the result of a forceful trauma that injures an internal structure without breaking the skin. Blows to the chest, abdomen, or head with a blunt instrument (e.g. a football or a fist) can cause contusions.<br/>
Sources: bullets, backblast, punches, vehicle crashes, falling.<br/>
Effects: pain - light, no bleeding.<br/>
<br/>

<font size='18'>Crush wounds</font>
<br/>
Occur when a heavy object falls onto a person, splitting the skin and shattering or tearing underlying structures.<br/>
Sources: falling, vehicle crashes, punches.<br/>
Effects: pain - light, bleeding - extremely slowly.<br/>
<br/>

<font size='18'>Cut wounds</font>
<br/>
Slicing wounds made with a sharp instrument, leaving even edges. They may be as minimal as a paper cut or as significant as a surgical incision.<br/>
Sources: vehicle crashes, grenades, explosions, artillery shells, backblast, stabs.<br/>
Effects: pain - light, bleeding - speed depends on length and size of the wound.<br/>
<br/>

<font size='18'>Lacerations</font>
<br/>
these are separating wounds that produce ragged edges. They are produced by a tremendous force against the body, either from an internal source or from an external source like a punch.<br/>
Sources: vehicle crashes, punches.<br/>
Effects: pain - light, bleeding - slow to medium speed (depends on wound size).<br/>
<br/>

<font size='18'>Velocity wound</font>
<br/>
They are caused by an object entering the body at a high speed, typically a bullet or small pieces of shrapnel.<br/>
Sources: bullets, grenades, explosions, artillery shells.<br/>
Effects: pain - extremely high, bleeding - medium speed (depends on wound size).<br/>
<br/>

<font size='18'>Puncture wounds</font>
<br/>
Deep, narrow wounds produced by sharp objects such as nails, knives, and broken glass.<br/>
Sources: stabs, grenades.<br/>
Effects: pain - light, bleeding - slowly.<br/>
<br/>
In order to stop the bleeding, all bleeding injuries on every body part requires treatment. This is done by either applying a tourniquet to legs or arms as a temporary solution, or by using bandages to stop the bleeding as a more permanent fix.
"]];

_med2 = player createDiaryRecord ["MedicalHelp", ["Bandages","
<br/>
<img image='brief\medical1.jpg'/>
<br/><br/>

<font size='18'>Efficiency</font>
Bandage efficiency, higher is better
<br/><br/>

<font size='18'>Reopening chance</font>
Reopening chance when advanced wounds are enabled, lower is better.
"]];

_med3 = player createDiaryRecord ["MedicalHelp", ["Tourniquet","
<br/>
Can only be applied on limbs.<br/>
Stops bleeding from wounds.<br/>
Should be taken off as fast as possible and applied only to give medic time to bandage all the wounds.<br/>
If not taken off for a while it will cause pain to the patient.<br/>
"]];

_med4 = player createDiaryRecord ["MedicalHelp", ["IVs & Autoinjectors","
<br/>
<font size='18'>IV	Effect</font>
<br/>
Saline plasma and blood	All three restore the volume of liquid in the blood stream. as a result blood pressure is raised for all of them.
Use the appropriate amount depending on the situation (heavy loss of blood, blood pressure too low) (250, 500 or 1 000 mL)
<br/><br/><br/>
<font size='18'>Autoinjector	Effect</font>
<br/><br/>
Morphine	Decreases the blood viscosity, suppress pain
<br/><br/>
Epinephrine	Raises the heart rate of the patient
<br/><br/>
Adenosine	Lowers the heart rate
<br/><br/>
Atropine	Lowers the heart rate of the patient
<br/><br/>
Note: Morphine stays much longer in the system compared to other medications.
"]];

_med4 = player createDiaryRecord ["MedicalHelp", ["Surgical kit","
<br/>
Is only useful when advanced wounds (reopening) is enabled.<br/>
Stitch a wound to stop it from reopening.<br/>
It’s use may be limited to a Medic/Dr and or near a vehicle / facility.<br/>
It’s use is limited according to the condition of the patient, you might need to stabilize him first before using it.
"]];

_med5 = player createDiaryRecord ["MedicalHelp", ["PAK","
<br/>
Used to fully heal someone. (Removes any injury, restore vitals to a stable state and reset the medical history, clears all medication in the system.)<br/>
It’s use may be limited to Medic/DR class and only in or near facility.<br/>
It’s use can also be limited according to the condition of the patient, you might need to stabilize him first before using it.<br/>
"]];

_med6 = player createDiaryRecord ["MedicalHelp", ["Blood pressure","
<br/>
NOTE:the systolic blood pressure is the number on the left, the diastolic blood pressure is the number on the right.<br/>
<br/><br/>
The diastolic is the pressure in the arteries when the heart rests between beats. This is the time when the heart fills with blood and gets oxygen.
<br/><br/>
The systolic is when your heart beats, it squeezes and pushes blood through your arteries to the rest of your body. This force creates pressure on those blood vessels, and that's your systolic blood pressure.
<br/><br/>
Blood pressure is affected by the amount of blood lost as well as IVs and medication.<br/>
Non existent: 0 - 20 systolic.<br/>
Low: 20 - 100 systolic.<br/>
Normal: 100 - 160 systolic.<br/>
High: 160 and above systolic.<br/>
"]];


_med7 = player createDiaryRecord ["MedicalHelp", ["Heart rate","
<br/>
The heart rate (pulse) is affected by the amount of blood lost and medications.
<br/><br/>
Low: 45 and below<br/>
Normal: between 46 and 119<br/>
High: 120 and above<br/>
"]];

_med8 = player createDiaryRecord ["MedicalHelp", ["Cardiac arrest","
<br/>
A patient will enter cardiac arrest when:
<br/><br/>
The heart rate is below 20.<br/>
The heart rate is above 200.<br/>
The systolic blood pressure is above 260.<br/>
The diastolic blood pressure is below 40 and the heart rate is above 190.<br/>
The systolic blood pressure is above 145 and the heart rate is above 150.<br/>
"]];

_med9 = player createDiaryRecord ["MedicalHelp", ["Treating the patient","
<br/>
This is a step by step guide, follow the steps from 1 to 6 in order unless stated otherwise.
<br/><br/>
Keeping the patient’s vitals stable is your first priority.<br/>
If advanced wounds are enabled make sure from time to time that they didn’t reopen.<br/>
If a limb has a wound with a high bleeding rate (or multiple) such as a large avulsion or large cut; use a tourniquet immediately on it, otherwise the patient might loose large amounts of blood while you try to treat it.<br/>
<br/><br/>
Step 1: Is the patient responsive?<br/>
Yes: Ask him if he has wounds / he is in pain and act accordingly.<br/>
No: Go to step 2.<br/>
<br/><br/>
Step 2: Is the patient wounded?
<br/>
Yes: Treat the wounds.<br/>
No: Skip this step.<br/>
<br/><br/>
Step 3: Does the patient have a pulse?<br/>
<br/>
Yes: Go to step 4.<br/>
No: If you are alone provide CPR, if you have someone else get him to do CPR while you treat the patient’s wounds. Skip to step 4 or 5 depending on the situation.
<br/><br/>
Step 4: Did the patient lose a lot of blood?<br/>
<br/>
Yes: Use IVs to restore the volume of liquid in the blood stream of the patient.<br/>
No: Skip this step.<br/>
<br/><br/>
Step 5: Is the patient in pain?<br/>
<br/>
Yes and stable pulse: Give him morphine.<br/>
Yes and unstable heart rate: Stabilize the heart rate before administrating morphine.<br/>
No: You’re done.<br/>
<br/><br/>
Step 6: is the patient awake now?<br/>
<br/>
Yes: You’re done.<br/>
No: Stabilize his pulse / make sure he isn’t in pain or missing blood.<br/>
"]];

_med10 = player createDiaryRecord ["MedicalHelp", ["Additional informations","
<br/>
As an infantryman you can use a tourniquet to stop a limb from bleeding, note that this is supposed to be a temporary solution and leaving the tourniquet more than 5 minutes will induce pain.<br/><br/>
Pain is only suppressed and not removed by default.<br/><br/>
You don’t have to take epinephrine after you take morphine, just wait until your pulse stabilizes by itself (Provided that you are in a stable condition).<br/>
"]];


_med11 = player createDiaryRecord ["MedicalHelp", ["Additional informations","
<br/>
A unit in the revive state will be unconscious and will stay unconscious until it is either woken up or the revive timer runs out.<br/><br/>
A unit in the revive state can’t die from any source of damage, only the timer reaching 0 can kill it.<br/><br/>
Each successful CPR will increase the time the unit can stay in the revive state.<br/><br/>
To wake up a patient the use of a PAK is required.<br/><br/>
Each successful revive removes a life from the unit, once the lives run out the next time the unit will take fatal damage it will not enter the revive state and will die.<br/><br/>
Each successful round of CPR (filled up completion bar) increases the time left in the revive state.<br/><br/>
"]];

_med12 = player createDiaryRecord ["MedicalHelp", ["Practice patient","
<br/>
You need to be server admin <br/><br/>
author: Tiberius<br/><br/>
Version: V001<br/><br/>
2017<br/><br/>
<br/><br/>
This script will spawn a civilian unit with ACE wounds as a practice patient.<br/><br/>
Use the following commandline to exec the script:<br/><br/>
<br/><br/>
null = [POSITION, DISTANCE, MODE] execVM "Tib_practicePatient\Tib_medical.sqf";<br/><br/>
<br/><br/>
POSITION: 	the position of an object. It will be the spawn position. <br/><br/>
		Use PLAYER for player. Do not use markers.  <br/><br/>
<br/><br/>
DISTANCEL:	The Distance between the spawnposition and the patient <br/><br/>
		to trigger the despawn of patient. <br/><br/>
<br/><br/>
MODE:		1, 2 or 3;<br/><br/>
		Mode 1 is minor injured patient. <br/><br/>
		Mode 2 is severe injured patient. <br/><br/>
		Mode 3 is patient with cardiac arrest. <br/><br/>
<br/><br/>
Example: null = [spawnPos, 10, 1] execVM "scripts\Tib_medical.sqf";<br/><br/>
<br/><br/>

"]];
