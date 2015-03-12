class CfgPatches {
	class a3_epoch_buses {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_server_settings"};
	};
};
class CfgFunctions {
	class Enigma {
		class main {
			file = "x\addons\Nibble\init";
			class init {
				postInit = 1;
			};
		};
	};
};

