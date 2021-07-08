#include "..\script_component.hpp"
/*
 * Author: Kresky, Jonpas, JoramD
 * Adds feature overview.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(featureOverview);
 */

params ["_player"];

_player createDiarySubject ["features", "Features"];

_player createDiaryRecord ["features", ["Environment Controller", "
    <br/>The main base and some courses have an additional laptop to control the environment.
"]];

_player createDiaryRecord ["features", ["Chat Commands", "
    <br/><font color='#E3D310'>#dpso-heal:</font color>
    <br/>Type `#dpso-heal` in chat to heal yourself.
    <br/>If you want to heal someone else, type `#dpso-heal John Doe`.
    <br/>
    <br/><font color='#E3D310'>#dpso-fix:</font color>
    <br/>Type `#dpso-fix` in chat to repair, refuel and rearm the vehicle you are looking at.
    <br/>
    <br/><font color='#E3D310'>#dpso-cleanup:</font color>
    <br/>Type `#dpso-cleanup` in chat to delete any items on the ground in a 10m range.
"]];

_player createDiaryRecord ["features", ["Arsenals", "
    <br/><img image='\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_PlasticCase_01_large_black_F.jpg' width='228' height='128'/>
    <br/><font color='#E3D310'>Equipment Arsenal:</font color>
    <br/>Will have items applicable to the course it is at (also has full arsenal).
    <br/>
    <br/><img image='\A3\\editorpreviews_f\Data\CfgVehicles\B_Slingload_01_Cargo_F.jpg' width='228' height='128'/>
    <br/><font color='#E3D310'>Full Arsenal:</font color>
    <br/>Will have every item available in the game.
"]];

