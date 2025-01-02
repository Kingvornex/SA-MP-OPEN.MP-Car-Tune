Part 1 - Define your tuned car. Goes as the following:
At the top of your script add:
For example:

pawn Code:
new tunnedElegy;
Part 2. - Under OnGameModeInIt We add the declare.

pawn Code:
tunnedElegy = AddStaticVehicle(CODE HERE);//This will be your Car
AddVehicleComponent(tunnedElegy, componentid);//Here will be your component's for the car
pawn Code:
AddVehicleComponent(carID, ComponentID);
The carID is the ID of the vehicle we want to give the component to (the name of the vehicle, in this case "tunnedElegy". The componentID is the ID of the car part which you wish to give to your vehicle.
For example:

pawn Code:
public OnGameModeInit()
{
tunnedElegy = AddStaticVehicle(CODE HERE);
AddVehicleComponent(tunnedElegy, 1035); // roof
AddVehicleComponent(tunnedElegy, 1079); // rim 
AddVehicleComponent(tunnedElegy, 1037); // exhaust 
AddVehicleComponent(tunnedElegy, 1039); // side 
AddVehicleComponent(tunnedElegy, 1172); // front 
AddVehicleComponent(tunnedElegy, 1148); // back 
AddVehicleComponent(tunnedElegy, 1146); // Spoiler
// Don't use these lines if it's a filterscript
SetGameModeText("Blank Script");
AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
return 1;
}
This will give us all of our components we need. However we also need a paint job. So we use a different function for this called "
pawn Code:
ChangeVehiclePaintjob(carid,paintjobid);
the Id we are using is either 0,1 or 2. In this example i am using 1. So i will add this to the TOP of the list of components. We now have this:

pawn Code:
public OnGameModeInit()
{
tunnedElegy = AddStaticVehicle(CODE HERE);
ChangeVehiclePaintjob(tunnedElegy,1); // paint job 
AddVehicleComponent(tunnedElegy, 1035); // roof
AddVehicleComponent(tunnedElegy, 1079); // rim 
AddVehicleComponent(tunnedElegy, 1037); // exhaust 
AddVehicleComponent(tunnedElegy, 1039); // side 
AddVehicleComponent(tunnedElegy, 1172); // front 
AddVehicleComponent(tunnedElegy, 1148); // back 
AddVehicleComponent(tunnedElegy, 1146); // Spoiler
// Don't use these lines if it's a filterscript
SetGameModeText("Blank Script");
AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
return 1;
}
Part 3 - Adding them to OnVehicleSpawn.

Under OnVehicleSpawn add the same AddVehicleComponents.
pawn Code:
public OnVehicleSpawn(vehicleid)
{
if (vehicleid == tunnedElegy){
    ChangeVehiclePaintjob(tunnedElegy,1); // paint job
    AddVehicleComponent(tunnedElegy, 1035); // roof 
    AddVehicleComponent(tunnedElegy, 1079); // rim 
    AddVehicleComponent(tunnedElegy, 1037); // exhaust
    AddVehicleComponent(tunnedElegy, 1039); // side
    AddVehicleComponent(tunnedElegy, 1172); // front
    AddVehicleComponent(tunnedElegy, 1148); // back 
    AddVehicleComponent(tunnedElegy, 1146); // Spoiler
}
return 1;
}
Part 4 - You are Finished
