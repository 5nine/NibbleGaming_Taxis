//player_cab.sqf | NibbleGaming Taxis v.1 | by Fivenine

private ["_nrcab"];
gotcabinit = true;
waituntil {!(IsNull (findDisplay 46))};
waitUntil {!isNull player};
_nrcab = [];
while {alive player} do
{
	while {count _nrcab <1}do{_nrcab = nearestObjects [getPos player, ["C_Offroad_01_F"], 150];sleep 3;};
	
	{
			if(_x getVariable["cabnr1",0]==1)then{	
			chatter_cab1	= compile preprocessFileLineNumbers "Taxis\chatter_cab1.sqf";
			_getInEvent 	= _x addEventHandler ["GetIn", {call chatter_cab1; _this execVM "Taxis\player_join_cab.sqf"}];
			_getOutEvent 	= _x addEventHandler ["GetOut", {_this execVM "Taxis\player_leave_cab.sqf"}];
			};
			if(_x getVariable["cabnr2",0]==1)then{	
			chatter_cab2	= compile preprocessFileLineNumbers "Taxis\chatter_cab2.sqf";
			_getInEvent 	= _x addEventHandler ["GetIn", {call chatter_cab2; _this execVM "Taxis\player_join_cab.sqf"}];
			_getOutEvent 	= _x addEventHandler ["GetOut", {_this execVM "Taxis\player_leave_cab.sqf"}];
			};
			if(_x getVariable["cabnr3",0]==1)then{	
			chatter_cab3	= compile preprocessFileLineNumbers "Taxis\chatter_cab3.sqf";
			_getInEvent 	= _x addEventHandler ["GetIn", {call chatter_cab3; _this execVM "Taxis\player_join_cab.sqf"}];
			_getOutEvent 	= _x addEventHandler ["GetOut", {_this execVM "Taxis\player_leave_cab.sqf"}];
			};
	} forEach _nrcab;
	_nrcab = [];
};
