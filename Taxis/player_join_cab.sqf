//player_join_cab.sqf | NibbleGaming Taxis v.1 | by Fivenine

private ["_gotIn","_cab"];
_cab = _this select 0;
_gotIn = _this select 2;

if (_gotIn == player) then {
player removeaction addcab;
//get destination positions and names
_destarray = _cab getVariable "destinations";
_WP1 	= _destarray select 0;
_name1 	= _destarray select 1;
_WP2 	= _destarray select 2;
_name2 	= _destarray select 3;
_WP3 	= _destarray select 4;
_name3 	= _destarray select 5;
_WP4 	= _destarray select 6;
_name4	= _destarray select 7;

gotout = false;
chosen = false;
//RemoveAllActions _cab; //shouldnt be needed 
			
	[_cab] spawn { 
		_cab = _this select 0;
		while {true}do{
			while{player==driver _cab}do{
				_cab setVariable ["AskStopCab", true, true];
				sleep 1;
				cutText [chatter_stealcab, "PLAIN DOWN",1];
				sleep 1;
				player action ["MOVETOCARGO",vehicle player,0];
			};
			
		};
	};
	
	if (_cab getVariable "gotpassenger") then {
		cutText ["Taxi is controlled by another player, wait for him to choose destination", "PLAIN DOWN",0.5];
		isjustpassenger = true;
		waituntil {_cab getVariable ["cabdest",0] > 0};
		_chosendest=nil;
		_destnr = _cab getVariable "cabdest";    
		switch (_destnr) do {
			case 1: { _chosendest = _name1; };
			case 2: { _chosendest = _name2; };
			case 3: { _chosendest = _name3; };
			case 4: { _chosendest = _name4; };
			case 0: { _chosendest = "nowhere"; };
		}; 
		_notify = format ["taxi is heading for %1", _chosendest];
		["cabtext",[_notify]] call bis_fnc_showNotification; 
		stopcab = _cab addaction ["<t color='#FF00FF'>Stop the cab!</t>",{(_this select 0) setVariable ["AskStopCab", true, true];},"",-99,false,false,"",""];
	} else {
	
	cutText [chatter_welcome, "PLAIN DOWN",1];
	isjustpassenger = false;
	_cab setvariable ["gotin", true, true];
	add1 = _cab addaction [format ["<t color='#00FF00'>Take me to %1</t>",_name1],{(_this select 0) setvariable ["cabdest", 1, true];},"",-94,false,true,"",""];
	add2 = _cab addaction [format ["<t color='#00FF00'>Take me to %1</t>",_name2],{(_this select 0) setvariable ["cabdest", 2, true];},"",-95,false,true,"",""];
	add3 = _cab addaction [format ["<t color='#00FF00'>Take me to %1</t>",_name3],{(_this select 0) setvariable ["cabdest", 3, true];},"",-96,false,true,"",""];
	add4 = _cab addaction [format ["<t color='#00FF00'>Take me to %1</t>",_name4],{(_this select 0) setvariable ["cabdest", 4, true];},"",-97,false,true,"",""];
	
	fnc_marker = {
	_mrkr = createMarkerLocal [(_this select 0),(_this select 1)];
	_mrkr setMarkerShapeLocal "ICON";
	_mrkr setMarkerTypeLocal "mil_dot";
	_mrkr setMarkertextLocal (_this select 0);
	_mrkr setMarkerColorLocal "ColorYellow";
	};

	[_name1,_WP1] call fnc_marker;
	[_name2,_WP2] call fnc_marker;
	[_name3,_WP3] call fnc_marker;
	[_name4,_WP4] call fnc_marker;
		
	
	waituntil {_cab getvariable ["cabdest",0]>0} or {gotout};
	removeAllActions _cab;
	deletemarkerLocal _name1;
	deletemarkerLocal _name2;
	deletemarkerLocal _name3;
	deletemarkerLocal _name4;
	if (gotout) exitwith {};

		_chosendest = nil;
		_destnr = _cab getVariable "cabdest";    
		switch (_destnr) do {
		case 1: { _chosendest = _name1; };
		case 2: { _chosendest = _name2; };
		case 3: { _chosendest = _name3; };
		case 4: { _chosendest = _name4; };
		case 0: { _chosendest = "nowhere"; };
		}; 

	_notify = format ["taxi is heading for %1", _chosendest];
	["cabtext",[_notify]] call bis_fnc_showNotification; 
	
	stopcab = _cab addaction ["<t color='#FF00FF'>Stop the cab!</t>",{(_this select 0) setVariable ["AskStopCab", true, true];},"",-98,false,false,"",""];
	
	addpay = _cab addaction ["<t color='#FFFF00'>Pay the driver 50 krypto</t>",{
				_alreadypaid = (_this select 0) getvariable "plyrpaid";
				if (!_alreadypaid) then {
					if (EPOCH_playerCrypto >= cabcost) then {
						EPOCH_playerCrypto = EPOCH_playerCrypto - cabcost; 
						(_this select 0) setVariable ["plyrpaid", true, true];
						systemchat chatter_paysuccess; 
						(_this select 0) removeaction addpay;
						_notifypayed = format ["You payed driver %1 krypto", cabcost];
						["cabtext",[_notifypayed]] call bis_fnc_showNotification; 
					} else {
						["cabtext",["You haven't got enough krypto"]] call bis_fnc_showNotification; 
						systemchat chatter_payfail; 
						(_this select 0) setVariable ["AskStopCab", true, true];
						sleep 3;
						player action ["Eject",vehicle player];};
				} else {
					["cabtext",["Someone already payed"]] call bis_fnc_showNotification;
					(_this select 0) removeaction addpay;
				};
			},"",-99,false,false,"",""];

	chosen = false;
	uiSleep 10;
	if (gotout) exitwith {};
	_notifycost = format ["Taxis cost %1 krypto", cabcost];
	["cabtext",[_notifycost]] call bis_fnc_showNotification; 
	systemchat chatter_gen1;
	};
	uiSleep 10;
	if (gotout) exitwith {};
	systemchat chatter_gen2;
	
	uiSleep 30;
	if (gotout) exitwith {};
	systemchat chatter_gen3;
	
	uiSleep 30;
	if (gotout) exitwith {};
	systemchat chatter_gen4;

	uiSleep 20;
	if (gotout) exitwith {};
	systemchat chatter_gen5;
	

};
