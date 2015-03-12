
diag_log "#NibbleGaming: Starting Nibblescripts";

spawn_cab			= compile preprocessFileLineNumbers "x\addons\Nibble\compile\spawn_cab.sqf";
spawn_AI			= compile preprocessFileLineNumbers "x\addons\Nibble\compile\spawn_AI.sqf";

[] execVM "x\addons\Nibble\variables.sqf";
//[] execVM "x\addons\Nibble\cabUS_server.sqf"; //temp for testing


