//==============================[ Includes ]====================================

#include <a_samp>
#include <zcmd>
#include <GetVehicleColor>
#include <sscanf2>
#include <YSI\y_ini>

//==============================[ Definitions ]=================================

#define SPD 			ShowPlayerDialog
#define DSL 			DIALOG_STYLE_LIST
#define DSI             DIALOG_STYLE_INPUT
#define D_TOP       	"Tuning by Dimi"
#define D_OK 			"Ok"
#define D_CANCEL 		"Cancel"
#define D_TEXT			"Paintjobs\nColors\nExhausts\nFront Bumper\nRear Bumper\nRoof\nSpoilers\nSide Skirts\nWheels\nCar Stereo\nHydraulics\nNitro"

#define T_FILE 			"Tuning/%s.ini"
#define TG_FILE 		"TGarage/%d.ini"

#define MAX_GARAGES 	100

#define dialog_TUNING 	1323
#define dialog_TUNING_2	1324

#define COLOR_PRICE		100

#define COLOR_RED		0xfa5555AA
#define COLOR_ORANGE	0xFF6600FF

#define SendErrorMessage(%0,%1) \
	SendClientMessage(%0, COLOR_RED, "ERROR | {FFFFFF} "%1)

//===========================[ News and Enums ]=================================

new PlayerText:TuningBuy[ MAX_PLAYERS ][ 14 ];

enum Vehicle {
    vVehID,
    vOwner[ MAX_PLAYER_NAME ],
	bool:vTuned,
	vSpoiler,
	vHood,
	vRoof,
	vSkirt,
	vLamps,
	vNitro,
	vExhaust,
	vWheels,
	vStereo,
	vHydraulics,
	vFrontBumper,
	vRearBumper,
	vRightVent,
	vLeftVent,
	vColor1,
	vColor2,
	vPaintJob
}
new VehicleInfo[ MAX_VEHICLES ][ Vehicle ];

enum aaa {
	Float:Position[ 3 ],
    Text3D:tg3D,
    tgPickup,
}
new tGarage[ MAX_GARAGES ][ aaa ];

enum PaintjobInfi {
	vehID,
	pNumber,
	pPrice,
	pName[ 12 ]
};
#define NUMBER_TYPE_PAINTJOB 	36
static const
	pjInfo[ NUMBER_TYPE_PAINTJOB ][ PaintjobInfi ] = {
	{ 483, 0, 100, "Paintjob 1" },
	{ 534, 0, 100, "Paintjob 1" },
	{ 534, 1, 100, "Paintjob 2" },
	{ 534, 2, 100, "Paintjob 3" },
	{ 535, 0, 100, "Paintjob 1" },
	{ 535, 1, 100, "Paintjob 2" },
	{ 535, 2, 100, "Paintjob 3" },
	{ 536, 0, 100, "Paintjob 1" },
	{ 536, 1, 100, "Paintjob 2" },
	{ 536, 2, 100, "Paintjob 3" },
	{ 558, 0, 100, "Paintjob 1" },
	{ 558, 1, 100, "Paintjob 2" },
	{ 558, 2, 100, "Paintjob 3" },
	{ 559, 0, 100, "Paintjob 1" },
	{ 559, 1, 100, "Paintjob 2" },
	{ 559, 2, 100, "Paintjob 3" },
	{ 560, 0, 100, "Paintjob 1" },
	{ 560, 1, 100, "Paintjob 2" },
	{ 560, 2, 100, "Paintjob 3" },
	{ 561, 0, 100, "Paintjob 1" },
	{ 561, 1, 100, "Paintjob 2" },
	{ 561, 2, 100, "Paintjob 3" },
	{ 562, 0, 100, "Paintjob 1" },
	{ 562, 1, 100, "Paintjob 2" },
	{ 562, 2, 100, "Paintjob 3" },
	{ 565, 0, 100, "Paintjob 1" },
	{ 565, 1, 100, "Paintjob 2" },
	{ 565, 2, 100, "Paintjob 3" },
	{ 567, 0, 100, "Paintjob 1" },
	{ 567, 1, 100, "Paintjob 2" },
	{ 567, 2, 100, "Paintjob 3" },
	{ 575, 0, 100, "Paintjob 1" },
	{ 575, 1, 100, "Paintjob 2" },
	{ 576, 0, 100, "Paintjob 1" },
	{ 576, 1, 100, "Paintjob 2" },
	{ 576, 2, 100, "Paintjob 3" }
};

enum ComponentsInfo {
	cID,
	cName[ 40 ],
	cPrice,
	cType
};
#define MAX_COMPONENTS	194
static const
	cInfo[ MAX_COMPONENTS ][ ComponentsInfo ] = {
	{ 1000, "Pro Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1001, "Win Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1002, "Drag Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1003, "Alpha Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1004, "Champ Scoop Hood", 100, CARMODTYPE_HOOD },
	{ 1005, "Fury Scoop Hood", 100, CARMODTYPE_HOOD },
	{ 1006, "Roof Scoop Roof", 100, CARMODTYPE_ROOF },
	{ 1007, "Right Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1008, "5x Nitrous", 100, CARMODTYPE_NITRO },
	{ 1009, "2x Nitrous", 100, CARMODTYPE_NITRO },
	{ 1010, "10x Nitrous", 100, CARMODTYPE_NITRO },
	{ 1011, "Race Scoop Hood", 100, CARMODTYPE_HOOD },
	{ 1012, "Worx Scoop Hood", 100, CARMODTYPE_HOOD },
	{ 1013, "Round Fog Lamp", 100, CARMODTYPE_LAMPS },
	{ 1014, "Champ Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1015, "Race Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1016, "Worx Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1017, "Left Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1018, "Upswept Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1019, "Twin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1020, "Large Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1021, "Medium Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1022, "Small Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1023, "Fury Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1024, "Square Fog Lamp", 100, CARMODTYPE_LAMPS },
	{ 1025, "Offroad Wheels", 100, CARMODTYPE_WHEELS },
	{ 1026, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1027, "Left Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1028, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1029, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1030, "Left X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1031, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1032, "Alien Roof Vent", 100, CARMODTYPE_ROOF },
	{ 1033, "X-Flow Roof Vent", 100, CARMODTYPE_ROOF },
	{ 1034, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1035, "X-Flow Roof Vent", 100, CARMODTYPE_ROOF },
	{ 1036, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1037, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1038, "Alien Roof Vent", 100, CARMODTYPE_ROOF },
	{ 1039, "Left X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1040, "Left Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1041, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1042, "Right Chrome Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1043, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1044, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1045, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1046, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1047, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1048, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1049, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1050, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1051, "Left Alien Sideskirt", 100, CARMODTYPE_SPOILER },
	{ 1052, "Left X-Flow Sideskirt", 100, CARMODTYPE_SPOILER },
	{ 1053, "X-Flow Roof", 100, CARMODTYPE_ROOF },
	{ 1054, "Alien Roof", 100, CARMODTYPE_ROOF },
	{ 1055, "Alien Roof", 100, CARMODTYPE_ROOF },
	{ 1056, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1057, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1058, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1059, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1060, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1061, "X-Flow Roof", 100, CARMODTYPE_ROOF },
	{ 1062, "Left Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1063, "Left X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1064, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1065, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1066, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1067, "Alien Roof", 100, CARMODTYPE_ROOF },
	{ 1068, "X-Flow Roof", 100, CARMODTYPE_ROOF },
	{ 1069, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1070, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1071, "Left Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1072, "Left X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1073, "Shadow Wheels", 100, CARMODTYPE_WHEELS },
	{ 1074, "Mega Wheels", 100, CARMODTYPE_WHEELS },
	{ 1075, "Rimshine Wheels", 100, CARMODTYPE_WHEELS },
	{ 1076, "Wires Wheels", 100, CARMODTYPE_WHEELS },
	{ 1077, "Classic Wheels", 100, CARMODTYPE_WHEELS },
	{ 1078, "Twist Wheels", 100, CARMODTYPE_WHEELS },
	{ 1079, "Cutter Wheels", 100, CARMODTYPE_WHEELS },
	{ 1080, "Switch Wheels", 100, CARMODTYPE_WHEELS },
	{ 1081, "Grove Wheels", 100, CARMODTYPE_WHEELS },
	{ 1082, "Import Wheels", 100, CARMODTYPE_WHEELS },
	{ 1083, "Dollar Wheels", 100, CARMODTYPE_WHEELS },
	{ 1084, "Trance Wheels", 100, CARMODTYPE_WHEELS },
	{ 1085, "Atomic Wheels", 100, CARMODTYPE_WHEELS },
	{ 1086, "Stereo Wheels", 100, CARMODTYPE_STEREO },
	{ 1087, "Hydraulics", 100, CARMODTYPE_HYDRAULICS },
	{ 1088, "Alien Roof", 100, CARMODTYPE_ROOF },
	{ 1089, "X-Flow Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1090, "Right Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1091, "X-Flow Roof", 100, CARMODTYPE_ROOF },
	{ 1092, "Alien Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1093, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1094, "Left Alien Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1095, "Right X-Flow Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1096, "Ahab Wheels", 100, CARMODTYPE_WHEELS },
	{ 1097, "Virtual Wheels", 100, CARMODTYPE_WHEELS },
	{ 1098, "Access Wheels", 100, CARMODTYPE_WHEELS },
	{ 1099, "Left Chrome Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1100, "Chrome Grill", 100, -1 }, // Bullbar
	{ 1101, "Left `Chrome Flames` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1102, "Left `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1103, "Covertible Roof", 100, CARMODTYPE_ROOF },
	{ 1104, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1105, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1106, "Right `Chrome Arches`", 100, CARMODTYPE_SIDESKIRT },
	{ 1107, "Left `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1108, "Right `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1109, "Chrome", 100, -1 }, // Bullbar
	{ 1110, "Slamin", 100, -1 }, // Bullbar
	{ 1111, "Little Sign?", 100, -1 }, // sig
	{ 1112, "Little Sign?", 100, -1 }, // sig
	{ 1113, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1114, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1115, "Chrome", 100, -1 }, // Bullbar
	{ 1116, "Slamin", 100, -1 }, // Bullbar
	{ 1117, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1118, "Right `Chrome Trim` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1119, "Right `Wheelcovers` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1120, "Left `Chrome Trim` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1121, "Left `Wheelcovers` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1122, "Right `Chrome Flames` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1123, "Bullbar Chrome Bars", 100, -1 }, // Bullbar
	{ 1124, "Left `Chrome Arches` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1125, "Bullbar Chrome Lights", 100, -1 }, // Bullbar
	{ 1126, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1127, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1128, "Vinyl Hardtop", 100, CARMODTYPE_ROOF },
	{ 1129, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1130, "Hardtop Roof", 100, CARMODTYPE_ROOF },
	{ 1131, "Softtop Roof", 100, CARMODTYPE_ROOF },
	{ 1132, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1133, "Right `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1134, "Right `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1135, "Slamin Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1136, "Chrome Exhaust", 100, CARMODTYPE_EXHAUST },
	{ 1137, "Left `Chrome Strip` Sideskirt", 100, CARMODTYPE_SIDESKIRT },
	{ 1138, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1139, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1140, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1141, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1142, "Left Oval Vents", 100, CARMODTYPE_VENT_LEFT },
	{ 1143, "Right Oval Vents", 100, CARMODTYPE_VENT_RIGHT },
	{ 1144, "Left Square Vents", 100, CARMODTYPE_VENT_LEFT },
	{ 1145, "Right Square Vents", 100, CARMODTYPE_VENT_RIGHT },
	{ 1146, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1147, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1148, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1149, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1150, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1151, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1152, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1153, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1154, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1155, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1156, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1157, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1158, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1159, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1160, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1161, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1162, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1163, "X-Flow Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1164, "Alien Spoiler", 100, CARMODTYPE_SPOILER },
	{ 1165, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1166, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1167, "X-Flow Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1168, "Alien Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1169, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1170, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1171, "Alien Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1172, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1173, "X-Flow Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1174, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1175, "Slamin Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1176, "Chrome Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1177, "Slamin Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1178, "Slamin Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1179, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1180, "Chrome Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1181, "Slamin Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1182, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1183, "Slamin Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1184, "Chrome Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1185, "Slamin Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1186, "Slamin Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1187, "Chrome Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1188, "Slamin Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1189, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1190, "Slamin Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1191, "Chrome Front Bumper", 100, CARMODTYPE_FRONT_BUMPER },
	{ 1192, "Chrome Rear Bumper", 100, CARMODTYPE_REAR_BUMPER },
	{ 1193, "Slamin Rear Bumper", 100, CARMODTYPE_REAR_BUMPER }
};


enum tpi {
	tID,
	tType,
	bool:tPaintjob,
	PJColor[ 2 ]
};
new TPInfo[ MAX_PLAYERS ][ tpi ];

new globalstring[ 128 ];

//=================================[ Functions ]=================================
stock CreatePlayerTextDraws( playerid ) {

	TuningBuy[ playerid ][ 0 ] = CreatePlayerTextDraw(playerid, 425.125000, 338.666687, "usebox");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 0 ], 0.000000, 8.627778);
	PlayerTextDrawTextSize(playerid, TuningBuy[ playerid ][ 0 ], 216.125000, 0.000000);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 0 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 0 ], 0);
	PlayerTextDrawUseBox(playerid, TuningBuy[ playerid ][ 0 ], true);
	PlayerTextDrawBoxColor(playerid, TuningBuy[ playerid ][ 0 ], 102);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 0 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 0 ], 0);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 0 ], 0);

	TuningBuy[ playerid ][ 1 ] = CreatePlayerTextDraw(playerid, 319.375000, 337.749847, "Hydraulics");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 1 ], 0.386249, 1.156664);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 1 ], 2);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 1 ], -1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 1 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 1 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 1 ], 51 );
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 1 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 1 ], 1 );
	PlayerTextDrawSetSelectable(playerid, TuningBuy[ playerid ][ 1 ], false );

	TuningBuy[ playerid ][ 2 ] = CreatePlayerTextDraw(playerid, 198.375000, 361.583282, "-");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 2 ], 18.981874, 0.514999);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 2 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 2 ], -10092289);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 2 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 2 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 2 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 2 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 2 ], 1);

	TuningBuy[ playerid ][ 3 ] = CreatePlayerTextDraw(playerid, 222.500000, 352.916656, "Left `Chrome Flames` Sideskirt");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 3 ], 0.244999, 1.092499);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 3 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 3 ], -1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 3 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 3 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 3 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 3 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 3 ], 1);

	TuningBuy[ playerid ][ 4 ] = CreatePlayerTextDraw(playerid, 222.500000, 365.000000, "price: ~w~10000$");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 4 ], 0.244999, 1.092499);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 4 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 4 ], -1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 4 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 4 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 4 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 4 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 4 ], 1);

	TuningBuy[ playerid ][ 5 ] = CreatePlayerTextDraw(playerid, 215.125000, 372.999877, "-");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 5 ], 6.743125, 0.444999);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 5 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 5 ], -10092289);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 5 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 5 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 5 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 5 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 5 ], 1);

	TuningBuy[ playerid ][ 6 ] = CreatePlayerTextDraw(playerid, 206.750000, 347.166564, "-");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 6 ], 18.981874, 0.514999);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 6 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 6 ], -10092289);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 6 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 6 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 6 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 6 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 6 ], 1);

	TuningBuy[ playerid ][ 7 ] = CreatePlayerTextDraw(playerid, 385.000000, 381.500000, "ld_beat:right");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 7 ], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, TuningBuy[ playerid ][ 7 ], 27.500000, 13.416657);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 7 ], 2);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 7 ], -1);
	PlayerTextDrawUseBox(playerid, TuningBuy[ playerid ][ 7 ], true);
	PlayerTextDrawBoxColor(playerid, TuningBuy[ playerid ][ 7 ], 255);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 7 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 7 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 7 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 7 ], 4);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 7 ], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[ playerid ][ 7 ], true);

	TuningBuy[ playerid ][ 8 ] = CreatePlayerTextDraw(playerid, 230.375000, 381.916473, "ld_beat:left");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 8 ], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, TuningBuy[ playerid ][ 8 ], 27.500000, 13.416657);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 8 ], 2);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 8 ], -1);
	PlayerTextDrawUseBox(playerid, TuningBuy[ playerid ][ 8 ], true);
	PlayerTextDrawBoxColor(playerid, TuningBuy[ playerid ][ 8 ], 255);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 8 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 8 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 8 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 8 ], 4);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 8 ], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[ playerid ][ 8 ], true);

	TuningBuy[ playerid ][ 9 ] = CreatePlayerTextDraw(playerid, 320.000000, 381.499938, "BUY");
	PlayerTextDrawTextSize(playerid, TuningBuy[ playerid ][ 9 ], 23.000000, 13.000000 );
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 9 ], 0.421249, 1.360832 );
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 9 ], 2);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 9 ], -1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 9 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 9 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 9 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 9 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 9 ], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[ playerid ][ 9 ], true);

	TuningBuy[ playerid ][ 10 ] = CreatePlayerTextDraw(playerid, 200.000000, 396.416656, "-");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 10 ], 18.981874, 0.514999);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 10 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 10 ], -10092289);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 10 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 10 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 10 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 10 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 10 ], 1);

	TuningBuy[ playerid ][ 11 ] = CreatePlayerTextDraw(playerid, 225.000000, 401.916595, "Advanced tuning system by ~r~Dimi");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 11 ], 0.258749, 0.987497);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 11 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 11 ], -1);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 11 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 11 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 11 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 11 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 11 ], 1);

	TuningBuy[ playerid ][ 12 ] = CreatePlayerTextDraw(playerid, 203.500000, 411.416839, "-");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 12 ], 18.981874, 0.514998);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 12 ], 1);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 12 ], -10092289);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 12 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 12 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 12 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 12 ], 2);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 12 ], 1);

	TuningBuy[ playerid ][ 13 ] = CreatePlayerTextDraw(playerid, 404.500000, 337.999877, "ld_beat:cross");
	PlayerTextDrawLetterSize(playerid, TuningBuy[ playerid ][ 13 ], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, TuningBuy[ playerid ][ 13 ], 17.500000, 8.749991);
	PlayerTextDrawAlignment(playerid, TuningBuy[ playerid ][ 13 ], 2);
	PlayerTextDrawColor(playerid, TuningBuy[ playerid ][ 13 ], -1);
	PlayerTextDrawUseBox(playerid, TuningBuy[ playerid ][ 13 ], true);
	PlayerTextDrawBoxColor(playerid, TuningBuy[ playerid ][ 13 ], 255);
	PlayerTextDrawSetShadow(playerid, TuningBuy[ playerid ][ 13 ], 0);
	PlayerTextDrawSetOutline(playerid, TuningBuy[ playerid ][ 13 ], 1);
	PlayerTextDrawBackgroundColor(playerid, TuningBuy[ playerid ][ 13 ], 51);
	PlayerTextDrawFont(playerid, TuningBuy[ playerid ][ 13 ], 4);
	PlayerTextDrawSetProportional(playerid, TuningBuy[ playerid ][ 13 ], 1);
	PlayerTextDrawSetSelectable(playerid, TuningBuy[ playerid ][ 13 ], true);
}
//==============================================================================
GetNearestTGarage( playerid ) {
    for(new i = 1; i < MAX_GARAGES; i++) {
        if( IsPlayerInRangeOfPoint( playerid, 10.0, tGarage[ i ][ Position ][ 0 ], tGarage[ i ][  Position ][ 1 ], tGarage[ i ][ Position ][ 2 ] ) ) { return i; }
	}
	return -1;
}
//==============================================================================
forward SaveTGarage( id );
public SaveTGarage( id ) {
	new iFile[ 40 ];
    format( iFile, sizeof( iFile ), TG_FILE, id );
	new INI:File = INI_Open( iFile );
	INI_WriteFloat( File, "Position1", tGarage[ id ][ Position ][ 0 ] );
	INI_WriteFloat( File, "Position2", tGarage[ id ][ Position ][ 1 ] );
	INI_WriteFloat( File, "Position3", tGarage[ id ][ Position ][ 2 ] );
	INI_Close( File );
	return 1;
}
//==============================================================================
forward LoadTGarage( id, name[], value[] );
public LoadTGarage( id, name[], value[] ) {
	INI_Float( "Position1", tGarage[ id ][ Position ][ 0 ] );
	INI_Float( "Position2", tGarage[ id ][ Position ][ 1 ] );
	INI_Float( "Position3", tGarage[ id ][ Position ][ 2 ] );
    return true;
}
//==============================================================================
forward SaveTuning( playerid, vehicleid, string[] );
public SaveTuning( playerid, vehicleid, string[] ) {
	new Color1, Color2;
    GetVehicleColor( vehicleid, Color1, Color2 );
	new file[ 40 ];
	format( file, sizeof( file ), T_FILE, string );
    if( fexist( file ) ) return 1;
	new INI:File = INI_Open( file );
	INI_SetTag( File, "Info" );
	INI_WriteInt( File, "VehID", GetVehicleModel( vehicleid ) );
	INI_WriteString( File, "Owner", GetName( playerid ) );
	INI_WriteBool( File, "Tuned", VehicleInfo[ vehicleid ][ vTuned ] );
    INI_WriteInt( File, "Spoiler", VehicleInfo[ vehicleid ][ vSpoiler ] );
	INI_WriteInt( File, "Hood", VehicleInfo[ vehicleid ][ vHood ] );
	INI_WriteInt( File, "Roof", VehicleInfo[ vehicleid ][ vRoof ] );
	INI_WriteInt( File, "Skirt", VehicleInfo[ vehicleid ][ vSkirt ] );
	INI_WriteInt( File, "Lamps", VehicleInfo[ vehicleid ][ vLamps ] );
	INI_WriteInt( File, "Nitro", VehicleInfo[ vehicleid ][ vNitro ] );
	INI_WriteInt( File, "Exhaust", VehicleInfo[ vehicleid ][ vExhaust ] );
	INI_WriteInt( File, "Wheels", VehicleInfo[ vehicleid ][ vWheels ] );
	INI_WriteInt( File, "Stereo", VehicleInfo[ vehicleid ][ vStereo ] );
	INI_WriteInt( File, "Hydraulics", VehicleInfo[ vehicleid ][ vHydraulics ] );
	INI_WriteInt( File, "FrontBumper", VehicleInfo[ vehicleid ][ vFrontBumper ] );
	INI_WriteInt( File, "RearBumper", VehicleInfo[ vehicleid ][ vRearBumper ] );
	INI_WriteInt( File, "RightVent", VehicleInfo[ vehicleid ][ vRightVent ] );
	INI_WriteInt( File, "LeftVent", VehicleInfo[ vehicleid ][ vLeftVent ] );
	INI_WriteInt( File, "PaintJob", VehicleInfo[ vehicleid ][ vPaintJob ] );
	INI_WriteInt( File, "Color1", Color1 );
	INI_WriteInt( File, "Color2", Color2 );
	INI_Close( File );
	return true;
}
//==============================================================================
forward LoadTuning( id, name[], value[] );
public LoadTuning( id, name[], value[] ) {
	INI_Int( "VehID", VehicleInfo[ id ][ vVehID ] );
	INI_String( "Owner", VehicleInfo[ id ][ vOwner ], MAX_PLAYER_NAME );
	INI_Bool( "Tuned", VehicleInfo[ id ][ vTuned ] );
	INI_Int( "Spoiler", VehicleInfo[ id ][ vSpoiler ] );
	INI_Int( "Hood", VehicleInfo[ id ][ vHood ] );
	INI_Int( "Roof", VehicleInfo[ id ][ vRoof ] );
	INI_Int( "Skirt", VehicleInfo[ id ][ vSkirt ] );
	INI_Int( "Lamps", VehicleInfo[ id ][ vLamps ] );
	INI_Int( "Nitro", VehicleInfo[ id ][ vNitro ] );
	INI_Int( "Exhaust", VehicleInfo[ id ][ vExhaust ] );
	INI_Int( "Wheels", VehicleInfo[ id ][ vWheels ] );
	INI_Int( "Stereo", VehicleInfo[ id ][ vStereo ] );
	INI_Int( "Hydraulics", VehicleInfo[ id ][ vHydraulics ] );
	INI_Int( "FrontBumper", VehicleInfo[ id ][ vFrontBumper ] );
	INI_Int( "RearBumper", VehicleInfo[ id ][ vRearBumper ] );
	INI_Int( "RightVent", VehicleInfo[ id ][ vRightVent ] );
	INI_Int( "LeftVent", VehicleInfo[ id ][ vLeftVent ] );
	INI_Int( "PaintJob", VehicleInfo[ id ][ vPaintJob ] );
	INI_Int( "Color1",  VehicleInfo[ id ][ vColor1 ] );
	INI_Int( "Color2",  VehicleInfo[ id ][ vColor2 ] );
	return true;
}
//==============================================================================
stock SetTune( vehicleid ) {
    if( VehicleInfo[ vehicleid ][ vTuned ] ) {
	    if( VehicleInfo[ vehicleid ][ vPaintJob ] != 255 ) ChangeVehiclePaintjob( vehicleid, VehicleInfo[ vehicleid ][ vPaintJob ] );
		if( VehicleInfo[ vehicleid ][ vSpoiler ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vSpoiler ] );
		if( VehicleInfo[ vehicleid ][ vHood ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vHood ] );
		if( VehicleInfo[ vehicleid ][ vRoof ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRoof ] );
		if( VehicleInfo[ vehicleid ][ vSkirt ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vSkirt ] );
		if( VehicleInfo[ vehicleid ][ vLamps ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vLamps ] );
		if( VehicleInfo[ vehicleid ][ vNitro ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vNitro ] );
		if( VehicleInfo[ vehicleid ][ vExhaust ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vWheels ] );
		if( VehicleInfo[ vehicleid ][ vWheels ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vWheels ] );
		if( VehicleInfo[ vehicleid ][ vStereo ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vStereo ] );
		if( VehicleInfo[ vehicleid ][ vHydraulics ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vHydraulics ] );
		if( VehicleInfo[ vehicleid ][ vFrontBumper ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vFrontBumper ] );
		if( VehicleInfo[ vehicleid ][ vRearBumper ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRearBumper ] );
		if( VehicleInfo[ vehicleid ][ vRightVent ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vRightVent ] );
		if( VehicleInfo[ vehicleid ][ vLeftVent ] != -1 ) AddVehicleComponent( vehicleid, VehicleInfo[ vehicleid ][ vLeftVent ] );
    }
}
//==============================================================================
stock AddComponentToVehicle( vehicleid, componentid ) {
	if( VehicleInfo[ vehicleid ][ vTuned ] ) {
		if( GetVehicleComponentType( componentid ) == CARMODTYPE_SPOILER ) {
		    VehicleInfo[ vehicleid ][ vSpoiler ] = componentid;
			if( VehicleInfo[ vehicleid ][ vSpoiler ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_HOOD ) {
		    VehicleInfo[ vehicleid ][ vHood ] = componentid;
			if( VehicleInfo[ vehicleid ][ vHood ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_ROOF ) {
		    VehicleInfo[ vehicleid ][ vRoof ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRoof ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_SIDESKIRT ) {
		    VehicleInfo[ vehicleid ][ vSkirt ] = componentid;
			if( VehicleInfo[ vehicleid ][ vSkirt ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_LAMPS ) {
		    VehicleInfo[ vehicleid ][ vLamps ] = componentid;
			if( VehicleInfo[ vehicleid ][ vLamps ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_NITRO ) {
		    VehicleInfo[ vehicleid ][ vNitro ] = componentid;
			if( VehicleInfo[ vehicleid ][ vNitro ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_EXHAUST ) {
		    VehicleInfo[ vehicleid ][ vExhaust ] = componentid;
			if( VehicleInfo[ vehicleid ][ vExhaust ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_WHEELS ) {
		    VehicleInfo[ vehicleid ][ vWheels ] = componentid;
			if( VehicleInfo[ vehicleid ][ vWheels ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_STEREO ) {
		    VehicleInfo[ vehicleid ][ vStereo ] = componentid;
			if( VehicleInfo[ vehicleid ][ vStereo ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_HYDRAULICS ) {
		    VehicleInfo[ vehicleid ][ vHydraulics ] = componentid;
			if( VehicleInfo[ vehicleid ][ vHydraulics ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_FRONT_BUMPER ) {
		    VehicleInfo[ vehicleid ][ vFrontBumper ] = componentid;
			if( VehicleInfo[ vehicleid ][ vFrontBumper ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_REAR_BUMPER ) {
		    VehicleInfo[ vehicleid ][ vRearBumper ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRearBumper ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_VENT_RIGHT ) {
		    VehicleInfo[ vehicleid ][ vRightVent ] = componentid;
			if( VehicleInfo[ vehicleid ][ vRightVent ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	    else if( GetVehicleComponentType( componentid ) == CARMODTYPE_VENT_LEFT ) {
		    VehicleInfo[ vehicleid ][ vLeftVent ] = componentid;
			if( VehicleInfo[ vehicleid ][ vLeftVent ] != -1 ) AddVehicleComponent( vehicleid, componentid );
		}
	}
}
//==============================================================================
stock NextIDGarage(const len) {
    new id = (-1);
    for( new loop = ( 0 ), provjera = ( -1 ), Data_[ 64 ] = "\0"; loop != len; ++ loop ) {
       provjera = ( loop+1 );
       format( Data_, ( sizeof Data_ ), TG_FILE, provjera );
       if(!fexist(Data_)) {
          id = ( provjera );
          break; } }
  	return ( id );
}
//==============================================================================
stock IsComponentidCompatible( modelid, componentid ) {
    if( componentid == 1025 || componentid == 1073 || componentid == 1074 || componentid == 1075 || componentid == 1076 ||
		componentid == 1077 || componentid == 1078 || componentid == 1079 || componentid == 1080 || componentid == 1081 ||
        componentid == 1082 || componentid == 1083 || componentid == 1084 || componentid == 1085 || componentid == 1096 ||
        componentid == 1097 || componentid == 1098 || componentid == 1087 || componentid == 1086 ) {
        return componentid;
	}

    switch( modelid ) {
        case 400: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 ) return componentid;
        case 401: if( componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 114 || componentid == 1020 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 402: if( componentid == 1009 || componentid == 1009 || componentid == 1010 ) return componentid;
        case 404: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 405: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1023 || componentid == 1000) return componentid;
        case 409: if( componentid == 1009 ) return componentid;
        case 410: if( componentid == 1019 || componentid == 1021 || componentid == 1020 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 411: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 412: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 415: if( componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 418: if( componentid == 1020 || componentid == 1021 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016) return componentid;
        case 419: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 420: if( componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1003) return componentid;
        case 421: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1016 || componentid == 1000) return componentid;
        case 422: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007) return componentid;
        case 426: if( componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003) return componentid;
        case 429: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 436: if( componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 438: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 439: if( componentid == 1003 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1013) return componentid;
        case 442: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 445: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 451: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 458: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 466: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 467: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 474: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 475: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 477: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007) return componentid;
        case 478: if( componentid == 1005 || componentid == 1004 || componentid == 1012 || componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 479: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 480: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 489: if( componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016 || componentid == 1000) return componentid;
        case 491: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 492: if( componentid == 1005 || componentid == 1004 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1016 || componentid == 1000) return componentid;
        case 496: if( componentid == 1006 || componentid == 1017 || componentid == 1007 || componentid == 1011 || componentid == 1019 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1003 || componentid == 1002 || componentid == 1142 || componentid == 1143 || componentid == 1020) return componentid;
        case 500: if( componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 506: if( componentid == 1009) return componentid;
        case 507: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 516: if( componentid == 1004 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1015 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 517: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 518: if( componentid == 1005 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 526: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 527: if( componentid == 1021 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1015 || componentid == 1017 || componentid == 1007) return componentid;
        case 529: if( componentid == 1012 || componentid == 1011 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 533: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 534: if( componentid == 1126 || componentid == 1127 || componentid == 1179 || componentid == 1185 || componentid == 1100 || componentid == 1123 || componentid == 1125 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1180 || componentid == 1178 || componentid == 1101 || componentid == 1122 || componentid == 1124 || componentid == 1106) return componentid;
        case 535: if( componentid == 1109 || componentid == 1110 || componentid == 1113 || componentid == 1114 || componentid == 1115 || componentid == 1116 || componentid == 1117 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1120 || componentid == 1118 || componentid == 1121 || componentid == 1119) return componentid;
        case 536: if( componentid == 1104 || componentid == 1105 || componentid == 1182 || componentid == 1181 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1184 || componentid == 1183 || componentid == 1128 || componentid == 1103 || componentid == 1107 || componentid == 1108) return componentid;
        case 540: if( componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 541: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 542: if( componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1015) return componentid;
        case 545: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 546: if( componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 547: if( componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1016 || componentid == 1003 || componentid == 1000) return componentid;
        case 549: if( componentid == 1012 || componentid == 1011 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 550: if( componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003) return componentid;
        case 551: if( componentid == 1005 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003) return componentid;
        case 555: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 558: if( componentid == 1092 || componentid == 1089 || componentid == 1166 || componentid == 1165 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1168 || componentid == 1167 || componentid == 1088 || componentid == 1091 || componentid == 1164 || componentid == 1163 || componentid == 1094 || componentid == 1090 || componentid == 1095 || componentid == 1093) return componentid;
        case 559: if( componentid == 1065 || componentid == 1066 || componentid == 1160 || componentid == 1173 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1159 || componentid == 1161 || componentid == 1162 || componentid == 1158 || componentid == 1067 || componentid == 1068 || componentid == 1071 || componentid == 1069 || componentid == 1072 || componentid == 1070 || componentid == 1009) return componentid;
        case 560: if( componentid == 1028 || componentid == 1029 || componentid == 1169 || componentid == 1170 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1141 || componentid == 1140 || componentid == 1032 || componentid == 1033 || componentid == 1138 || componentid == 1139 || componentid == 1027 || componentid == 1026 || componentid == 1030 || componentid == 1031) return componentid;
        case 561: if( componentid == 1064 || componentid == 1059 || componentid == 1155 || componentid == 1157 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1154 || componentid == 1156 || componentid == 1055 || componentid == 1061 || componentid == 1058 || componentid == 1060 || componentid == 1062 || componentid == 1056 || componentid == 1063 || componentid == 1057) return componentid;
        case 562: if( componentid == 1034 || componentid == 1037 || componentid == 1171 || componentid == 1172 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1149 || componentid == 1148 || componentid == 1038 || componentid == 1035 || componentid == 1147 || componentid == 1146 || componentid == 1040 || componentid == 1036 || componentid == 1041 || componentid == 1039) return componentid;
        case 565: if( componentid == 1046 || componentid == 1045 || componentid == 1153 || componentid == 1152 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1150 || componentid == 1151 || componentid == 1054 || componentid == 1053 || componentid == 1049 || componentid == 1050 || componentid == 1051 || componentid == 1047 || componentid == 1052 || componentid == 1048) return componentid;
        case 566: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 567: if( componentid == 1129 || componentid == 1132 || componentid == 1189 || componentid == 1188 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1187 || componentid == 1186 || componentid == 1130 || componentid == 1131 || componentid == 1102 || componentid == 1133) return componentid;
        case 575: if( componentid == 1044 || componentid == 1043 || componentid == 1174 || componentid == 1175 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1176 || componentid == 1177 || componentid == 1099 || componentid == 1042) return componentid;
        case 576: if( componentid == 1136 || componentid == 1135 || componentid == 1191 || componentid == 1190 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1192 || componentid == 1193 || componentid == 1137 || componentid == 1134) return componentid;
        case 579: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 580: if( componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
        case 585: if( componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007) return componentid;
        case 587: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 589: if( componentid == 1005 || componentid == 1004 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1024 || componentid == 1013 || componentid == 1006 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007) return componentid;
        case 600: if( componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1022 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007) return componentid;
        case 602: if( componentid == 1008 || componentid == 1009 || componentid == 1010) return componentid;
        case 603: if( componentid == 1144 || componentid == 1145 || componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007) return componentid;
    }
    return false;
}
//==============================================================================
stock GetVehicleCameraPos( vehicleid, &Float:x, &Float:y, &Float:z, Float:xoff=0.0, Float:yoff=0.0, Float:zoff=0.0 ) { // credits Pasha
    new Float:rot;
    GetVehicleZAngle( vehicleid, rot );
    rot = 360 - rot;
    GetVehiclePos( vehicleid, x, y, z );
    x = floatsin( rot, degrees ) * yoff + floatcos( rot, degrees ) * xoff + x;
    y = floatcos( rot, degrees ) * yoff - floatsin( rot, degrees ) * xoff + y;
    z = zoff + z;
}
//==============================================================================
stock TuningTDControl( playerid, bool:show ) {
	if( show == true ) {
        for( new i = 0; i < 14; i ++ ) {
			PlayerTextDrawShow( playerid, TuningBuy[ playerid ][ i ] );
		}

	}
	else if( show == false ) {
		for( new i = 0; i < 14; i ++ ) {
			PlayerTextDrawHide( playerid, TuningBuy[ playerid ][ i ]);
		}
	}
}
//==============================================================================
ResetTuningInfo( playerid ) {
	TPInfo[ playerid ][ tID ] = -1;
	TPInfo[ playerid ][ tType ] = -1;
	TPInfo[ playerid ][ tPaintjob ] = false;
	TPInfo[ playerid ][ PJColor ] = -1;
	TPInfo[ playerid ][ PJColor ] = -1;
}
//==============================================================================
stock ResetTuning( vehid ) {
	if( VehicleInfo[ vehid ][ vTuned ] ) {
	    VehicleInfo[ vehid ][ vTuned ] = false;
		VehicleInfo[ vehid ][ vSpoiler ] = -1;
		VehicleInfo[ vehid ][ vHood ] = -1;
		VehicleInfo[ vehid ][ vRoof ] = -1;
		VehicleInfo[ vehid ][ vSkirt ] = -1;
		VehicleInfo[ vehid ][ vLamps ] = -1;
		VehicleInfo[ vehid ][ vNitro ] = -1;
		VehicleInfo[ vehid ][ vExhaust ] = -1;
		VehicleInfo[ vehid ][ vWheels ] = -1;
		VehicleInfo[ vehid ][ vStereo ] = -1;
		VehicleInfo[ vehid ][ vHydraulics ] = -1;
		VehicleInfo[ vehid ][ vFrontBumper ] = -1;
		VehicleInfo[ vehid ][ vRearBumper ] = -1;
		VehicleInfo[ vehid ][ vRightVent ] = -1;
		VehicleInfo[ vehid ][ vLeftVent ] = -1;
		VehicleInfo[ vehid ][ vPaintJob ] = 255;
	}
}
//==============================================================================
stock GetName( id ) {
	new ime[MAX_PLAYER_NAME];
 	GetPlayerName(id, ime, sizeof ime);
	return ime;
}
//==============================================================================
public OnFilterScriptInit( ) {
	print("\n--------------------------------------");
	print(" Advanced Tuning System by Dimi");
	print("--------------------------------------\n");

	for(new i = 1; i < MAX_GARAGES; i++) {
	    new file[ 50 ];
	    format( file, sizeof( file ), TG_FILE, i );
	    if( fexist( file ) ) {
	    	INI_ParseFile( file, "LoadTGarage", .bExtra = true, .extra = i );
	        tGarage[ i ][ tg3D ] = Create3DTextLabel( "{FFFFFF}To tune your vehicle type\n{ff6600}[ /tune ]", -1, tGarage[ i ][ Position ][ 0 ], tGarage[ i ][ Position ][ 1 ], tGarage[ i ][ Position ][ 2 ], 15.0, 0, 1 );
			tGarage[ i ][ tgPickup ] = CreatePickup( 1239, 1, tGarage[ i ][ Position ][ 0 ], tGarage[ i ][ Position ][ 1 ], tGarage[ i ][ Position ][ 2 ], -1 );
	    }
	}

	for( new i = 0; i < MAX_VEHICLES; i++ ) {
	    VehicleInfo[ i ][ vTuned ] = false;
		VehicleInfo[ i ][ vSpoiler ] = -1;
		VehicleInfo[ i ][ vHood ] = -1;
		VehicleInfo[ i ][ vRoof ] = -1;
		VehicleInfo[ i ][ vSkirt ] = -1;
		VehicleInfo[ i ][ vLamps ] = -1;
		VehicleInfo[ i ][ vNitro ] = -1;
		VehicleInfo[ i ][ vExhaust ] = -1;
		VehicleInfo[ i ][ vWheels ] = -1;
		VehicleInfo[ i ][ vStereo ] = -1;
		VehicleInfo[ i ][ vHydraulics ] = -1;
		VehicleInfo[ i ][ vFrontBumper ] = -1;
		VehicleInfo[ i ][ vRearBumper ] = -1;
		VehicleInfo[ i ][ vRightVent ] = -1;
		VehicleInfo[ i ][ vLeftVent ] = -1;
		VehicleInfo[ i ][ vPaintJob ] = 255;
	}
	return 1;
}
//==============================================================================
public OnFilterScriptExit( ) {
	return 1;
}
//==============================================================================
public OnPlayerConnect( playerid ) {
    CreatePlayerTextDraws( playerid );
    ResetTuningInfo( playerid );
	return 1;
}
//==============================================================================
public OnPlayerDisconnect( playerid, reason ) {
	return 1;
}
//==============================================================================
public OnDialogResponse( playerid, dialogid, response, listitem, inputtext[] ) {
	switch( dialogid ) {
	    case dialog_TUNING: {
	        if( response ) {
	            if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	            if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
				new vehicleid = GetPlayerVehicleID( playerid ), Float:Pos[ 6 ];

	            TPInfo[ playerid ][ tID ] = -1;

				switch( listitem ) {
	                case 0: {
						
						for( new i = 0; i < NUMBER_TYPE_PAINTJOB; i++ ) {
			                if( pjInfo[ i ][ vehID ] == GetVehicleModel( vehicleid ) ) {
				            	TPInfo[ playerid ][ tID ] = i;
								break;
							}
			           	}
						if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible paintjobs for your vehicle model." );
						
						new pid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tPaintjob ] = true;
						
						GetVehicleColor( vehicleid, TPInfo[ playerid ][ PJColor ][ 0 ], TPInfo[ playerid ][ PJColor ][ 1 ] );
						
						TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

                        ChangeVehicleColor( vehicleid, 1, 1 );
                        ChangeVehiclePaintjob( vehicleid, pjInfo[ pid ][ pNumber ] );

	                    format( globalstring, sizeof( globalstring ), "%s", pjInfo[ pid ][ pName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", pjInfo[ pid ][ pPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );
						
						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 5 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						
						SelectTextDraw( playerid, COLOR_ORANGE );
					}
	                case 1: {
						SPD( playerid, dialog_TUNING_2, DSI, D_TOP, "Input Color1 ID and Color2 ID.\nExample: 0 1", D_OK, D_CANCEL );
	                }
	                case 2: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_EXHAUST ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_EXHAUST;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], -2, -5, 0 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 3: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_FRONT_BUMPER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_FRONT_BUMPER;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 4: { 

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_REAR_BUMPER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_REAR_BUMPER;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 5: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_ROOF ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_ROOF;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 6: {
	                    
	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_SPOILER ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_SPOILER;
						TPInfo[ playerid ][ tPaintjob ] = false;
	                
	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );
	                
	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );
						
						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );
						
						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						
						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 7: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_SIDESKIRT ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_SIDESKIRT;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 0.5 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 8: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_WHEELS ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_WHEELS;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 4, 0, 0.5 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 9: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_STEREO ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_STEREO;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 10: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_HYDRAULICS ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_HYDRAULICS;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 2, 2, 2 );
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	                case 11: {

	                    for( new i = 0; i < MAX_COMPONENTS; i++ ) {
			                if( cInfo[ i ][ cType ] == CARMODTYPE_NITRO ) {
			                    if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
				                    TPInfo[ playerid ][ tID ] = i;
									break;
								}
			                }
						}
	                    if( TPInfo[ playerid ][ tID ] == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

						new cid = TPInfo[ playerid ][ tID ];
						TPInfo[ playerid ][ tType ] = CARMODTYPE_NITRO;
						TPInfo[ playerid ][ tPaintjob ] = false;

	                    TogglePlayerControllable( playerid, false );
	                    TuningTDControl( playerid, true );

	                    format( globalstring, sizeof( globalstring ), "%s", cInfo[ cid ][ cName ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
						format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ cid ][ cPrice ] );
						PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                        AddVehicleComponent( vehicleid, cInfo[ cid ][ cID ] );

						GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, -6, 2 ); // done
						SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

						GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
						SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

						SelectTextDraw( playerid, COLOR_ORANGE );
	                }
	            }
	        }
	        else if( !response ) {
	            SetCameraBehindPlayer( playerid );
	        }
	    }
	    case dialog_TUNING_2: {
	        if( !response ) return 1;
			if( response ) {
			    if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	            if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
				new vehicleid = GetPlayerVehicleID( playerid );
			    if( GetPlayerMoney( playerid ) < COLOR_PRICE ) return SendErrorMessage( playerid, "You do not have enough money." );
			    new b1, b2;
			    if( sscanf( inputtext, "ii", b1, b2 ) ) return SPD( playerid, dialog_TUNING_2, DSI, D_TOP, "Input Color1 ID and Color2 ID.\nExample: 0 1", D_OK, D_CANCEL );
				if( b1 < 0 || b2 < 0 || b1 > 255 || b2 > 255 ) return SendErrorMessage( playerid, "Color ID can't be higher from 255 or lower than 0!");
				
				ChangeVehicleColor( vehicleid, b1, b2 );
				GivePlayerMoney( playerid, COLOR_PRICE );
				
				SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
			}
		}
	}
	return true;
}
//==============================================================================
public OnVehicleSpawn( vehicleid ) {
	SetTune( vehicleid );
	return true;
}
//==============================================================================
public OnPlayerClickPlayerTextDraw( playerid, PlayerText:playertextid ) {
    if( _:playertextid != INVALID_TEXT_DRAW ) {
        if( playertextid == TuningBuy[ playerid ][ 7 ] ) { // desno
            if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	        if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
	            
            if( TPInfo[ playerid ][ tPaintjob ] == false ) {
            
				new compid = -1, vehicleid = GetPlayerVehicleID( playerid );
            
	            for( new i = ( TPInfo[ playerid ][ tID ]+1 ); i < MAX_COMPONENTS; i++ ) {
					if( cInfo[ i ][ cType ] == TPInfo[ playerid ][ tType ] ) {
						if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
							compid = i;
							break;
						}
					}
				}
				if( compid == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model" );

	            RemoveVehicleComponent( vehicleid, cInfo[ TPInfo[ playerid ][ tID ] ][ cID ] );

	            TPInfo[ playerid ][ tID ] = compid;

	            format( globalstring, sizeof( globalstring ), "%s", cInfo[ compid ][ cName ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
				format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ compid ][ cPrice ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

				AddVehicleComponent( vehicleid, cInfo[ compid ][ cID ] );

				SelectTextDraw( playerid, COLOR_ORANGE );
			}
			else if( TPInfo[ playerid ][ tPaintjob ] == true ) {
			
			    new paintid = -1, vehicleid = GetPlayerVehicleID( playerid );
			    
			    for( new i = ( TPInfo[ playerid ][ tID ]+1 ); i < NUMBER_TYPE_PAINTJOB; i++ ) {
			    	if( pjInfo[ i ][ vehID ] == GetVehicleModel( vehicleid ) ) {
						paintid = i;
						break;
					}
			   	}
			   	if( paintid == -1 ) return SendErrorMessage( playerid, "No compatible paintjobs for your vehicle model." );

                TPInfo[ playerid ][ tID ] = paintid;
                
                format( globalstring, sizeof( globalstring ), "%s", pjInfo[ paintid ][ pName ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
				format( globalstring, sizeof( globalstring ), "price: ~w~%d$", pjInfo[ paintid ][ pPrice ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );
                
                ChangeVehiclePaintjob( vehicleid, pjInfo[ paintid ][ pNumber ] );
                
                SelectTextDraw( playerid, COLOR_ORANGE );
			}
        }
        if( playertextid == TuningBuy[ playerid ][ 8 ] ) { // levo
            if( TPInfo[ playerid ][ tPaintjob ] == false ) {
            
	            if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
		        if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );

	            new compid = -1, vehicleid = GetPlayerVehicleID( playerid );

	            for( new i = (TPInfo[ playerid ][ tID ]-1); i > 0; i-- ) {
					if( cInfo[ i ][ cType ] == TPInfo[ playerid ][ tType ] ) {
						if( cInfo[ i ][ cID ] == IsComponentidCompatible( GetVehicleModel( vehicleid ), cInfo[ i ][ cID ] ) ) {
							compid = i;
							break;
						}
					}
				}
				if( compid == -1 ) return SendErrorMessage( playerid, "No compatible components selected species for your vehicle model." );

				RemoveVehicleComponent( vehicleid, cInfo[ TPInfo[ playerid ][ tID ] ][ cID ] );

	            TPInfo[ playerid ][ tID ] = compid;

	            format( globalstring, sizeof( globalstring ), "%s", cInfo[ compid ][ cName ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
				format( globalstring, sizeof( globalstring ), "price: ~w~%d$", cInfo[ compid ][ cPrice ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

				AddVehicleComponent( vehicleid, cInfo[ compid ][ cID ] );

				SelectTextDraw( playerid, COLOR_ORANGE );
			}
			else if( TPInfo[ playerid ][ tPaintjob ] == true ) {

			    new paintid = -1, vehicleid = GetPlayerVehicleID( playerid );

			    for( new i = (TPInfo[ playerid ][ tID ]-1); i > 0; i-- ) {
			    	if( pjInfo[ i ][ vehID ] == GetVehicleModel( vehicleid ) ) {
						paintid = i;
						break;
					}
			   	}
			   	if( paintid == -1 ) return SendErrorMessage( playerid, "No compatible paintjobs for your vehicle model." );

                TPInfo[ playerid ][ tID ] = paintid;

                format( globalstring, sizeof( globalstring ), "%s", pjInfo[ paintid ][ pName ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 3 ], globalstring );
				format( globalstring, sizeof( globalstring ), "price: ~w~%d$", pjInfo[ paintid ][ pPrice ] );
				PlayerTextDrawSetString( playerid, TuningBuy[ playerid ][ 4 ], globalstring );

                ChangeVehiclePaintjob( vehicleid, pjInfo[ paintid ][ pNumber ] );

                SelectTextDraw( playerid, COLOR_ORANGE );
			}
        }
        if( playertextid == TuningBuy[ playerid ][ 9 ] ) { // buy
            if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	        if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );

            new Float:Pos[ 6 ], vehicleid = GetPlayerVehicleID( playerid );

            if( TPInfo[ playerid ][ tPaintjob ] == false ) {
            
				if( GetPlayerMoney( playerid ) < cInfo[ TPInfo[ playerid ][ tID ] ][ cPrice ] ) return SendErrorMessage( playerid, "You do not have enough money." );

				new cid = TPInfo[ playerid ][ tID ];

		        RemoveVehicleComponent( vehicleid, cInfo[ TPInfo[ playerid ][ tID ] ][ cID ] );

		        VehicleInfo[ vehicleid ][ vTuned ] = true;

		        AddComponentToVehicle( vehicleid, cInfo[ cid ][ cID ] );
		        
		        GivePlayerMoney( playerid, -cInfo[ TPInfo[ playerid ][ tID ] ][ cPrice ] );

			}
			else if( TPInfo[ playerid ][ tPaintjob ] == true ) {
			
			    if( GetPlayerMoney( playerid ) < pjInfo[ TPInfo[ playerid ][ tID ] ][ pPrice ] ) return SendErrorMessage( playerid, "You do not have enough money." );
			
			    new paintid = TPInfo[ playerid ][ tID ];
			
			    VehicleInfo[ vehicleid ][ vTuned ] = true;
			    
			    VehicleInfo[ vehicleid ][ vPaintJob ] = pjInfo[ paintid ][ pNumber ];
			    
			    GivePlayerMoney( playerid, -pjInfo[ TPInfo[ playerid ][ tID ] ][ pPrice ] );
			    
			    ChangeVehicleColor( vehicleid, TPInfo[ playerid ][ PJColor ][ 0 ], TPInfo[ playerid ][ PJColor ][ 1 ] );
			    
			    ChangeVehiclePaintjob( vehicleid, pjInfo[ paintid ][ pNumber ] );
			
			}
			GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 2 );
			SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

			GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
			SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
			
			CancelSelectTextDraw( playerid );

		    TuningTDControl( playerid, false );
		    TogglePlayerControllable( playerid, true );

			SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
        }
        if( playertextid == TuningBuy[ playerid ][ 13 ] ) { // close
        
            if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	        if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );

            new Float:Pos[ 6 ], vehicleid = GetPlayerVehicleID( playerid );

			if( TPInfo[ playerid ][ tPaintjob ] == false ) {

		        RemoveVehicleComponent( vehicleid, cInfo[ TPInfo[ playerid ][ tID ] ][ cID ] );

				SetTune( vehicleid );
			}
			else if( TPInfo[ playerid ][ tPaintjob ] == true ) {
			    ChangeVehiclePaintjob( vehicleid, 3 );
				ChangeVehicleColor( vehicleid, TPInfo[ playerid ][ PJColor ][ 0 ], TPInfo[ playerid ][ PJColor ][ 1 ] );
			}
			GetVehicleCameraPos( vehicleid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ], 0, 6, 2 );
			SetPlayerCameraPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );

			GetVehiclePos( vehicleid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
			SetPlayerCameraLookAt( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );

	        CancelSelectTextDraw( playerid );
	            
			TuningTDControl( playerid, false );
		    TogglePlayerControllable( playerid, true );

			SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
        }
    }
    return true;
}

//================================[ Commands ]==================================

CMD:tune( playerid, params[] ) {
	if( GetNearestTGarage( playerid ) == -1 ) return SendErrorMessage( playerid, "You must to be on pickup of tuning garage." );
	SPD( playerid, dialog_TUNING, DSL, D_TOP, D_TEXT, D_OK, D_CANCEL );
	return true;
}
//==============================================================================
CMD:removetuning( playerid, params[] ) {
	if( GetNearestTGarage( playerid ) == -1 ) return SendErrorMessage( playerid, "You must to be on pickup of tuning garage." );
    if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
	new vehicleid = GetPlayerVehicleID( playerid ), componentid;

    ResetTuning( vehicleid );
    
	ChangeVehiclePaintjob( vehicleid, 3 );
	for( new i; i < 14; i++ ) {
		componentid = GetVehicleComponentInSlot( vehicleid, i );
		if( componentid != 0 )
			RemoveVehicleComponent( vehicleid, componentid );
	}
	SendClientMessage( playerid, -1, "Successfully removed tuning." );
	return true;
}
//==============================================================================
CMD:savetuning( playerid, params[] ) {
	new file[ 80 ], tuningname[ 40 ];
	if( sscanf( params,"s[40]", tuningname ) ) return SendClientMessage( playerid, -1, "USAGE: /savetuning [ tuning-name ]");
	if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
	new vehicleid = GetPlayerVehicleID( playerid );
	format( file, sizeof( file ), T_FILE, tuningname );
	if( fexist( file ) ) return SendErrorMessage( playerid, "Already exist saved tuning with that name!");
	
	format( globalstring, sizeof( globalstring ), "Successfully saved tuning with name %s", tuningname );
	SendClientMessage( playerid, -1, globalstring );
	
	SaveTuning( playerid, vehicleid, tuningname );
	return true;
}
//==============================================================================
CMD:loadtuning( playerid, params[] ) {
	new file[ 80 ], tuningname[ 40 ];
	if( sscanf( params,"s[40]", tuningname ) ) return SendClientMessage( playerid, -1, "USAGE: /loadtuning [ tuning-name ]");
	if( !IsPlayerInAnyVehicle( playerid ) ) return SendErrorMessage( playerid, "You must be in the vehicle." );
	if( GetPlayerState( playerid ) != PLAYER_STATE_DRIVER ) return SendErrorMessage( playerid, "You must be in the driver's seat." );
	new vehicleid = GetPlayerVehicleID( playerid );
    if( VehicleInfo[ vehicleid ][ vTuned ] == true ) return SendErrorMessage( playerid, "This vehicle is arleady tuned." );
	format( file, sizeof( file ), T_FILE, tuningname );
	if( !fexist( file ) ) return SendErrorMessage( playerid, "No exist saved tuning with that name!");
    INI_ParseFile( file, "LoadTuning", .bExtra = true, .extra = vehicleid );
	if( strcmp( GetName( playerid ), VehicleInfo[ vehicleid ][ vOwner ], true ) == 0 ) {

		if( GetVehicleModel( vehicleid ) != VehicleInfo[ vehicleid ][ vVehID ] ) return SendErrorMessage( playerid, "This tuning is not saved for your vehicle model." );

		format( globalstring, sizeof( globalstring ), "Successfully loaded tuning with name %s", tuningname );
		SendClientMessage( playerid, -1, globalstring );

		SetTune( vehicleid );
		ChangeVehicleColor( vehicleid, VehicleInfo[ vehicleid ][ vColor1 ], VehicleInfo[ vehicleid ][ vColor2 ] );
	}
	else return SendErrorMessage( playerid, "You are not a owner of this tuning." );
	return true;
}
//==============================================================================
CMD:maketgarage( playerid, params[] ) {
    if( !IsPlayerAdmin( playerid ) ) return SendErrorMessage( playerid, "You must be rcon admin." );
    new i = NextIDGarage( MAX_GARAGES ), Float:Pos[ 3 ], file[ 40 ];
	GetPlayerPos( playerid, Pos[ 0 ], Pos[ 1 ], Pos[ 2 ] );
	format( file, sizeof( file ), TG_FILE, i );
	if( fexist( file ) ) return SendErrorMessage( playerid, "ID of that garage already exist!" );
	tGarage[ i ][ Position ][ 0 ] = Pos[ 0 ];
	tGarage[ i ][ Position ][ 1 ] = Pos[ 1 ];
	tGarage[ i ][ Position ][ 2 ] = Pos[ 2 ];
	tGarage[ i ][ tg3D ] = Create3DTextLabel( "{FFFFFF}To tune your vehicle type\n{ff6600}[ /tune ]", -1, tGarage[ i ][ Position ][ 0 ], tGarage[ i ][ Position ][ 1 ], tGarage[ i ][ Position ][ 2 ], 15.0, 0, 1 );
	tGarage[ i ][ tgPickup ] = CreatePickup( 1239, 1, tGarage[ i ][ Position ][ 0 ], tGarage[ i ][ Position ][ 1 ], tGarage[ i ][ Position ][ 2 ], -1 );
	SaveTGarage( i );
	return true;
}
//==============================================================================
CMD:removetgarage( playerid, params[] ) {
    if( !IsPlayerAdmin( playerid ) ) return SendErrorMessage( playerid, "You must be rcon admin." );
	new i = GetNearestTGarage( playerid );
	if( i == -1 ) return SendErrorMessage( playerid, "You must be on pickup for tune." );
	
	tGarage[ i ][ Position ][ 0 ] = 0.0;
	tGarage[ i ][ Position ][ 1 ] = 0.0;
	tGarage[ i ][ Position ][ 2 ] = 0.0;
	
	DestroyPickup( tGarage[ i ][ tgPickup ] );
	Delete3DTextLabel( tGarage[ i ][ tg3D ] );
	
    new file[ 50 ];
	format( file, sizeof( file ), TG_FILE, i );
	if( fexist( file ) ) { fremove( file ); }

	SendClientMessage( playerid, COLOR_RED, "Successfully deleted tuning garage." );
	return true;
}
//==============================================================================
CMD:money( playerid, params[] ) { // test cmd
	GivePlayerMoney( playerid, 10000 );
	return true;
}
//==============================================================================
CMD:veh1( playerid, params[] ) { // test cmd
	
	new Float:Pos[ 3 ];
	GetPlayerPos( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
	new carid = CreateVehicle( 560, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ], 0.0, -1, -1, -1 );
	
	new engine, lights, alarm, doors, bonnet, boot, objective;

    GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(carid, 1, lights, alarm, 0, 0, 0, objective);
	return true;
}
//==============================================================================
CMD:veh2( playerid, params[] ) { // test cmd

	new Float:Pos[ 3 ];
	GetPlayerPos( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
	new carid = CreateVehicle( 402, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ], 0.0, -1, -1, -1 );

	new engine, lights, alarm, doors, bonnet, boot, objective;

    GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(carid, 1, lights, alarm, 0, 0, 0, objective);
	return true;
}
//==============================================================================
CMD:veh3( playerid, params[] ) { // test cmd

	new Float:Pos[ 3 ];
	GetPlayerPos( playerid, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ] );
	new carid = CreateVehicle( 562, Pos[ 0 ],Pos[ 1 ],Pos[ 2 ], 0.0, -1, -1, -1 );

	new engine, lights, alarm, doors, bonnet, boot, objective;

    GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(carid, 1, lights, alarm, 0, 0, 0, objective);
	return true;
}
