/*

CAR RADIO SCRIPT - USE /carradio IN A CAR TO STREAM TO ALL PLAYERS IN SAID CAR!

Credits to Jerm from SAMP Forums for coding this script.
Credits to NinjahZ from SAMP Forums for his radio script. (Based this script off of his.)
Credits to SA-MP Team - for a_samp.

*/

#define FILTERSCRIPT

#include <a_samp>

#define DIALOG_MAIN 1870
#define DIALOG_SONG 1872
#define	DIALOG_LEFTCAR 1873

#pragma tabsize 0

new carradio[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
	if(carradio[playerid] == 1)
	{
		carradio[playerid] = 0;
		StopAudioStreamForPlayer(playerid);
	}
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	if(carradio[killerid] == 1)
	{
		carradio[killerid] = 0;
		StopAudioStreamForPlayer(killerid);
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_DRIVER)
	{
		if(carradio[playerid] == 1)
		{
		    carradio[playerid] = 0;
			StopAudioStreamForPlayer(playerid);
		}
    }
    if(oldstate == PLAYER_STATE_PASSENGER)
	{
		if(carradio[playerid] == 1)
		{
		    carradio[playerid] = 0;
			StopAudioStreamForPlayer(playerid);
		}
    }
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(carradio[playerid] == 1)
	{
		carradio[playerid] = 0;
		StopAudioStreamForPlayer(playerid);
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_MAIN)
	{
		if(response) 
		{
			if(listitem == 0) 
            {
                if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xFF0000FF, "You must be in a vehicle to select a URL!");
                ShowPlayerDialog(playerid,DIALOG_SONG,DIALOG_STYLE_INPUT,"Input URL","Type a song or radio station URL here.","Listen","Cancel");
            }
            if(listitem == 1) 
            {
				carradio[playerid] = 0;
				StopAudioStreamForPlayer(playerid);
            }
   		}
	}
	if(dialogid == DIALOG_SONG)
	{
	    	if(!response) 
        	{
           	 //	This is neccessary so that if a player cancels it doesn't play a blank stream for players.
        	}
        	else if(strlen(inputtext) < 64 || strlen(inputtext) > 0)
        	{
				new vehicle = GetPlayerVehicleID(playerid);
                for(new i; i < MAX_PLAYERS; i++)
                {
					new playercar = GetPlayerVehicleID(i);
					if(playercar == vehicle)
                    {
						carradio[i] = 1;
						PlayAudioStreamForPlayer(i, inputtext);
					}
				}
				new changer[MAX_PLAYER_NAME+1], string[48+MAX_PLAYER_NAME+1];
    			GetPlayerName(playerid, changer, sizeof(string));
         		new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				for(new i2; i2 < MAX_PLAYERS; i2++)
				{
					if(IsPlayerInRangeOfPoint(i2, 10.0, x, y, z))
					{
        				format(string, sizeof(string),  "%s reaches for the car stereo and turns some knobs.", changer);
						SendClientMessage(i2, 0xC2A2DAAA, string);
					}
				}
        	}
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp(cmdtext, "/carradio",true)==0)
	{
    	if(!IsPlayerInAnyVehicle(playerid)) return ShowPlayerDialog(playerid, DIALOG_LEFTCAR, DIALOG_STYLE_MSGBOX, "Car Radio","Use this to play song/radio URLS for players within the same car as you!", "Okay", "Cancel");
		ShowPlayerDialog(playerid, DIALOG_MAIN, DIALOG_STYLE_LIST, "Car Radio","{BB0000}Song/Radio URL\n{BB0000}Turn Off Your Current Stream", "Select", "Cancel");
		return 1;
	}
	return 0;
}
