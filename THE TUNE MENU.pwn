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

TmenuT[home] = "{FFFFFF}Tune Menu - 1","{FFFFFF}Paint Jobs\nColors\nExhausts\nFront Bumpers\nRear Bumpers\nRoofs\nSpoilers\nSideskirts\nBullbars\nWheels\nCar Stereos\nHydraulic\nNitro\nNeons"
TmenuT[paint] = "{FFFFFF}Paintjobs List", "{FFFFFF}Item: Paint Job - 1 - 	Price: $5K\nItem: Paint Job - 2 - 	Price: $5K\nItem: Paint Job - 3 - 	Price: $5K"
TmenuT[colors] = "{FFFFFF}Exhausts List", "{FFFFFF}Item: Wheel Arch Alien Exhaust - 	Price: $1K\nItem: Wheel Arch X-Flow Exhaust - 	Price: $1K\nItem: Locos Low Chromer Exhaust - 	Price: $1K\nLocos Low Slamin Exhaust - 	Price: $1K"
TmenuT[exust] = "{FFFFFF}Front Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - 	Price: $1K\nItem: Wheel Arch X-Flow Bumper - 	Price: $1K\nItem: Locos Low Chromer Bumper - 	Price: $1K\nItem: Locos Low Slamin Bumper - 	Price: $1K"
TmenuT[frontbump] = "{FFFFFF}Rear Bumpers List", "{FFFFFF}Item: Wheel Arch Alien Bumper - 	Price: $1K\nItem: Wheel Arch X-Flow Bumper - 	Price: $1K\nItem: Locos Low Chromer Bumper - 	Price: $1K\nItem: Locos Low Slamin Bumper - 	Price: $1K"
TmenuT[rearbump] = "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - 	Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - 	Price: $1K\nItem: Locos Low Hardtop Roof - 	Price: $1K\nItem: Locos Low Softtop Roof - 	Price: $1K"
TmenuT[roofs] = "{FFFFFF}Roofs List", "{FFFFFF}Item: Wheel Arch Alien Roof Vent - 	Price: $1K\nItem: Wheel Arch X-Flow Roof Vent - 	Price: $1K\nItem: Locos Low Hardtop Roof - 	Price: $1K\nItem: Locos Low Softtop Roof - 	Price: $1K"
TmenuT[spoilers] = "{FFFFFF}Spoilers List", "{FFFFFF}Item: Alien Spoiler - 	Price: $2K\nItem: X-Flow Spoiler - 	Price: $2K"
TmenuT[side] = "{FFFFFF}Sideskirts List", "{FFFFFF}Item: Wheel Arch Alien Sideskirts - 	Price: $1K\nItem: Wheel Arch X-Flow Sideskirts - 	Price: $1K\nItem: Locos Low Chrome Strip - 	Price: $1K\nItem: Locos Low Chrome Flames - 	Price: $1K\nItem: Locos Low Chrome Arches - 	Price: $1K\nItem: Locos Low Chrome Trim - 	Price: $1K\nItem: Locos Low Wheelcovers - 	Price: $1K"
TmenuT[bull] = "{FFFFFF}Bullbars List", "{FFFFFF}Item: Locos Low Chrome Grill - 	Price: $1K\nItem: Locos Low Chrome Bars - 	Price: $1K\nItem: Locos Low Chrome Lights - 	Price: $1K\nItem: Locos Low Chrome Bullbar - 	Price: $1K"
TmenuT[wheel] = "{FFFFFF}Wheels List - 1", "{FFFFFF}Item: Offroad - 	Price: $1K\nItem: Mega - 	Price: $1K\nItem: Wires - 	Price: $1K\nItem: Twist - 	Price: $1K\nItem: Grove - 	Price: $1K\nItem: Import - 	Price: $1K\nItem: Atomic - 	Price: $1K\nItem: Ahab - 	Price: $1K\nItem: Virtual - 	Price: $1K\nItem: Access - 	Price: $1K\N{FFFFFF}Item: Trance - 	Price: $1K\nItem: Shadow - 	Price: $1K\nItem: Rimshine - 	Price: $1K\nItem: Classic - 	Price: $1K\nItem: Cutter - 	Price: $1K\nItem: Switch - 	Price: $1K\nItem: Dollar - 	Price: $1K"
TmenuT[stereo] = "Car Stereos List", "{FFFFFF}Item: Bass Boost - 	Price: $1K"
TmenuT[hydraulic] = "{FFFFFF}Hydraulics", "{FFFFFF}Item: Hydraulics - 	Price: $1K"
TmenuT[nitro] = "{FFFFFF}Nitros Oxide", "{FFFFFF}Item: Nirto x2 - 	Price: $1K\nItem: Nirto x5 - 	Price: $2K\nItem: Nirto x10 - 	Price: $3K"
TmenuT[neons] = "{FFFFFF}Neons", "{FFFFFF}Item: Blue Neons - 	Price: $5K\nItem: Red Neons - 	Price: $5K\nItem: Green Neons - 	Price: $5K\nItem: Yellow Neons - 	Price: $5K\nItem: Pink Neons - 	Price: $5K\nItem: White Neons - 	Price: $5K\nRemove Neons"











