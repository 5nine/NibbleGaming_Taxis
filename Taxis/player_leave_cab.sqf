//player_leave_cab.sqf | NibbleGaming Taxis v.1 | by Fivenine

private "_cab";
_cab = _this select 0;

gotout = true;
RemoveAllActions _cab; 
if (!isjustpassenger) then { 
_cab setVariable ["gotout", true, true];
} else {
_cab setVariable ["passengergotout", true, true];	
};