# NibbleGaming Taxis for Arma 3: Epoch

Epochmod forum post: http://epochmod.com/forum/index.php?/topic/32340-release-taxi-script/

## Install Instructions:

1. Copy folder `Taxis` to your mission folder (or inside your mission.pbo)
2. Compile a pbo from folder `NibbleGaming_Taxis` with the same name.
3. Copy `NibbleGaming_Taxis.pbo` to your `@epochhive\addons` folder.
4. Follow the instructions below

Add this to the bottom of your `init.sqf`:

```sqf
if(isDedicated)exitWith{};
[] execVM "Taxis\player_cab.sqf";
```

Add this to the bottom of your `description.ext`:
```sqf
class CfgNotifications
        {
        class cabtext
            {
            title = "Nibble Taxis";
            iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
            color[] = {0.8,0.8,0,1};
            description = "%1";
            duration = 5;
            priority = 0;
            };
        };
```

Add this to your `mission.sqm` below the closing curly bracket (`};`) of `class Markers`:

```sqf
    class Sensors {
        items = 3;

        class Item0     
        {
            position[] = {13326.5,0.16426,14515.2}; //position of trader 1
            name="trader1";
            activationBy = "ANY";
            repeating = 1;
            interruptable = 1;
            age = "UNKNOWN";
            expCond = "(player distance trader1) < 40;";
            expActiv= "[]execVM ""Taxis\init_cab1.sqf"";";
            expDesactiv = "player removeAction addcab;";
            class Effects{};
            
        };
        class Item1     
        {
            position[] = {18451.9,0.00143814,14278.1}; //position of trader 2
            name="trader2";
            activationBy = "ANY";
            repeating = 1;
            interruptable = 1;
            age = "UNKNOWN";
            expCond = "(player distance trader2) < 40;";
            expActiv= "[]execVM ""Taxis\init_cab2.sqf"";";
            expDesactiv = "player removeAction addcab;";
            class Effects{};
        };
        class Item2 
        {
            
            position[] = {6192.46,0.00154114,16834}; //position of trader 3
            name="trader3";
            activationBy = "ANY";
            repeating = 1;
            interruptable = 1;
            age = "UNKNOWN";
            expCond = "(player distance trader3) < 40;";
            expActiv= "[]execVM ""Taxis\init_cab3.sqf"";";
            expDesactiv = "player removeAction addcab;";
            class Effects{};
        };
    };
```

## Infistar:

In `run.sqf`, make sure these config options are set as followed:

```sqf
/*  Notification check   */ _UNC = false;

/*  HandleDamage check   */ _HDC = false;	//perhaps not needed because it only applies to driver, which is serverside
/*  Remove Hit Handler   */ _REH = false;	//perhaps not needed because it only applies to driver, which is serverside
/*  Revert HandleDamage  */ _RHD = false;	//perhaps not needed because it only applies to driver, which is serverside

/*  Remove Action Plrs   */ _OAP = false;
/*  Remove Action Objs   */ _OAO = false;
/*  Use Anti Teleport    */ _UAT = false;  	//can probably be true, but if server lags the taxi jumps a bit, which can be mistaken for teleport

/*  Check Local Markers  */ _CLM = false;
_UVC = false;
```

## Optional config:

- inside `Taxis` folder, `edit chatter_cab*.sqf` to your liking, those are the chatmessages from the driver.
- dePbo `NibbleGaming_Taxis.pbo` and edit each `cab*_init.sqf` to customize spawnpositions, destinations and so on. 
- If you changed positions in the step above, you also need to edit each position in `mission.sqm` so that it corresponds with positions with each cab. This is needed so the players get the addaction at the correct location. 
