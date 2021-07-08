/*
 * File: CfgCommunicationMenu.hpp
 * Project: v.Cam_Lao_Nam
 * File Created: Tuesday, 6th July 2021 7:29:18 pm
 * Author: YonV (yonv@gmail.com)
 * -----
 * Last Modified: Wednesday, 7th July 2021 6:08:56 pm
 * Modified By: YonV (yonv@gmail.com>)
 */


class CfgCommunicationMenu
	{
	class HAS_callTransport
		{
		text = "Call for transport";
		submenu = "#USER:RYD_HAS_CT_submenu";
		//expression = "[[_this,this,_caller,_pos,_target,_is3D,_ID],RYD_HAS_atCalled] remoteExec ['spawn',2];";
		expression = "";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
		cursor = "\A3\ui_f\data\igui\cfg\cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
		};
		
	class HAS_callSupply
		{
		text = "Call for supplies";
		submenu = "#USER:RYD_HAS_CS_submenu";
		//expression = "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2]";
		expression = "";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
		cursor = "\A3\ui_f\data\igui\cfg\cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
		};
		
	class HAS_callCAS
		{
		text = "Call CAS support";
		submenu = "#USER:RYD_HAS_CC_submenu";
		//expression = "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2]";
		expression = "";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\casheli_ca.paa";
		cursor = "\A3\ui_f\data\igui\cfg\cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
		};
		
	class HAS_callCancel
		{
		text = "Cancel pending call";
		submenu = "";
		expression = "RYD_HAS_CallCancelled = true;publicVariableServer 'RYD_HAS_CallCancelled';";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";
		cursor = "";
		enable = "1";
		removeAfterExpressionCall = 0;
		};
		
	class HAS_FlightCeiling
		{
		text = "Change flight ceiling";
		submenu = "#USER:RYD_HAS_FC_submenu";
		//expression = "[[nil,nil,nil,100],RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];";
		expression = "";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";
		cursor = "";
		enable = "1";
		removeAfterExpressionCall = 0;
		};
	};