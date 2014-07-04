_pathtoscripts = "actions\";
_EXECscript1 = 'player execVM "'+_pathtoscripts+'%1"';
_EXECscript2 = '["%1"] execVM "actions\FunMenu\morph.sqf"';
_EXECscript3 = '["%1"] execVM "actions\FunMenu\movements.sqf"';

ActionMenu =
[
	["",true],
	["Action Menu >>", [], "#USER:ActionsMenu", -5, [["expression", ""]], "1", "1"],
	["Deploy Menu >>", [], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
	["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"],
	["Server Rules", [], "", -5, [["expression", format[_EXECscript1,"server_rules.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
];

ActionsMenu =
[
	["",true],
	["Self Bloodbag", [], "", -5, [["expression", format[_EXECscript1,"player_selfbloodbag.sqf"]]], "1", "1"],
	["Flip Vehicle", [], "", -5, [["expression", format[_EXECscript1,"flip_vehicle.sqf"]]], "1", "1"],
	["Suicide", [], "", -5, [["expression", format[_EXECscript1,"suicide.sqf"]]], "1", "1"],	
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
];

VehicleMenu =
[
	["",true],
	["Build Bike", [], "", -5, [["expression", format[_EXECscript1,"deploy_bike.sqf"]]], "1", "1"],
	["Build Mozzie", [],  "", -5, [["expression", format[_EXECscript1,"deploy_mozzie.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
];

MovementMenu =
[
	["",true],
	["Dance1",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoIvan"]]],"1","1"],
	["Dance2",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoStefan"]]],"1","1"],
	["Dance3",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingStefan"]]],"1","1"],
	["Boxing",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle68boxing"]]],"1","1"],
	["Karate",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exerciseKata"]]],"1","1"],
	["Pushups",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisePushup"]]],"1","1"],
	["Squat",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisekneeBendA"]]],"1","1"],
	["HandStand",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];

TransformAnimalMenu =
[
	["",true],
	["Goat", [], "", -5, [["expression", format[_EXECscript2,"Goat"]]], "1", "1"],
	["Rabbit", [], "", -5, [["expression", format[_EXECscript2,"Rabbit"]]], "1", "1"],
	["Chicken", [], "", -5, [["expression", format[_EXECscript2,"Hen"]]], "1", "1"],
	["Dog 01", [], "", -5, [["expression", format[_EXECscript2,"Pastor"]]], "1", "1"],
	["Dog 02", [], "", -5, [["expression", format[_EXECscript2,"Fin"]]], "1", "1"],
	["Sheep", [], "", -5, [["expression", format[_EXECscript2,"Sheep"]]], "1", "1"],
	["Wild Boar", [], "", -5, [["expression", format[_EXECscript2,"WildBoar"]]], "1", "1"],
	["Cow (Black & White)", [], "", -5, [["expression", format[_EXECscript2,"Cow04"]]], "1", "1"],
	["Human Survivor", [], "", -5, [["expression", format[_EXECscript2,"Survivor2_DZ"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:ActionMenu";