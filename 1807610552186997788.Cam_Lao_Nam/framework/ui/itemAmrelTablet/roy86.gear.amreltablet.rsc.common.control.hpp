class RscControlAmrelTabletButtons: Rsc86ControlsGroupNoScrollbars {
	idc = ASSIGNED_IDC_0;
	x = "6.00 * (((safezoneW / safezoneH) min 1.2) / 40) + safeZoneX + (uiNamespace getVariable [""Roy86_IGUI_AmrelTablet_X"",0])";
	y = "34.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safeZoneY + (uiNamespace getVariable [""Roy86_IGUI_AmrelTablet_Y"",0])";
	w = "44.0 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    class Controls {
		class RscControlAmrelTabletButton_Fnc1 : Rsc86ButtonTextOnly {
			idc = ASSIGNED_IDC_1;
			text = "";
			tooltip = "Undefined";
			x = "(0 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "0.05 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "3.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,1};
			shadow = 1;
		};
		class RscControlAmrelTabletButton_Fnc2 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_2;
			x = "(1 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RscControlAmrelTabletButton_Fnc3 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_3;
			x = "(2 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RscControlAmrelTabletButton_Fnc4 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_4;
			x = "(3 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RscControlAmrelTabletButton_Fnc5 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_5;
			x = "(4 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RscControlAmrelTabletButton_Fnc6 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_6;
			x = "(5 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		/* class RscControlAmrelTabletButton_Fnc7 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_7;
			x = "(6 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		}; */
		/* class RscControlAmrelTabletButton_Fnc8 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_8;
			x = "(7 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		}; */
		/* class RscControlAmrelTabletButton_Fnc9 : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_9;
			x = "(8 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		}; */
		/* class RscControlAmrelTabletButton_FncX : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_10;
			x = "(9 * 4.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		}; */
		class RscControlAmrelTabletButton_FncY : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_11;
			x = "(7 * 4.2 - 0.2) * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RscControlAmrelTabletButton_FncZ : RscControlAmrelTabletButton_Fnc1 {
			idc = ASSIGNED_IDC_12;
			x = "(8 * 4.2 + 0.5) * (((safezoneW / safezoneH) min 1.2) / 40)";
			w = "3 * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
    };
};

class RscControlAmrelTabletMenuScreen: Rsc86ControlsGroupNoScrollbars {
    idc = ASSIGNED_IDC_13;
	x = "4.65 * (((safezoneW / safezoneH) min 1.2) / 40) + safeZoneX + (uiNamespace getVariable [""Roy86_IGUI_AmrelTablet_X"",0])";
    y = "32.65 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safeZoneY + (uiNamespace getVariable [""Roy86_IGUI_AmrelTablet_Y"",0])";
	w = "38.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    class Controls {
        class RscControlAmrelTabletMenuScreen_Fnc1: Rsc86StructuredText {
            idc = ASSIGNED_IDC_14;
            x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
            y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            w = "6.35 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            size = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            text = "Tab 1: Empty";
			color[] = {0,0,0,0.8};
			colorText[] = {0,0,0,0.8};
            colorBackground[] = {0,0,0,0.2};
        };
        class RscControlAmrelTabletMenuScreen_Fnc2: RscControlAmrelTabletMenuScreen_Fnc1 {
            idc = ASSIGNED_IDC_15;
            x = "6.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
            text = "Tab 2: Empty";
        };
        class RscControlAmrelTabletMenuScreen_Fnc3: RscControlAmrelTabletMenuScreen_Fnc1 {
            idc = ASSIGNED_IDC_16;
            x = "12.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
            text = "Tab 3: Empty";
        };
        class RscControlAmrelTabletMenuScreen_Fnc4: RscControlAmrelTabletMenuScreen_Fnc1 {
            idc = ASSIGNED_IDC_17;
            x = "19.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
            text = "Tab 4: Empty";
        };
        class RscControlAmrelTabletMenuScreen_Fnc5: RscControlAmrelTabletMenuScreen_Fnc1 {
            idc = ASSIGNED_IDC_18;
            x = "25.7 * (((safezoneW / safezoneH) min 1.2) / 40)";
            text = "Tab 5: Empty";
        };
        class RscControlAmrelTabletMenuScreen_Fnc6: RscControlAmrelTabletMenuScreen_Fnc1 {
            idc = ASSIGNED_IDC_19;
            x = "32.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
            text = "Tab 6: Empty";
        };
    };
};