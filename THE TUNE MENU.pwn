#include <open.mp>
#include <crashdetect>
#include <easyDialog>

enum gdtexts
{
  home[300],
  paint[300],
  colors[300],
  exust[300],
  frontbump[300],
  rearbump[300],
  roofs[300],
  spoilers[300],
  side[300],
  bull[300],
  wheel[300],
  stereo[300],
  hydraulic[300],
  nitro[300],
  neons[300]
}
new TmenuT[gdtexts];

TmenuT[home] = "{FFFFFF}Tune Menu", "{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nHydraulic\nNitro\nNeons"
TmenuT[paint] = "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - \tPrice: $5K\nItem: Paint Job - 2 - \tPrice: $5K\nItem: Paint Job - 3 - \tPrice: $5K"
TmenuT[colors] = "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - \tPrice: $1K\nItem: Wheel Arch X-Flow Exhaust - \tPrice: $1K\nItem: Locos Low Chromer Exhaust - \tPrice: $1K\nLocos Low Slamin Exhaust - \tPrice: $1K"
TmenuT[exust] = "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - \tPrice: $1K\nItem: Wheel Arch X-Flow Bumper - \tPrice: $1K\nItem: Locos Low Chromer Bumper - \tPrice: $1K\nItem: Locos Low Slamin Bumper - \tPrice: $1K"
TmenuT[frontbump] = "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - \tPrice: $1K\nItem: Wheel Arch X-Flow Bumper - \tPrice: $1K\nItem: Locos Low Chromer Bumper - \tPrice: $1K\nItem: Locos Low Slamin Bumper - \tPrice: $1K"
TmenuT[rearbump] = "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - \tPrice: $1K\nItem: Wheel Arch X-Flow Roof Vent - \tPrice: $1K\nItem: Locos Low Hardtop Roof - \tPrice: $1K\nItem: Locos Low Softtop Roof - \tPrice: $1K"
TmenuT[roofs] = "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - \tPrice: $1K\nItem: Wheel Arch X-Flow Roof Vent - \tPrice: $1K\nItem: Locos Low Hardtop Roof - \tPrice: $1K\nItem: Locos Low Softtop Roof - \tPrice: $1K"
TmenuT[spoilers] = "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - \tPrice: $2K\nItem: X-Flow Spoiler - \tPrice: $2K"
TmenuT[side] = "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - \tPrice: $1K\nItem: Wheel Arch X-Flow Sideskirts - \tPrice: $1K\nItem: Locos Low Chrome Strip - \tPrice: $1K\nItem: Locos Low Chrome Flames - \tPrice: $1K\nItem: Locos Low Chrome Arches - \tPrice: $1K\nItem: Locos Low Chrome Trim - \tPrice: $1K\nItem: Locos Low Wheelcovers - \tPrice: $1K"
TmenuT[bull] = "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - \tPrice: $1K\nItem: Locos Low Chrome Bars - \tPrice: $1K\nItem: Locos Low Chrome Lights - \tPrice: $1K\nItem: Locos Low Chrome Bullbar - \tPrice: $1K"
TmenuT[wheel] = "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - \tPrice: $1K\nItem: Mega - \tPrice: $1K\nItem: Wires - \tPrice: $1K\nItem: Twist - \tPrice: $1K\nItem: Grove - \tPrice: $1K\nItem: Import - \tPrice: $1K\nItem: Atomic - \tPrice: $1K\nItem: Ahab - \tPrice: $1K\nItem: Virtual - \tPrice: $1K\nItem: Access - \tPrice: $1K\N{FFFFFF}Item: Trance - \tPrice: $1K\nItem: Shadow - \tPrice: $1K\nItem: Rimshine - \tPrice: $1K\nItem: Classic - \tPrice: $1K\nItem: Cutter - \tPrice: $1K\nItem: Switch - \tPrice: $1K\nItem: Dollar - \tPrice: $1K"
TmenuT[stereo] = "Car Stereos List", "{FFFFFF}Item: Bass Boost - \tPrice: $1K"
TmenuT[hydraulic] = "{FFFFFF}Hydraulics", "{FFFFFF}Item: Hydraulics - \tPrice: $1K"
TmenuT[nitro] = "{FFFFFF}Nitros Oxide", "{FFFFFF}Item: Nirto x2 - \tPrice: $1K\nItem: Nirto x5 - \tPrice: $2K\nItem: Nirto x10 - \tPrice: $3K"
TmenuT[neons] = "{FFFFFF}Neons", "{FFFFFF}Item: Blue Neons - \tPrice: $5K\nItem: Red Neons - \tPrice: $5K\nItem: Green Neons - \tPrice: $5K\nItem: Yellow Neons - \tPrice: $5K\nItem: Pink Neons - \tPrice: $5K\nItem: White Neons - \tPrice: $5K\nRemove Neons"

TmenuT[home] = "{FFFFFF}Car Tuning Menu", "{FFFFFF}Paint Jobs\nColors\nHoods\nVents\nLights\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSide Skirts\nBullbars\nWheels\nCar Stereo\nHydraulics\nNitrous Oxide\nRepair Car"
TmenuT[hoods] = "{FFFFFF}Hoods List", "{FFFFFF}Item: Hood - 1 - \tPrice: $2K\nItem: Hood - 2 - \tPrice: $2K"
TmenuT[vents] = "{FFFFFF}Vents List", "{FFFFFF}Item: Vent - 1 - \tPrice: $2K\nItem: Vent - 2 - \tPrice: $2K"
TmenuT[lights] = "{FFFFFF}Lights List", "{FFFFFF}Item: Headlights - \tPrice: $1K\nItem: Taillights - \tPrice: $1K"
TmenuT[repair] = "{FFFFFF}Repair Car", "{FFFFFF}Item: Full Repair - \tPrice: $10K"

stock ShowTuneDialog(pid, digid)
{
  switch(digid)
    {
    case HOME:
    {
      Dialog_Show(pid, HOME, "{FFFFFF}Car Tuning Menu", TmenuT[home], "OK", "Close");
    }
    case PAINT:
    {
      Dialog_Show(pid, PAINT, "{FFFFFF}Paintjobs List", TmenuT[paint], "OK", "Back");
    }
    case COLORS:
    {
      Dialog_Show(pid, COLORS, "{FFFFFF}Exhausts List", TmenuT[colors], "OK", "Back");
    }
    case HOODS:
    {
      Dialog_Show(pid, HOODS, "{FFFFFF}Hoods List", TmenuT[hoods], "OK", "Back");
    }
    case VENTS:
    {
      Dialog_Show(pid, VENTS, "{FFFFFF}Vents List", TmenuT[vents], "OK", "Back");
    }
    case LIGHTS:
    {
      Dialog_Show(pid, LIGHTS, "{FFFFFF}Lights List", TmenuT[lights], "OK", "Back");
    }
    case EXUST:
    {
      Dialog_Show(pid, EXUST, "{FFFFFF}Front Bumpers List", TmenuT[exust], "OK", "Back");
    }
    case FRONTBUMP:
    {
      Dialog_Show(pid, FRONTBUMP, "{FFFFFF}Rear Bumpers List", TmenuT[frontbump], "OK", "Back");
    }
    case REARBUMP:
    {
      Dialog_Show(pid, REARBUMP, "{FFFFFF}Roofs List", TmenuT[rearbump], "OK", "Back");
    }
    case ROOFS:
    {
      Dialog_Show(pid, ROOFS, "{FFFFFF}Roofs List", TmenuT[roofs], "OK", "Back");
    }
    case SPOILERS:
    {
      Dialog_Show(pid, SPOILERS, "{FFFFFF}Spoilers List", TmenuT[spoilers], "OK", "Back");
    }
    case SIDE:
    {
      Dialog_Show(pid, SIDE, "{FFFFFF}Sideskirts List", TmenuT[side], "OK", "Back");
    }
    case BULL:
    {
      Dialog_Show(pid, BULL, "{FFFFFF}Bullbars List", TmenuT[bull], "OK", "Back");
    }
    case WHEEL:
    {
      Dialog_Show(pid, WHEEL, "{FFFFFF}Wheels List - 1", TmenuT[wheel], "OK", "Back");
    }
    case STEREO:
    {
      Dialog_Show(pid, STEREO, "Car Stereos List", TmenuT[stereo], "OK", "Back");
    }
    case HYDRAULIC:
    {
      Dialog_Show(pid, HYDRAULIC, "{FFFFFF}Hydraulics", TmenuT[hydraulic], "OK", "Back");
    }
    case NITRO:
    {
      Dialog_Show(pid, NITRO, "{FFFFFF}Nitros Oxide", TmenuT[nitro], "OK", "Back");
    }
    case NEONS:
    {
      Dialog_Show(pid, NEONS, "{FFFFFF}Neons", TmenuT[neons], "OK", "Back");
    }
    case REPAIR:
    {
      Dialog_Show(pid, REPAIR, "{FFFFFF}Repair Car", TmenuT[repair], "OK", "Back");
    }
    default:
    {
      Dialog_Show(pid, HOME, "{FFFFFF}Car Tuning Menu", TmenuT[home], "OK", "Close");
    }
  }
}

static pvehicleid[MAX_PLAYERS]; // array containing players vehicle id (loaded when player enters as driver)
static pmodelid[MAX_PLAYERS]; // array containing players vehicle MODEL id (loaded when player enters as driver)

Dialog:PAINT(playerid, response, listitem, inputtext[]) 
{
if (response)
{
           	switch(listitem)// Checking which list item was selected
        	{
        	    case 0:
        	    {
                 if(pmodelid[playerid] == 562 ||
				pmodelid[playerid] == 565 ||
				pmodelid[playerid] == 559 ||
				pmodelid[playerid] == 561 ||
				pmodelid[playerid] == 558 ||
				pmodelid[playerid] == 560)
		        {

		            new car = GetPlayerVehicleID(playerid);
		            if(pmodelid[playerid] == 562) // Elegy
		            {
		            	AddVehicleComponent(car,1149);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	              		SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
		            	ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 565) // Flash
					{
					    AddVehicleComponent(car,1150);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 559) // Jester
					{
					    AddVehicleComponent(car,1159);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 561) // Stratum
					{
					    AddVehicleComponent(car,1154);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 560) // Sultan
					{
					    AddVehicleComponent(car,1141);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 558) // Uranus
					{
					    AddVehicleComponent(car,1168);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				 	    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					}
					else
					{
				    SendClientMessage(playerid,COLOR_YELLOW,"[WARNING] You cannot install this component to your car.");
					ShowTuneDialog(pid, REARBUMP);

					}
        	    }
        	    case 1:
        	    {
                 if(pmodelid[playerid] == 562 ||
				pmodelid[playerid] == 565 ||
				pmodelid[playerid] == 559 ||
				pmodelid[playerid] == 561 ||
				pmodelid[playerid] == 558 ||
				pmodelid[playerid] == 560)
		        {


			        new car = GetPlayerVehicleID(playerid);
			        if(pmodelid[playerid] == 562) // Elegy
			        {
			            AddVehicleComponent(car,1148);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,COLOR_WHITE,"[INFO] YComponent successfully added.");
			            ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 565) // Flash
					{
					    AddVehicleComponent(car,1151);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 559) // Jetser
					{
					    AddVehicleComponent(car,1161);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 561) // Stratum
					{
					    AddVehicleComponent(car,1156);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 560) // Sultan
					{
					    AddVehicleComponent(car,1140);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					else if(pmodelid[playerid] == 558)  // Uranus
					{
					    AddVehicleComponent(car,1167);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					}
					else
					{
				    SendClientMessage(playerid,COLOR_YELLOW,"[WARNING] You cannot install this component to your car.");
					ShowTuneDialog(pid, REARBUMP);

					}
        	    }
        	    case 2:
        	    {
                 if(pmodelid[playerid] == 562 ||
				pmodelid[playerid] == 565 ||
				pmodelid[playerid] == 559 ||
				pmodelid[playerid] == 561 ||
				pmodelid[playerid] == 560)
		        {


			        new car = GetPlayerVehicleID(playerid);
			        if(pmodelid[playerid] == 562) // Elegy
			        {
			            AddVehicleComponent(car,1148);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
			            ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 565) // Flash
					{
					    AddVehicleComponent(car,1151);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 559) // Jetser
					{
					    AddVehicleComponent(car,1161);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 561) // Stratum
					{
					    AddVehicleComponent(car,1156);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 560) // Sultan
					{
					    AddVehicleComponent(car,1140);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 558)  // Uranus
					{
					    AddVehicleComponent(car,1167);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
					}
						else
					{
				    SendClientMessage(playerid,COLOR_YELLOW,"[WARNING] You cannot install this component to your car.");
					ShowTuneDialog(pid, REARBUMP);

					}
        	    }
				case 3:
        	    {
                 if(pmodelid[playerid] == 575 ||
				pmodelid[playerid] == 534 ||
				pmodelid[playerid] == 567 ||
				pmodelid[playerid] == 536 ||
				pmodelid[playerid] == 576 ||
				pmodelid[playerid] == 535)
			    {
			        new car = GetPlayerVehicleID(playerid);
			        if(pmodelid[playerid] == 575) // Brodway
			        {
			            AddVehicleComponent(car,1177);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
			            SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
			            ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 534)// Remington
					{
					    AddVehicleComponent(car,1178);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 567)// Savanna
					{
					    AddVehicleComponent(car,1186);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}
						else if(pmodelid[playerid] == 536) // Blade
					{
					    AddVehicleComponent(car,1183);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}

						else if(pmodelid[playerid] == 535) // Slamvan
					{
					    AddVehicleComponent(car,1110);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}

						else if(pmodelid[playerid] == 576) // Tornado
					{
					    AddVehicleComponent(car,1193);
			            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
					    SendClientMessage(playerid,COLOR_WHITE,"[INFO] Component successfully added.");
					    ShowTuneDialog(pid, REARBUMP);

					}

					}
						else
					{
				    SendClientMessage(playerid,COLOR_YELLOW,"[WARNING] You cannot install this component to your car.");
					ShowTuneDialog(pid, REARBUMP);

					}
        	    }

}
else
{
ShowTuneDialog(pid, HOME);
}
return 1;
}

static pvehicleid[MAX_PLAYERS]; // array containing players vehicle id (loaded when player enters as driver)
static pmodelid[MAX_PLAYERS]; // array containing players vehicle MODEL id (loaded when player enters as driver)

Dialog:PAINT(playerid, response, listitem, inputtext[]) 
{
    if (response)
    {
        switch(listitem) // Checking which list item was selected
        {
            case 0:
            {
                if(pmodelid[playerid] == 562 ||
                    pmodelid[playerid] == 565 ||
                    pmodelid[playerid] == 559 ||
                    pmodelid[playerid] == 561 ||
                    pmodelid[playerid] == 558 ||
                    pmodelid[playerid] == 560)
                {
                    new car = GetPlayerVehicleID(playerid);
                    if(pmodelid[playerid] == 562) // Elegy
                    {
                        AddVehicleComponent(car, 1149);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 565) // Flash
                    {
                        AddVehicleComponent(car, 1150);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 559) // Jester
                    {
                        AddVehicleComponent(car, 1159);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 561) // Stratum
                    {
                        AddVehicleComponent(car, 1154);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 560) // Sultan
                    {
                        AddVehicleComponent(car, 1141);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 558) // Uranus
                    {
                        AddVehicleComponent(car, 1168);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You cannot install this component to your car.");
                    ShowTuneDialog(playerid, REARBUMP);
                }
                break;
            }
            case 1:
            {
                if(pmodelid[playerid] == 562 ||
                    pmodelid[playerid] == 565 ||
                    pmodelid[playerid] == 559 ||
                    pmodelid[playerid] == 561 ||
                    pmodelid[playerid] == 558 ||
                    pmodelid[playerid] == 560)
                {
                    new car = GetPlayerVehicleID(playerid);
                    if(pmodelid[playerid] == 562) // Elegy
                    {
                        AddVehicleComponent(car, 1148);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 565) // Flash
                    {
                        AddVehicleComponent(car, 1151);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 559) // Jester
                    {
                        AddVehicleComponent(car, 1161);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 561) // Stratum
                    {
                        AddVehicleComponent(car, 1156);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 560) // Sultan
                    {
                        AddVehicleComponent(car, 1140);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 558)  // Uranus
                    {
                        AddVehicleComponent(car, 1167);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You cannot install this component to your car.");
                    ShowTuneDialog(playerid, REARBUMP);
                }
                break;
            }
            case 2:
            {
                if(pmodelid[playerid] == 562 ||
                    pmodelid[playerid] == 565 ||
                    pmodelid[playerid] == 559 ||
                    pmodelid[playerid] == 561 ||
                    pmodelid[playerid] == 560)
                {
                    new car = GetPlayerVehicleID(playerid);
                    if(pmodelid[playerid] == 562) // Elegy
                    {
                        AddVehicleComponent(car, 1148);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 565) // Flash
                    {
                        AddVehicleComponent(car, 1151);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 559) // Jester
                    {
                        AddVehicleComponent(car, 1161);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 561) // Stratum
                    {
                        AddVehicleComponent(car, 1156);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 560) // Sultan
                    {
                        AddVehicleComponent(car, 1140);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                    else if(pmodelid[playerid] == 558)  // Uranus
                    {
                        AddVehicleComponent(car, 1167);
                        PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                        SendClientMessage(playerid, COLOR_WHITE, "[INFO] Component successfully added.");
                        ShowTuneDialog(playerid, REARBUMP);
                    }
                }
                else
                {
                    SendClientMessage(playerid, COLOR_YELLOW, "[WARNING] You cannot install this component to your car.");
                    ShowTuneDialog(playerid, REARBUMP);
                }
                break;
            }
            case 3:
            {
                if(pmodelid[playerid] == 575 ||

