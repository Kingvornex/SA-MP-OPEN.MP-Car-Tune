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












