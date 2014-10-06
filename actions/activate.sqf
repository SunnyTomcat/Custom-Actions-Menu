private["_veh", "_idx"];
_idx = -1;

waitUntil {!isNil "dayz_animalCheck"}; // Wait for player to load
waitUntil {!isNil "ActionsConfigLoaded"}; // Wait for config to load

while {alive player} do {
	if(_idx == -1) then {
		_idx = (vehicle player) addaction [("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"actions\Actions_Menu.sqf","",-107,false,true,"",""];
		_veh = vehicle player;
	};
	if (_veh != vehicle player) then
	{
		_veh removeAction _idx;
		_idx = -1;      
	};
	Sleep 2;
};