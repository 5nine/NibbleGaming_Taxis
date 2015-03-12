//spawn_AI.sqf | NibbleGaming Taxis v.1 | by Fivenine

_cabdriver 	= _this select 0;

_combatgrp = createGroup RESISTANCE;
_combatgrp setCombatMode "RED";
_combatgrp setBehaviour "COMBAT";
[_cabDriver] joinSilent _combatgrp;
_combatgrp selectLeader _cabdriver;
_cabDriver enableAI "TARGET";
_cabDriver enableAI "AUTOTARGET";
_cabDriver enableAI "MOVE";
_cabDriver enableAI "ANIM";
_cabDriver enableAI "FSM";
_cabDriver setCombatMode "RED";
_cabDriver setBehaviour "COMBAT";
_cabDriver addVest "V_Press_F";
_cabDriver addMagazines ["11Rnd_45ACP_Mag", 3];
_cabDriver addWeapon "hgun_Pistol_heavy_01_F";
_cabDriver addHandgunItem "optic_MRD";
_cabDriver allowDammage true;
_cabDriver addEventHandler ["HandleDamage", {true}];

unassignVehicle _cabDriver;
_posdriver = getpos _cabDriver;
		
fnc_backupunit = {
	(_this select 0) enableAI "TARGET";
	(_this select 0) enableAI "AUTOTARGET";
	(_this select 0) enableAI "MOVE";
	(_this select 0) enableAI "ANIM";
	(_this select 0) enableAI "FSM";
	(_this select 0) allowDammage true;
	removeUniform 		(_this select 0);
	removeHeadgear 		(_this select 0);
	removeBackpack 		(_this select 0);
	removeallitems 		(_this select 0);
	removeAllWeapons 	(_this select 0);
	(_this select 0) forceAddUniform "U_NikosAgedBody";
	(_this select 0) addVest "V_Press_F";
	(_this select 0) addHeadgear "H_Hat_grey";
	(_this select 0) addMagazines ["11Rnd_45ACP_Mag", 3];
	(_this select 0) addWeapon "hgun_Pistol_heavy_01_F";
	(_this select 0) addHandgunItem "optic_MRD";
};	
		
_backupunit1 = _combatgrp createUnit ["I_Soldier_EPOCH", _posdriver, [], 200, "FORM"];
[_backupunit1] call fnc_backupunit;
_backupunit1 addWeapon "arifle_MX_GL_Black_F"; 
_backupunit1 addMagazines ["30Rnd_65x39_caseless_mag_Tracer",3]; 
_backupunit1 addPrimaryWeaponItem "acc_pointer_IR"; 
_backupunit1 selectWeapon "arifle_MX_GL_Black_F";

_backupunit2 = _combatgrp createUnit ["I_Soldier_EPOCH", _posdriver, [], 200, "FORM"];
[_backupunit2] call fnc_backupunit;

_backupunit2 addWeapon "M14_EPOCH"; 
_backupunit2 addMagazines ["20Rnd_762x51_Mag",3]; 
_backupunit2 addPrimaryWeaponItem "optic_DMS"; 
_backupunit2 selectWeapon "M14_EPOCH";

