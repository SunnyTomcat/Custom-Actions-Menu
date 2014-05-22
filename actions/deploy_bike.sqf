private ["_mags","_weapons","_canDo","_onLadder","_finished","_finishedTime","_veh","_location","_vehtospawn","_dir"];

_mags = magazines player;
_weapons = weapons player;
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder && !_inVehicle);

if("ItemToolbox" in _weapons && "PartGeneric" in _mags && "PartWheel" in _mags && "PartWheel" in _mags) then {
	hasBikeItem = true;
} else { 
	hasBikeItem = false;
	cutText ["\n\n2x scrap metal and 2x wheels required to build bike", "PLAIN DOWN"];
};

if (hasBikeItem && _canDo && dayz_combat == 1) then {
    cutText ["You are in Combat and cannot build a bike.", "PLAIN DOWN"];
};

if (hasBikeItem && _canDo && (dayz_combat !=1)) then {
	player removeMagazine "PartGeneric";
	player removeMagazine "PartGeneric";
	player removeMagazine "PartWheel";
	player removeMagazine "PartWheel";

	player playActionNow "Medic";
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,10,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+10;

	while {r_doLoop} do {
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};

	if (_finished) then {
		_vehtospawn = "Old_bike_TK_CIV_EP1"
		_dist = 10;
		_charID = dayz_characterID;
		_dir = getDir vehicle player;
		_pos = getPosATL vehicle player;
		_pos = [(_pos select 0)+_dist*sin(_dir),(_pos select 1)+_dist*cos(_dir),0];
		_worldspace = [_dir,_pos]; 
		_location = _pos;
		_veh = createVehicle [_vehtospawn, _pos, [], 0, "CAN_COLLIDE"];
		_veh setVariable ["MalSar",1,true];
		
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;

		cutText ["You have built a bike!", "PLAIN DOWN"];
		sleep 10;
		cutText ["Warning: Spawned bikes DO NOT SAVE after server restart!", "PLAIN DOWN"];
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		player addMagazine "PartGeneric";
		player addMagazine "PartGeneric";
		player addMagazine "PartWheel";
		player addMagazine "PartWheel";
		cutText ["\n\nCanceled building a bike!", "PLAIN DOWN"];
	};
} else {
	if(!_canDo) then {
		cutText ["You are in a vehicle or already performing an action","PLAIN DOWN"];
	};
};