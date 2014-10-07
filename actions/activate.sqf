private["_veh", "_idx"];

waitUntil {!isNil "dayz_animalCheck"}; // Wait for player to load
waitUntil {!isNil "ActionsConfigLoaded"}; // Wait for config to load

_idx = -1;
_player = player;

if((ActionMenuPlayers && !(((getPlayerUID _player) in AdminAndModList))) || (ActionMenuAdmins && ((getPlayerUID _player) in AdminAndModList))) then {
	while {alive player} do {
		if(_idx == -1) then {
			_idx = (vehicle _player) addaction [("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"admintools\actionMenu\Actions_Menu.sqf","",-107,false,true,"",""];
			_veh = vehicle _player;
		};
		if (_veh != vehicle _player) then
		{
			_veh removeAction _idx;
			_idx = -1;      
		};
		Sleep 2;
	};
};