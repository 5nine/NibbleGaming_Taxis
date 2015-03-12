//spawn_cab.sqf | NibbleGaming Taxis v.1 | by Fivenine

_cab 		= _this select 0;
_dir 		= _this select 1;
_cabDriver 	= _this select 2;


_cab call EPOCH_server_setVToken;
_cab setVariable["LOCK_OWNER", "-1"];
_cab setVariable["LOCKED_TILL", 3.4028235e38];
_cab setDir _dir;
_cab setPos getPos _cab;
_cab setFuel .3;
_cab allowDammage false;
_cab addEventHandler ["HandleDamage", {false}];	

clearWeaponCargoGlobal _cab;
clearMagazineCargoGlobal _cab;
clearBackpackCargoGlobal  _cab;
clearItemCargoGlobal _cab;
_cab addItemCargoGlobal ["WhiskeyNoodle",2];


_cabDriver enableAI "TARGET";
_cabDriver enableAI "AUTOTARGET";
_cabDriver enableAI "MOVE";
_cabDriver enableAI "ANIM";
_cabDriver enableAI "FSM";
_cabDriver allowDammage false;
_cabDriver setCombatMode "GREEN";
_cabDriver setBehaviour "CARELESS";
removeAllWeapons _cabDriver;
_cabGroup selectLeader _cabDriver;
_cabDriver addEventHandler ["HandleDamage", {false}];	
sleep 1;
_cabDriver assignAsDriver _cab;
_cabDriver moveInDriver _cab;
