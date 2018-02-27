------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the script logic for map: vr_aperture_main
--
-------------------------------------------------------------------------------

HMDAvatar = nil
InVRMode = false
CurrentTime = nil
DeltaTime = nil
DemoStartTime = nil
AtlasCollapseTime = nil

--Controller pickup
SkipControllerJokes = true

ControllerPickedUp = false
DemoCanCompleteItself = true
DemoFastCompletion = false
DemoSlowNags = false
DemoAutoStarts = true

--ChargingStation
ChargingStationReverseDirState = false
ChargingStationReversePolarityState = false
OnChargingStationUserClickCompleteState = false

MustHoldLeverDoorOpen = true

WaitingForButtonPress = -1.0

--Drawers
OpenedDrawers = {}
CurrentDrawer = nil
CurrentDrawerState = nil
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
	Particles = "info_particle_system"
}

--Entities whose handles are needed by the script
EntHandles =
{
	Triggers =
	{
	
	},

	Relays =
	{
		
	},

	Buttons =
	{
	
	},

	Props =
	{
		BoneTest =
		{
			Name = "bonetest",
			Ent = nil
		},
		BoneTestCube =
		{
			Name = "bonetestcube",
			Ent = nil
		},
	},

	Sounds =
	{
		
	},

	Remappers =
	{
		
	},

	Soundscapes =
	{
		
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
		
		
	},
}


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
	SetFarZ( 470, offset + 1.00 ) 
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

	--EntHandles.Props.BoneTest.Ent:SetConstraint( player:EyePosition() )

	--EntHandles.Props.BoneTest.Ent:SetParent( EntHandles.Props.BoneTestCube.Ent, "!bonemerge" )
	--EntHandles.Props.BoneTest.Ent:SetParent( player, "" )
	
end

function OnUpdate()
	EntHandles.Props.BoneTest.Ent:SetConstraint( player:EyePosition() )
end

-----------------------------------------------------------
function OnShutdown()
	VRPrint( "OnShutdown()" )

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

						--Set up the redirect for the entity if requested`
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

