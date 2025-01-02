//Map Filterscript Exported with Texture Studio By: [uL]Pottus///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <a_samp>
#include <streamer>

new carvid_0;
new carvid_1;

public OnFilterScriptInit()
{
    new tmpobjid;

    carvid_0 = CreateVehicle(508,1998.1232,-2366.8823,13.6295,185.9327,2,0,-1);
    AddVehicleComponent(carvid_0,1010);
    AddVehicleComponent(carvid_0,1025);
    carvid_1 = CreateVehicle(611,1998.1232,-2366.8823+5,13.6295+3,185.9327,0,0,-1);
	AttachTrailerToVehicle(carvid_1,carvid_0);
	LinkVehicleToInterior(carvid_1,1);


    tmpobjid = CreateDynamicObject(19601,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "barrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 0.000, 3.358, -0.830, 0.000, 180.000, 180.000);
    tmpobjid = CreateDynamicObject(19868,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -1.251, -1.571, -1.460, 0.000, 0.000, 90.000);
    tmpobjid = CreateDynamicObject(19868,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 1.251, -1.571, -1.460, 0.000, 0.000, -90.000);
    tmpobjid = CreateDynamicObject(1593,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -0.847, 3.612, -0.680, 0.000, 90.000, 100.299);
    tmpobjid = CreateDynamicObject(1593,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 0.847, 3.612, -0.680, 0.000, 90.000, 80.699);
    tmpobjid = CreateDynamicObject(2899,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -1.470, -1.350, 0.710, 0.000, 270.000, 0.000);
    tmpobjid = CreateDynamicObject(2899,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 1.470, -1.350, 0.710, 0.000, 90.000, 0.000);
    tmpobjid = CreateDynamicObject(2899,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -1.470, -0.730, -0.339, 0.000, -90.000, 0.000);
    tmpobjid = CreateDynamicObject(19843,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_vent1", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 0.479, 2.081, 0.443, 57.500, 0.000, 180.000);
    tmpobjid = CreateDynamicObject(19843,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_vent1", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -0.479, 2.081, 0.443, 301.399, 0.000, 360.000);
    tmpobjid = CreateDynamicObject(19844,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 1.328, -2.311, -0.830, 0.000, 90.000, 0.000);
    tmpobjid = CreateDynamicObject(19844,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -1.328, -2.311, -0.830, 0.000, -90.000, 0.000);
    tmpobjid = CreateDynamicObject(2899,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 0, 13659, "8bars", "AH_gbarrier", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 1.491, -0.700, -0.390, 0.000, 90.000, 0.000);
    tmpobjid = CreateDynamicObject(19279,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, -0.770, 2.400, 1.459, -76.400, 0.000, 0.000);
    tmpobjid = CreateDynamicObject(19279,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_0, 0.770, 2.400, 1.459, -70.099, 0.000, 0.000);

    tmpobjid = CreateDynamicObject(3175,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, 0.000, -2.549, -0.760, 0.000, 0.000, 0.000);
    tmpobjid = CreateDynamicObject(19868,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, -1.111, -1.571, -0.920, 0.000, 0.000, 90.000);
    tmpobjid = CreateDynamicObject(19868,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterial(tmpobjid, 1, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    SetDynamicObjectMaterial(tmpobjid, 2, 5150, "wiresetc_las2", "ganggraf01_LA_m", 0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, 1.111, -1.571, -0.920, 0.000, 0.000, -90.000);
    tmpobjid = CreateDynamicObject(19279,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, 0.000, -4.795, 1.849, -59.699, 0.000, 180.000);
    tmpobjid = CreateDynamicObject(1025,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, 0.000, -5.400, 0.360, 0.000, 0.000, 270.000);
    tmpobjid = CreateDynamicObject(1897,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(tmpobjid, carvid_1, 0.000, 1.480, -0.190, 270.000, 0.000, 0.000);


    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        OnPlayerConnect(i);
    }

    return 1;

}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	if(vehicleid == carvid_0)
	{
	    AttachTrailerToVehicle(carvid_1,carvid_0);
	}
	return 1;
}

public OnFilterScriptExit()
{
    DestroyVehicle(carvid_0);
    DestroyVehicle(carvid_1);
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
    if(vehicleid == carvid_0)
    {
        AddVehicleComponent(carvid_0,1010);
    	AddVehicleComponent(carvid_0,1025);
    }
    else if(vehicleid == carvid_1)
    {
		AttachTrailerToVehicle(carvid_1,carvid_0);
		LinkVehicleToInterior(carvid_1,1);
    }
}
