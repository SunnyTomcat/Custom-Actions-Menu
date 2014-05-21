Nox's Custom Action Menu
==================

Picture coming soon

# Install Instructions

1. ***[Download the Zip File](https://github.com/noxsicarius/WPDs-Action-Menu/archive/master.zip)***
	
	> Recommended PBO tool for all "pack", "repack", or "unpack" steps: ***[PBO Manager](http://www.armaholic.com/page.php?id=16369)***

1. Navigate to your MPMissions folder. If you rent a server log into your server via FTP or your host's File Manager, find, and download your MPMissions file.
 
	> Note: "Your_Mission.pbo" is a placeholder name. Your mission might be called "DayZ_Epoch_11.Chernarus", "DayZ_Epoch_13.Tavi", or "dayz_mission" depending on hosting and chosen map.

1. Extract the the project zip.
1. Move the ***actions*** folder into the root of your mission folder.
1. If you do not have a custom compiles and fn_selfFunctions.sqf do step (A). If you have a custom compiles.sqf do step (B).
	   
	> #### (A)

	> Move the custom folder into your MPMissions folder.
	> Navigate to your mission's init.sqf file
	> Find this line:

	> 	~~~~java
	> 	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	> 	~~~~

	> And place this directly below it:

	> 	~~~~java
	> 	call compile preprocessFileLineNumbers "custom\compiles.sqf";
	> 	~~~~

	> It should now look like this:

	> 	~~~~java
	> 	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	> 	call compile preprocessFileLineNumbers "custom\compiles.sqf";
	> 	~~~~

	> #### (B)

	> Open your custom ***fn_sselfActions.sqf***

	> Locate the following line of code:
	> 	~~~~java
	>	_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
	>	~~~~
	
	>	And place this code below it:
	> 	~~~~java
	> 	/*----------------- NoxSicarius' Custom Action Menu -------------------------------*/
	>	if(_canDo && !_inVehicle && !_isPZombie) then {
	>		s_player_customAction = player addaction [ ("<t color=""#FE9A2E"">" + ("Action Menu") + "</t>"),"actions\Actions_menu.sqf","",6,false,true,"",""];
	>	}else{
	>		player removeAction s_player_customAction;
	>		s_player_customAction = -1;
	>	};
	>	/*----------------- NoxSicarius' Custom Action Menu -------------------------------*/
	> 	~~~~

#### If you use my Epoch Admin Tools then skip the remaining steps. Otherwise, continue.

1. Open ***actions\Actions_Menu.sqf*** and replace "111111111" near the top of the file with your player UID. 
1. Locate your ***@DayZ_Epoch_Server/addons/dayz_server.pbo*** on your server host, download and unpack it, and open the resulting ***dayz_server*** folder.
1. Open ***init/server_functions.sqf*** and replace this:

    ~~~~java
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
    ~~~~
    
	...with this:

    ~~~~java
        if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x)  && !((typeOf vehicle _x) in DZE_safeVehicle) && (vehicle _x getVariable ["MalSar",0] !=1)) then {
    ~~~~
    
	> Note: This step may not work well if you use other mods that modify this operator. The important code to fit into this operator is `(vehicle _x getVariable ["MalSar",0] !=1)` which can be added easily with a rudimentary knowledge of programming.

	1. Now open your ***compile/server_updateObject.sqf***
	Locat this code:
    ~~~~java
    if (!_parachuteWest and !(locked _object)) then {
    ~~~~

	And place the following code directly ABOVE it:
    ~~~~java
    // Epoch Admin Tools
    if (_object getVariable "MalSar" == 1) exitWith {};
    ~~~~

5. Repack the server pbo and upload it to your server. 


####IF you are using special antihack add the following to your AHconfig.sqf

	~~~~java
	,'#USER:ActionMenu','#USER:ActionsMenu','#USER:VehicleMenu','#USER:FunMenu','#USER:MovementMenu','#USER:TransformAnimalMenu'
	~~~~