//cab_main.sqf | NibbleGaming Taxis v.1 | by Fivenine

private ["_namecab", "_cabDriver", "_spawnpos", "_unitpos", "_FirstWP", "_dir", "_destarray"];

_namecab 	= (_this select 0 select 0);
_spawnpos 	= (_this select 0 select 1);
_unitpos 	= (_this select 0 select 2);
_FirstWP 	= (_this select 0 select 3);
_dir 		= (_this select 0 select 4);

_WP1 	= (_this select 0 select 5);
_name1 	= (_this select 0 select 6);
_WP2 	= (_this select 0 select 7);
_name2 	= (_this select 0 select 8);
_WP3 	= (_this select 0 select 9);
_name3 	= (_this select 0 select 10);
_WP4 	= (_this select 0 select 11);
_name4 	= (_this select 0 select 12);

_destarray = [_WP1,_name1,_WP2,_name2,_WP3,_name3,_WP4,_name4];

diag_log format ["#NibbleGaming: taxi %1: Player called cab, spawning it now!",_namecab];


//create group and first waypoint
_cabGroup = createGroup EAST;
_cabGroup setSpeedMode "normal";
_WP = _cabGroup addWaypoint [_FirstWP,1,1];
_WP setWaypointType "MOVE";

//create the cab and driver
_cab = createVehicle ["C_Offroad_01_F",_spawnpos,[],0,"CAN_COLLIDE"];	
"C_man_polo_1_F" createUnit [_unitpos, _cabGroup, "_cabDriver = this;", 1, "Private"];

//call cab functions
[_cab,_dir,_cabDriver] call spawn_cab;

//init variables
_cab setVariable [format ["cab%1",_namecab],1,true];	
_cab setVariable ["destinations",_destarray,true]; //send destinations to client for markers
_cab setVariable ["gotin", false];
_cab setVariable ["cabdest", 0, true];
_cab setVariable ["gotpassenger",false,true];

//wait for player to get in
waituntil {_cab getvariable "gotin"};
sleep 1;
_cab setVariable ["gotpassenger",true,true];


diag_log format ["#NibbleGaming: taxi %1: Player got in",_namecab];

 //function to get driver to move on new waypoint
moveonWP = {
	(_this select 0) setWaypointType "MOVE";
	(_this select 1) enableAI "TARGET";
	(_this select 1) enableAI "MOVE";
};


_cab setVariable ["plyrpaid", false, true]; 
//wait for player to choose destination
While {_cab getvariable ["gotin", true]} do {
	_destination = _cab getVariable ["cabdest",0];
		if (_destination==1) exitwith { 
			_WP = _cabGroup addWaypoint [_WP1,1,2]; //telos
			[_WP,_cabDriver] call moveonWP;
			diag_log format ["#NibbleGaming: taxi %1 going to %2",_namecab, _name1];
			};
		if (_destination==2) exitwith { 
			_WP = _cabGroup addWaypoint [_WP2,1,2]; //athira
			[_WP,_cabDriver] call moveonWP;
			diag_log format ["#NibbleGaming: taxi %1 going to %2",_namecab, _name2];
			};
		if (_destination==3) exitwith {
			_WP = _cabGroup addWaypoint [_WP3,1,2]; //agios
			[_WP,_cabDriver] call moveonWP;
			diag_log format ["#NibbleGaming: taxi %1 going to %2",_namecab, _name3];
			};
		if (_destination==4) exitwith {
			_WP = _cabGroup addWaypoint [_WP4,1,2]; //Poliakko
			[_WP,_cabDriver] call moveonWP;
			diag_log format ["#NibbleGaming: taxi %1 going to %2",_namecab, _name4];
			};
	if (_cab getvariable "gotout") exitWith {};
sleep 1;
};

if (_cab getvariable "gotout") exitWith {
	sleep 1;
	deleteVehicle _cabDriver; 
	deleteVehicle _cab;
};

_cab setVariable ["AskStopCab", false, true];

//function to get cab to stop when player ask
[_cab] spawn {
	private ["_cab","_cabDriver"];
	_cab = _this select 0;
	_cabDriver = driver _cab;
	while {alive _cab} do {
		waitUntil {_cab getVariable "AskStopCab"};
			_cabDriver disableAI "TARGET";
			_cabDriver disableAI "MOVE";
			sleep 6;
			_cabDriver enableAI "TARGET";
			_cabDriver enableAI "MOVE";
			_cab setVariable ["AskStopCab", false, true];
			};
		};


_reinforcemode = false;


while {alive _cab}  do {

	//refuel cab
	if(fuel _cab < 0.2) then {
		_cab setFuel 0.3;
	};
		
	//if driver isn't in driver seat, move him there 
	if ((driver _cab != _cabDriver) && (!_reinforcemode)) then { 
		_cabDriver assignAsDriver _cab;
		_cabDriver action ["MOVETODRIVER",_cab];
	};
	
	//if driver dies (should never happen) then delete cab and exit 
	if (isNull _cabDriver) exitWith {
		deleteVehicle _cab;
	};
	
	//if cab dissappears then delete driver and exit (when admins delete cab for instance)
	if (isNull _cab) exitWith {
	deleteVehicle _cabDriver;
	};
	//when player gets out and there is no passengers still in 
	if ((_cab getVariable "gotout") && (count crew _cab < 2)) exitWith { 
	   
	   //if player has payed, exit normally
	   if (_cab getVariable "plyrpaid") then { 
	   		sleep 10;
			deleteVehicle _cabDriver; 
			deleteVehicle _cab;
			_reinforcemode = false;
		
		//if player didnt pay, arm driver and spawn in 2 AI's							
		} else { 
			_reinforcemode = true;
		};
	};
	sleep 0.5;
};

//"didnt pay" mode
if (_reinforcemode) then {
	[_cab,_cabDriver] spawn { 
	//needs to be spawn so main script can end 
	_cab = _this select 0;
	_cabDriver = _this select 1;
	sleep 2;
	if (count crew _cab > 0) then {
	{_x action ["Eject", _cab];}forEach crew _cab;
	};
	_cab setVehicleLock "LOCKED";
	
	[_cabdriver] call spawn_AI;
	
	//cleanup car and AI after 100 and 250 seconds 
	uisleep 100;
	deleteVehicle _cab;
	uisleep 150;
	{deleteVehicle _x; } forEach units group _cabDriver;
	};
};

	


