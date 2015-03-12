//cab2_init.sqf | NibbleGaming Taxis v.1 | by Fivenine

cab2occupied = true;
PublicVariable "cab2occupied";

_namecab = "nr2"; //needs to be either "nr1", "nr2", "nr3" for now..
_spawnpos = [18295.9,14204.6,0]; //where cab spawns
_unitpos = [18292.1,14209.5,0]; //where driver spawns, (should be close to cab spawn)
_FirstWP = [18432.3,14275.1,0]; //just outside trader, where cab waits for players
_dir = 53.2263; //direction of spawned cab

//set destination waypoint positions of cab2
_WP1 	= [26949,23257.3,0]; //molos
_name1 	= "molos";
_WP2 	= [20799.2,6775.98,0]; //selekano
_name2 	= "selekano";
_WP3 	= [9426.66, 15908.9,0]; //agios
_name3 	= "agios";
_WP4 = [14015.4, 18573.3,0]; //athira
_name4 	= "athira";

_params = [_namecab,_spawnpos,_unitpos,_FirstWP,_dir,_WP1,_name1,_WP2,_name2,_WP3,_name3,_WP4,_name4];

cab2scripthandler = [_params] execVM "x\addons\Nibble\cab_main.sqf";
waitUntil {scriptDone cab2scripthandler};
cab2occupied = false;
PublicVariable "cab2occupied";