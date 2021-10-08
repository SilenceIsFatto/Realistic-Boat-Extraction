class CfgPatches
{
	class MS_RBE
	{
		name="MS_RBE";
		author="Mercury Studios - Silence";
		requiredVersion=1.9400001;
		requiredAddons[]={};
		version=0.1;
	};
};
class CfgFunctions
{
	class MS_RBE
	{
		class RBEFnc
		{
			file="\MS_RBE\functions";
			class addAction
			{
				postInit=1;
			};
		};
	};
};

