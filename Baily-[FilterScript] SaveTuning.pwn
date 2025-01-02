#include <a_samp>
#include <dini>
/* TUNING SAVER BY Baily */
forward TuneThisCar(vehicleid);
forward LoadModsForAll(vehicleid);
forward SaveModsForAll(vehicleid);
new spoiler[20][0] = {
	{1000},
	{1001},
	{1002},
	{1003},
	{1014},
	{1015},
	{1016},
	{1023},
	{1058},
	{1060},
	{1049},
	{1050},
	{1138},
	{1139},
	{1146},
	{1147},
	{1158},
	{1162},
	{1163},
	{1164}
};

new nitro[3][0] = {
    {1008},
    {1009},
    {1010}
};

new fbumper[23][0] = {
    {1117},
    {1152},
    {1153},
    {1155},
    {1157},
    {1160},
    {1165},
    {1167},
    {1169},
    {1170},
    {1171},
    {1172},
    {1173},
    {1174},
    {1175},
    {1179},
    {1181},
    {1182},
    {1185},
    {1188},
    {1189},
    {1192},
    {1193}
};

new rbumper[22][0] = {
    {1140},
    {1141},
    {1148},
    {1149},
    {1150},
    {1151},
    {1154},
    {1156},
    {1159},
    {1161},
    {1166},
    {1168},
    {1176},
    {1177},
    {1178},
    {1180},
    {1183},
    {1184},
    {1186},
    {1187},
    {1190},
    {1191}
};

new exhaust[28][0] = {
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1028},
    {1029},
    {1037},
    {1043},
    {1044},
    {1045},
    {1046},
    {1059},
    {1064},
    {1065},
    {1066},
    {1089},
    {1092},
    {1104},
    {1105},
    {1113},
    {1114},
    {1126},
    {1127},
    {1129},
    {1132},
    {1135},
    {1136}
};

new bventr[2][0] = {
    {1042},
    {1044}
};

new bventl[2][0] = {
    {1043},
    {1045}
};

new bscoop[4][0] = {
	{1004},
	{1005},
	{1011},
	{1012}
};

new rscoop[13][0] = {
    {1006},
    {1032},
    {1033},
    {1035},
    {1038},
    {1053},
    {1054},
    {1055},
    {1061},
    {1067},
    {1068},
    {1088},
    {1091}
};

new lskirt[21][0] = {
    {1007},
    {1026},
    {1031},
    {1036},
    {1039},
    {1042},
    {1047},
    {1048},
    {1056},
    {1057},
    {1069},
    {1070},
    {1090},
    {1093},
    {1106},
    {1108},
    {1118},
    {1119},
    {1133},
    {1122},
    {1134}
};

new rskirt[21][0] = {
    {1017},
    {1027},
    {1030},
    {1040},
    {1041},
    {1051},
    {1052},
    {1062},
    {1063},
    {1071},
    {1072},
    {1094},
    {1095},
    {1099},
    {1101},
    {1102},
    {1107},
    {1120},
    {1121},
    {1124},
    {1137}
};

new hydraulics[1][0] = {
    {1087}
};

new base[1][0] = {
    {1086}
};

new rbbars[2][0] = {
    {1109},
    {1110}
};

new fbbars[2][0] = {
    {1115},
    {1116}
};

new wheels[17][0] = {
    {1025},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1096},
    {1097},
    {1098}
};

new lights[2][0] = {
	{1013},
	{1024}
};
//
enum tInfo
{
	mod1,
	mod2,
	mod3,
	mod4,
	mod5,
	mod6,
	mod7,
	mod8,
	mod9,
	mod10,
	mod11,
	mod12,
	mod13,
	mod14,
	mod15,
	mod16,
	mod17,
	paintjob,
	colorA,
	colorB,
}
new TuneCar[MAX_VEHICLES][tInfo];

#define FILTERSCRIPT

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("  Tuning SaVe by Baily");
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
}

#endif


public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	LoadModsForAll(vehicleid);
	TuneThisCar(vehicleid);
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	LoadModsForAll(vehicleid);
	TuneThisCar(vehicleid);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    SaveModsForAll(vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}
//
public TuneThisCar(vehicleid)
{
		if(TuneCar[vehicleid][mod1]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod1]); }
		if(TuneCar[vehicleid][mod2]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod2]); }
		if(TuneCar[vehicleid][mod3]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod3]); }
		if(TuneCar[vehicleid][mod4]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod4]); }
		if(TuneCar[vehicleid][mod5]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod5]); }
		if(TuneCar[vehicleid][mod6]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod6]); }
		if(TuneCar[vehicleid][mod7]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod7]); }
		if(TuneCar[vehicleid][mod8]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod8]); }
		if(TuneCar[vehicleid][mod9]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod9]); }
		if(TuneCar[vehicleid][mod10]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod10]); }
		if(TuneCar[vehicleid][mod11]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod11]); }
		if(TuneCar[vehicleid][mod12]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod12]); }
		if(TuneCar[vehicleid][mod13]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod13]); }
		if(TuneCar[vehicleid][mod14]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod14]); }
		if(TuneCar[vehicleid][mod15]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod15]); }
		if(TuneCar[vehicleid][mod16]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod16]); }
		if(TuneCar[vehicleid][mod17]!=0) { AddVehicleComponent(vehicleid,TuneCar[vehicleid][mod17]); }
		if(TuneCar[vehicleid][colorA]!=0 || TuneCar[vehicleid][colorB]!=0)
		{
		ChangeVehicleColor(vehicleid,TuneCar[vehicleid][colorA],TuneCar[vehicleid][colorB]);
		}
		if(TuneCar[vehicleid][paintjob]!=0) { ChangeVehiclePaintjob(vehicleid,TuneCar[vehicleid][paintjob]); }
		return 1;
}
InitComponents(componentid)
{
	new i;
	for(i=0; i<20; i++)
	{
	    if(spoiler[i][0]==componentid) { return 1; }
	}
	for(i=0; i<3; i++)
	{
	    if(nitro[i][0]==componentid) { return 2; }
	}
	for(i=0; i<23; i++)
	{
	    if(fbumper[i][0]==componentid) { return 3; }
	}
	for(i=0; i<22; i++)
	{
	    if(rbumper[i][0]==componentid) { return 4; }
	}
	for(i=0; i<28; i++)
	{
	    if(exhaust[i][0]==componentid) { return 5; }
	}
	for(i=0; i<2; i++)
	{
	    if(bventr[i][0]==componentid) { return 6; }
	}
	for(i=0; i<2; i++)
	{
	    if(bventl[i][0]==componentid) { return 7; }
	}
	for(i=0; i<4; i++)
	{
	    if(bscoop[i][0]==componentid) { return 8; }
	}
	for(i=0; i<13; i++)
	{
	    if(rscoop[i][0]==componentid) { return 9; }
	}
	for(i=0; i<21; i++)
	{
	    if(lskirt[i][0]==componentid) { return 10; }
	}
	for(i=0; i<21; i++)
	{
	    if(rskirt[i][0]==componentid) { return 11; }
	}
	if(hydraulics[0][0]==componentid) { return 12; }
	if(base[0][0]==componentid) { return 13; }
	for(i=0; i<2; i++)
	{
	    if(rbbars[i][0]==componentid) { return 14; }
	}
	for(i=0; i<2; i++)
	{
	    if(fbbars[i][0]==componentid) { return 15; }
	}
	for(i=0; i<17; i++)
	{
	    if(wheels[i][0]==componentid) { return 16; }
	}
	for(i=0; i<2; i++)
	{
	    if(lights[i][0]==componentid) { return 17; }
	}
	return 0;
}
//
public OnVehicleMod(playerid,vehicleid,componentid)
{
new Varz=InitComponents(componentid);
switch (Varz)
{
case 1: { TuneCar[vehicleid][mod1]=componentid; }
case 2: { TuneCar[vehicleid][mod2]=componentid; }
case 3: { TuneCar[vehicleid][mod3]=componentid; }
case 4: { TuneCar[vehicleid][mod4]=componentid; }
case 5: { TuneCar[vehicleid][mod5]=componentid; }
case 6: { TuneCar[vehicleid][mod6]=componentid; }
case 7: { TuneCar[vehicleid][mod7]=componentid; }
case 8: { TuneCar[vehicleid][mod8]=componentid; }
case 9: { TuneCar[vehicleid][mod9]=componentid; }
case 10: { TuneCar[vehicleid][mod10]=componentid; }
case 11: { TuneCar[vehicleid][mod11]=componentid; }
case 12: { TuneCar[vehicleid][mod12]=componentid; }
case 13: { TuneCar[vehicleid][mod13]=componentid; }
case 14: { TuneCar[vehicleid][mod14]=componentid; }
case 15: { TuneCar[vehicleid][mod15]=componentid; }
case 16: { TuneCar[vehicleid][mod16]=componentid; }
case 17: { TuneCar[vehicleid][mod17]=componentid; }
}
printf("Component Added: %d",componentid);
SaveModsForAll(vehicleid);
return 1;
}

public OnVehiclePaintjob(playerid,vehicleid, paintjobid)
{
TuneCar[vehicleid][paintjob]=paintjobid;
return 1;
}
//

public LoadModsForAll(vehicleid)
{
new formatLD[256];
format(formatLD,sizeof(formatLD),"Baily_Carlist/%d.mods",vehicleid);
if(dini_Exists(formatLD))
{
TuneCar[vehicleid][mod1] = dini_Int(formatLD, "mod1");
TuneCar[vehicleid][mod2] = dini_Int(formatLD, "mod2");
TuneCar[vehicleid][mod3] = dini_Int(formatLD, "mod3");
TuneCar[vehicleid][mod4] = dini_Int(formatLD, "mod4");
TuneCar[vehicleid][mod5] = dini_Int(formatLD, "mod5");

TuneCar[vehicleid][mod6] = dini_Int(formatLD, "mod6");
TuneCar[vehicleid][mod7] = dini_Int(formatLD, "mod7");
TuneCar[vehicleid][mod8] = dini_Int(formatLD, "mod8");
TuneCar[vehicleid][mod9] = dini_Int(formatLD, "mod9");
TuneCar[vehicleid][mod10] = dini_Int(formatLD, "mod10");

TuneCar[vehicleid][mod11] = dini_Int(formatLD, "mod11");
TuneCar[vehicleid][mod12] = dini_Int(formatLD, "mod12");
TuneCar[vehicleid][mod13] = dini_Int(formatLD, "mod13");
TuneCar[vehicleid][mod14] = dini_Int(formatLD, "mod14");
TuneCar[vehicleid][mod15] = dini_Int(formatLD, "mod15");

TuneCar[vehicleid][mod16] = dini_Int(formatLD, "mod16");
TuneCar[vehicleid][mod17] = dini_Int(formatLD, "mod17");
TuneCar[vehicleid][paintjob] = dini_Int(formatLD, "paintjob");
TuneCar[vehicleid][colorA] = dini_Int(formatLD, "color1");
TuneCar[vehicleid][colorB] = dini_Int(formatLD, "color2");
}
else
{
dini_Create(formatLD);
}
return 0;
}
public SaveModsForAll(vehicleid)
{
new formatLD[256];
format(formatLD,sizeof(formatLD),"Baily_Carlist/%d.mods",vehicleid);
if(dini_Exists(formatLD))
{
dini_IntSet(formatLD,"mod1",TuneCar[vehicleid][mod1]);
dini_IntSet(formatLD,"mod2",TuneCar[vehicleid][mod2]);
dini_IntSet(formatLD,"mod3",TuneCar[vehicleid][mod3]);
dini_IntSet(formatLD,"mod4",TuneCar[vehicleid][mod4]);
dini_IntSet(formatLD,"mod5",TuneCar[vehicleid][mod5]);
dini_IntSet(formatLD,"mod6",TuneCar[vehicleid][mod6]);
dini_IntSet(formatLD,"mod7",TuneCar[vehicleid][mod8]);
dini_IntSet(formatLD,"mod9",TuneCar[vehicleid][mod9]);
dini_IntSet(formatLD,"mod10",TuneCar[vehicleid][mod10]);
dini_IntSet(formatLD,"mod11",TuneCar[vehicleid][mod11]);
dini_IntSet(formatLD,"mod12",TuneCar[vehicleid][mod12]);
dini_IntSet(formatLD,"mod13",TuneCar[vehicleid][mod13]);
dini_IntSet(formatLD,"mod14",TuneCar[vehicleid][mod14]);
dini_IntSet(formatLD,"mod15",TuneCar[vehicleid][mod15]);
dini_IntSet(formatLD,"mod16",TuneCar[vehicleid][mod16]);
dini_IntSet(formatLD,"mod17",TuneCar[vehicleid][mod17]);
dini_IntSet(formatLD,"paintjob",TuneCar[vehicleid][paintjob]);
dini_IntSet(formatLD,"color1",TuneCar[vehicleid][colorA]);
dini_IntSet(formatLD,"color2",TuneCar[vehicleid][colorB]);
}
else
{
dini_Create(formatLD);
dini_IntSet(formatLD,"mod1",TuneCar[vehicleid][mod1]);
dini_IntSet(formatLD,"mod2",TuneCar[vehicleid][mod2]);
dini_IntSet(formatLD,"mod3",TuneCar[vehicleid][mod3]);
dini_IntSet(formatLD,"mod4",TuneCar[vehicleid][mod4]);
dini_IntSet(formatLD,"mod5",TuneCar[vehicleid][mod5]);
dini_IntSet(formatLD,"mod6",TuneCar[vehicleid][mod6]);
dini_IntSet(formatLD,"mod7",TuneCar[vehicleid][mod8]);
dini_IntSet(formatLD,"mod9",TuneCar[vehicleid][mod9]);
dini_IntSet(formatLD,"mod10",TuneCar[vehicleid][mod10]);
dini_IntSet(formatLD,"mod11",TuneCar[vehicleid][mod11]);
dini_IntSet(formatLD,"mod12",TuneCar[vehicleid][mod12]);
dini_IntSet(formatLD,"mod13",TuneCar[vehicleid][mod13]);
dini_IntSet(formatLD,"mod14",TuneCar[vehicleid][mod14]);
dini_IntSet(formatLD,"mod15",TuneCar[vehicleid][mod15]);
dini_IntSet(formatLD,"mod16",TuneCar[vehicleid][mod16]);
dini_IntSet(formatLD,"mod17",TuneCar[vehicleid][mod17]);
dini_IntSet(formatLD,"paintjob",TuneCar[vehicleid][paintjob]);
dini_IntSet(formatLD,"color1",TuneCar[vehicleid][colorA]);
dini_IntSet(formatLD,"color2",TuneCar[vehicleid][colorB]);
}
return 0;
}
public OnVehicleRespray(playerid,vehicleid, color1, color2)
{
TuneCar[vehicleid][colorA] = color1;
TuneCar[vehicleid][colorB] = color2;
return 1;
}
