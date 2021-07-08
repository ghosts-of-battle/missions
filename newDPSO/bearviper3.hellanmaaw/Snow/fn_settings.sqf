////////////////////////////settings//////////////////////////////////////

/////////////////////////////snow/////////////////////////////////////////////////////////////////////

_hardSnowFall          = false;                            // activate hard snow falling when overcast up to 0.9

///////////////////////environment effects///////////////////////////////////////////////////////////
_windOn                = true;                            // activate/deactivate wind true/false

_vlS                   = 1;                               // volume wind level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
_vlSE                  = 1;                               // volume Environment Sounds level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
//////////////////////////////////snow mask////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_maskOn                = true;                            // activate/deactivate snowMask simulation true/false
_glassesOnlySnow       = true;                            // Work only with _maskOn = true -------   if you want snowMask only when snow falling or raining  - if false mask when sunny too
_useCheckGlasses       = true;                            // Work only with _maskOn = true--------- check if player have mask defined in _gogglesArray ----- mask can be in all places , backpack , vest, uniform or assigned slot
_gogglesArray          = [                                /* Work only with _maskOn = true--------- array of mask allowed */

                          "NVGogglesB_blk_F",
                          "dpso_Respirator",
                          "dpso_Respirator_Black",
                          "dpso_Respirator_Olive",
                          "dpso_Respirator_Sand",
                          "G_Balaclava_blk",
                          "G_Balaclava_combat",
                          "G_Balaclava_oli",
                          "G_Bandanna_aviator",
                          "G_Bandanna_blk",
                          "G_Bandanna_khk",
                          "G_Bandanna_oli",
                          "G_Bandanna_shades",
                          "G_Bandanna_tan",
                          "G_Combat",
                          "G_Combat_Goggles_tna_F",
                          "G_Lowprofile",
                          "G_Balaclava_TI_blk_F",
                          "G_Balaclava_TI_tna_F",
                          "G_Balaclava_TI_G_tna_F",
                          "G_Tactical_Clear",
                          "G_Tactical_Black",
                          "G_WirelessEarpiece_F",
                          "G_Spectacles_Tinted",
                          "G_Balaclava_TI_G_blk_F",
                          "G_Bandanna_beast",
                          "G_Balaclava_lowprofile",
                          "G_Bandanna_sport",
                          "G_SSU_Bandana_AOR1",
                          "G_SSU_Bandana_AOR1_Beast",
                          "G_SSU_Bandana_Sports_AOR1",
                          "G_SSU_Bandana_Sports_AOR1_Beast",
                          "G_SSU_Bandana_AOR2",
                          "G_SSU_Bandana_AOR2_Beast",
                          "G_SSU_Bandana_Sports_AOR2",
                          "G_SSU_Bandana_Sports_AOR2_Beast",
                          "G_SSU_Bandana_MCAM_Black",
                          "G_SSU_Bandana_MCAM_Black_Beast",
                          "G_SSU_Bandana_Sports_MCAM_Black",
                          "G_SSU_Bandana_Sports_MCAM_Black_Beast",
                          "G_SSU_Bandana_Black",
                          "G_SSU_Bandana_Black_Beast",
                          "G_SSU_Bandana_Sports_Black",
                          "G_SSU_Bandana_Sports_Black_Beast",
                          "G_SSU_Bandana_M81",
                          "G_SSU_Bandana_M81_Beast",
                          "G_SSU_Bandana_Sports_M81",
                          "G_SSU_Bandana_Sports_M81_Beast",
                          "G_SSU_Bandana_MCAM",
                          "G_SSU_Bandana_MCAM_Beast",
                          "G_SSU_Bandana_Sports_MCAM",
                          "G_SSU_Bandana_Sports_MCAM_Beast",
                          "G_SSU_Bandana_OCP",
                          "G_SSU_Bandana_OCP_Beast",
                          "G_SSU_Bandana_Sports_OCP",
                          "G_SSU_Bandana_Sports_OCP_Beast",
                          "G_SSU_Bandana_MCAM_Tropic",
                          "G_SSU_Bandana_MCAM_Tropic_Beast",
                          "G_SSU_Bandana_Sports_MCAM_Tropic",
                          "G_SSU_Bandana_Sports_MCAM_Tropic_Beast",
                          "G_SSU_Bandana_MCAM_Woodland",
                          "G_SSU_Bandana_MCAM_Woodland_Beast",
                          "G_SSU_Bandana_Sports_MCAM_Woodland",
                          "G_SSU_Bandana_Sports_MCAM_Woodland_Beast",
                          "G_SSU_Balaclava_TI_G_Black",
                          "G_SSU_Balaclava_TI_M81",
                          "G_SSU_Balaclava_TI_G_M81",
                          "G_SSU_Balaclava_TI_G_MCAM",
                          "G_SSU_Balaclava_TI_OCP",
                          "G_SSU_Balaclava_TI_G_OCP",
                          "G_SSU_Balaclava_TI_MCAM_Tropic",
                          "G_SSU_Balaclava_TI_MCAM_Woodland",
                          "G_SSU_Balaclava_TI_G_MCAM_Woodland",
                          "G_SSU_Balaclava_TI_G_MCAM_Tropic",
                          "G_SSU_Balaclava_TI_MCAM",
                          "G_SSU_Balaclava_TI_Black",
                          "G_SSU_Balaclava_TI_G_MCAM_Black",
                          "G_SSU_Balaclava_TI_MCAM_Black",
                          "G_SSU_Balaclava_TI_G_AOR2",
                          "G_SSU_Balaclava_TI_AOR2",
                          "G_SSU_Balaclava_TI_G_AOR1",
                          "G_SSU_Balaclava_TI_AOR1",
                          "G_SSU_Balaclava_TI_G_MCAM_Alpine",
                          "G_SSU_Balaclava_TI_MCAM_Alpine",
                          "G_B_Diving"
                         ];
_noCheckBackpack       = true;                            // Work only with _maskOn = true--------- check or not in backpack for glasses (recommended true for have a place for remove at the moment glasses)


///////////////////////Snow FootSteps Sound//////////////////////////////////////////

_snowStepsSound       = true;                            // activate/deactivate sound crunching on snow
_ssVolume             = 3;                               // volume of sound
_ssDistance           = 30;                              // max distance audible sound


///////////////////////Blizzard /////////////////////////////////////////

_blizzOn              = true ;                          // activate/deactivate blizzard
_blizzCcOn            = true ;                         // activate deactivate white colorCorrection
_timeStartblizz       = [300,600,900,1200];                // times starts array static time
_blizzDuration        = 100;                           // duration time blizzard --- dnot set up to difference between times in _timeStartArray [1800,3600] -- 3600-1800= 1800 (_blizzDuration 1795 max)

_blizzWavesVel        = 10;                             //seconds between waves -- increase for less blizzard , decrease(test first!) for speed blizzard

/////////////////////RetexTure Vehicles///////////////////////////////////

_retextureOn = true ;

////////////////////Vehicles Slide on Snow/////////////////////////////////

_vehSlideOnSnow = true ;

////////////////////Spawn frozen Wrecks //////////////////////////////////


_itemsMinMax          = [10,15,20];                     // numb min med max  of items spawned when wreck will be removed

_spawnItemsArray      = [ // classes of items to spawn when wreck will be removed - add remove change items
                        "ToolKit"
                        ];

_wrecksTypes          = [                              //  classes of wrecks will be spawned (must be the same of _wrecksTypes in  @exileserver\addon\a3_WY_Wrecks\fn_settings.sqf)
                                            "WY_Snow_Bmp2_wreck_F",
                                            "WY_Snow_Brdm2_wreck_F",
                                            "WY_Snow_Datsun_1_wreck_F",
                                            "WY_Snow_Hilux_wreck_F",
                                            "WY_Snow_T72_wreck_F",
                                            "WY_Snow_UAZ_wreck_F",
                                            "WY_Snow_URAL_wreck_F",
                                            "WY_Snow_UH60_wreck_F",
                                            "WY_Snow_BVP1T_wreck_F",
                                            "WY_Snow_Fort_Barricade_F",
                                            "WY_Snow_HMMWV_wreck_F",
                                            "WY_Snow_SKOD_wreck_F"
                        ];

_wrecksDoubleItems    = [                            //  classes of wrecks - when removed spawn double of items
                                            "WY_Snow_UH60_wreck_F",
                                            "WY_Snow_Fort_Barricade_F"
                        ];

//////////////////////////end settings////////////////////////////////////


//////////////////////////end settings////////////////////////////////////
