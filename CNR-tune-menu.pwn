#define TUNE_MENU 41
#define TUNE_MENU1 42
#define TUNE_MENU2 43
#define TUNE_MENU3 44
#define TUNE_MENU4 45
#define TUNE_MENU5 46
#define TUNE_MENU6 47
#define TUNE_MENU7 48
#define TUNE_MENU8 49
#define TUNE_MENU9 50
#define TUNE_MENU10 51
#define TUNE_MENU11 52
#define TUNE_MENU12 53
#define TUNE_MENU13 54
#define TUNE_MENU14 55
#define TUNE_MENU15 56
#define TUNE_MENU16 57

new bool:IsPlayerUsingTuneMenu[MAX_PLAYERS char];


    if(dialogid == SERVICE_STATION_MENU)
    {
		if(response)
		{
			switch(listitem)
			{
			    case 0:
			    {
			        if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, RED, "POOL KAFI NADARI!");
	    			RepairVehicle(GetPlayerVehicleID(playerid));
	    			GivePlayerCash(playerid, -500);
	    			PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	    			GameTextForPlayer(playerid,"~w~Vehicle ~g~Repaired~n~~r~Cost: $500", 5000, 5);
	    			SendClientMessage(playerid, YELLOW, "Vehicle repaired.");
	    			ShowPlayerDialog(playerid, SERVICE_STATION_MENU, DIALOG_STYLE_LIST, "{FFFFFF} Service Station - Menu", "{FFFFFF}Service: Repair - Price: $500\nService: Refuel - Price: $500\nService: Vehicle Bomb - Price: $100K\nClick here for Tune Menu", "Buy", "Cancel");
	    			return 1;
			    }
			    case 1:
			    {
			        new vid = GetPlayerVehicleID(playerid);
			        if(GetVehicleFuel[vid] == 100) return SendClientMessage(playerid, RED, "Your vehicles fuel tank is full.");
					if(GetPlayerCash(playerid) < 500) return SendClientMessage(playerid, RED, "POOL KAFI NADARI!");
					GetVehicleFuel[vid] = 100;
					GivePlayerCash(playerid, - 500);
					TogglePlayerControllable(playerid, true);
 			        GetVehicleParamsEx(vid, engine, lights, alarm, doors, bonnet, boot, vcondition);
				    SetVehicleParamsEx(vid, ON, lights, OFF, doors, OFF, OFF, vcondition);
					GameTextForPlayer(playerid,"~w~Vehicle ~g~Refuelled.~n~~r~Cost: $500", 3000, 5);
					SendClientMessage(playerid, YELLOW, "Vehicle refuelled.");
					ShowPlayerDialog(playerid, SERVICE_STATION_MENU, DIALOG_STYLE_LIST, "{FFFFFF} Service Station - Menu", "{FFFFFF}Service: Repair - Price: $500\nService: Refuel - Price: $500\nService: Vehicle Bomb - Price: $100K\nClick here for Tune Menu", "Buy", "Cancel");
	    			return 1;
			    }
			    case 2:
			    {
			        if(GetTeam{playerid} != CLASS_CIV) return SendClientMessage(playerid, RED, "Only civilians can buy vehicle bombs.");
			        if(BomberStage{playerid} != 0) return SendClientMessage(playerid, RED, "You already have a bomb strapped to a vehicle, use /blowbomb.");
					if(GetPlayerCash(playerid) < 100000) return SendClientMessage(playerid, RED, "POOL KAFI NADARI!");
			        GivePlayerCash(playerid, - 100000);
	            	BomberStage{playerid} = 1;
	            	VehicleBombOwner[GetPlayerVehicleID(playerid)] = playerid;
	            	SendClientMessage(playerid, YELLOW, "Dar mashin alan yek bomb dari mashin ra tark kon va sepas az /blowbomb baraye monfager kardan bomb estefade kon.");
	    			return 1;
			    }
			    case 3:
			    {
			        switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
					{
        				case 562,565,559,561,560,575,534,567,536,535,576,411,579,602,496,518,527,589,597,419,
						533,526,474,545,517,410,600,436,580,439,549,491,445,604,507,585,587,466,492,546,551,516,
						426,547,405,409,550,566,406,540,421,529,431,438,437,420,525,552,416,433,427,490,528,
						407,544,470,598,596,599,601,428,499,609,524,578,486,573,455,588,403,514,423,
						414,443,515,456,422,482,530,418,572,413,440,543,583,478,554,402,542,603,475,568,504,457,
        				483,508,429,541,415,480,434,506,451,555,477,400,404,489,479,442,458,467,558:
						{
            				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
							IsPlayerUsingTuneMenu{playerid} = true;
						}
						default: return SendClientMessage(playerid, RED, "You cant tune this vehicle.");
					}
			    }
			}
		}
		return 1;
	}


	case TUNE_MENU:
	{
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
				ShowPlayerDialog(playerid, TUNE_MENU1, DIALOG_STYLE_LIST, "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - Price: $5K\nItem: Paint Job - 2 - Price: $5K\nItem: Paint Job - 3 - Price: $5K\nBack", "Select", "Cancel");
			}
			case 1:
			{
				ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");
			}
			case 2:
			{
				ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
			}
			case 3:
			{
				ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
			}
			case 4:
			{
				ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
			}
            case 5:
			{
				ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
			}
			case 6:
			{
				ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
			}
			case 7:
			{
				ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
			}
            case 8:
			{
				ShowPlayerDialog(playerid, TUNE_MENU9, DIALOG_STYLE_LIST, "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - Price: $1K\nItem: Locos Low Chrome Bars - Price: $1K\nItem: Locos Low Chrome Lights - Price: $1K\nItem: Locos Low Chrome Bullbar - Price: $1K\nBack", "Select", "Cancel");
			}
			case 9:
			{
				ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			case 10:
			{
				ShowPlayerDialog(playerid, TUNE_MENU11, DIALOG_STYLE_LIST, "{FFFFFF}Car Stereos List", "{FFFFFF}Item: Bass Boost - Price: $1K\nBack", "Select", "Cancel");
			}
			case 11:
			{
				ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			case 12:
			{
				ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
			}
			case 13:
			{
				ShowPlayerDialog(playerid, TUNE_MENU14, DIALOG_STYLE_LIST, "{FFFFFF}Hydraulics", "{FFFFFF}Item: Hydraulics - Price: $1K\nBack", "Select", "Cancel");
			}
			case 14:
			{
				ShowPlayerDialog(playerid, TUNE_MENU15, DIALOG_STYLE_LIST, "{FFFFFF}Nitros Oxide", "{FFFFFF}Item: Nirto x2 - Price: $1K\nItem: Nirto x5 - Price: $2K\nItem: Nirto x10 - Price: $3K\nBack", "Select", "Cancel");
			}
			case 15:
			{
				ShowPlayerDialog(playerid, TUNE_MENU16, DIALOG_STYLE_LIST, "{FFFFFF}Neons", "{FFFFFF}Item: Blue Neons - Price: $5K\nItem: Red Neons - Price: $5K\nItem: Green Neons - Price: $5K\nItem: Yellow Neons - Price: $5K\nItem: Pink Neons - Price: $5K\nItem: White Neons - Price: $5K\nRemove Neons\nBack", "Select", "Cancel");
			}
			}
       }
   }

   case TUNE_MENU1:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560 ||

				GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
				if(GetPlayerCash(playerid) >= 5000)
		        {

					ChangeVehiclePaintjob(GetPlayerVehicleID(playerid),0);
				    OnVehiclePaintjob(playerid, GetPlayerVehicleID(playerid), 0);
					ChangeVehicleColor(GetPlayerVehicleID(playerid),1,1);
		            OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 1, 1);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					GivePlayerCash(playerid,-5000);
					SendClientMessage(playerid,YELLOW,"You have added Paintjob - 1 to your car for $5K.");
                    ShowPlayerDialog(playerid, TUNE_MENU1, DIALOG_STYLE_LIST, "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - Price: $5K\nItem: Paint Job - 2 - Price: $5K\nItem: Paint Job - 3 - Price: $5K\nBack", "Select", "Cancel");

				}
				else
				{
				   SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
				}
				else
				{
				   SendClientMessage(playerid,RED,"Paintjobs only work for Wheel Arch Angel and Loco Low Co type cars.");
			       ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
				}
			}
			case 1:
			{
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560 ||

				GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
				if(GetPlayerCash(playerid) >= 5000)
		        {

					ChangeVehiclePaintjob(GetPlayerVehicleID(playerid),1);
					OnVehiclePaintjob(playerid, GetPlayerVehicleID(playerid), 1);
					ChangeVehicleColor(GetPlayerVehicleID(playerid),1,1);
		            OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 1, 1);
					GivePlayerCash(playerid,-5000);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					SendClientMessage(playerid,YELLOW,"You have added Paintjob - 2 to your car for $5K.");
                    ShowPlayerDialog(playerid, TUNE_MENU1, DIALOG_STYLE_LIST, "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - Price: $5K\nItem: Paint Job - 2 - Price: $5K\nItem: Paint Job - 3 - Price: $5K\nBack", "Select", "Cancel");

				}
				else
				{
				   SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
				}
				else
				{
				   SendClientMessage(playerid,RED,"Paintjobs only work for Wheel Arch Angel and Loco Low Co type cars.");
			       ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
				}
			}
			case 2:
			{
				if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560 ||

				GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
				if(GetPlayerCash(playerid) >= 5000)
		        {

                   ChangeVehiclePaintjob(GetPlayerVehicleID(playerid),2);
                   OnVehiclePaintjob(playerid, GetPlayerVehicleID(playerid), 2);
                   ChangeVehicleColor(GetPlayerVehicleID(playerid),1,1);
                   OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 1, 1);
                   GivePlayerCash(playerid,-5000);
                   PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				   SendClientMessage(playerid,YELLOW,"You have added Paintjob - 3 to your car for $5K.");
                   ShowPlayerDialog(playerid, TUNE_MENU1, DIALOG_STYLE_LIST, "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - Price: $5K\nItem: Paint Job - 2 - Price: $5K\nItem: Paint Job - 3 - Price: $5K\nBack", "Select", "Cancel");
				}
				else
				{
				   SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
				}
				else
				{
				   SendClientMessage(playerid,RED,"Paintjobs only work for Wheel Arch Angel and Loco Low Co type cars.");
			       ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
				}
			}
			case 3:
			{
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
			}
			}
	   }
   }

   case TUNE_MENU2:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		            GivePlayerCash(playerid,-1000);
		            ChangeVehicleColor(GetPlayerVehicleID(playerid),0,0);//Black
		            OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 0, 0);
		            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		            SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Black for $1K.");
		            ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 1:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),1,1);//White
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 1, 1);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle White for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 2:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),3,3);//Red
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 3, 3);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Red for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 3:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),79,79); //Blue
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 79, 79);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Blue for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 4:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),86,86);//Green
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 86, 86);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Green for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 5:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),6,6);//Yellow
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 6, 6);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Yellow for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");

			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 6:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),126,126);//Pink
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 126, 126);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			        SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Pink for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");
			}
			else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 7:
			{
		    if(GetPlayerCash(playerid) >= 1000)
            {

			        GivePlayerCash(playerid,-1000);
			        ChangeVehicleColor(GetPlayerVehicleID(playerid),66,66);//Brown
			        OnVehicleRespray(playerid, GetPlayerVehicleID(playerid), 66, 66);
			        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	          		SendClientMessage(playerid,YELLOW,"You have successfully painted your vehicle Brown for $1K.");
			        ShowPlayerDialog(playerid, TUNE_MENU2, DIALOG_STYLE_LIST, "{FFFFFF}Colors List", "{FFFFFF}Item: Black - Price: $1K\nItem: White - Price: $1K\nItem: Red - Price: $1K\nItem: Blue - Price: $1K\nItem: Green - Price: $1K\nItem: Yellow - Price: $1K\nItem: Pink - Price: $1K\nItem: Brown - Price: $1K\nBack", "Select", "Cancel");
            }
            else
			{
			    SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 8:
			{
        		    ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
			}
		}
   }

   case TUNE_MENU3:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {

		            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
                    if(GetPlayerCash(playerid) >= 1000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1034);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1034);
		            	GivePlayerCash(playerid,-1000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		            	SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1046);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1046);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1065);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1065);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Jetser.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1064);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1064);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1028);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1028);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1089);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1089);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Exhaust to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
	    			}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
	  			 	else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
                    }
                    }
            }
			case 1:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
                {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
                    if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1037);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1037);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Exhaust to your Elegy.");
			            ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1045);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1045);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Exhaust to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1066);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1066);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"ou Have Successfully Added A Wheel Arch X-Flow Exhaust to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1059);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1059);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Exhaust to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1029);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1029);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Exhaust to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1092);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1092);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Exhaust to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
					}
            }
			case 2:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)

			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1126);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1126);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Exhaust to your Remington.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1129);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1129);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	                    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Exhaust to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1104);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1104);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Exhaust to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1113);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1113);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Exhaust to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1136);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1136);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					   	SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Exhaust to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}

					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
			case 3:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1127);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1127);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Exhaust to your Remingon.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1132);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1132);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Exhaust to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1105);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1105);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Exhaust to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1114);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1114);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Exhaust to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
                    if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1135);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1135);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Exhaust to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU3, DIALOG_STYLE_LIST, "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - Price: $1K\nItem: Wheel Arch X-Flow Exhaust - Price: $1K\nItem: Locos Low Chromer Exhaust - Price: $1K\nLocos Low Slamin Exhaust - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
			case 4:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
	    }
   }

   case TUNE_MENU4:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                   if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				   GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				   GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				   GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				   GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
				   {

		            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
					if(GetPlayerCash(playerid) >= 1000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1171);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1171);
		            	GivePlayerCash(playerid,-1000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1153);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1153);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1160);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1160);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1155);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1155);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1169);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1169);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1166);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1166);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Front Bumper to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
	                }
	                }
            }
			case 1:
            {
                   if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
	               GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
	               GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
	               GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
                   GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		           {


			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1172);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1172);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Elegy.");
			            ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1152);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1152);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1173);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1173);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1157);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1157);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1170);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1170);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1165);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1165);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Front Bumper to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
		    }
			case 2:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
				{

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1179);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1179);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Front Bumper to your Remington.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1189);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1189);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Front Bumper to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1182);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1182);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Front Bumper to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1115);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1115);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Front Bumper to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1191);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1191);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Front Bumper to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
            case 3:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
	            GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1185);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1185);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Front Bumper to your Remington.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1188);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1188);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Front Bumper to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1181);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1181);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Front Bumper to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
                    else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1116);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1116);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Front Bumper to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1190);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1190);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Front Bumper to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU4, DIALOG_STYLE_LIST, "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
                    }
                    }
            }
            case 4:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
        }
   }

   case TUNE_MENU5:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {

		            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
					if(GetPlayerCash(playerid) >= 1000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1149);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1149);
		            	GivePlayerCash(playerid,-1000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1150);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1150);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1159);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1159);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1154);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1154);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1141);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1141);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1168);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1168);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Rear Bumper to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
			case 1:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {


			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1148);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1148);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Elegy.");
		                ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1151);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1151);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Flash.");
				        ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1161);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1161);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Jester.");
				        ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1156);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1156);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Stratum.");
				        ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1140);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1140);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Sultan.");
				        ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1167);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1167);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Rear Bumper to your Uranus.");
				        ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
			case 2:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1180);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1180);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Rear Bumper to your Remington.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1187);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1187);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Rear Bumper to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1184);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1184);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Rear Bumper to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1109);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1109);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Rear Bumper to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1192);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1192);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Chromer Rear Bumper to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
			case 3:
            {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1178);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1178);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Rear Bumper to your Remington.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1186);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1186);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Rear Bumper to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1183);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1183);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Rear Bumper to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1110);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1110);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Rear Bumper to your Slamvan.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1193);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1193);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Slamin Rear Bumper to your Tornado.");
					    ShowPlayerDialog(playerid, TUNE_MENU5, DIALOG_STYLE_LIST, "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - Price: $1K\nItem: Wheel Arch X-Flow Bumper - Price: $1K\nItem: Locos Low Chromer Bumper - Price: $1K\nItem: Locos Low Slamin Bumper - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Locos Low type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
            case 4:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
        }
   }

   case TUNE_MENU6:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {


		            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
					if(GetPlayerCash(playerid) >= 1000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1035);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1035);
		            	GivePlayerCash(playerid,-1000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1054);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1054);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1067);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1067);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1055);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1055);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1032);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1032);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1088);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1088);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Roof Vent to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
	        case 1:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {



			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1035);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1035);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Elegy.");
			            ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1053);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1053);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1068);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1068);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1061);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1061);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1033);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1033);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1091);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1091);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Roof Vent to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
			case 2:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1128);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1128);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Hardtop Roof to your Blade.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
			        else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1128);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1128);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Hardtop Roof to your Savanna.");
					    ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Savanna or Blade.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
		    case 3:
			{
                 if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1131);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1131);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Locos Low Softtop Roof to your Savanna.");
			            ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
	   				else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
					if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1103);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1103);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Locos Low Softtop Roof to your Blade.");
                        ShowPlayerDialog(playerid, TUNE_MENU6, DIALOG_STYLE_LIST, "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - Price: $1K\nItem: Locos Low Hardtop Roof - Price: $1K\nItem: Locos Low Softtop Roof - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Savanna or Blade.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
            case 4:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
	     }
   }

   case TUNE_MENU7:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {
                    if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
					if(GetPlayerCash(playerid) >= 2000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1147);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1147);
		            	GivePlayerCash(playerid,-2000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1049);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1049);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1162);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1162);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, " {FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1158);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1158);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1138);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1138);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1164);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1164);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch Alien Spoiler to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
    	    }
            case 1:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
					if(GetPlayerCash(playerid) >= 2000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1146);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1146);
		            	GivePlayerCash(playerid,-2000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Elegy.");
			            ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1150);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1150);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1158);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1158);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1060);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1060);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1139);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1139);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
					if(GetPlayerCash(playerid) >= 2000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1163);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1163);
		            	GivePlayerCash(playerid,-2000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added a Wheel Arch X-Flow Spoiler to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU7, DIALOG_STYLE_LIST, "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - Price: $2K\nItem: X-Flow Spoiler - Price: $2K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to X-Flow Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
            }
            case 2:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
	   	 }
    }

    case TUNE_MENU8:
    {
		if(response)
		{
		    switch(listitem)
            {
			case 0:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {

		            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
		            {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1036);
		            	AddVehicleComponent(GetPlayerVehicleID(playerid),1040);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1036);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1040);
		            	GivePlayerCash(playerid,-1000);
		            	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Elegy.");
		            	ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
                    }
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1047);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1051);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1047);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1051);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1069);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1071);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1056);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1062);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1056);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1062);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1026);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1027);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1026);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1027);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1090);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1094);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1090);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1094);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch Alien Sideskirts to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
					}
		    }
	   	    case 1:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 565 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 559 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 561 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		        {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
			        {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1039);
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1041);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1039);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1041);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Elegy.");
			            ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 565)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1048);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1052);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1048);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1052);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Flash.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 559)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1070);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1072);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1070);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1072);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Jester.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1057);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1063);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1057);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1063);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Stratum.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1031);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1030);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1031);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1030);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Sultan.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1093);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1095);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1093);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1095);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Wheel Arch X-Flow Sideskirts to your Uranus.");
					    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to Wheel Arch Angels type cars.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
		            }
		    }
		    case 2:
			{
                 if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536 ||
	               GetVehicleModel(GetPlayerVehicleID(playerid)) == 576 ||
		 	       GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
                   {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 567)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1102);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1133);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1102);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1133);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Strip Sideskirts to your Savanna.");
	    		        ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
	                }
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
	                else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 576)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1134);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1137);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1134);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1137);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Strip Sideskirts to your Tornado.");
	    		        ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
	                }
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
	                else if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 536)
					{
		            if(GetPlayerCash(playerid) >= 1000)
                    {
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1108);
					    AddVehicleComponent(GetPlayerVehicleID(playerid),1107);
					    OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1108);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1107);
		            	GivePlayerCash(playerid,-1000);
					    PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Strip Sideskirts to your Blade.");
	                    ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
	                }
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Savanna, Tornado or Blade.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
	                }
	        }
	  	    case 3:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			    {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			        {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1122);
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1101);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1122);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1101);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Flames Sideskirts to your Locos Remington.");
			            ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Remington.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
			        }
			}
			case 4:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534 ||
				GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			    {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			        {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1106);
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1124);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1106);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1124);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Arches Sideskirts to your Remington.");
			            ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Remington.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
			        }
			}
			case 5:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)

			    {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			        {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1118);
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1120);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1118);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1120);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Trim Sideskirts to your Slamvan.");
			            ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Slamvan.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
			        }
			}
			case 6:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)

			    {
			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			        {
		            if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1119);
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1121);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1119);
		            	OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1121);
		            	GivePlayerCash(playerid,-1000);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Wheelcovers to your Slamvan.");
			            ShowPlayerDialog(playerid, TUNE_MENU8, DIALOG_STYLE_LIST, "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - Price: $1K\nItem: Locos Low Chrome Strip - Price: $1K\nItem: Locos Low Chrome Flames - Price: $1K\nItem: Locos Low Chrome Arches - Price: $1K\nItem: Locos Low Chrome Trim - Price: $1K\nItem: Locos Low Wheelcovers - Price: $1K\nBack", "Select", "Cancel");
					}
                    else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Slamvan.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
			        }
			}
			case 7:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");}
            }
         }
   }

   case TUNE_MENU9:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)

			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1100);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1100);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            GivePlayerCash(playerid,-1000);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Grill to your Remington.");
			            ShowPlayerDialog(playerid, TUNE_MENU9, DIALOG_STYLE_LIST, "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - Price: $1K\nItem: Locos Low Chrome Bars - Price: $1K\nItem: Locos Low Chrome Lights - Price: $1K\nItem: Locos Low Chrome Bullbar - Price: $1K\nBack", "Select", "Cancel");
			        }
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Remington.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
			case 1:
			{
                 if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)

			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1123);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1123);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            GivePlayerCash(playerid,-1000);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Bars to your Remington.");
			            ShowPlayerDialog(playerid, TUNE_MENU9, DIALOG_STYLE_LIST, "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - Price: $1K\nItem: Locos Low Chrome Bars - Price: $1K\nItem: Locos Low Chrome Lights - Price: $1K\nItem: Locos Low Chrome Bullbar - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Remington.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
			case 2:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)

			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 534)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1125);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1125);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            GivePlayerCash(playerid,-1000);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Lights to your Remington.");
			            ShowPlayerDialog(playerid, TUNE_MENU9, DIALOG_STYLE_LIST, "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - Price: $1K\nItem: Locos Low Chrome Bars - Price: $1K\nItem: Locos Low Chrome Lights - Price: $1K\nItem: Locos Low Chrome Bullbar - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Remington.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
			case 3:
			{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)

			    {

			        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 535)
			        {
					if(GetPlayerCash(playerid) >= 1000)
                    {
			            AddVehicleComponent(GetPlayerVehicleID(playerid),1117);
			            OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1117);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            GivePlayerCash(playerid,-1000);
			            SendClientMessage(playerid,YELLOW,"You have added Locos Low Chrome Lights to your Slamvan.");
			            ShowPlayerDialog(playerid, TUNE_MENU9, DIALOG_STYLE_LIST, "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - Price: $1K\nItem: Locos Low Chrome Bars - Price: $1K\nItem: Locos Low Chrome Lights - Price: $1K\nItem: Locos Low Chrome Bullbar - Price: $1K\nBack", "Select", "Cancel");
					}
					else
			        {
			            SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			        }
			        }
					else
					{
				    SendClientMessage(playerid,RED,"You can only add this component to a Slamvan.");
					ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
					}
					}
			}
			case 4:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
       }
   }

   case TUNE_MENU10:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
			if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1025);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1025);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			     GivePlayerCash(playerid,-1000);
                 SendClientMessage(playerid,YELLOW,"You have added some Offroad Wheels.");
	             ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
	        }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 1:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1074);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1074);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			     GivePlayerCash(playerid,-1000);
			     SendClientMessage(playerid,YELLOW,"You have added some Mega Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 2:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

	             AddVehicleComponent(GetPlayerVehicleID(playerid),1076);
	             OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1076);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Wires Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
	        case 3:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1078);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1078);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			     SendClientMessage(playerid,YELLOW,"You have added some Twist Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 4:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1081);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1081);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			     SendClientMessage(playerid,YELLOW,"You have added some Groove Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 5:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

                 AddVehicleComponent(GetPlayerVehicleID(playerid),1082);
                 OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1082);
			     GivePlayerCash(playerid,-1000);
                 PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
   			     SendClientMessage(playerid,YELLOW,"You have added some Import Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 6:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1085);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1085);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			     SendClientMessage(playerid,YELLOW,"You have added some Atomic Wheels.");
                 ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 7:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1096);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1096);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	          	 SendClientMessage(playerid,YELLOW,"You have added some Ahab Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 8:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

                 AddVehicleComponent(GetPlayerVehicleID(playerid),1097);
                 OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1097);
			     GivePlayerCash(playerid,-1000);
                 PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	           	 SendClientMessage(playerid,YELLOW,"You have added some Virtual Wheels.");
                 ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 9:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

			     AddVehicleComponent(GetPlayerVehicleID(playerid),1098);
			     OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1098);
			     GivePlayerCash(playerid,-1000);
			     PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	         	 SendClientMessage(playerid,YELLOW,"You have added some Access Wheels.");
			     ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 10:
			{
                 ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
			}
			case 11:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
			}
		}
   }

   case TUNE_MENU11:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
			if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1086);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1086);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         GivePlayerCash(playerid,-1000);
		         SendClientMessage(playerid,YELLOW,"You have added a Bass Boost Stereo System.");
		         ShowPlayerDialog(playerid, TUNE_MENU11, DIALOG_STYLE_LIST, "{FFFFFF}Car Stereos List", "{FFFFFF}Item: Bass Boost - Price: $1K\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 1:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
		}
   }

   case TUNE_MENU12:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
		         ShowPlayerDialog(playerid, TUNE_MENU14, DIALOG_STYLE_LIST, "{FFFFFF}Hydraulics", "{FFFFFF}Item: Hydraulics - Price: $1K\nBack", "Select", "Cancel");
			}
			case 1:
			{
		         ShowPlayerDialog(playerid, TUNE_MENU15, DIALOG_STYLE_LIST, "{FFFFFF}Nitros Oxide", "{FFFFFF}Item: Nitro x2 - Price: $1K\nNitro x5 - Price: $2K\nNitro x10 - Price: $3K\nBack", "Select", "Cancel");
			}
			case 2:
			{
		         ShowPlayerDialog(playerid, TUNE_MENU16, DIALOG_STYLE_LIST, "{FFFFFF}Neons", "{FFFFFF}Item: Blue Neons - Price: $5K\nItem: Red Neons - Price: $5K\nItem: Green Neons - Price: $5K\nItem: Yellow Neons - Price: $5K\nItem: Pink Neons - Price: $5K\nItem: White Neons - Price: $5K\nRemove Neons\nBack", "Select", "Cancel");
			}
			case 3:
            {
                 ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
            }
            }
		}
	}

   case TUNE_MENU13:
   {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1084);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1084);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Trance Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 1:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1073);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1073);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Shadow Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 2:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1075);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1075);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Rimshine Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 3:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1077);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1077);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Classic Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 4:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1079);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1079);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Cutter Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 5:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1080);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1080);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Switch Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 6:
            {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1083);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1083);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added some Dollar Wheels.");
		         ShowPlayerDialog(playerid, TUNE_MENU13, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 2", "{FFFFFF}Item: Trance - Price: $1K\nItem: Shadow - Price: $1K\nItem: Rimshine - Price: $1K\nItem: Classic - Price: $1K\nItem: Cutter - Price: $1K\nItem: Switch - Price: $1K\nItem: Dollar - Price: $1K\nBack", "Select", "Cancel");
            }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
            case 7:
            {
		         ShowPlayerDialog(playerid, TUNE_MENU10, DIALOG_STYLE_LIST, "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - Price: $1K\nItem: Mega - Price: $1K\nItem: Wires - Price: $1K\nItem: Twist - Price: $1K\nItem: Grove - Price: $1K\nItem: Import - Price: $1K\nItem: Atomic - Price: $1K\nItem: Ahab - Price: $1K\nItem: Virtual - Price: $1K\nItem: Access - Price: $1K\nNext\nBack", "Select", "Cancel");
            }
            }
		}
    }
    case TUNE_MENU14:
    {
		if(response)
		{
			switch(listitem)
            {
		    case 0:
		    {
		    if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1087);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1087);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         GivePlayerCash(playerid,-1000);
		         SendClientMessage(playerid,YELLOW,"You have added Hydraulics to your car for $1K.");
		         ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 1:
		    {
			    ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			}
		}
	}

	case TUNE_MENU15:
    {
		if(response)
		{
			switch(listitem)
            {
            case 0:
			{
			if(GetPlayerCash(playerid) >= 1000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1009);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1009);
		         GivePlayerCash(playerid,-1000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added Nitros x2 to your car for $1K.");
		         ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 1:
			{
			if(GetPlayerCash(playerid) >= 2000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1008);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1008);
		         GivePlayerCash(playerid,-2000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added Nitros x5 to your car for $2K.");
		         ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
		    case 2:
			{
			if(GetPlayerCash(playerid) >= 3000)
            {

		         AddVehicleComponent(GetPlayerVehicleID(playerid),1010);
		         OnVehicleMod(playerid,GetPlayerVehicleID(playerid),1010);
		         GivePlayerCash(playerid,-3000);
		         PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
		         SendClientMessage(playerid,YELLOW,"You have added Nitros x10 to your car for $3K.");
		         ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 3:
		    {
			    ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 2", "{FFFFFF}Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			}
		}
	}
	case TUNE_MENU16:
    {
		if(response)
		{
			switch(listitem)
            {
            case 0:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	blueneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18648,0,0,0,0,0,0);
            	blueneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18648,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(blueneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(blueneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = BLUE_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added Blue Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 1:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	redneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18647,0,0,0,0,0,0);
            	redneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18647,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(redneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(redneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = RED_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added Red Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 2:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	greenneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18649,0,0,0,0,0,0);
      			greenneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18649,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(greenneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(greenneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = GREEN_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added Green Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 3:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	yellowneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18650,0,0,0,0,0,0);
       			yellowneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18650,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(yellowneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(yellowneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = YELLOW_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added Yellow Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 4:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	pinkneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18651,0,0,0,0,0,0);
          		pinkneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18651,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(pinkneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(pinkneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = PINK_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added Pink Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 5:
			{
			if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only buy neons for owned vehicles.");
			if(GetPlayerCash(playerid) >= 5000)
			{
			    DestroyNeons(GetPlayerVehicleID(playerid));
		    	whiteneons[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18652,0,0,0,0,0,0);
          		whiteneons2[GetPlayerVehicleID(playerid)] = CreateDynamicObject(18652,0,0,0,0,0,0);
            	AttachDynamicObjectToVehicle(whiteneons[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            	AttachDynamicObjectToVehicle(whiteneons2[GetPlayerVehicleID(playerid)], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = WHITE_NEONS;
                GivePlayerCash(playerid,-5000);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
                SendClientMessage(playerid, YELLOW, "You have added White Neons to your car for $5K.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
		    }
			else
			{
			     SendClientMessage(playerid,RED,"POOL KAFI NADARI!");
			}
			}
			case 6:
			{
				if(IsPlayerInOwnedVehicle(playerid, GetPlayerVehicleID(playerid)) == 0) return SendClientMessage(playerid, RED, "You can only remove neons from owned vehicles.");
			    DestroyNeons(GetPlayerVehicleID(playerid));
				SaveVehicleStats(IsShopVehicle[GetPlayerVehicleID(playerid)]);
				VehicleInfo[IsShopVehicle[GetPlayerVehicleID(playerid)]][vNeons] = NO_NEONS;
			    SendClientMessage(playerid, YELLOW, "Neons Removed.");
				ShowPlayerDialog(playerid, TUNE_MENU, DIALOG_STYLE_LIST, "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nNext", "Select", "Cancel");
			}
			case 7:
		    {
			    ShowPlayerDialog(playerid, TUNE_MENU12, DIALOG_STYLE_LIST, "Tune Menu - 2", "Hydraulics\nNitros Oxide\nNeons\nBack", "Select", "Cancel");
			}
			}
		}
    }


public OnVehicleMod(playerid, vehicleid, componentid)
{
	if(IsShopVehicle[vehicleid] != -1)
	{
    	new modcount = 0;
		for(new m = 0; m < MAX_ALOUD_MODS; m++)
		{
	    	if(GetVehicleMods[IsShopVehicle[vehicleid]][m] == 0)
	    	{
	        	GetVehicleMods[IsShopVehicle[vehicleid]][m] = componentid;
	        	SaveVehicleStats(IsShopVehicle[vehicleid]);
				modcount++;
	        	break;
			}
		}
		if(modcount == 0)
		{
	    	for(new m = 0; m < 12; m++)
			{
				GetVehicleMods[IsShopVehicle[vehicleid]][m] = 0;
			}
			SaveVehicleStats(IsShopVehicle[vehicleid]);
		}
	}

    //
    switch(componentid)
    {
        case 1008..1010: if(IsPlayerInInvalidNosVehicle(playerid)) RemoveVehicleComponent(vehicleid,componentid);
        case 1026..1033,1138..1142: if(GetVehicleModel(vehicleid) != 560) RemoveVehicleComponent(vehicleid,componentid);
    }
    if(IsPlayerUsingTuneMenu{playerid} == false) return GivePlayerCash(playerid, -AVehicleModPrices[componentid - 1000]);
    //

    IsPlayerUsingTuneMenu{playerid} = false;
	return 1;
}


