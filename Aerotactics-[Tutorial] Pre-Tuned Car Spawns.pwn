// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>

new Tcar;

public OnGameModeInit()
{
    Tcar=AddStaticVehicle(560,2485.6999500,-1667.9000200,13.1000000,0.0000000,111,103); //Sultan
    AddVehicleComponent(Tcar, 1138);
    AddVehicleComponent(Tcar, 1026);
    AddVehicleComponent(Tcar, 1033);
    AddVehicleComponent(Tcar, 1010);
    AddVehicleComponent(Tcar, 1082);
    AddVehicleComponent(Tcar, 1141);
    AddVehicleComponent(Tcar, 1169);
    ChangeVehiclePaintjob(Tcar, 2);
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    //Sultan
    AddVehicleComponent(Tcar, 1138);
    AddVehicleComponent(Tcar, 1026);
    AddVehicleComponent(Tcar, 1033);
    AddVehicleComponent(Tcar, 1010);
    AddVehicleComponent(Tcar, 1082);
    AddVehicleComponent(Tcar, 1141);
    AddVehicleComponent(Tcar, 1169);
    ChangeVehiclePaintjob(Tcar, 2);
    return 1;
}
