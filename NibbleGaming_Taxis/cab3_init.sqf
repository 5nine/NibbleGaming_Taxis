//cab3_init.sqf | NibbleGaming Taxis v.1 | by Fivenine

cab3occupied = true;
PublicVariable "cab3occupied";

_namecab = "nr3"; //needs to be either "nr1", "nr2", "nr3" for now..
_spawnpos = [6069.48,16744.2,0]; //where cab spawns
_unitpos = [6068.48,16743.2,0]; //where driver spawns, (should be close to cab spawn)
_FirstWP = [6164.83,16820.3,0]; //just outside trader, where cab waits for players
_dir = 53.2263; //direction of spawned cab

//set destination waypoint positions of cab2
_WP1 	= [4583.98,21430.9,0]; //Oreokastro
_name1 	= "Oreokastro";
_WP2 	= [5038.12,11337,0]; //Panochori
_name2 	= "Panochori";
_WP3 	= [9518.64,20355.6,0]; //Abdera
_name3 	= "Abdera";
_WP4 = [14015.4, 18573.3,0]; //athira
_name4 	= "athira";

_params = [_namecab,_spawnpos,_unitpos,_FirstWP,_dir,_WP1,_name1,_WP2,_name2,_WP3,_name3,_WP4,_name4];

cab3scripthandler = [_params] execVM "x\addons\Nibble\cab_main.sqf";
waitUntil {scriptDone cab3scripthandler};
cab3occupied = false;
PublicVariable "cab3occupied";