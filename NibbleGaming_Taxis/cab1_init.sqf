//cab1_init.sqf | NibbleGaming Taxis v.1 | by Fivenine

cab1occupied = true;
PublicVariable "cab1occupied";

_namecab = "nr1"; //needs to be either "nr1", "nr2", "nr3" for now..
_spawnpos = [13178.8, 14481.4, 0]; //where cab spawns
_unitpos = [13180.7, 14583.3,0]; //where driver spawns, (should be close to cab spawn)
_FirstWP = [13295, 14563.6,0]; //just outside trader, where cab waits for players
_dir = 53.2263; //direction of spawned cab

//set destination waypoint positions of cab1
_WP1 	= [16169.4, 17369.6,0]; //Telos
_name1 	= "telos";
_WP2 	= [14015.4, 18573.3,0]; //athira
_name2 	= "athira";
_WP3 	= [9426.66, 15908.9,0]; //agios
_name3 	= "agios";
_WP4 = [11012, 13483.2,0]; //Poliakko
_name4 	= "Poliakko";

_params = [_namecab,_spawnpos,_unitpos,_FirstWP,_dir,_WP1,_name1,_WP2,_name2,_WP3,_name3,_WP4,_name4];

cab1scripthandler = [_params] execVM "x\addons\Nibble\cab_main.sqf";
waitUntil {scriptDone cab1scripthandler};
cab1occupied = false;
PublicVariable "cab1occupied";