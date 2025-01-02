// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#define COLOR_DARKORANGE 0xFF3F00AA
#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/cartune", cmdtext, true, 10) == 0)
	{

		ShowPlayerDialog(playerid,1223,DIALOG_STYLE_LIST,"Car Tune  BY Bartje01","Tuners\nLowriders\nOthers\nBasic parts\nPaintjobs","Ok", "Cancel");

		return 1;
	}
	return 0;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new vehicleid;
    vehicleid = GetPlayerVehicleID(playerid);
    switch(dialogid)
    {
        case 1223:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1; 
            }
            switch(listitem) 
            {
                case 0: 
                {
                ShowPlayerDialog(playerid,1224,DIALOG_STYLE_LIST,"Tuners","Elegy\nFlash\nJester\nSultan\nUranus\nStratum","Ok", "Cancel");
                }
                case 1:
                {
                ShowPlayerDialog(playerid,1225,DIALOG_STYLE_LIST,"Lowriders","Blade\nSavanna\nBroadway\nRemington\nSlamvan\nTornado","Ok", "Cancel");
                }
                case 2:
                {
                if(GetVehicleModel(vehicleid) == 562||565||559||560||558||561)
				{
               	ShowPlayerDialog(playerid,1226,DIALOG_STYLE_LIST,"Others","Spoilers","Ok", "Cancel");
                }
                else
                {
                SendClientMessage(playerid,COLOR_DARKORANGE,"You have to be in a Tuner");
                }
                }
                case 3:
                {
                 ShowPlayerDialog(playerid,1227,DIALOG_STYLE_LIST,"Basic parts","Rims\nExtra","Ok", "Cancel");
                }
                case 4:
                {
                 ShowPlayerDialog(playerid,1250,DIALOG_STYLE_LIST,"Paintjobs","Paintjob1\nPaintjob2\nPaintjob3","Ok", "Cancel");
                }
            }
        }
    }
	////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1224:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
                ShowPlayerDialog(playerid,1228,DIALOG_STYLE_LIST,"Elegy","ExhaustAlienElegy\nX-Flow roof\nAlien Sideskirt\nExhaust X-Flow\nAlien Roof\nX-Flow Sideskirt\nSpoiler X-Flow\nSpoilerAlien\nRear BumperX-Flow\nRear BumperAlien\nFront Bumper X-Flow\nFront Bumper Alien","Ok", "Cancel");
                }
                case 1:
                {
                ShowPlayerDialog(playerid,1229,DIALOG_STYLE_LIST,"Flash","Exhaust X-Flow\nExhaust Alien\n Alien Sideskirt\nX-Flow sideskirt\nSpoiler Alien\nSpoiler X-Flow\nRoof X-Flow\nRoof Alien\nRear bumper Alien\nRear bumper X-Flow\nFront bumper X-Flow\nFront Bumper Alien","Ok", "Cancel");
                }
                case 2:
                {
                 ShowPlayerDialog(playerid,1230,DIALOG_STYLE_LIST,"Jester","Sideskirts Alien\nSideskirts X-Flow\nFront Bumper X-Flow\nRear bumper Alien\nFront Bumper Alien\nRear Bumper X-Flow\nSpoiler Alien\nSpoiler X-Flow\nExhaust Alien\nExhaust X-Flow\nRoof Alien\nRoof X-Flow","Ok", "Cancel");
                }
                case 3:
                {
                 ShowPlayerDialog(playerid,1231,DIALOG_STYLE_LIST,"Sultan","Alien Sideskirt\nExhaust Alien\nExhaust X-Flow\nX-flow Sideskirt\nAlien Roof\nX-Flow Roof\nSpoiler Alien\nSpoiler X-Flow\nRear Bumper X-Flow\nRear Bumper Alien\nFront Bumper Alien\nFront Bumper X-Flow","Ok", "Cancel");
                }
                case 4:
                {
                 ShowPlayerDialog(playerid,1232,DIALOG_STYLE_LIST,"Uranus","Roof Alien\nRoof X-Flow\nExhaust X-Flow\nExhaust Alien\nSideskirt Alien\nSideskirt X-Flow\nSpoiler X-Flow\nSpoiler Alien\nFront Bumper X-Flow\nFront Bumper Alien\nRear Bumper X-FLow\nRear Bumper Alien","Ok", "Cancel");
                }
                case 5:
                {
                 ShowPlayerDialog(playerid,1233,DIALOG_STYLE_LIST,"Stratum","Roof Alien\nSideskirt Alien\nSideskirt X-Flow\nSpoiler Alien\nExhaust X-Flow\nSpoiler X-Flow\nRoof X-Flow\nExhaust Alien\nRear Bumper Alien\nFront Bumper Alien\nRear Bumper X-Flow\nFront Bumper X-Flow","Ok", "Cancel");
                }
            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1225:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
                ShowPlayerDialog(playerid,1234,DIALOG_STYLE_LIST,"Blade","Roof Convertible\nRood Hardtop\nExhaust Chrome\nExhaust Slamin\nSideskirt Chrome\nFrontbumper Slamin\nFrontbumper Chrome\nRearbumper Slamin\nRearbumper Chrome","Ok", "Cancel");
                }
                case 1:
                {
                ShowPlayerDialog(playerid,1235,DIALOG_STYLE_LIST,"Savanna","Sideskirt Chrome Strip\nExhaust Chrome\nExhaust Slamin\nHardtop\nSofttop\nRear bumper Slamin\nRear bumper chrome\nFront bumper Slamin\nFront bumper chrome","Ok", "Cancel");
                }
                case 2:
                {
                 ShowPlayerDialog(playerid,1236,DIALOG_STYLE_LIST,"Broadway","Sideskirt Chrome\nExhaust Slamin\nExhaust Chrome\nFront bumper chrome\nFront bumper Slamin\nRearbumper Chrome\nRearbumper Slamin","Ok", "Cancel");
                }
                case 3:
                {
                 ShowPlayerDialog(playerid,1237,DIALOG_STYLE_LIST,"Remington","Bullbar Chrome Grill\nSideskirt Chrome Flame\nSideskirt Chrome Arches\nBullbars Bars\nBullbars Lights\nExhaust Chrome\nExhaust Slamin\nRear bumper Chrome\nFront bumper slamin\nRear bumper Chrome\nFront bumper slamin","Ok", "Cancel");
                }
                case 4:
                {
                 ShowPlayerDialog(playerid,1238,DIALOG_STYLE_LIST,"Slamvan","Rear Bullbars Chrome\nRear Bullbars Slamin\nFront Sign\nFront Sign 2\nExhaust Chrome\nExhaust Slamin\nFront Bullbars Chrome\nFront Bullbars Slamin\nFront Bumper Chrome\nSideskirt Chrome Trim\nSideskirt Wheelcovers","Ok", "Cancel");
                }
                case 5:
                {
                ShowPlayerDialog(playerid,1239,DIALOG_STYLE_LIST,"Tornado","Sideskirt\nExhaust Slamin\nExhaust Chrome\nFront Bumper Slaming\nFront Bumper Chrome\nRear Bumper Chrome\nRear Bumper Slamin","Ok", "Cancel");
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////

	switch(dialogid)
		 		{
        		case 1226:
        		{
            	if(!response)
            	{
            	SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            	return 1;
            	}
            	switch(listitem)
            	{
                case 0:
                {
                
                if(IsTuner(GetVehicleModel(vehicleid)))
                {
                    ShowPlayerDialog(playerid,1240,DIALOG_STYLE_LIST,"Spoilers","Spoiler Pro\nSpoiler Win\nSpoiler Drag\nSpoiler Alpha\nSpoiler Race\nSpoiler Worx","Ok", "Cancel");
                    return 1;
                }
                else
                {
                SendClientMessage(playerid,COLOR_DARKORANGE,"You have to be in a Tuner");
                }
                }
                case 1:
                {
                ShowPlayerDialog(playerid,1241,DIALOG_STYLE_LIST,"Hoods","Hood Champ Scoop\nHood Fury Scoop\nRoof Scoop\nRace Scoop\nWorx Scoop","Ok", "Cancel");
                }
                case 2:
                {
                 ShowPlayerDialog(playerid,1242,DIALOG_STYLE_LIST,"Lamps","Round Fog\nSqaure Fog","Ok", "Cancel");
                }
                case 3:
                {
                 ShowPlayerDialog(playerid,1243,DIALOG_STYLE_LIST,"Vents","Oval Vents\nSqaure Vents","Ok", "Cancel");
                }
                case 4:
                {
                 ShowPlayerDialog(playerid,1244,DIALOG_STYLE_LIST,"Sides","Sideskirt","Ok", "Cancel");
                }
                case 5:
                {
                 ShowPlayerDialog(playerid,1245,DIALOG_STYLE_LIST,"Exhaust","Exhausts Upset\nExhaust Twin\nExhaust Large\nExhaust Medium\nExhaust Small","Ok", "Cancel");
                }
            }
        }
    }
    ////////////////////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1227:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
                ShowPlayerDialog(playerid,1246,DIALOG_STYLE_LIST,"Rims","Ahab\nVirtual\nAccess\nShadow\nMega\nRimshine\nWires\nClassic\nTwist\nCutter\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic","Ok", "Cancel");
                }
                case 1:
                {
                ShowPlayerDialog(playerid,1247,DIALOG_STYLE_LIST,"Extra","Bas Boost\nHydraulics\nNitro x2\nNitro x5\nNitro x10","Ok", "Cancel");
                }
            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////
    
    switch(dialogid)
    {

        case 1228:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 562)
				{
				GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1034);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 1:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1035);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1036);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1040);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1037);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1038);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1039);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1041);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1146);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1147);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1148);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1149);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1172);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 562)
				{
    			AddVehicleComponent(vehicle, 1171);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Elegy");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1229:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicleid, 1045);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 1:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1046);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1047);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1051);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1048);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1052);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1049);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1050);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1053);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1054);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1150);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1151);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1152);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 565)
				{
    			AddVehicleComponent(vehicle, 1153);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Flash");
				}
                }
            }
        }
    }
    switch(dialogid)
    {
        case 1230:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicleid, 1069);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1071);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 1:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1070);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1072);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1173);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1159);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1160);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1161);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1162);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1158);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1065);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1066);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1067);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 559)
				{
    			AddVehicleComponent(vehicle, 1068);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Jester");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1231:
        {
            if(!response)
            {
                SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
                return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicleid, 1026);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1027);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicleid, 1028);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1029);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1030);
    			GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicle, 1031);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1032);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1033);
    			GivePlayerMoney(playerid,-800);

    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1138);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1139);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1140);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1141);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1169);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 560)
				{
    			AddVehicleComponent(vehicle, 1170);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Sultan");
				}
                }
            }
        }
    }
    
	switch(dialogid)
    {
        case 1233:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicleid, 1055);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicleid, 1056);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1062);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1057);
    			GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicle, 1063);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1058);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1059);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1060);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1061);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1064);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1154);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1155);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1156);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 561)
				{
    			AddVehicleComponent(vehicle, 1157);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Stratum");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1232:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicleid, 1088);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicleid, 1091);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1089);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1092);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1090);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1094);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1093);
    			GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicle, 1095);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1163);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1164);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1165);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1166);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1167);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
                case 11:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 558)
				{
    			AddVehicleComponent(vehicle, 1168);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Uranus");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
    switch(dialogid)
    {
        case 1234:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicleid, 1103);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicleid, 1128);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1104);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1105);
    			GivePlayerMoney(playerid,-800);

    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1107);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1108);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1181);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1182);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1183);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 536)
				{
    			AddVehicleComponent(vehicle, 1184);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Blade");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1235:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 567)
				{
                AddVehicleComponent(vehicleid, 1102);
                GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1133);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicleid, 1129);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1132);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1130);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1132);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1186);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1187);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1188);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 567)
				{
    			AddVehicleComponent(vehicle, 1189);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Savanna");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1236:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 575)
				{
                AddVehicleComponent(vehicleid, 1042);
                GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1099);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicleid, 1043);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicle, 1044);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicle, 1174);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicle, 1175);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicle, 1176);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 575)
				{
    			AddVehicleComponent(vehicle, 1177);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Broadway");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1237:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 534)
				{
                AddVehicleComponent(vehicleid, 1100);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicleid, 1101);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1122);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1106);
    			GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicleid, 1124);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1123);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1125);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1126);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1127);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1178);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1179);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1180);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 534)
				{
    			AddVehicleComponent(vehicle, 1185);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Remington");
				}
                }
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1238:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }
            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 535)
				{
                AddVehicleComponent(vehicleid, 1109);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 535)
				{

    			AddVehicleComponent(vehicleid, 1110);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1111);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1112);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1113);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1114);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1115);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 7:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1116);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 8:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1117);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 9:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1120);
    			AddVehicleComponent(vehicle, 1118);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
                }
                case 10:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 535)
				{
    			AddVehicleComponent(vehicle, 1121);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicle, 1119);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Slamvan");
				}
    		}
		}
	}
}
                /////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1239:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) == 576)
				{
                AddVehicleComponent(vehicleid, 1134);
                GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicleid, 1137);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicleid, 1135);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicle, 1136);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicle, 1190);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicle, 1191);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicle, 1192);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
				}
                }
                case 6:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 576)
				{
    			AddVehicleComponent(vehicle, 1193);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Tornado");
						}
                }
            }
        }
	}
                /////////////////////////////////////////////////////////////////////////

	switch(dialogid)
    {
        case 1240:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1000);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicleid, 1001);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1002);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1003);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1015);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 5:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1016);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
			}
        }
    }
                ////////////////////////////////////////////////////////////////////////
	switch(dialogid)
    {
        case 1241:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1004);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicleid, 1005);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
				case 2:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1006);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
    			else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
    			case 3:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1011);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 4:
                {
                new vehicle;
                vehicle = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicle, 1012);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
				}
				}
				}

    switch(dialogid)
    {
        case 1242:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1013);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicleid, 1024);
    			GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}
				
            }
        }
    }
    switch(dialogid)
    {
        case 1243:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1142);
                GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicleid, 1143);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
    			AddVehicleComponent(vehicleid, 1142);
    			GivePlayerMoney(playerid,-800);
    			AddVehicleComponent(vehicleid, 1145);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
				}

            }
        }
    }
    switch(dialogid)
    {
        case 1244:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1007);
                GivePlayerMoney(playerid,-800);
                AddVehicleComponent(vehicleid, 1017);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
            }
        }
    }
    switch(dialogid)
    {
        case 1245:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1018);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1019);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 2:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1020);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 3:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1021);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 4:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1022);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
            }
        }
    }
    switch(dialogid)
    {
        case 1246:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1096);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1097);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 2:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1098);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 3:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1073);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 4:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1074);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 5:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1075);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 6:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1076);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 7:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1077);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 8:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1078);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 9:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1079);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 10:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1080);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 11:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1081);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 12:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1082);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 13:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1083);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 14:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1084);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 15:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1085);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
            }
        }
    }
    switch(dialogid)
    {
        case 1247:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1086);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1087);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 2:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1009);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 3:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1008);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 4:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                AddVehicleComponent(vehicleid, 1010);
                GivePlayerMoney(playerid,-800);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
            }
        }
    }
    switch(dialogid)
    {
        case 1250:
        {
            if(!response)
            {
            SendClientMessage(playerid, 0xFF0000FF, "You cancelled.");
            return 1;
            }

            switch(listitem)
            {
                case 0:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                ChangeVehiclePaintjob(vehicleid,1);
                GivePlayerMoney(playerid,-1000);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 1:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                ChangeVehiclePaintjob(vehicleid,2);
                GivePlayerMoney(playerid,-1000);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                case 2:
                {
				if(GetVehicleModel(vehicleid) >=1)
				{
                ChangeVehiclePaintjob(vehicleid,3);
                GivePlayerMoney(playerid,-1000);
    			SendClientMessage(playerid,COLOR_DARKORANGE,"Vehicle Component added");
				}
				else
				{
				SendClientMessage(playerid,COLOR_DARKORANGE,"This is not an Vehicle");
				}
                }
                
            }
        }
    }
    return 0; 
}
stock IsTuner(modelid)
{
    switch(modelid)
    {
        case 562, 565, 559,
        560, 558, 561: return true;
    }
    return false;
}
