/*  This handles all actions

    Execution on: Client
	
	- Silence/Stevio
*/
mst_fnc_addActionsToHelicopter = {
	heli = cursorTarget;
	vicReadyAction = heli addAction ["Ready Ropes",{hint str heli, heli enableSimulation false, heli allowDamage false}];
	vicUnreadyAction = heli addAction ["Unready Ropes",{hint str heli, heli enableSimulation true, heli allowDamage true}];
};

rope_fnc = {
	vic = nearestObjects [player, ["Ship"], 10] select 0;heli = nearestObjects [player, ["Air"], 10] select 0;
	[vic, heli] call BIS_fnc_attachToRelative;
	playerrope = "CBA_B_InvisibleTargetVehicle" createVehicle position vic;
	playerrope setPos (vic modelToWorld [0,0,-.5]);
	playerrope attachTo [vic];
	myRope = ropeCreate [heli, [0,2,0.5], playerrope, [0,0,0], 5.5];
	[heli, [0,0,0], [0,0,-1]] ropeAttachTo (ropes playerrope select 0);
};

// Variables (Defaults)
isAttached = false;
//varHolder setVariable ["riskyEject",false,true];
//varHolder setVariable ["detectRadius",10,true];
vic = player;
heli = player;

// Heli Eject Action - Boat Script Implemented by Silence#9762 (06/07/2021)
readyAction = ['Ready','Eject Boat','',{
	_vari = player getVariable "BoatRiskyEject";
	//_variRadius = player getVariable "BoatAttachRadius";
	vic = nearestObjects [player, ["Ship"], 10] select 0;
	heli = nearestObjects [player, ["Air"], 10] select 0;
	detach vic,
	vic allowDamage false,
	heli allowDamage false,
	if (_vari) then {
		vic setVelocity [0,-25,0];
	};
	if !(_vari) then {
		vic setPos (heli modelToWorld [0,-25,0]);
	}; 
	isAttached = false,
	[] spawn {sleep 3, vic allowDamage true, heli allowDamage true}
},{isAttached}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], readyAction] call ace_interact_menu_fnc_addActionToObject;

boatAction = ['Attach','Attach Ropes','',{vic = nearestObjects [player, ["Ship"], 10] select 0;heli = nearestObjects [player, ["Air"], 10] select 0; hint str vic, [vic, heli] call BIS_fnc_attachToRelative, isAttached = true},{!isAttached && vehicle player != player}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], boatAction] call ace_interact_menu_fnc_addActionToObject;

releaseAction = ['Detach','Detach Ropes','',{vic = nearestObjects [player, ["Ship"], 10] select 0; detach vic, isAttached = false},{isAttached}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], releaseAction] call ace_interact_menu_fnc_addActionToObject;
