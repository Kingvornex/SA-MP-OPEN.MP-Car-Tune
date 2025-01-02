#include <a_samp>
#include <dini>
#define DIALOG_TUNING 64
#define COLOUR_RED 0xFF00FFFF
#define COLOUR_WHITE 0xFFFFFFFF
new Float:px, Float:py, Float:pz, Float:prx, Float:pry, Float:prz;
new Float:x, Float:y, Float:z, Float:z_angle;
new vehicleid, VehicleObject[15];
stock _AttachObjectToVehicle(objectid, vehid, Float:ox, Float:oy, Float:oz, Float:rox=0.0, Float:roy=0.0, Float:roz=0.0)
{
    AttachObjectToVehicle(objectid, vehid, ox, oy, oz, 0.0, 0.0, 0.0);
    #pragma unused rox
    #pragma unused roy
    #pragma unused roz
}
#define AttachObjectToVehicle _AttachObjectToVehicle
public OnPlayerCommandText(playerid, cmdtext[])
{
 if(!strcmp("/neontuning", cmdtext)) 
 {
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOUR_RED, "You are not in a vehicle"); 
    switch(GetVehicleModel(GetPlayerVehicleID(playerid)))
    {
      case 445,602,429,496,504,401,518,402,541,527,415,542,589,507,562,585,419,526,466,492,474,494,502,503,411,546,559,551,516,467,603,426,436,547,405,580,560,550,506,549,451,558,540,491,421,477,529:
       {
       ShowPlayerDialog(playerid,DIALOG_TUNING,DIALOG_STYLE_LIST,"Tuning","\n1.Red\n2.Blue\n3.Green\n4.Yellow\n5.Pink\n6.White","Select","Exit");
       }
       default: return SendClientMessage(playerid, COLOUR_RED, "You are not in a tunable vehicle");
    }
    return 1;
 }
 return 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem)
{
    if(dialogid == DIALOG_TUNING && response)
    {
        switch(listitem)
        {
            case 1:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[1] = CreateObject(18647,px,py,pz,prx,pry,prz,10);
                VehicleObject[2] = CreateObject(18647,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[1],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[2],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
            case 2:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[3] = CreateObject(18648,px,py,pz,prx,pry,prz,10);
                VehicleObject[4] = CreateObject(18648,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[3],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[4],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
            case 3:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[5] = CreateObject(18649,px,py,pz,prx,pry,prz,10);
                VehicleObject[6] = CreateObject(18649,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[5],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[6],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
            case 4:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[7] = CreateObject(18650,px,py,pz,prx,pry,prz,10);
                VehicleObject[8] = CreateObject(18650,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[7],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[8],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
            case 5:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[9] = CreateObject(18651,px,py,pz,prx,pry,prz,10);
                VehicleObject[10] = CreateObject(18651,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[9],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[10],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
            case 6:
            {
                GetVehiclePos(vehicleid,Float:x,Float:y,Float:z);
                GetVehicleZAngle(vehicleid,Float:z_angle);
                VehicleObject[11] = CreateObject(18652,px,py,pz,prx,pry,prz,10);
                VehicleObject[12] = CreateObject(18652,px,py,pz,prx,pry,prz,10);
                AttachObjectToVehicle(VehicleObject[11],vehicleid,0.9004, 0.1164, -0.4655,0);
                AttachObjectToVehicle(VehicleObject[12],vehicleid,-0.8706, 0.0570, -0.4655,0);
                GivePlayerMoney(playerid,-1500);
                SendClientMessage(playerid,0x83BFBFAA,"You succesfully added neon to your car!");
            }
        }
    }
    return 0;
} 
