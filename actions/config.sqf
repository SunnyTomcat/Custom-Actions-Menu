/* 
	If you use Nox's Epoch Admin Tools disregard this if code.
	If you do not use that admin tool then replace 111111111 with
	your UID if you want to use the Fun Menu transformation.
	If you do not want to use the transformations then skip this
*/
if(isNil "AdminList") then {
	AdminList = [
	"111111111",
	"999999999",
	"999999999"
	];
	ModList = [
	"999999999",
	"999999999"
	];
};


/****** Bike variables ******/
// This option requires players to have a toolbox to build a bike
RequireToolBoxBike = true;

// This option requires players to have the parts for building a bike
RequirePartsBike = true;

// This option dictates if players are allowed to repack a bike to get their items back
AllowPackBike = true;


/****** Mozzie variables ******/
// This option requires players to have a toolbox to build a Mozzie
RequireToolBoxMozzie = true;

// This option requires players to have the parts for building a Mozzie
RequirePartsMozzie = true;

// This option dictates if players are allowed to repack a mozzie to get their items back
AllowPackMozzie = true;


/****** DO NOT MODIFY BELOW THIS ********/
ActionsConfigLoaded = true;