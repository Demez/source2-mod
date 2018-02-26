------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the script logic for map: vr_longbow
--
-------------------------------------------------------------------------------

InVRMode = false
HMDAvatar = nil
Hand1Attached = false
Hand2Attached = false
Multitools = {}


--Class names for all the entities to get handles to
EntClassNames =
{
	Triggers = "trigger_multiple",
	Longbows = "vr_longbow"
}

--Entities whose handles are needed by the script
EntHandles =
{
	Triggers =
	{
		LongbowPickupTrigger =
		{
			Name = "longbow_pickup_trigger",
			OutputName = "OnStartTouch",
			RedirectFunction = "OnLongbowPickupTriggerTouched",
			Ent = nil
		}
	},

	Longbows =
	{
		Longbow =
		{
			Name = "vr_longbow",
			Ent = nil
		}
	}
}


-----------------------------------------------------------
function VRPrint( msg )
	print( "VR_LONGBOW_LOGIC: " .. msg )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRPrint( "OnGameplayStart()" )

	InVRMode = IsInVRMode()

	if InVRMode then
		VRPrint( "Playing in VR" )
	else
		VRPrint( "Not playing in VR" )
	end


	--Get all the entity handles needed by the script
	print()
	print()
	GetEntityHandles()
	print()
	print()
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
function OnUpdate()
end


-----------------------------------------------------------
function OnLongbowPickupTriggerTouched( self, args )
	VRPrint( "OnLongbowPickupTriggerTouched()" )
end


-----------------------------------------------------------
function OnHMDAvatarAndHandsSpawned()
	VRPrint( "OnHMDAvatarAndHandsSpawned()" )

	HMDAvatar = player:GetHMDAvatar()
	local hand1 = HMDAvatar:GetVRHand( 0 )
	if hand1 ~= nil then
		hand1:SetAttachment( EntHandles.Longbows.Longbow.Ent )
	end
end
