//variables.sqf | NibbleGaming Taxis v.1 | by Fivenine

cab1occupied = false;
publicVariable "cab1occupied";
cab2occupied = false;
publicVariable "cab2occupied";
cab3occupied = false;
publicVariable "cab3occupied";

diag_log "#NibbleGaming Taxis: Published client variables";

"Callcab" addPublicVariableEventHandler {
	if ((_this select 1) == ("Cab1")) then {
	[] execVM "x\addons\Nibble\cab1_init.sqf";
	};
	if ((_this select 1) == ("Cab2")) then {
	[] execVM "x\addons\Nibble\cab2_init.sqf";
	};
	if ((_this select 1) == ("Cab3")) then {
	[] execVM "x\addons\Nibble\cab3_init.sqf";
	};
};
diag_log "#NibbleGaming Taxis: added Callcab variable eventhandler";