class CfgPatches
{
	class RBE
	{
		units[] = {};
		weapons[] = {};
		author="Silence";
		requiredVersion=1.9400001;
		requiredAddons[]={};
		version=0.1;
	};
};

#include "cfgEventHandlers.hpp"

class CfgFunctions
{
	class RBE
	{
		class RBEFnc
		{
			file="\Realistic-Boat-Extraction\functions";
			class addAction
			{
				postInit=1;
			};
		};
	};
};

