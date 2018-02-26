------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the script logic for map: vr_aperture_main
--
-------------------------------------------------------------------------------

--Is the room not large enough for the full roomscale GDC demo experience?
SmallRoomMode = false

HMDAvatar = nil
InVRMode = false
CurrentTime = nil
DeltaTime = nil
DemoStartTime = nil
AtlasCollapseTime = nil

--Controller pickup
SkipControllerJokes = false

ControllerPickedUp = false
DemoCanCompleteItself = false
DemoFastCompletion = false
DemoSlowNags = true
DemoAutoStarts = true

--ChargingStation
ChargingStationReverseDirState = false
ChargingStationReversePolarityState = false
OnChargingStationUserClickCompleteState = false

MustHoldLeverDoorOpen = false

WaitingForButtonPress = -1.0

--Drawers
OpenedDrawers = {}
CurrentDrawer = nil
CurrentDrawerState = nil
IsDrawerEngaged = false
DrawerAnimSequences =
{
	top =
	{
		Name = "Drawer One",
		Open = "drawer_one_open",
		Close = "drawer_one_close",
		Attachment = "drawer_one_anchor_point"
	},

	middle =
	{
		Name = "Drawer Two",
		Open = "drawer_two_open",
		Close = "drawer_two_close",
		Attachment = "drawer_two_anchor_point"
	},

	bottom =
	{
		Name = "Drawer Three",
		Open = "drawer_three_open",
		Close = "drawer_three_close",
		Attachment = "drawer_three_anchor_point"
	}
}

--Class names for all the entities to get handles to
EntClassNames =
{
	Triggers = "trigger_multiple",
	Relays = "logic_relay",
	Buttons = "func_button",
	Props = "prop_dynamic",
	Sounds = "point_soundevent",
	Templates = "point_template",
	Remappers = "point_value_remapper",
	Soundscapes = "env_soundscape",
	ServerCommands = "point_servercommand",
	Particles = "info_particle_system",
	Cubemaps = "env_cubemap",
	PointHmdAnchors = "point_hmd_anchor",
	EnvFades = "env_fade",
}

--Entities whose handles are needed by the script
EntHandles =
{
	Triggers =
	{
		ControllerPickupTrigger =
		{
			Name = "controller_pickup_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnControllerPickupTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersOpenTriggerTop =
		{
			Name = "mini_drawers_open_trigger_top",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnTopDrawerOpenTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersOpenTriggerMiddle =
		{
			Name = "mini_drawers_open_trigger_middle",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnMiddleDrawerOpenTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersOpenTriggerBottom =
		{
			Name = "mini_drawers_open_trigger_bottom",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnBottomDrawerOpenTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersCloseTriggerTop =
		{
			Name = "mini_drawers_close_trigger_top",
			OutputName = "OnTrigger",
			RedirectFunction = "OnDrawerCloseTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersCloseTriggerMiddle =
		{
			Name = "mini_drawers_close_trigger_middle",
			OutputName = "OnTrigger",
			RedirectFunction = "OnDrawerCloseTriggerTouched",
			Disable = true,
			Ent = nil
		},

		MiniDrawersCloseTriggerBottom =
		{
			Name = "mini_drawers_close_trigger_bottom",
			OutputName = "OnTrigger",
			RedirectFunction = "OnDrawerCloseTriggerTouched",
			Disable = true,
			Ent = nil
		},

		RobotDoorTrigger =
		{
			Name = "robot_door_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnRobotDoorTriggerTouched",
			Disable = true,
			Ent = nil
		},

		AtlasEnterTrigger =
		{
			Name = "atlas_enter",
			Disable = true,
			Ent = nil
		},

		AtlasExplodeTrigger =
		{
			Name = "atlas_explode_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnAtlasExplodeTriggerTouched",
			Disable = true,
			Ent = nil
		},

		AtlasRepairButtonTrigger =
		{
			Name = "atlas_repair_button_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnAtlasRepairButtonTriggerTouched",
			Disable = true,
			Ent = nil
		},

		AtlasRepairButtonTriggerCorrectSide =
		{
			Name = "atlas_repair_button_trigger_correct_side",
			Disable = true,
			Ent = nil
		},

		AtlasRepairButtonTriggerWrongSide =
		{
			Name = "atlas_repair_button_trigger_wrong_side",
			Disable = true,
			Ent = nil
		},

		AtlasCollapseTrigger =
		{
			Name = "atlas_collapse_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnAtlasCollapseTriggerTouched",
			Disable = true,
			Ent = nil
		}
	},

	Relays =
	{
		AutoStartRelay =
		{
			Name = "auto_start",
			Ent = nil
		},

		BeginDemoRelay =
		{
			Name = "begin_demo_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "OnBeginDemoRelayTriggered",
			Ent = nil
		},

		AtlasDebugRelay =
		{
			Name = "atlas_debug_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "OnRobotDoorTriggerTouchedDebug",
			Ent = nil
		},
		StartDisassemblyDebug =
		{
			Name = "start_disassembly_debug",
			OutputName = "OnTrigger",
			RedirectFunction = "OnAtlasCollapseTriggerTouched",
			Ent = nil
		},

		MultitoolPressButton =
		{
			Name = "relay_multitool_button",
			OutputName = "OnTrigger",
			RedirectFunction = "OnMultitoolPressButton",
			Ent = nil
		},
		LeverForceDownRelay =
		{
			Name = "lever_force_down",
			Ent = nil
		},
		AtlasEnterRelay =
		{
			Name = "atlas_enter_relay",
			Ent = nil
		},

		AtlasExplodeRelay =
		{
			Name = "atlas_explode_relay",
			Ent = nil
		},
		
		AtlasHoloRelay =
		{
			Name = "atlas_holo_relay",
			Ent = nil
		},
		AtlasExplodeDoneRelay =
		{
			Name = "atlas_explode_done_relay_script",
			OutputName = "OnTrigger",
			RedirectFunction = "OnAtlasPulledOpen",
			Ent = nil
		},

		AtlasHoloExplodeRelay =
		{
			Name = "atlas_holo_explode_relay",
			Ent = nil
		},

		AtlasRepairButtonRelay =
		{
			Name = "atlas_repair_button_relay",
			Ent = nil
		},

		EnableNextVRHUDRelay =
		{
			Name = "enable_next_vr_hud_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "EnableNextVRRepairHUD",
			Ent = nil
		},

		AtlasCollapseRelay =
		{
			Name = "atlas_collapse_relay",
			Ent = nil
		},

		AtlasDisableRelay =
		{
			Name = "atlas_disable_relay",
			Ent = nil
		},

		BrokenAtlasTurnOnRelay =
		{
			Name = "broken_atlas_turnon_relay",
			Ent = nil
		},

		BrokenAtlasTurnOffRelay =
		{
			Name = "broken_atlas_turnoff_relay",
			Ent = nil
		},

		BTSPropsTurnOnRelay =
		{
			Name = "bts_props_turnon_relay",
			Ent = nil
		},

		BTSPropsTurnOffRelay =
		{
			Name = "bts_props_turnoff_relay",
			Ent = nil
		},

		StartRoomDisassembleRelay =
		{
			Name = "start_room_disassemble_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "OnStartRoomDisassembleRelayTriggered",
			Ent = nil
		},

		EndRoomAssembleRelay =
		{
			Name = "end_room_assemble_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "OnEndRoomAssembleRelayTriggered",
			Ent = nil
		},

		DemoEndRelay =
		{
			Name = "demo_end_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "OnDemoEndRelayTriggered",
			Ent = nil
		},
		
		BackroomPropsKillRelay =
		{
			Name = "backroom_props_kill_relay",
			Ent = nil
		},
		
		BackwallPropsKillRelay =
		{
			Name = "backwall_props_kill_relay",
			Ent = nil
		},
		
		ContainerExteriorTurnoffRelay =
		{
			Name = "container_exterior_turnoff_relay",
			Ent = nil
		},
		
		ContainerExteriorTurnonRelay =
		{
			Name = "container_exterior_turnon_relay",
			Ent = nil
		},
		StartTestChamberEndRelay =
		{
			Name = "relay_testchamberend",
			Ent = nil
		},
		
		AssemblySequenceOffRelay =
		{
			Name = "assembly_sequence_off_relay",
			Ent = nil
		},
		
		SetHandModelsRelay =
		{
			Name = "sethandmodels",
			OutputName = "OnTrigger",
			RedirectFunction = "OnSetHandModels",
			Ent = nil
		},
		PlayerQuitRelay =
		{
			Name = "player_quit_relay",
			OutputName = "OnTrigger",
			RedirectFunction = "PlayQuitFunction",
			Ent = nil
		}
	},

	Buttons =
	{
		ControllerPickupButton =
		{
			Name = "controller_pickup_button",
			OutputName = "OnPressed",
			RedirectFunction = "OnMultitoolPressButton",
			LockUsingEntFire = true,
			Ent = nil
		}
	},

	Props =
	{

		ControllerPickupProp =
		{
			Name = "controller_pickup",
			Ent = nil
		},
		ControllerPickupProp2 =
		{
			Name = "controller_pickup2",
			Ent = nil
		},
		ControllerChargingStation =
		{
			Name = "controller_charging_station",
			Ent = nil
		},
		MiniDrawersProp =
		{
			Name = "mini_drawers",
			Ent = nil
		},
		MiniDrawersHandleTop =
		{
			Name = "mini_drawer_handle_top",
			Ent = nil
		},
		MiniDrawersHandleMiddle =
		{
			Name = "mini_drawer_handle_middle",
			Ent = nil
		},
		MiniDrawersHandleBottom =
		{
			Name = "mini_drawer_handle_bottom",
			Ent = nil
		},
		MiniDrawersLightTop =
		{
			Name = "drawer_one_indicator_light",
			Ent = nil
		},
		MiniDrawersLightMiddle =
		{
			Name = "drawer_two_indicator_light",
			Ent = nil
		},
		MiniDrawersLightBottom =
		{
			Name = "drawer_three_indicator_light",
			Ent = nil
		},

		DesignCenterAnimatedProp =
		{
			Name = "design_center_anim",
			DisableUsingEntFire = true,
			Ent = nil
		},
		DrawerEmployee =
		{
			Name = "drawer_employee",
			DisableUsingEntFire = true,
			Ent = nil
		},
		GdcSolidWall =
		{
			Name = "gdc_solid_wall",
			DisableUsingEntFire = true,
			Ent = nil
		},
		GdcHoloWall =
		{
			Name = "gdc_holo_wall",
			DisableUsingEntFire = true,
			Ent = nil
		},
		emptyDrawerContent1 =
		{
			Name = "drawer_1_content",
			DisableUsingEntFire = true,
			Ent = nil
		},
		emptyDrawerContent2 =
		{
			Name = "drawer_2_content",
			DisableUsingEntFire = true,
			Ent = nil
		},

		StartRoomProp =
		{
			Name = "start_room_prop",
			Ent = nil
		},

		RobotDoorProp =
		{
			Name = "robot_door_prop",
			Ent = nil
		},

		AtlasWalkProp =
		{
			Name = "atlas_walk_prop",
			OutputName = "OnAnimationDone",
			RedirectFunction = "OnAtlasWalkDoneAnimating",
			Ent = nil
		},

		AtlasCoreProp =
		{
			Name = "atlascore",
			Ent = nil
		},

		AtlasEyeProp =
		{
			Name = "atlas_eye",
			Ent = nil
		},

		AtlasFloorProp =
		{
			Name = "atlas_floor",
			Ent = nil
		},

		FrontWallAssemblyProp =
		{
			Name = "room_frontwall_dissassembly_prop",
			OutputName = "OnAnimationDone",
			RedirectFunction = "OnFrontWallAssemblyDoneAnimating",
			Ent = nil
		},

		GladosProp =
		{
			Name = "glados",
			Ent = nil
		},

		DemoRoomAssemblyProp =
		{
			Name = "demo_room_assembly_prop",
			OutputName = "OnAnimationDone",
			RedirectFunction = "OnEndRoomAssemblyDoneAnimating",
			DisableUsingEntFire = true,
			Ent = nil
		},
		
		BackroomProp =
		{
			Name = "backroom_container_interior_prop",
			Ent = nil
		},
		
		ContainerExteriorRobotProp =
		{
			Name = "container_exterior_robot_prop",
			Ent = nil
		},
		
		ContainerExteriorDrawersProp =
		{
			Name = "container_exterior_drawers_prop",
			Ent = nil
		},
		worldOfFireTransparentProp =
		{
			Name = "world_of_fire_transparent",
			Ent = nil
		},
		ContainerExteriorBackroomProp =
		{
			Name = "container_exterior_backroom_prop",
			Ent = nil
		},
		AtlasInspectionLamp =
		{
			Name = "atlas_inspection_lamp",
			Ent = nil
		},
		AtlasSedator =
		{
			Name = "atlas_sedator",
			Ent = nil
		},
    	AtlasHolder =
		{
			Name = "atlas_holder",
			Ent = nil
		},
    	MultitoolTeleportArea =
		{
			Name = "vr_teleport_area",
			EF_NODRAW = true,
			Ent = nil,
		},
    	MultitoolTeleportDestination =
		{
			Name = "vr_teleport_destination",
			EF_NODRAW = true,
			Ent = nil
		},
	},

	Sounds =
	{
		GladosLoopSoundSource =
		{
			Name = "glados_loop_sound_source",
			Ent = nil
		},
		
		AnnouncerSoundSource =
		{
			Name = "announcer_sound_source",
			Ent = nil
		},
		
		AmbWaitingRoomMusicSoundSource =
		{
			Name = "waitingroom_music_sound_source",
			Ent = nil
		},
		
		AmbWaitingRoomLightsSoundSource =
		{
			Name = "waitingroom_lights_sound_source",
			Ent = nil
		},
		
		AmbWaitingRoomAirSoundSource =
		{
			Name = "waitingroom_air_sound_source",
			Ent = nil
		},
		
		AmbVentASoundSource =
		{
			Name = "ambience_vent_A_sound_source",
			Ent = nil
		},
		
		AmbVentBSoundSource =
		{
			Name = "ambience_vent_B_sound_source",
			Ent = nil
		},
		
		AmbRackSoundSource_a =
		{
			Name = "amb_rack_sound_source_a",
			Ent = nil
		},
		
		AmbRackSoundSource_b =
		{
			Name = "amb_rack_sound_source_b",
			Ent = nil
		},
		
		AmbTapeMachineSoundSource =
		{
			Name = "amb_tapemachine_sound_source",
			Ent = nil
		},
		
		AmbDeskRadarSoundSource_a =
		{
			Name = "amb_desk_radar_sound_source_a",
			Ent = nil
		},
		
		AmbDeskRadarSoundSource_b =
		{
			Name = "amb_desk_radar_sound_source_b",
			Ent = nil
		},

		GladosSoundSource =
		{
			Name = "glados_sound_source",
			Ent = nil
		},
		
		GladosEntrySoundSource =
		{
			Name = "gladosentry_sound_source",
			Ent = nil
		},

		KlaxonSoundSource =
		{
			Name = "klaxon_sound_source",
			Ent = nil
		},
		
		LeverSoundSource =
		{
			Name = "lever_sound_source",
			Ent = nil
		},
		
		FloorSoundSource =
		{
			Name = "floor_sound_source",
			Ent = nil
		},
		
		CrashSoundSource =
		{
			Name = "crash_sound_source",
			Ent = nil
		},
		
		DoorSoundSource =
		{
			Name = "door_sound_source",
			Ent = nil
		},
		
		ChargerSoundSource =
		{
			Name = "charger_sound_source",
			Ent = nil
		},
		
		LDoorSoundSource =
		{
			Name = "door_sound_source_left",
			Ent = nil
		},
		
		RDoorSoundSource =
		{
			Name = "door_sound_source_right",
			Ent = nil
		},
		
		DrawerSoundSource =
		{
			Name = "drawer_sound_source",
			Ent = nil
		},
		
		Drawer_L_SoundSource =
		{
			Name = "drawer_l_sound_source",
			Ent = nil
		},
		
		Drawer_R_SoundSource =
		{
			Name = "drawer_r_sound_source",
			Ent = nil
		},
		
		TwodSoundSource_a =
		{
			Name = "twod_sound_source_a",
			Ent = nil
		},
		
		TwodSoundSource_b =
		{
			Name = "twod_sound_source_b",
			Ent = nil
		}
	},

	Remappers =
	{
		OpenDrawer =
		{
			Name = "remapper_open_drawer",
			Ent = nil
		},

		OpenAtlas =
		{
			Name = "remapper_open_atlas",
			Ent = nil
		},

		OpenLever =
		{
			Name = "remapper_open_lever",
			Ent = nil
		}
	},

	Soundscapes =
	{
		MainSpawnEnclosed =
		{
			Name = "main_spawn_enclosed",
			Ent = nil
		},

		MainSpawnWallOpen =
		{
			Name = "main_spawn_wall_open_1",
			DisableUsingEntFire = true,
			Ent = nil
		},

		TestChamberOpenFull =
		{
			Name = "test_chamber_open_full",
			DisableUsingEntFire = true,
			Ent = nil
		},

		FinalRoomEnclosed =
		{
			Name = "final_room_enclosed",
			DisableUsingEntFire = true,
			Ent = nil
		}
	},

	ServerCommands =
	{
		Command =
		{
			Name = "servercommand",
			Ent = nil
		}
	},
	Particles =
	{
		ChargingStationParticleEffect =
		{
			Name = "charging_station_particle_effect",
			Ent = nil
		},
		ChargingStationEnableParticleEffect =
		{
			Name = "charging_station_enable_particle_effect",
			Ent = nil
		},
		ChargingStationUserClickParticleEffect =
		{
			Name = "charging_station_user_click",
			Ent = nil
		},
		AtmostPlasterEffectA =
		{
			Name = "AtmostPlasterEffectA",
			Ent = nil
		},
		AtmostPlasterEffectB =
		{
			Name = "AtmostPlasterEffectB",
			Ent = nil
		},
		InfoRepairbuttonParticleEffect =
		{
			Name = "info_repairbutton",
			Ent = nil
		},
		InfoChargingStationParticleEffect =
		{
			Name = "info_charging_station",
			Ent = nil
		},
		AtlasHoloEndParticleEffect =
		{
			Name = "atlas_holo_end",
			Ent = nil
		},
		InfoDrawersParticleEffect =
		{
			Name = "info_drawers",
			Ent = nil
		},
		InfoFaceplateParticleEffect =
		{
			Name = "info_faceplate",
			Ent = nil
		}
		
	},

	Cubemaps =
	{
		StartRoomInterior =
		{
			Name = "atlas_sequence_start_room_cubemap",
			Ent = nil
		},
		BTS =
		{
			Name = "bts_cubemap",
			Ent = nil
		},
	},
	
	PointHmdAnchors =
	{
		SmallRoomVrOpenDrawers =
		{
			Name = "smallroomvr_opendrawers",
			Ent = nil
		},
		SmallRoomVrOpenDoor =
		{
			Name = "smallroomvr_opendoor",
			Ent = nil
		},
		SmallRoomVrRobotRepair =
		{
			Name = "smallroomvr_robotrepair",
			Ent = nil
		},
	},
	
	EnvFades =
	{
		SmallRoomVrFadeIn =
		{
			Name = "smallroomvr_fadein",
			Ent = nil
		},
		SmallRoomVrFadeOut =
		{
			Name = "smallroomvr_fadeout",
			Ent = nil
		},
	},
}

--Nag data
CurrentNagName = ""
NextNagTime = 0
NextAutoCompleteTime = 0
CurrentNagTimer = 0
LastNagTime = 0

--Nags by the announcer for the player to move on and complete a task
NagList =
{
	CameraLookAt =
	{
		NagDelay = 9,
		Nags =
		{
			"Aperture.announcer_camera_nag_01", --1.3s
			"Aperture.announcer_camera_nag_02", --1.2s
			"Aperture.announcer_camera_nag_03" --1.7s
		},
		InfoParticles = nil,
		InevitableCompletion = 0,
		InevitableCompletionFunction = nil
	},

	ControllerPickup =
	{
		NagDelay = 9,
		Nags =
		{
			"Aperture.announcer_multitool_pickup_nag_a", --1.2s
			"Aperture.announcer_multitool_pickup_nag_b", --1.1s
		},
		InfoParticles = nil,
		InevitableCompletion = 0,
		InevitableCompletionFunction = nil
	},

	ControllerCharge =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_multitool_charge_nag_a", --1.2s
			"Aperture.announcer_multitool_charge_nag_b", --1.1s
		},
		InfoParticles = EntHandles.Particles.InfoChargingStationParticleEffect,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnControllerPickupTriggerTouched"
	},

	MultitoolPressButton =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_multitool_button_nag_a", --1.2s
			"Aperture.announcer_multitool_button_nag_b", --1.1s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnMultitoolPressButton"
	},

	DrawerOpen =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_first_drawer_nag_a", --1s
			"Aperture.announcer_first_drawer_nag_b", --1s
			"Aperture.announcer_first_drawer_nag_c", --1s
		},
		InfoParticles = EntHandles.Particles.InfoDrawersParticleEffect,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerPull =
	{
		NagDelay = 4,
		Nags =
		{
			"Aperture.announcer_faceplate_pull_nag_a", --0.8s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerClose =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_drawer_incinerate_nag_a", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_b", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_c", --0.9s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerOpen2 =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_second_drawer_nag_a", --1s
			"Aperture.announcer_second_drawer_nag_b", --1s
			"Aperture.announcer_second_drawer_nag_c", --1s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerClose2 =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_drawer_incinerate_nag_a", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_b", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_c", --0.9s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerOpen3 =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_third_drawer_nag_a", --1s
			"Aperture.announcer_third_drawer_nag_b", --1s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	DrawerClose3 =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_drawer_incinerate_nag_d", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_c", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_a", --0.9s
			"Aperture.announcer_drawer_incinerate_nag_b", --0.9s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "SkipDrawerSequence"
	},

	LeverPull =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_open_door_nag_a", --1.2s
			"Aperture.announcer_open_door_nag_b", --1.2s
			"Aperture.announcer_open_door_nag_c", --1.2s
			"Aperture.announcer_open_door_nag_d", --1.2s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnRobotDoorTriggerTouchedDebug"
	},

	FaceplateUse =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_faceplate_nag_a", --1.8s
			"Aperture.announcer_faceplate_nag_b", --1.8s
			"Aperture.announcer_faceplate_nag_c", --1.8s
		},
		InfoParticles = EntHandles.Particles.InfoFaceplateParticleEffect,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnAtlasRepairButtonTouchDebug"
	},

	FaceplatePull =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_faceplate_pull_nag_a", --0.8s
			"Aperture.announcer_faceplate_pull_nag_b", --1.5s
			"Aperture.announcer_faceplate_pull_nag_c", --1.6s
		},
		InfoParticles = nil,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnAtlasRepairButtonTouchDebug"
	},

	RepairButton =
	{
		NagDelay = 8,
		Nags =
		{
			"Aperture.announcer_repair_button_nag_a", --1.1s
			"Aperture.announcer_repair_button_nag_b", --1.1s
			"Aperture.announcer_repair_button_nag_c", --1.1s
			"Aperture.announcer_repair_button_nag_d", --1.1s
		},
		InfoParticles = EntHandles.Particles.InfoRepairbuttonParticleEffect,
		InevitableCompletion = 20,
		InevitableCompletionFunction = "OnAtlasRepairButtonTouchDebug"
	}
}

--Repair HUD
RepairHUDSequence =
{
	{
		ConvarName = "vr_hmd_helmet_no_rotate_model",
		ModelName = "models/personal/tristan/hud_no_rotate.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_yaw_model",
		ModelName = "models/personal/tristan/hud_yaw.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_yaw_roll_model",
		ModelName = "models/personal/tristan/hud_yaw_roll.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_yaw_roll_pitch_model",
		ModelName = "models/personal/tristan/hud_yaw_roll_pitch.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_yaw_pitch_model",
		ModelName = "models/personal/tristan/hud_yaw_pitch.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_pitch_model",
		ModelName = "models/personal/tristan/hud_pitch.vmdl"
	},

	{
		ConvarName = "vr_hmd_helmet_roll_model",
		ModelName = "models/personal/tristan/hud_roll.vmdl"
	}
}

CurrentRepairHUDSequence = 0

-----------------------------------------------------------
function VRPrint( msg )
	print( "VR_APERTURE_LOGIC: " .. msg )
end


-----------------------------------------------------------
function OnPrecache( self, context )
	VRPrint( "OnPrecache()" )
end


-----------------------------------------------------------
function WarmGPUCachesAndInitFarZ()

	--Get a few frames of the scene rendered from different viewpoints before the env_fade kicks in to warm everything up

	--Set this to happen after the env_fade to visualize it
	offset = 0.0
	
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_no_transform 1", offset + 0.00 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate   0 ; r_farz 16000", offset + 0.05 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate  45 ; r_farz 16000", offset + 0.10 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate  90 ; r_farz 16000", offset + 0.15 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 135 ; r_farz 16000", offset + 0.20 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 180 ; r_farz 16000", offset + 0.25 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 225 ; r_farz 16000", offset + 0.30 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 270 ; r_farz 16000", offset + 0.35 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset  50 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 315 ; r_farz 16000", offset + 0.40 )
	EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate   0 ; r_farz 16000", offset + 0.45 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate  45 ; r_farz 16000", offset + 0.50 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate  90 ; r_farz 16000", offset + 0.55 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 135 ; r_farz 16000", offset + 0.60 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 180 ; r_farz 16000", offset + 0.65 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 225 ; r_farz 16000", offset + 0.70 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 270 ; r_farz 16000", offset + 0.75 )
    EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 350 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 315 ; r_farz 16000", offset + 0.80 )
	EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0 ; vr_player_x_offset 0 ; vr_player_y_offset 0 ; vr_player_rotate 0", offset + 1.00 )
	EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_no_transform 0", offset + 1.00 )
	
	--Set the far z plane so that the player can see all the way into the back room
	SetFarZ( 500, offset + 1.00 ) 
end

-----------------------------------------------------------
function OnGameplayStart()
	VRPrint( "OnGameplayStart()" )

	CurrentTime = Time()
	DeltaTime = 0
	DemoStartTime = CurrentTime

	InVRMode = IsInVRMode()

	if InVRMode then
		VRPrint( "Playing in VR" )
	else
		VRPrint( "Not playing in VR" )
	end

	Convars:RegisterConvar( "aperture_use_vr_hud", "0", "If the VR HUD should turn on during the aperture demo", 0 )
	VRPrint( "Registered \"aperture_use_vr_hud\" convar." )

	--Get all the entity handles needed by the script
	print()
	print()
	GetEntityHandles()
	print()
	print()

	WarmGPUCachesAndInitFarZ()

	--Parent the drawers to the start room prop
	EntHandles.Props.MiniDrawersProp.Ent:SetParent( EntHandles.Props.StartRoomProp.Ent, "drawer_attach" )

	--Sound Effects
	PlayAudio( EntHandles.Sounds.ChargerSoundSource.Ent, "Aperture.multitool_charger_loop" )
	PlayAudio( EntHandles.Sounds.AmbRackSoundSource_a.Ent, "Aperture.amb_rack" )
	PlayAudio( EntHandles.Sounds.AmbRackSoundSource_b.Ent, "Aperture.amb_rack_hum" )
	PlayAudio( EntHandles.Sounds.AmbTapeMachineSoundSource.Ent, "Aperture.amb_tape_machine_hum" )
	PlayAudio( EntHandles.Sounds.AmbDeskRadarSoundSource_a.Ent, "Aperture.amb_desk_radar" )
	PlayAudio( EntHandles.Sounds.AmbDeskRadarSoundSource_b.Ent, "Aperture.amb_desk_radar_hum" )
	PlayAudio( EntHandles.Sounds.AmbVentASoundSource.Ent, "Aperture.amb_vent_A" )
	PlayAudio( EntHandles.Sounds.AmbVentBSoundSource.Ent, "Aperture.amb_vent_B" )

	--EntFireByHandle( self, EntHandles.Relays.SetHandModelsRelay.Ent, "Trigger", "", 1 )
	if DemoAutoStarts == true then

		if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
			DemoCanCompleteItself = true
			DemoFastCompletion = true
			SkipControllerJokes = true

			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 0.6 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_no_transform 1", 1.1 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset 0; vr_player_rotate 0", 1.1 )
			--EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 3.1 )

			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 9.5 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset -30; vr_player_y_offset 0; vr_player_rotate 180", 10 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 12 )

			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 19.5 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset 80; vr_player_rotate 90", 20 )
			EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 22.0 )
		end

		EntFireByHandle( self, EntHandles.Relays.AutoStartRelay.Ent, "Trigger", "", 0 )
	end
    
    --Prevent small props from disappearing
    Convars:SetFloat( "r_size_cull_threshold", 0.0 )
	
end


-----------------------------------------------------------
function OnShutdown()
	VRPrint( "OnShutdown()" )

	DisableVRRepairHUD()

	--Reset the far z clipping plane
	Convars:SetInt( "r_farz", -1 )
end


-----------------------------------------------------------
function GetEntityHandles()
	VRPrint( "GetEntityHandles()" )
	print()

	--For each entity type to get handles for
	for entName, entityType in pairs( EntHandles ) do
		local entClassName = EntClassNames[entName]
		print()
		VRPrint( "Looking for \"" .. entClassName .. "\" entities at OnGameplayStart()" )
		print()
		--Find all the entities of this type in the map
		local allEntitiesOfType = Entities:FindAllByClassname( entClassName )

		local foundEntCount = 0
		local unclaimedEntities = {}
		local unclaimedCount = 0

		--For each found entity of type
		for _, foundEntity in ipairs( allEntitiesOfType ) do
			local foundEntName = foundEntity:GetName()
			local entityHandleFound = false

			--For each entity of this type to get a handle for
			for _, entHandleData in pairs( entityType ) do
				--If this entHandleData doesn't already have a handle
				if entHandleData.Ent == nil then
					if vlua.find( foundEntName, entHandleData.Name ) then
						VRPrint( "Found " .. entHandleData.Name .. ": " .. foundEntName )
						--Store a handle to the found entity
						entHandleData.Ent = foundEntity

						--Set up the redirect for the entity if requested
						if vlua.contains( entHandleData, "OutputName" ) and vlua.contains( entHandleData, "RedirectFunction" ) then
							VRPrint( "\tRedirecting: " .. entHandleData.OutputName .. " to " .. entHandleData.RedirectFunction )
							entHandleData.Ent:RedirectOutput( entHandleData.OutputName, entHandleData.RedirectFunction, thisEntity )
						end

						--Disable on start if requested
						if vlua.contains( entHandleData, "Disable" ) and entHandleData.Disable == true then
							VRPrint( "\tDisabled on start" )
							entHandleData.Ent:Disable()
						end

						--Disable using EntFire if requested
						if vlua.contains( entHandleData, "DisableUsingEntFire" ) and entHandleData.DisableUsingEntFire == true then
							VRPrint( "\tDisabled on start using EntFire" )
							EntFireByHandle( self, entHandleData.Ent, "Disable" )
						end

						--Lock using EntFire if requested
						if vlua.contains( entHandleData, "LockUsingEntFire" ) and entHandleData.LockUsingEntFire == true then
							VRPrint( "\tLocked on start using EntFire" )
							EntFireByHandle( self, entHandleData.Ent, "Lock" )
						end

						--Lock using AddEffects( EF_NODRAW ) if requested
						if vlua.contains( entHandleData, "EF_NODRAW" ) and entHandleData.EF_NODRAW == true then
							VRPrint( "\tNot drawn on start using AddEffects( EF_NODRAW )" )
							entHandleData.Ent:AddEffects( 32 )	-- 32 == 0x20 == EF_NODRAW
						end

						entityHandleFound = true
						break
					end
				end
			end

			foundEntCount = foundEntCount + 1

			--If this entity didn't get its handle stored
			if entityHandleFound ~= true then
				if foundEntName == "" then
					foundEntName = "(unnamed)"
				end
				unclaimedCount = unclaimedCount + 1
				table.insert( unclaimedEntities, foundEntName )
			end
		end

		--Print out all the unclaimed entities
		if unclaimedCount ~= 0 then
			print()
			if unclaimedCount == 1 then
				VRPrint( "Found " .. unclaimedCount .. " unclaimed " .. entClassName .. " entity: " )
			else
				VRPrint( "Found " .. unclaimedCount .. " unclaimed " .. entClassName .. " entities: " )
			end
			for _, unclaimedEntName in ipairs( unclaimedEntities ) do
				VRPrint( "\t" .. unclaimedEntName )
			end
		end

		if foundEntCount == 1 then
			VRPrint( foundEntCount .. " " .. entClassName .. " entity found, " .. unclaimedCount .. " unclaimed" )
		else
			VRPrint( foundEntCount .. " " .. entClassName .. " entities found, " .. unclaimedCount .. " unclaimed" )
		end

		print()
	end
end


-----------------------------------------------------------
function OnBeginDemoRelayTriggered( self, args )
	VRPrint( "OnBeginDemoRelayTriggered()" )

	--Start the timer for the demo
	DemoStartTime = CurrentTime
	print()
	VRPrint( "Demo start time: " .. DemoStartTime )
	print()

	--Kill the begin demo relay so that it can't be triggered again
	EntFireByHandle( self, EntHandles.Relays.BeginDemoRelay.Ent, "Kill" )

	--Start the demo intro sequence
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_welcome" ) --7.8s

	if SkipControllerJokes == true then
		EntFireByHandle( self, EntHandles.Triggers.ControllerPickupTrigger.Ent, "Enable", "", 2 )

		EnableDrawerOpenTriggers()

		PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_first_drawer", 8.0 ) --3.9s
	
		EntFireByHandle( self, EntHandles.Props.AtlasInspectionLamp.Ent, "SetAnimation", "spotlight_drawer_anim", 6.00 )

		--Queue nagging to open the drawer
		StopNagging()
		QueueNagging( "DrawerOpen", 13 )
		
		if SmallRoomMode == true then
			EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeOut.Ent, "Fade", "", 12 )
			EntFireByHandle( self, EntHandles.PointHmdAnchors.SmallRoomVrOpenDrawers.Ent, "Enable", "", 13 )
			EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeIn.Ent, "Fade", "", 13 )
		end
		
		CurrentDrawerState = "WaitingToOpenDrawer"

	else
		PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_multitool_charge", 7.8 ) --2.6s

		--Enable the controller pickup trigger after the announcer VO
		EntFireByHandle( self, EntHandles.Triggers.ControllerPickupTrigger.Ent, "Enable", "", 9 )

		--Queue nagging to pick up the controller
		QueueNagging( "ControllerCharge", 11 )
	end

	--This attaches the controller to the player
	ControllerPickedUp = true

	--Hide controller
	EntHandles.Props.ControllerPickupProp.Ent:AddEffects( 32 )
	EntHandles.Props.ControllerPickupProp2.Ent:AddEffects( 32 )

	--start room props
	ChargingStationInteraction(1)

end


-----------------------------------------------------------
function OnControllerPickupTriggerTouched( self, args )
	VRPrint( "OnControllerPickupTriggerTouched()" )
	
	--This syntax is not working Jeep to Investigate
	--EntHandles.Triggers.ControllerPickupTrigger.Ent:Kill()
	EntFireByHandle( self, EntHandles.Triggers.ControllerPickupTrigger.Ent, "Kill" )

	if SkipControllerJokes == true then
		OnMultitoolPressButton()
	else
		--EntFireByHandle( self, EntHandles.Buttons.ControllerPickupButton.Ent, "Unlock" )
		PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_multitool_button_a", 0.7 ) --3.9s

		--Queue nagging to press the button
		StopNagging()
		QueueNagging( "MultitoolPressButton", 4 )

		--For now automatically move to the next thing since I don't know how to detect a button press
		--EntFireByHandle( self, EntHandles.Relays.MultitoolPressButton.Ent, "Trigger", "", 4.2 )
		WaitingForButtonPress = CurrentTime + 2.75

		ChargingStationInteraction(2)
	end
	
	--Sound Effects
	PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.multitool_charge" )
	PlayAudio( EntHandles.Sounds.ChargerSoundSource.Ent, "Aperture.multitool_charger_powerdown" )
	
	
end


-----------------------------------------------------------
function OnMultitoolPressButton( self, args )
	VRPrint( "OnMultitoolPressButton()" )
	
	ChargingStationInteraction(3)
	EntFireByHandle( self, EntHandles.Buttons.ControllerPickupButton.Ent, "Kill" )
	--Set the state of the charging station and give visual feedback for button pressed
	
	--Sound Effects
	PlayAudio( EntHandles.Sounds.TwodSoundSource_b.Ent, "Aperture.multitool_irradiate" )
	StopAudio( EntHandles.Sounds.ChargerSoundSource.Ent, "Aperture.multitool_charger_loop" )

	--Enable the mini drawer open triggers and play the next announcer VO line
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_multitool_irradiated_a", 0.7 ) --4.4s
	PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.Klaxon_single", 5.1 )
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_multitool_irradiated_b", 5.6 )

	if SkipControllerJokes == false then
		EnableDrawerOpenTriggers()

		PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_first_drawer", 8.7 ) --3.9s
	
		EntFireByHandle( self, EntHandles.Props.AtlasInspectionLamp.Ent, "SetAnimation", "spotlight_drawer_anim", 6.00 )

		--Queue nagging to open the drawer
		StopNagging()
		QueueNagging( "DrawerOpen", 13 )

		CurrentDrawerState = "WaitingToOpenDrawer"
	end
end


-----------------------------------------------------------
function HasDrawerBeenOpened( selectedDrawer )
	for _, drawerName in ipairs( OpenedDrawers ) do
		if vlua.find( drawerName, selectedDrawer ) ~= nil then
			return true
		end
	end

	return false
end


-----------------------------------------------------------
function MarkDrawerOpened( drawerName )
	table.insert( OpenedDrawers, drawerName )
end


-----------------------------------------------------------
function EnableDrawerOpenTriggers()
	VRPrint( "EnableDrawerOpenTriggers()" )

	VRPrint( "Num Opened drawers: " .. #OpenedDrawers )
	for _, drawerName in ipairs( OpenedDrawers ) do
		VRPrint( "Opened: " .. drawerName )
	end

	if CurrentDrawer == nil then
		--Enable all the drawer open triggers since the sequence hasn't started yet
		EntHandles.Triggers.MiniDrawersOpenTriggerTop.Ent:Enable()
		EntHandles.Triggers.MiniDrawersOpenTriggerMiddle.Ent:Enable()
		EntHandles.Triggers.MiniDrawersOpenTriggerBottom.Ent:Enable()
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "0", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "0", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "0", 0 )
	else
		--Enable the top drawer open trigger if it hasn't been opened yet
		if HasDrawerBeenOpened( "top" ) == false then
			VRPrint( "Enabling top drawer open trigger" )
			EntHandles.Triggers.MiniDrawersOpenTriggerTop.Ent:Enable()
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "0", 0 )	
		end

		--Enable the middle drawer open trigger if it hasn't been opened yet
		if HasDrawerBeenOpened( "middle" ) == false then
			VRPrint( "Enabling middle drawer open trigger" )
			EntHandles.Triggers.MiniDrawersOpenTriggerMiddle.Ent:Enable()
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "0", 0 )	
		end

		--Enable the bottom drawer open trigger if it hasn't been opened yet
		if HasDrawerBeenOpened( "bottom" ) == false then
			VRPrint( "Enabling bottom drawer open trigger" )
			EntHandles.Triggers.MiniDrawersOpenTriggerBottom.Ent:Enable()
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "0", 0 )
		end
	end
end


-----------------------------------------------------------
function DisableDrawerOpenTriggers()
	VRPrint( "DisableDrawerOpenTriggers()" )

	--Disable all the drawer open triggers
	EntHandles.Triggers.MiniDrawersOpenTriggerTop.Ent:Disable()
	EntHandles.Triggers.MiniDrawersOpenTriggerMiddle.Ent:Disable()
	EntHandles.Triggers.MiniDrawersOpenTriggerBottom.Ent:Disable()
end


-----------------------------------------------------------
function EnableDrawerCloseTrigger( closeTriggerEnableDelay )
	VRPrint( "EnableDrawerCloseTrigger() closeTriggerEnableDelay: " .. closeTriggerEnableDelay )

	if closeTriggerEnableDelay == 1000 then
		return
	end

	EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnEngage", "OnDrawerEngaged", thisEntity )
	EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnDisengage", "OnDrawerDisengaged", thisEntity )

	if CurrentDrawer == nil then
		return
	end

	if CurrentDrawer == "top" then
		EntFireByHandle( self, EntHandles.Triggers.MiniDrawersCloseTriggerTop.Ent, "Enable", "", closeTriggerEnableDelay )
	elseif CurrentDrawer == "middle" then
		EntFireByHandle( self, EntHandles.Triggers.MiniDrawersCloseTriggerMiddle.Ent, "Enable", "", closeTriggerEnableDelay )
	elseif CurrentDrawer == "bottom" then
		EntFireByHandle( self, EntHandles.Triggers.MiniDrawersCloseTriggerBottom.Ent, "Enable", "", closeTriggerEnableDelay )
	end
end


-----------------------------------------------------------
function DisableDrawerCloseTriggers()
	VRPrint( "DisableDrawerCloseTriggers()" )

	--Disable all the drawer close triggers
	EntHandles.Triggers.MiniDrawersCloseTriggerTop.Ent:Disable()
	EntHandles.Triggers.MiniDrawersCloseTriggerMiddle.Ent:Disable()
	EntHandles.Triggers.MiniDrawersCloseTriggerBottom.Ent:Disable()
end


-----------------------------------------------------------
function OnTopDrawerOpenTriggerTouched( self, args )
	VRPrint( "OnTopDrawerOpenTriggerTouched()" )

	if CurrentDrawerState == "WaitingToOpenDrawer" and HasDrawerBeenOpened( "top" ) == false then
		MarkDrawerOpened( "top" )
		OnDrawerOpenTriggerTouched( "top" )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "1", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "1", 0 )
	end
end


-----------------------------------------------------------
function OnMiddleDrawerOpenTriggerTouched( self, args )
	VRPrint( "OnMiddleDrawerOpenTriggerTouched()" )

	if CurrentDrawerState == "WaitingToOpenDrawer" and HasDrawerBeenOpened( "middle" ) == false then
		MarkDrawerOpened( "middle" )
		OnDrawerOpenTriggerTouched( "middle" )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "1", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "1", 0 )
	end
end


-----------------------------------------------------------
function OnBottomDrawerOpenTriggerTouched( self, args )
	VRPrint( "OnBottomDrawerOpenTriggerTouched()" )

	if CurrentDrawerState == "WaitingToOpenDrawer" and HasDrawerBeenOpened( "bottom" ) == false then
		MarkDrawerOpened( "bottom" )
		OnDrawerOpenTriggerTouched( "bottom" )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "1", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "1", 0 )
	end
end

-----------------------------------------------------------
function OnDrawerEngaged()
	VRPrint( "OnDrawerEngaged()" )

	if CurrentDrawer == nil then
		return
	end

	if CurrentDrawer == "top" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleTop.Ent, "SetAnimation", "handle_raise")
	elseif CurrentDrawer == "middle" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleMiddle.Ent, "SetAnimation", "handle_raise" )
	elseif CurrentDrawer == "bottom" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleBottom.Ent, "SetAnimation", "handle_raise" )
	end

	IsDrawerEngaged = true
end

-----------------------------------------------------------
function OnDrawerDisengaged()
	VRPrint( "OnDrawerDisengaged()" )

	if CurrentDrawer == nil then
		return
	end

	if CurrentDrawer == "top" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleTop.Ent, "SetAnimation", "handle_lower" )
	elseif CurrentDrawer == "middle" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleMiddle.Ent, "SetAnimation", "handle_lower" )
	elseif CurrentDrawer == "bottom" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleBottom.Ent, "SetAnimation", "handle_lower" )
	end

	IsDrawerEngaged = false
end

-----------------------------------------------------------
function OnDrawerOpenTriggerTouched( drawerName, onOpenAnimatingFuncName )
	VRPrint( "OnDrawerOpenTriggerTouched()" )

	if CurrentDrawerState == "WaitingToOpenDrawer" then
		--Disable all drawer open triggers
		DisableDrawerOpenTriggers()

		CurrentDrawer = drawerName

		--Open the selected drawer
		EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "SetAnimation", DrawerAnimSequences[CurrentDrawer].Open )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "SetPlaybackRate", "0.0", 0.001 )

		EntFireByHandle( self, EntHandles.Remappers.OpenDrawer.Ent, "Enable", "", 0.001 )

		
		EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnEngage", "OnDrawerEngaged", thisEntity )
		EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnDisengage", "OnDrawerDisengaged", thisEntity )

		--PlayAudio( EntHandles.Sounds.DrawerSoundSource.Ent, "Aperture.drawer_open" )
		if #OpenedDrawers == 1 then
			--Enable the design center props and play the announcer VO
			EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnReachedValueCustom", "OnDrawerDoneOpenAnimating", thisEntity )
			EntFireByHandle( self, EntHandles.Props.emptyDrawerContent1.Ent, "SetParentAttachment", DrawerAnimSequences[CurrentDrawer].Attachment )
			EntFireByHandle( self, EntHandles.Props.emptyDrawerContent1.Ent, "Enable" )
		end
		if #OpenedDrawers == 2 then
			--Enable the design center props and play the announcer VO
			EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnReachedValueCustom", "OnDrawerDoneOpenAnimating", thisEntity )
			EntFireByHandle( self, EntHandles.Props.emptyDrawerContent2.Ent, "SetParentAttachment", DrawerAnimSequences[CurrentDrawer].Attachment )
			EntFireByHandle( self, EntHandles.Props.emptyDrawerContent2.Ent, "Enable" )
		end

		
		--If this is the third drawer then enable the design center props
		if #OpenedDrawers >= 3 then
			--Enable the design center props and play the announcer VO
			EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnReachedValueOne", "OnDrawerDoneOpenAnimating", thisEntity )

			handlePosition = nil

			if CurrentDrawer == "top" then
				handlePosition = EntHandles.Props.MiniDrawersHandleTop.Ent:GetOrigin()
			elseif CurrentDrawer == "middle" then
				handlePosition = EntHandles.Props.MiniDrawersHandleMiddle.Ent:GetOrigin()
			elseif CurrentDrawer == "bottom" then
				handlePosition = EntHandles.Props.MiniDrawersHandleBottom.Ent:GetOrigin()
			end

			handlePosition.x = handlePosition.x + 0
			handlePosition.y = handlePosition.y + 0
			handlePosition.z = handlePosition.z + 0

			EntHandles.Props.DesignCenterAnimatedProp.Ent:SetOrigin( handlePosition )
			--EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetParentAttachment", DrawerAnimSequences[CurrentDrawer].Attachment )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "Enable" )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetAnimation", "drawer_open_anim" )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetPlaybackRate", "0.0", 0.001 )
			
		end

		StopNagging()
		QueueNagging( "DrawerPull", 0 )

		CurrentDrawerState = "OpeningDrawer"
	end
end


-----------------------------------------------------------
function OnDrawerDoneOpenAnimating()
	VRPrint( "OnDrawerDoneOpenAnimating()" )

	if CurrentDrawerState == "OpeningDrawer" then
		local closeTriggerEnableDelay = 0
		VRPrint( "Num opened drawers: " .. #OpenedDrawers )
		--Play audio corresponding to the number of drawers opened by the player
		local numDrawersOpen = #OpenedDrawers
		if numDrawersOpen == 1 then
			EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnReachedValueCustom", "OnDrawerDoneOpenAnimating", thisEntity )
			EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnReachedValueZero", "OnDrawerDoneCloseAnimatingManual", thisEntity )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "1", 0 )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "1", 0 )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "1", 0 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_second_drawer" ) --2.5s
			closeTriggerEnableDelay = 1000
			--Queue nagging to close the drawer
			QueueNagging( "DrawerClose", closeTriggerEnableDelay )
		elseif numDrawersOpen == 2 then
			EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnReachedValueCustom", "OnDrawerDoneOpenAnimating", thisEntity )
			EntHandles.Remappers.OpenDrawer.Ent:RedirectOutput( "OnReachedValueZero", "OnDrawerDoneCloseAnimatingManual", thisEntity )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "1", 0 )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "1", 0 )
			EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "1", 0 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_third_drawer" ) --3.5s
			closeTriggerEnableDelay = 1000
			--Queue nagging to close the drawer
			QueueNagging( "DrawerClose2", closeTriggerEnableDelay )
		elseif numDrawersOpen == 3 then
			--Disable the remapper
			EntFireByHandle( self, EntHandles.Remappers.OpenDrawer.Ent, "Disable" )
			if CurrentDrawer == "top" then
				EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleTop.Ent, "SetAnimation", "handle_lower" )
			elseif CurrentDrawer == "middle" then
				EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleMiddle.Ent, "SetAnimation", "handle_lower" )
			elseif CurrentDrawer == "bottom" then
				EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleBottom.Ent, "SetAnimation", "handle_lower" )
			end

			EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnReachedValueOne", "OnDrawerDoneOpenAnimating", thisEntity )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetAnimation", "drawer_calm_idle_anim",.1 )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetAnimation", "drawer_calamity_anim", 3.8 )
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetAnimation", "drawer_worship_anim", 16.2 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_third_drawer_god_a" )
			
			PlayAudio( EntHandles.Sounds.Drawer_L_SoundSource.Ent, "Aperture.popup_drawer_anim_left_praise" )
			PlayAudio( EntHandles.Sounds.Drawer_R_SoundSource.Ent, "Aperture.popup_drawer_anim_right_praise" )
			
			PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.Klaxon_single", 4.0 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_third_drawer_god_b", 4.5 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_drawer_incinerate", 12.3 ) --3.2s
			closeTriggerEnableDelay = 15.3
			--Queue nagging to close the drawer
			QueueNagging( "DrawerClose3", closeTriggerEnableDelay )
		end

		--Enable the drawer close trigger
		EnableDrawerCloseTrigger( closeTriggerEnableDelay )

		CurrentDrawerState = "WaitingToCloseDrawer"

		if numDrawersOpen < 3 then
			CurrentDrawerState = "ClosingDrawer"
		end
	end
end


-----------------------------------------------------------
function OnDrawerCloseTriggerTouched()
	VRPrint( "OnDrawerCloseTriggerTouched()" )

	if IsUsePressed() == false then
		return
	end

	if CurrentDrawerState == "WaitingToCloseDrawer" then
		--Disable the drawer close triggers
		DisableDrawerCloseTriggers()

		--Close the drawer
		EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "SetAnimation", DrawerAnimSequences[CurrentDrawer].Close )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "SetPlaybackRate", "1.0", 0.001 )

		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightTop.Ent, "skin", "1", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightMiddle.Ent, "skin", "1", 0 )
		EntFireByHandle( self, EntHandles.Props.MiniDrawersLightBottom.Ent, "skin", "1", 0 )

		EntHandles.Props.MiniDrawersProp.Ent:RedirectOutput( "OnAnimationDone", "OnDrawerDoneCloseAnimating", thisEntity )
		PlayAudio( EntHandles.Sounds.DrawerSoundSource.Ent, "Aperture.drawer_close" )
		
		--If this is the third drawer then enable the robot door trigger
		if #OpenedDrawers >= 3 then
			--Enable the robot door trigger
			EntHandles.Triggers.RobotDoorTrigger.Ent:Enable()

			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "SetAnimation", "drawer_close_anim" )
			
			--Kill the design center prop slightly before it finishes animating to work around source2 anim interupt bug
			EntFireByHandle( self, EntHandles.Props.DesignCenterAnimatedProp.Ent, "Kill", "", .70)
			
			StopAudio( EntHandles.Sounds.Drawer_L_SoundSource.Ent, "Aperture.popup_drawer_anim_left_praise", 1)
			StopAudio( EntHandles.Sounds.Drawer_R_SoundSource.Ent, "Aperture.popup_drawer_anim_right_praise", 1 )
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_drawer_closed" ) --4.2s
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_open_door", 3 ) --5s
		end
	
		StopNagging()

		CurrentDrawerState = "ClosingDrawer"
	end
end

function SkipDrawerSequence()
	if CurrentDrawerState == "WaitingToCloseDrawer" then
		EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "SetAnimation", DrawerAnimSequences[CurrentDrawer].Close )
	end

	DisableDrawerOpenTriggers()
	DisableDrawerCloseTriggers()

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_drawer_closed" ) --4.2s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_open_door", 4 ) --5s

	StopNagging()
	CurrentDrawerState = "ClosingDrawer"
	table.insert( OpenedDrawers, "top" )
	table.insert( OpenedDrawers, "middle" )
	table.insert( OpenedDrawers, "bottom" )
	OnDrawerDoneCloseAnimating()

	EntHandles.Triggers.RobotDoorTrigger.Ent:Enable()
end


function OnDrawerDoneCloseAnimatingManual()
	VRPrint( "OnDrawerDoneCloseAnimatingManual()" )

	EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnReachedValueZero", "OnDrawerDoneCloseAnimatingManual", thisEntity )

	if IsDrawerEngaged == true then
		if CurrentDrawer == "top" then
			EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleTop.Ent, "SetAnimation", "handle_lower" )
		elseif CurrentDrawer == "middle" then
			EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleMiddle.Ent, "SetAnimation", "handle_lower" )
		elseif CurrentDrawer == "bottom" then
			EntFireByHandle( self, EntHandles.Props.MiniDrawersHandleBottom.Ent, "SetAnimation", "handle_lower" )
		end
	end

	EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnEngage", "OnDrawerEngaged", thisEntity )
	EntHandles.Remappers.OpenDrawer.Ent:DisconnectRedirectedOutput( "OnDisengage", "OnDrawerDisengaged", thisEntity )

	OnDrawerDoneCloseAnimating()
end

-----------------------------------------------------------
function OnDrawerDoneCloseAnimating()
	VRPrint( "OnDrawerDoneCloseAnimating()" )

	if CurrentDrawerState == "ClosingDrawer" then
		EnableDrawerOpenTriggers()

		--If this is the third drawer
		if #OpenedDrawers >= 3 then
			EntHandles.Props.MiniDrawersProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnDrawerDoneCloseAnimating", thisEntity )

			PlayAudio( EntHandles.Sounds.DrawerSoundSource.Ent, "Aperture.incineration", 1.0 )
			
			EntFireByHandle( self, EntHandles.Props.AtlasInspectionLamp.Ent, "SetAnimation", "spotlight_robotdoor_anim", 2.00 )
		
			--Enable survivor employee
			EntFireByHandle( self, EntHandles.Props.DrawerEmployee.Ent, "Enable" )
			if CurrentDrawer == "top" then
				EntFireByHandle( self, EntHandles.Props.DrawerEmployee.Ent, "SetAnimation", "employee_escape_top", 6.5 )
			elseif CurrentDrawer == "middle" then
				EntFireByHandle( self, EntHandles.Props.DrawerEmployee.Ent, "SetAnimation", "employee_escape_middle", 6.5 )
			elseif CurrentDrawer == "bottom" then
				EntFireByHandle( self, EntHandles.Props.DrawerEmployee.Ent, "SetAnimation", "employee_escape_bottom", 6.5 )
			end

			--Queue nagging to pull the lever
			StopNagging()
			QueueNagging( "LeverPull", 10 )
			
			if SmallRoomMode == true then
				EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeOut.Ent, "Fade", "", 9 )
				EntFireByHandle( self, EntHandles.PointHmdAnchors.SmallRoomVrOpenDoor.Ent, "Enable", "", 10 )
				EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeIn.Ent, "Fade", "", 10 )
			end
			
			CurrentDrawerState = "DrawerSequenceDone"
		else
			EntFireByHandle( self, EntHandles.Remappers.OpenDrawer.Ent, "Disable" )

			--Queue nagging to open the drawer
			if #OpenedDrawers == 1 then
				QueueNagging( "DrawerOpen2", 0 )
				PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_second_drawer_nag_c" ) --5s
				EntHandles.Props.emptyDrawerContent1.Ent:Kill()

			end

			if #OpenedDrawers == 2 then
				QueueNagging( "DrawerOpen3", 0 )
				EntHandles.Props.emptyDrawerContent2.Ent:Kill()
				-- UNDONE too much nagging!
				--PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_third_drawer_nag_b" ) --5s
			end

			CurrentDrawerState = "WaitingToOpenDrawer"
		end
	end
end

-----------------------------------------------------------
function OnRobotDoorTriggerTouchedDebug( self, args )
	VRPrint( "OnRobotDoorTriggerTouchedDebug()" )

	--Prevents double triggering of the function
	if EntHandles.Triggers.RobotDoorTrigger.Ent == nil then
		return
	end

	if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 0.0 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 2.5 )
	end

	EntHandles.Triggers.RobotDoorTrigger.Ent:Kill()
	EntHandles.Triggers.RobotDoorTrigger.Ent = nil
	EntHandles.Relays.AtlasDebugRelay.Ent:Kill()
	EntHandles.Relays.AtlasDebugRelay.Ent = nil

	--Open the robot door
	--EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "latch_open" )
	EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetPlaybackRate", "4.0", 0.001 )
	EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "door_open_combined" )
	EntFireByHandle( self, EntHandles.Props.AtlasWalkProp.Ent, "Enable" )
	EntHandles.Remappers.OpenLever.Ent:RedirectOutput( "OnReachedValueOne", "OnLeverDoneOpenAnimating", thisEntity )
	EntHandles.Props.RobotDoorProp.Ent:RedirectOutput( "OnAnimationDone", "OnLeverDoneOpenAnimatingDebug", thisEntity )

	--Set the FarZ so that the robots in the hallway can be seen
	SetFarZ( 600 )

	--Turn on the broken atlas models once the door opens
	EntFireByHandle( self, EntHandles.Relays.BrokenAtlasTurnOnRelay.Ent, "Trigger" )

	EntFireByHandle( self, EntHandles.Remappers.OpenLever.Ent, "Disable" )

end

-----------------------------------------------------------
function OnLeverDoneOpenAnimatingDebug()
	VRPrint( "OnLeverDoneOpenAnimatingDebug()" )
	EntHandles.Props.RobotDoorProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnLeverDoneOpenAnimatingDebug", thisEntity )
	OnLeverDoneOpenAnimating()
	ChargingStationInteraction(3)
	--EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "door_open", 1 )
end


-----------------------------------------------------------
function OnRobotDoorTriggerTouched( self, args )
	VRPrint( "OnRobotDoorTriggerTouched()" )

	--Prevents double triggering of the function
	if EntHandles.Triggers.RobotDoorTrigger.Ent == nil then
		return
	end

	if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 0.0 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 2.5 )
	end

	EntHandles.Triggers.RobotDoorTrigger.Ent:Kill()
	EntHandles.Triggers.RobotDoorTrigger.Ent = nil
	EntHandles.Relays.AtlasDebugRelay.Ent:Kill()
	EntHandles.Relays.AtlasDebugRelay.Ent = nil

	--Open the robot door
	if MustHoldLeverDoorOpen == true then
		EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "door_open_combined" )
	else
		EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "latch_open" )	
	end
	EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetPlaybackRate", "0.0", 0.001 )

	EntFireByHandle( self, EntHandles.Remappers.OpenLever.Ent, "Enable", "", 0.001 )
	EntHandles.Remappers.OpenLever.Ent:RedirectOutput( "OnReachedValueOne", "OnLeverDoneOpenAnimating", thisEntity )

	--Set the FarZ so that the robots in the hallway can be seen
	SetFarZ( 600 )

	--Turn on the broken atlas models once the door opens
	EntFireByHandle( self, EntHandles.Relays.BrokenAtlasTurnOnRelay.Ent, "Trigger" )

	EntFireByHandle( self, EntHandles.Props.AtlasWalkProp.Ent, "Enable" )

end

-----------------------------------------------------------
function OnLeverDoneOpenAnimating()
	VRPrint( "OnLeverDoneOpenAnimating()" )

	--Disable the remapper
	EntHandles.Remappers.OpenLever.Ent:DisconnectRedirectedOutput( "OnReachedValueOne", "OnLeverDoneOpenAnimating", thisEntity )

	if MustHoldLeverDoorOpen == true then
		EntFireByHandle( self, EntHandles.Relays.LeverForceDownRelay.Ent, "Trigger", "", 10 )
	else
		EntFireByHandle( self, EntHandles.Remappers.OpenLever.Ent, "Disable" )
	end

	PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.door_chime", 0 )	
	
	if MustHoldLeverDoorOpen == false then
		EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "door_open", 1 )
	end
	PlayAudio( EntHandles.Sounds.DoorSoundSource.Ent, "Aperture.door_open_shared", 1 )
	PlayAudio( EntHandles.Sounds.LDoorSoundSource.Ent, "Aperture.door_open_left", 1 )
	PlayAudio( EntHandles.Sounds.RDoorSoundSource.Ent, "Aperture.door_open_right", 1 )
	PlayAudio( EntHandles.Sounds.AmbWaitingRoomMusicSoundSource.Ent, "Aperture.amb_waiting_room_music", 1 )
	PlayAudio( EntHandles.Sounds.AmbWaitingRoomLightsSoundSource.Ent, "Aperture.amb_waiting_room_lights", 1 )
	PlayAudio( EntHandles.Sounds.AmbWaitingRoomAirSoundSource.Ent, "Aperture.amb_waiting_room_air", 1 )

	--Bring in Atlas the robot
	EntFireByHandle( self, EntHandles.Relays.AtlasEnterRelay.Ent, "Trigger" )

	--Close the robot door after the robot has walked through it
	if MustHoldLeverDoorOpen == true then
		EntFireByHandle( self, EntHandles.Remappers.OpenLever.Ent, "Disable", "", 20 )
	end
	EntFireByHandle( self, EntHandles.Props.RobotDoorProp.Ent, "SetAnimation", "door_close", 21 )
	PlayAudio( EntHandles.Sounds.DoorSoundSource.Ent, "Aperture.door_close_shared", 21 )
	PlayAudio( EntHandles.Sounds.LDoorSoundSource.Ent, "Aperture.door_close_left", 21 )
	PlayAudio( EntHandles.Sounds.RDoorSoundSource.Ent, "Aperture.door_close_right", 21 )
	PlayAudio( EntHandles.Sounds.LeverSoundSource.Ent, "Aperture.lever_close", 21 )
	StopAudio( EntHandles.Sounds.AmbWaitingRoomMusicSoundSource.Ent, "Aperture.amb_waiting_room_music", 21.5 )
	StopAudio( EntHandles.Sounds.AmbWaitingRoomLightsSoundSource.Ent, "Aperture.amb_waiting_room_lights", 23 )
	StopAudio( EntHandles.Sounds.AmbWaitingRoomAirSoundSource.Ent, "Aperture.amb_waiting_room_air", 23 )
	
	--Turn off the broken atlas models once the door has closed
	EntFireByHandle( self, EntHandles.Relays.BrokenAtlasTurnOffRelay.Ent, "Trigger", "", 23 )

	--Set the FarZ back after the robot door has closed
	SetFarZ( 500, 23 )
	
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_now_serving" ) --1.9s

	if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 22.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset -20; vr_player_rotate 0", 23 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 25.0 )

		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 29.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset -30; vr_player_y_offset -20; vr_player_rotate 180", 30 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 32.0 )

		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 39.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset 80; vr_player_rotate 90", 40 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 42.0 )
	end

	StopNagging()
end


-----------------------------------------------------------
function OnAtlasWalkDoneAnimating( self, args )
	VRPrint( "OnAtlasWalkDoneAnimating()" )
	EntHandles.Props.AtlasWalkProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnAtlasWalkDoneAnimating", thisEntity )

	--Trigger the atlas holo explode sequence
	EntFireByHandle( self, EntHandles.Relays.AtlasHoloExplodeRelay.Ent, "Trigger" )

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_faceplate_a" ) --7.6s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_faceplate_b", 8 ) --4.2s

	--Queue nagging to attach to faceplate
	QueueNagging( "FaceplateUse", 11 )
    ChargingStationInteraction(3)
	
	if SmallRoomMode == true then
		EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeOut.Ent, "Fade", "", 0 )
		EntFireByHandle( self, EntHandles.PointHmdAnchors.SmallRoomVrRobotRepair.Ent, "Enable", "", 1 )
		EntFireByHandle( self, EntHandles.EnvFades.SmallRoomVrFadeIn.Ent, "Fade", "", 1 )
	end
	
end

-----------------------------------------------------------
function OnAtlasExplodeTriggerTouchedDebug( self, args )
	VRPrint( "OnAtlasExplodeTriggerTouchedDebug()" )

	OnAtlasExplodeTriggerTouched()
	--OnAtlasPulledOpen()

	EntFireByHandle( self, EntHandles.Remappers.OpenAtlas, "kill", "", 0.0 )
	EntFireByHandle( self, EntHandles.Props.AtlasCoreProp, "SetAnimation", "explode", 0.5 )
	EntFireByHandle( self, EntHandles.Props.AtlasEyeProp, "SetAnimation", "eyeball_pre_explode", 0.5 )
	EntFireByHandle( self, EntHandles.Relays.AtlasExplodeDoneRelay, "Trigger", "", 1.5 )
	
end

function OnAtlasRepairButtonTouchDebug (self, args)
	VRPrint( "OnAtlasRepairButtonTouchDebug()" )
		--Kill Holoobject and Do Particle effects

	EntFireByHandle( self, EntHandles.Relays.AtlasHoloRelay.Ent, "Trigger" )
	EntFireByHandle( self, EntHandles.Particles.AtlasHoloEndParticleEffect.Ent, "start", "", 0)
	EntFireByHandle( self, EntHandles.Particles.AtlasHoloEndParticleEffect.Ent, "kill", "", 3)
	OnAtlasRepairButtonTriggerTouched()
end

-----------------------------------------------------------
function OnAtlasExplodeTriggerTouched( self, args )
	VRPrint( "OnAtlasExplodeTriggerTouched()" )

	--Prevents double triggering of the function
	if EntHandles.Triggers.AtlasExplodeTrigger.Ent == nil then
		return
	end

	--Kill the trigger
	EntHandles.Triggers.AtlasExplodeTrigger.Ent:Kill()
	EntHandles.Triggers.AtlasExplodeTrigger.Ent = nil
	
	--Trigger the atlas explode sequence
	EntFireByHandle( self, EntHandles.Relays.AtlasExplodeRelay.Ent, "Trigger" )

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_faceplate_pull", 0.5 ) --5.4s

	--Queue nagging to attach to faceplate
	QueueNagging( "FaceplatePull", 6 )
	
end

-----------------------------------------------------------
function OnAtlasPulledOpen( self, args )
	VRPrint( "OnAtlasPulledOpen()" )
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_repair_button", 1 ) --3s

		--Queue nagging to press the repair button
	QueueNagging( "RepairButton", 3 )

	--Kill Holoobject and Do Particle effects

	EntFireByHandle( self, EntHandles.Relays.AtlasHoloRelay.Ent, "Trigger" )
	EntFireByHandle( self, EntHandles.Particles.AtlasHoloEndParticleEffect.Ent, "start", "", 0)
	EntFireByHandle( self, EntHandles.Particles.AtlasHoloEndParticleEffect.Ent, "kill", "", 3)
end

-----------------------------------------------------------
function OnAtlasRepairButtonTriggerTouched( self, args )
	VRPrint( "OnAtlasRepairButtonTriggerTouched()" )

	--Dont do the out of order charging station joke after this point
	EntFireByHandle( self, EntHandles.Triggers.ControllerPickupTrigger.Ent, "Disable", "", 0 )

	--Prevents double triggering of the function
	if EntHandles.Triggers.AtlasRepairButtonTrigger.Ent == nil then
		return
	end

	--Kill the trigger
	EntHandles.Triggers.AtlasRepairButtonTrigger.Ent:Kill()
	EntHandles.Triggers.AtlasRepairButtonTrigger.Ent = nil
	EntHandles.Triggers.AtlasRepairButtonTriggerCorrectSide.Ent:Kill()
	EntHandles.Triggers.AtlasRepairButtonTriggerCorrectSide.Ent = nil
	EntHandles.Triggers.AtlasRepairButtonTriggerWrongSide.Ent:Kill()
	EntHandles.Triggers.AtlasRepairButtonTriggerWrongSide.Ent = nil

	--Trigger the atlas repair button sequence
	EntFireByHandle( self, EntHandles.Relays.AtlasRepairButtonRelay.Ent, "Trigger" )

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_robot_fix" ) --19.3s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_alert_klaxon_a", 16.5 ) --6.6s
	PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.Klaxon01", 24 ) --15.4s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_alert_klaxon_b", 32 ) --3.9s
	PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.Klaxon02", 36 ) --12.4s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_alert_klaxon_c", 40 ) --3.5s
	PlayAudio( EntHandles.Sounds.KlaxonSoundSource.Ent, "Aperture.OceanSounds", 44 ) --11.3s
	PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.atlas_crash_snap", 54.77 )
	StopNagging()

	if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 16.0 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset 20; vr_player_rotate 0", 16.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 18.5 )

		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 31.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset -30; vr_player_y_offset 20; vr_player_rotate 180", 32 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 34.0 )

		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 39.5 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_player_height_offset 0; vr_player_x_offset 40; vr_player_y_offset 0; vr_player_rotate 0", 40 )
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 1", 42.0 )
	end

	--Queue the Atlas collapse to happen even if the player doesn't do anything
	local atlasRepairSequenceTime = 54.9
	VRPrint( "Queued the Atlas collapse sequence to happen in " .. atlasRepairSequenceTime .. " seconds" )
	AtlasCollapseTime = CurrentTime + atlasRepairSequenceTime
end


-----------------------------------------------------------
function OnAtlasCollapseTriggerTouched( self, args )
	VRPrint( "OnAtlasCollapseTriggerTouched()" )

	--Prevents double triggering of the function
	if EntHandles.Triggers.AtlasCollapseTrigger.Ent == nil then
		return
	end

	--Kill the trigger
	EntHandles.Triggers.AtlasCollapseTrigger.Ent:Kill()
	EntHandles.Triggers.AtlasCollapseTrigger.Ent = nil

	--Stop the Atlas collapse from triggering again
	AtlasCollapseTime = nil
	
	--Debug test for perf
	--EntFireByHandle( self, EntHandles.Props.worldOfFireTransparentProp.Ent, "Kill")

	if GlobalSys:CommandLineCheck( "-vrperftest" ) == true then
		EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "vr_perf_test_capture 0", 0 )
		PlayQuitFunction()
	end
	
	--Disable the HUD overlay models
	DisableVRRepairHUD()
	--Set the FarZ so that the entire outside space can be seen
	SetFarZ( 5400, 1 )


	--Stop the klaxon sounds
	EntFireByHandle( self, EntHandles.Sounds.KlaxonSoundSource.Ent, "StopSound" )

	--Trigger the atlas collapse sequence
	EntFireByHandle( self, EntHandles.Relays.AtlasCollapseRelay.Ent, "Trigger" )

	--Enable all the props in the bts area
	EntFireByHandle( self, EntHandles.Relays.BTSPropsTurnOnRelay.Ent, "Trigger", "", 10 )
	

	-- trigger relays to enable visibility of the exterior room container props
	EntFireByHandle( self, EntHandles.Relays.ContainerExteriorTurnonRelay.Ent, "Trigger", "", 1 )
	
	--Open the front wall
	EntFireByHandle( self, EntHandles.Props.FrontWallAssemblyProp.Ent, "SetAnimation", "open", 13 )

	--Disable the starting room soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.MainSpawnEnclosed.Ent, "Disable", "", 14 )

	SetFarZ( 15000, 13 )
	
	--Enable the wall open soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.MainSpawnWallOpen.Ent, "Enable", "", 13 )
	

	--Play crash sound
	PlayAudio( EntHandles.Sounds.CrashSoundSource.Ent, "Aperture.atlas_crash_debris", 0.2 ) --2.0s
	PlayAudio( EntHandles.Sounds.FloorSoundSource.Ent, "Aperture.floor_disposal", 3.8 )
	EntFireByHandle( self, EntHandles.Particles.AtmostPlasterEffectA.Ent, "start", "", 13)
	EntFireByHandle( self, EntHandles.Particles.AtmostPlasterEffectB.Ent, "start", "", 20)
	EntFireByHandle( self, EntHandles.Particles.AtmostPlasterEffectB.Ent, "start", "", 20)
	
	SetFarZ( -1, 40 )
	
	--Play the announcer and GLaDOS VO
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_failure", 13.2 ) --6.8s

	PlayAudio( EntHandles.Sounds.GladosEntrySoundSource.Ent, "Aperture.glados_entry_pre", 24 )
	PlayAudio( EntHandles.Sounds.GladosLoopSoundSource.Ent, "Aperture.glados_powerloop", 24 )	
	--EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "SetAnimation", "glados_oh_its_you", 23 )
	EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "SetAnimation", "glados_aperture_spectacle", 23 )
	PlayAudio( EntHandles.Sounds.GladosSoundSource.Ent, "Aperture.Glados_oh_its_you", 23 ) --5.6s

	--EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "SetAnimation", "glados_congratulations", 29.5 )
	PlayAudio( EntHandles.Sounds.GladosSoundSource.Ent, "Aperture.Glados_congratulations", 29.5 ) --8.6s

	--Trigger the start room to disassemble around the player
	EntFireByHandle( self, EntHandles.Relays.StartRoomDisassembleRelay.Ent, "Trigger", "", 35.9 )
	
		--Remove atlas
	EntFireByHandle( self, EntHandles.Relays.AtlasDisableRelay.Ent, "Trigger" )


end


-----------------------------------------------------------
function OnFrontWallAssemblyDoneAnimating( self, args )
	VRPrint( "OnFrontWallAssemblyDoneAnimating()" )
	EntHandles.Props.FrontWallAssemblyProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnFrontWallAssemblyDoneAnimating", thisEntity )
	
	--Kill the front wall assembly prop
	EntFireByHandle( self, EntHandles.Props.FrontWallAssemblyProp.Ent, "Kill" )
end


-----------------------------------------------------------
function OnStartRoomDisassembleRelayTriggered( self, args )
	VRPrint( "OnStartRoomDisassembleRelayTriggered()" )

	EntFireByHandle( self, EntHandles.Props.DrawerEmployee.Ent, "Disable" )

	--Disassemble the room around the player
	EntHandles.Props.StartRoomProp.Ent:RedirectOutput( "OnAnimationDone", "OnStartRoomDoneDisassembleAnimating", thisEntity )
	EntFireByHandle( self, EntHandles.Props.StartRoomProp.Ent, "SetAnimation", "room_disassembly" )
	EntFireByHandle( self, EntHandles.Props.AtlasInspectionLamp.Ent, "SetAnimation", "atlas_lamp_disassembly" )
	EntFireByHandle( self, EntHandles.Props.AtlasHolder.Ent, "SetAnimation", "atlas_holder_disassembly" )
	EntFireByHandle( self, EntHandles.Props.AtlasSedator.Ent, "SetAnimation", "atlas_sedator_disassembly" )
	
	--Sound Effects
	PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.decon_rumble", 1.5 )
	PlayAudio( EntHandles.Sounds.TwodSoundSource_b.Ent, "Aperture.decon_impact", 1.5 )
	StopAudio( EntHandles.Sounds.AmbRackSoundSource_a.Ent, "Aperture.amb_rack" )
	StopAudio( EntHandles.Sounds.AmbRackSoundSource_b.Ent, "Aperture.amb_rack_hum" )
	StopAudio( EntHandles.Sounds.AmbTapeMachineSoundSource.Ent, "Aperture.amb_tape_machine_hum" )
	StopAudio( EntHandles.Sounds.AmbDeskRadarSoundSource_a.Ent, "Aperture.amb_desk_radar" )
	StopAudio( EntHandles.Sounds.AmbDeskRadarSoundSource_b.Ent, "Aperture.amb_desk_radar_hum" )
	StopAudio( EntHandles.Sounds.AmbVentASoundSource.Ent, "Aperture.amb_vent_A" )
	StopAudio( EntHandles.Sounds.AmbVentBSoundSource.Ent, "Aperture.amb_vent_B" )
	StopAudio( EntHandles.Sounds.ChargerSoundSource.Ent, "Aperture.multitool_charger_loop" )
	StopAudio( EntHandles.Sounds.GladosLoopSoundSource.Ent, "Aperture.glados_powerloop", 10 )	
	
	--Trigger relay to kill the backWALL props and after it can no longer be seen
	EntFireByHandle( self, EntHandles.Relays.BackwallPropsKillRelay.Ent, "Trigger", "", 10 )
	
	--Trigger relay to kill the backROOM prop and light after it can no longer be seen
	EntFireByHandle( self, EntHandles.Relays.BackroomPropsKillRelay.Ent, "Trigger", "", 19 )
	
	--Kill the drawers prop
	EntFireByHandle( self, EntHandles.Props.MiniDrawersProp.Ent, "Kill", "", 16)
	
	--Enable the end room assembly prop
	EntFireByHandle( self, EntHandles.Props.DemoRoomAssemblyProp.Ent, "Enable", "", 10 )

	--Disable the wall open soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.MainSpawnWallOpen.Ent, "Disable", "", 0 )

	--Enable the full chamber open soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.TestChamberOpenFull.Ent, "Enable", "", 0 )



	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_repair_station_a", 1.5 ) --5.1s

	--EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "SetAnimation", "glados_dont_listen_to_him", 6 )
	--EntHandles.Props.GladosProp.Ent:RedirectOutput( "OnAnimationDone", "OnGladosPropDoneAnimating", thisEntity )
	PlayAudio( EntHandles.Sounds.GladosSoundSource.Ent, "Aperture.Glados_dont_listen_to_him", 6 ) --8.8s
	--EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "Disable", "", 16 )

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_repair_station_b", 27 ) --1.7s

	--Trigger the end room to assemble around the player
	EntFireByHandle( self, EntHandles.Relays.EndRoomAssembleRelay.Ent, "Trigger", "", 17 )
	
	--Holo End wall Sequence
	EntFireByHandle( self, EntHandles.Props.GdcHoloWall.Ent, "Enable", "", 28 )
	EntFireByHandle( self, EntHandles.Props.GdcHoloWall.Ent, "SetAnimation", "holo_anim", 28 )
	EntFireByHandle( self, EntHandles.Props.GdcHoloWall.Ent, "Kill", "", 55)

	--Turn off the start room cubemap in favor of the BTS one, since the start room is being disassembled
	--Disabling this till I can talk to Don about it. Some bad artifacts when this switch occurs.
	--EntFireByHandle( self, EntHandles.Cubemaps.StartRoomInterior.Ent, "Disable", "", 4 )
	--EntFireByHandle( self, EntHandles.Cubemaps.BTS.Ent, "SetLightGroups", "default;lg_startroom_interor", 4 )

end


-----------------------------------------------------------
function OnGladosPropDoneAnimating( self, args )
	VRPrint( "OnGladosPropDoneAnimating()" )
	EntHandles.Props.GladosProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnGladosPropDoneAnimating", thisEntity )

	--Kill the glados prop
	EntFireByHandle( self, EntHandles.Props.GladosProp.Ent, "Kill" )
end


-----------------------------------------------------------
function OnStartRoomDoneDisassembleAnimating( self, args )

	-- When holding animation at the last frame, we receive the output for OnAnimationDone
	-- repeatedly and indefinitely. Work around this by only doing anything the first time
	-- this is called.
	if onStartRoomDoneDisassembleAnimatingCalled then
		return
	end
	onStartRoomDoneDisassembleAnimatingCalled = true	
	
	VRPrint( "OnStartRoomDoneDisassembleAnimating()" )

	--Kill the start room prop
	EntFireByHandle( self, EntHandles.Props.StartRoomProp.Ent, "Kill", "", 50 )

end


-----------------------------------------------------------
function OnEndRoomAssembleRelayTriggered( self, args )
	VRPrint( "OnEndRoomAssembleRelayTriggered()" )

	--Assemble the room around the player
	EntFireByHandle( self, EntHandles.Props.DemoRoomAssemblyProp.Ent, "SetAnimation", "assemble" )

	--Disable the full chamber open soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.TestChamberOpenFull.Ent, "Disable", "", 37 )

	--Enable the final room soundscape
	EntFireByHandle( self, EntHandles.Soundscapes.FinalRoomEnclosed.Ent, "Enable", "", 37 )

	PlayAudio( EntHandles.Sounds.GladosSoundSource.Ent, "Aperture.Glados_end_want_you", 14.3 ) --11.2s
	PlayAudio( EntHandles.Sounds.GladosSoundSource.Ent, "Aperture.Glados_end_better_assignment", 26 ) --4s

	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_repair_station_c", 31.5 ) --1.6s
	PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, "Aperture.announcer_thankyou", 34 ) --1.2s
	
	PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.Glados_end_has_to_say_that", 35.7 ) --4s
	PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.Glados_end_goodbye", 40.3 ) --4s
	-- stop any remaining atmos effects
	EntFireByHandle( self, EntHandles.Particles.AtmostPlasterEffectA.Ent, "stop", "", 30)
	EntFireByHandle( self, EntHandles.Particles.AtmostPlasterEffectB.Ent, "stop", "", 30)
	

	--Trigger the end of the demo
	EntFireByHandle( self, EntHandles.Relays.DemoEndRelay.Ent, "Trigger", "", 45 )
end


-----------------------------------------------------------
function OnEndRoomAssemblyDoneAnimating( self, args )
	VRPrint( "OnEndRoomAssemblyDoneAnimating()" )	
	EntFireByHandle( self, EntHandles.Relays.StartTestChamberEndRelay.Ent, "Trigger", "", 0 )
	EntFireByHandle( self, EntHandles.Relays.AssemblySequenceOffRelay.Ent, "Trigger", "", 5.5 )
	
	-- Set the FarZ so less of outside vista is rendered when room closes
	SetFarZ( 800, 5.5 )
	
	EntFireByHandle( self, EntHandles.Relays.PlayerQuitRelay.Ent, "Trigger", "", 15.5 )
	
	EntHandles.Props.DemoRoomAssemblyProp.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnEndRoomAssemblyDoneAnimating", thisEntity )
	EntFireByHandle( self, EntHandles.Props.DemoRoomAssemblyProp.Ent, "kill", "", 5.5 )
	
	--Disable all the props in the bts area
	EntFireByHandle( self, EntHandles.Relays.BTSPropsTurnOffRelay.Ent, "Trigger", "", 5.5 )

	--Set the FarZ so that only the end room can be seen
	SetFarZ( 550, 14.0 )
end



-----------------------------------------------------------
function OnDemoEndRelayTriggered( self, args )
	VRPrint( "OnDemoEndRelayTriggered()" )

	--Print out the time it took for the demo to complete
	local totalDemoTime = CurrentTime - DemoStartTime
	local mins = math.floor( totalDemoTime/60 )
	local secs = math.floor( totalDemoTime - ( mins * 60 ) )
	print()
	print()
	VRPrint( "Total demo time: " .. string.format( "%02.f", mins ) .. ":" .. string.format( "%02.f", secs ) )
	print()
	print()
end

function IsUsePressed()
	UsePressed = false

	if player:IsUsePressed() then
		UsePressed = true
	end

	-- STEAM_RIGHT_TRIGGER_MASK            1
	-- STEAM_LEFT_TRIGGER_MASK             2
	-- STEAM_RIGHT_BUMPER_MASK             4
	-- STEAM_LEFT_BUMPER_MASK              8
	-- STEAM_BUTTON_0_MASK                 16
	-- STEAM_BUTTON_1_MASK                 32
	-- STEAM_BUTTON_2_MASK                 64
	-- STEAM_BUTTON_3_MASK                 128
	-- STEAM_TOUCH_0_MASK                  256
	-- STEAM_TOUCH_1_MASK                  512
	-- STEAM_TOUCH_2_MASK                  1024
	-- STEAM_TOUCH_3_MASK                  2048
	-- STEAM_BUTTON_MENU_MASK              4096
	-- STEAM_BUTTON_STEAM_MASK             8192
	-- STEAM_BUTTON_ESCAPE_MASK            16384
	-- STEAM_BUTTON_BACK_LEFT_MASK         32768
	-- STEAM_BUTTON_BACK_RIGHT_MASK        65536
	-- STEAM_BUTTON_LEFTPAD_CLICKED_MASK   131072
	-- STEAM_BUTTON_RIGHTPAD_CLICKED_MASK  262144
	-- STEAM_LEFTPAD_FINGERDOWN_MASK       524288
	-- STEAM_RIGHTPAD_FINGERDOWN_MASK      1048576

	-- TC_INPUT_L_TRACKPAD		1
	-- TC_INPUT_L_TRIGGER		2
	-- TC_INPUT_L_SYSTEM		4
	-- TC_INPUT_L_MENU			8
	-- TC_INPUT_L_GRIP			16
	-- TC_INPUT_R_TRACKPAD		65536
	-- TC_INPUT_R_TRIGGER		131072
	-- TC_INPUT_R_SYSTEM		262144
	-- TC_INPUT_R_MENU			524288
	-- TC_INPUT_R_GRIP			1048576
	
	UsefulButtons = bit.bor( 1, 2, 4, 8, 16 )

	if player:IsVRControllerButtonPressed( UsefulButtons ) then
		UsePressed = true
	end

	UsefulButtons = bit.bor( 65536, 131072, 262144, 524288, 1048576 )

	if player:IsVRControllerButtonPressed( UsefulButtons ) then
		UsePressed = true
	end

	return UsePressed;
end


-----------------------------------------------------------
function OnUpdate()
	local newTime = Time()
	
	DeltaTime = newTime - CurrentTime
	CurrentTime = newTime

	UpdateNagging()

	--Keep the controller attached to the player
	if ControllerPickedUp == true then
		local controllerPos
		local controllerPos2

		if InVRMode then
			controllerPos = player:ShootPosition( 0 )
			controllerPos2 = player:ShootPosition( 1 )
		else
			controllerPos = player:EyePosition() + ( player:EyeAngles():Forward() * 20 ) - ( player:EyeAngles():Up() * 5 )
			controllerPos2 = player:EyePosition() + ( player:EyeAngles():Forward() * 20 ) - ( player:EyeAngles():Up() * 5 )
		end
		EntHandles.Props.ControllerPickupProp.Ent:SetOrigin( controllerPos )
		EntHandles.Props.ControllerPickupProp2.Ent:SetOrigin( controllerPos2 )

		UsePressed = IsUsePressed()

		if UsePressed then
			if WaitingForButtonPress ~= -1.0 and CurrentTime >= WaitingForButtonPress then
				OnMultitoolPressButton()
				WaitingForButtonPress = -1.0
			end
		end

		--Use the HMDAvatar angles if its available
		local entToParent = player
		if HMDAvatar ~= nil then
			entToParent = HMDAvatar
		end

		local parentAngles = entToParent:GetAngles()
		EntHandles.Props.ControllerPickupProp.Ent:SetAngles( -20, parentAngles.y, parentAngles.z )
		EntHandles.Props.ControllerPickupProp2.Ent:SetAngles( -20, parentAngles.y, parentAngles.z )
	end

	--Trigger the Atlas collapse sequence if the time is up
	if AtlasCollapseTime ~= nil and CurrentTime >= AtlasCollapseTime then
		OnAtlasCollapseTriggerTouched( nil, nil )
	end

end


-----------------------------------------------------------
function PlayAudio( audioEnt, audioName, delay )
	delay = delay or 0

	VRPrint( "PlayAudio(): " .. audioName .. " in " .. delay .. " seconds" )

	EntFireByHandle( self, audioEnt, "SetSoundName", audioName, delay )
	EntFireByHandle( self, audioEnt, "StartSound", "", delay )
end


-----------------------------------------------------------
function StopAudio( audioEnt, audioName, delay )
	delay = delay or 0

	VRPrint( "StopAudio(): " .. audioName .. " in " .. delay .. " seconds" )

	EntFireByHandle( self, audioEnt, "SetSoundName", audioName, delay )
	EntFireByHandle( self, audioEnt, "StopSound", "", delay )
end


-----------------------------------------------------------
function QueueNagging( nagName, delay )
	delay = delay or 0

	VRPrint( "QueueNagging(): " .. nagName .. " in " .. delay .. " seconds" )

	CurrentNagName = nagName
	NextNagTime = CurrentTime + delay + NagList[CurrentNagName].NagDelay
	NextAutoCompleteTime = CurrentTime + delay + NagList[CurrentNagName].NagDelay + NagList[CurrentNagName].InevitableCompletion

	if DemoFastCompletion then
		NextAutoCompleteTime = CurrentTime + delay
	end
	LastNagTime = 0
end


-----------------------------------------------------------
function StopNagging()
	VRPrint( "StopNagging(): " .. CurrentNagName )
	if CurrentNagName ~= "" and NagList[CurrentNagName].InfoParticles ~= nil and NagList[CurrentNagName].InfoParticles.Ent ~= nil then
		EntFireByHandle( self, NagList[CurrentNagName].InfoParticles.Ent, "StopPlayEndCap","", 10 )
	end
	CurrentNagName = ""
end


releaseskipbutton = true

-----------------------------------------------------------
function UpdateNagging()

	UsefulButtons = bit.bor( 4, 8, 262144, 524288 )

	if player:IsVRControllerButtonPressed( UsefulButtons ) and releaseskipbutton then
		--UNCOMMENT THESE LINES TO SKIP AHEAD ON A BUTTON
		--PlayAudio( EntHandles.Sounds.TwodSoundSource_a.Ent, "Aperture.multitool_charge" )
		--DemoCanCompleteItself = true
		--NextAutoCompleteTime = CurrentTime
		releaseskipbutton = false
	end

	if not player:IsVRControllerButtonPressed( UsefulButtons ) then
		releaseskipbutton = true
	end

	if CurrentNagName ~= "" then --There is a nag active or queued
		if DemoCanCompleteItself and NagList[CurrentNagName].InevitableCompletionFunction ~= nil and CurrentTime >= NextAutoCompleteTime then
			VRPrint( "Nag Auto Complete Function (" .. CurrentNagName .. "): " .. NagList[CurrentNagName].InevitableCompletionFunction .. "()" )
			NagTemp = CurrentNagName
			getfenv()[NagList[CurrentNagName].InevitableCompletionFunction]()
			if NagTemp == CurrentNagName then
				StopNagging()
			end
			return
		end

		if CurrentTime >= NextNagTime then --Time to play a nag
			local nagIndex = RandomInt( 1, #NagList[CurrentNagName].Nags )
			--Play the nag
			PlayAudio( EntHandles.Sounds.AnnouncerSoundSource.Ent, NagList[CurrentNagName].Nags[nagIndex] )
			--PlayAudio( EntHandles.Sounds.NagSoundSource.Ent, NagList[CurrentNagName].Nags[nagIndex] )
			if NagList[CurrentNagName].InfoParticles ~= nil and NagList[CurrentNagName].InfoParticles.Ent ~= nil then
				EntFireByHandle( self, NagList[CurrentNagName].InfoParticles.Ent, "Start", "", 0.75 )
			end

			--Queue the next nag
			NextNagTime = CurrentTime + NagList[CurrentNagName].NagDelay
			if DemoSlowNags == true then
				NextNagTime = NextNagTime + NagList[CurrentNagName].NagDelay * 2
			end
		end
	end
end


-----------------------------------------------------------
function EnableNextVRRepairHUD()
	VRPrint( "EnableNextVRRepairHUD()" )

	--Check if the Convar is set on
	local useVRHUD = Convars:GetBool( "aperture_use_vr_hud" )

	if InVRMode and useVRHUD then
		CurrentRepairHUDSequence = CurrentRepairHUDSequence + 1
		if CurrentRepairHUDSequence <= #RepairHUDSequence then
			Convars:SetStr( RepairHUDSequence[CurrentRepairHUDSequence].ConvarName, RepairHUDSequence[CurrentRepairHUDSequence].ModelName )
		else
			VRPrint( "Already enabled all the HUD models." )
		end
	else
		VRPrint( "Not enabling the VR HUD since the convar \"aperture_use_vr_hud\" is not set or the game is not in VR mode." )
	end
end


-----------------------------------------------------------
function DisableVRRepairHUD()
	VRPrint( "DisableVRRepairHUD()" )

	--Disable the HUD models
	Convars:SetStr( "vr_hmd_helmet_no_rotate_model", "" )
	Convars:SetStr( "vr_hmd_helmet_yaw_model", "" )
	Convars:SetStr( "vr_hmd_helmet_yaw_roll_model", "" )
	Convars:SetStr( "vr_hmd_helmet_yaw_roll_pitch_model", "" )
	Convars:SetStr( "vr_hmd_helmet_yaw_pitch_model", "" )
	Convars:SetStr( "vr_hmd_helmet_pitch_model", "" )
	Convars:SetStr( "vr_hmd_helmet_roll_model", "" )
end


-----------------------------------------------------------
function SetFarZ( zVal, delay )
	delay = delay or 0

	VRPrint( "SetFarZ() zVal: " .. zVal .. " in " .. delay .. " seconds" )

	EntFireByHandle( self, EntHandles.ServerCommands.Command.Ent, "Command", "r_farz " .. zVal, delay )
end

-----------------------------------------------------------
function OnSetHandModels()
	VRPrint( "OnSetHandModels()" )
end


-----------------------------------------------------------
function OnHMDAvatarAndHandsSpawned()
	VRPrint( "OnHMDAvatarAndHandsSpawned()" )

	HMDAvatar = player:GetHMDAvatar()

	CreateApertureMultitools()
end


-----------------------------------------------------------
function CreateApertureMultitools()
	VRPrint( "CreateApertureMultitools()" )

	--Create the multitool entity for each hand
	SpawnTable = 
	{
		aperture_multitool1 = 
		{
			classname = "vr_aperture_multitool",
			origin = Vector(0, 0, 0),
			angles = QAngle(0, 0, 0),
			model = "aperture/models/vr_controller.vmdl"
		},

		aperture_multitool2 = 
		{
			classname = "vr_aperture_multitool",
			origin = Vector(0, 0, 0),
			angles = QAngle(0, 0, 0),
			model = "aperture/models/vr_controller.vmdl"
		}
	}

	SpawnEntityListFromTableAsynchronous( SpawnTable, OnMultitoolsSpawned )
end


-----------------------------------------------------------
function OnMultitoolsSpawned( spawnedEnts )
	VRPrint( "OnMultitoolsSpawned()" )
	
	VRPrint( "Spawned " .. #spawnedEnts .. " multitools" )

	player:SetLightGroup( "lg_startroom_interior" )

	local hand1 = HMDAvatar:GetVRHand( 0 )
	hand1:SetAttachment( spawnedEnts[1] )

	local hand2 = HMDAvatar:GetVRHand( 1 )
	hand2:SetAttachment( spawnedEnts[2] )
end


-----------------------------------------------------------
function ChargingStationInteraction ( MyState )
	VRPrint( "ChargingStationInteraction()")
	if  MyState == 1 then
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "controller_start_anim", 0 )
		EntHandles.Props.ControllerChargingStation.Ent:RedirectOutput( "OnAnimationDone", "OnChargingStationStartAnimComplete", thisEntity )
		EntFireByHandle( self, EntHandles.Particles.ChargingStationUserClickParticleEffect.Ent, "start")
	elseif MyState == 2 and not ChargingStationReversePolarityState then
		EntHandles.Props.ControllerChargingStation.Ent:RedirectOutput( "OnAnimationLoopCycleDone", "OnChargingStationReversePolarityAnimComplete", thisEntity )
	elseif MyState == 3 then
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "controller_station_reverse", 0 )
		--EntHandles.Props.ControllerChargingStation.Ent:RedirectOutput( "OnAnimationLoopCycleDone", "OnChargingStationUserClickComplete", thisEntity )
		EntFireByHandle( self, EntHandles.Particles.ChargingStationUserClickParticleEffect.Ent, "StopPlayEndCap")
	end
end

function OnChargingStationStartAnimComplete()
	VRPrint( "OnChargingStationStartAnimComplete()")
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "rotate_clockwise", 0 )
	EntHandles.Props.ControllerChargingStation.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnChargingStationStartAnimComplete", thisEntity )
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "1", 0.001 )
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "1.5", .5 )
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "2", 1 )
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "4", 1.5 )
	EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "8", 2 )

end

function OnChargingStationReversePolarityAnimComplete()
	if not ChargingStationReversePolarityState then
		VRPrint( "OnChargingStationReversePolarityAnimComplete()")
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "reverse_polarity", 0 )
		--EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "1", .001 )
		EntHandles.Props.ControllerChargingStation.Ent:DisconnectRedirectedOutput( "OnAnimationLoopCycleDone", "OnChargingStationReversePolarityAnimComplete", thisEntity )
		EntHandles.Props.ControllerChargingStation.Ent:RedirectOutput( "OnAnimationDone", "OnChargingStationReverseDirectionAnimComplete", thisEntity )
		
		EntFireByHandle( self, EntHandles.Particles.ChargingStationParticleEffect.Ent, "StopPlayEndCap")
		EntFireByHandle( self, EntHandles.Particles.ChargingStationEnableParticleEffect.Ent, "Start")
		ChargingStationReversePolarityState = true
	end	

end

function OnChargingStationReverseDirectionAnimComplete()
	if not ChargingStationReverseDirState then 
		VRPrint( "OnChargingStationReverseDirectionAnimComplete")
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "rotate_counter_clockwise", 0 )
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "1.5", .5 )
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "2", .75 )
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetPlaybackRate", "3", 1 )
		EntHandles.Props.ControllerChargingStation.Ent:DisconnectRedirectedOutput( "OnAnimationDone", "OnChargingStationReverseDirectionAnimComplete", thisEntity )
		ChargingStationReverseDirState = true

	end
end

function OnChargingStationUserClickComplete()
	if not OnChargingStationUserClickCompleteState then 
		VRPrint( "OnChargingStationUserClickComplete()")
		EntFireByHandle( self, EntHandles.Props.ControllerChargingStation.Ent, "SetAnimation", "controller_station_reverse", 0 )
		EntHandles.Props.ControllerChargingStation.Ent:DisconnectRedirectedOutput( "OnAnimationLoopCycleDone", "OnChargingStationUserClickComplete", thisEntity )
		OnChargingStationUserClickCompleteState = true
	end
end

function PlayQuitFunction()
	player:Quit()
end

