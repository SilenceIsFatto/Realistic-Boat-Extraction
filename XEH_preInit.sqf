#include "script_component.hpp"

#include "XEH_PREP.sqf"

ADDON = true;

[
    "Silence_RealisticBoatExtraction_Radius", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Radius (Boat Attaching)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Realistic Boat Extraction", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    10,
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		player setVariable ["BoatAttachRadius",_value];
    }
] call CBA_fnc_addSetting;

[
    "Silence_RealisticBoatExtraction_Eject", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Boat Eject Type (Risky/Safe)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Realistic Boat Extraction", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false,
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
		player setVariable ["BoatRiskyEject",_value];
    }
] call CBA_fnc_addSetting;