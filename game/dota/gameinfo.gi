//DO NOT TOUCH UNLESS YOU WANT TO BREAK! (╯°□°）╯︵ ┻━┻
"GameInfo"
{
	game 		"Dota 2"
	title 		"Dota 2"

	gamelogo 1
	type		multiplayer_only

	nomodels 1
	nohimodel 1
	nocrosshair 0
	GameData	"dota.fgd"
	SupportsDX8	0
	nodegraph 0
	tonemapping 0 // Hide tonemapping ui in tools mode

	FileSystem
	{
		SteamAppId				570		// This will mount all the GCFs we need (240=CS:S, 220=HL2).
		ToolsAppId				316570	// Tools will load this (ie: source SDK caches) to get things like materials\debug, materials\editor, etc.
		BreakpadAppId			316570	// Only necessary if (BreakpadAppId != SteamAppId). Upload minidumps as this alternate appid
		
		//
		// The code that loads this file automatically does a few things here:
		//
		// 1. For each "Game" search path, it adds a "GameBin" path, in <dir>\bin
		// 2. For each "Game" search path, it adds another "Game" path in front of it with _<langage> at the end.
		//    For example: c:\hl2\cstrike on a french machine would get a c:\hl2\cstrike_french path added to it.
		// 3. For the first "Game" search path, it adds a search path called "MOD".
		// 4. For the first "Game" search path, it adds a search path called "DEFAULT_WRITE_PATH".
		//

		//
		// Search paths are relative to the exe directory\..\
		//
		SearchPaths
		{
			// These are optional language paths. They must be mounted first, which is why there are first in the list.
			// *LANGUAGE* will be replaced with the actual language name. If not running a specific language, these paths will not be mounted
			Game_Language		dota_*LANGUAGE*
			Game_Language		dota_*LANGUAGE*_imported

			// These are optional low-violence paths. They will only get mounted if you're in a low-violence mode.
			Game_LowViolence	dota_lv
			Game_LowViolence	dota_lv_imported

			Game				dota
			Game				dota_imported

			Game				dota_core
			Game				core

			Mod					dota
			Mod					dota_imported

			AddonRoot			dota_addons

			// Note: addon content is included in publiccontent by default.
			PublicContent		dota_core
			PublicContent		core
		}
	}

	MaterialSystem2
	{
		RenderModes
		{
			"game" "Default"
			"game" "DotaDeferred"
			"game" "DotaForward"
			"game" "Depth"

			"tools" "ToolsVis" // Visualization modes for all shaders (lighting only, normal maps only, etc.)
			"tools" "ToolsWireframe" // This should use the ToolsVis mode above instead of being its own mode
			"tools" "ToolsUtil" // Meant to be used to render tools sceneobjects that are mod-independent, like the origin grid
		}
	}

	Engine2
	{
		"HasModAppSystems" "1"
		"Capable64Bit" "1"
		"UsesScaleform" "1"
		"HasGameUI" "1" // dota uses gameui
		"GameUIFromClient" "1"  // AND that gameui comes from client.dll
		"URLName" "dota2"
		"UsesBink" "0"
		"RenderingPipeline"
		{
			"SkipPostProcessing" "1"
			"SupportsMSAA" "0"
		}
		
		"BugBait"
		{
			// Used by 'bug:' in chat to normalize report settings during playtests
			"Owner" "triage*" 
			"Severity" "high"
			"Priority" "none"
			"Category" "---"
			"Product" "dota"
			"Component" "dota"
		}
	}

	SceneSystem
	{
		"NoSunLightManager" "1"
	}

	ToolsEnvironment
	{
		"Engine"	"Dota 2"
		"ToolsDir"	"../sdktools"	// NOTE: Default Tools path. This is relative to the mod path.
		"DeveloperHelpURL" "https://intranet.valvesoftware.com/wiki/Source_2_SDK"
		"ToolsProductName" "Dota2 Workshop Tools"
	}
	
	Hammer
	{
		"fgd"					"dota.fgd"	// NOTE: This is relative to the 'mod' path.
		"GameFeatureSet"		"Dota"
		"LoadScriptEntities"	"0"
		"DefaultTextureScale"	"0.250000"
		"DefaultSolidEntity"	"trigger_multiple"
		"DefaultPointEntity"	"info_player_start_goodguys"
		"NavMarkupEntity"		"func_nav_markup"
		"EnableDotaTools"		"1"
		"DefaultGridTileSet"	"/maps/tilesets/radiant_basic.vmap"
		"DefaultGridTileSet2"	"/maps/tilesets/dire_basic.vmap"
		"AddonMapCommand"		"dota_launch_custom_game"
		"PostMapLoadCommands"	"jointeam good" // Commands sent to the console by hammer after it finishes building a map and loads it
		"RequiredGameEntities"	"info_player_start_goodguys; info_player_start_badguys; env_global_light; ent_dota_game_events"
	}

	MaterialEditor
	{
		"DefaultShader"			"global_lit_simple"
		"ExpressionHelpUrl"		"https://intranet.valvesoftware.com/index.php/Source_2.0/Shader_Format#Shader.2FMaterial_Expression_Syntax"
	}
	
	ResourceCompiler
	{
		// Overrides of the default builders as specified in code, this controls which map builder steps
		// will be run when resource compiler is run for a map without specifiying any specific map builder
		// steps. Additionally this controls which builders are displayed in the hammer build dialog.
		DefaultMapBuilders
		{			
			"light"		"0"	// Dota does not use baked lighting
			"envmap"	"0"	// Dota doesn't generate environment maps from the map
			"gridnav"	"1"	// Dota generates its grid navigation data by default
		}
	}

	RenderPipelineAliases
	{
		"Tools"			"Dota"
		"EnvMapBake"	"Dota"
	}
	
	Source1Import
	{
		"importmod"			"dota"
		"importdir"			"..\dota_imported"
		"ignoreParticleManifest" "1"	
		"createStaticOverlays" "1"	// info_overlay entities will be converted to static overlay nodes instead of preserved as Info_overlay entities
		"changelist"	"2264042"
		"oldchangelist"	"2246563"
		"oldchangelist"	"2192759"
		"oldchangelist"	"2192468"
		"oldchangelist"	"2187054"
		"oldchangelist"	"2149856"
		"oldchangelist"	"2141840"
		"oldchangelist"	"2141113"
		"oldchangelist"	"2090590"
		"oldchangelist"	"2085272"
		"oldchangelist" "2067624"
		"oldchangelist" "2051272"
		"oldchangelist" "1803612"

		// These are files that are synced ahead of the current change list
		// To handle bug fixes from source 1

		// All exception files must be under the depot game or content root paths
		// These are needed to build a fake local filename to see if it is in 
		// the user's clientspec.
		depotRootPaths
		{
			"game"		"//dota/staging/game/dota/"
			"content"	"//dota/staging/content/dota/"
		}

		syncException
		{
			"changelist"  "2297616"
			"p4path" "//dota/staging/content/dota/materialsrc/particle/Fire_Particle_6/..."
		}
		syncException
		{
			"changelist"  "2290224"
			"p4path" "//dota/staging/content/dota/materialsrc/particle/chat_icon/chat_icon.mks"
			"p4path" "//dota/staging/content/dota/materialsrc/particle/chat_icon/chat_icon.tga"
			"p4path" "//dota/staging/content/dota/materialsrc/particle/chat_icon/chat_icon_1.tga"
			"p4path" "//dota/staging/content/dota/materialsrc/particle/chat_icon/chat_icon_2.tga"
		}
		syncException
		{
			"changelist"  "2280983"
			"p4path" "//dota/staging/game/dota/materials/models/courier/greevil/loot_greevil.vmt"
		}
		syncException
		{
			"changelist"  "2278590"
			"p4path" "//dota/staging/game/dota/materials/models/items/earth_spirit/demon_stone_summon/demon_stone_summon_color.vmt"	
			"p4path" "//dota/staging/game/dota/materials/models/items/earth_spirit/vanquishing_demons_summon/vanquishing_demons_summon_color.vmt"
		}
		syncException
		{
			"changelist"  "2287777"
			"p4path" "//dota/staging/game/dota/models/props_gameplay/divine_rapier.mdl"
			"p4path" "//dota/staging/game/dota/models/props_gameplay/divine_rapier.dx90.vtx"
			"p4path" "//dota/staging/game/dota/models/props_gameplay/divine_rapier.vvd"
		}
	}
}
