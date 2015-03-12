NibbleGaming Taxis for Arma 3: Epoch, by Fivenine

Install Instructions:
1. Copy folder "Taxis" to your mission folder (or inside your mission.pbo)

2. Copy "NibbleGaming_Taxis.pbo" to your "@epochhive\addons" folder. 

3. read "add to.txt" and insert those parts to init.sqf, description.ext and mission.sqm (all located within your missionfolder or mission.pbo)


Infistar:
In run.sqf, make sure these config options are set as followed:

/*  Notification check   */ _UNC = false;

/*  HandleDamage check   */ _HDC = false;	(perhaps not needed because it only applies to driver, which is serverside)
/*  Remove Hit Handler   */ _REH = false;	(perhaps not needed because it only applies to driver, which is serverside)
/*  Revert HandleDamage  */ _RHD = false;	(perhaps not needed because it only applies to driver, which is serverside)

/*  Remove Action Plrs   */ _OAP = false;
/*  Remove Action Objs   */ _OAO = false;
/*  Use Anti Teleport    */ _UAT = false;  	(can probably be true, but if server lags the taxi jumps a bit, which can be mistaken for teleport)

/*  Check Local Markers  */ _CLM = false;	
_UVC = false;


optional config:
 
 - inside "Taxis" folder, edit chatter_cab*.sqf to your liking, those are the chatmessages from the driver.
 
 - dePbo "NibbleGaming_Taxis.pbo" and edit each cab*_init.sqf to customize spawnpositions, destinations and so on. 

 
