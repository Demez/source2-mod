------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the gameplay logic for map: vr_demo_1
--
-------------------------------------------------------------------------------

--Globals
ObjectList =
{
	{
		name = "Spell Book",
		brushName = "brush_spell_book",
		brushEnt = nil
	},

	{
		name = "Sword Bucket",
		brushName = "brush_sword_bucket",
		brushEnt = nil
	},

	{
		name = "Wall Swords",
		brushName = "brush_wall_swords",
		brushEnt = nil
	},

	{
		name = "Telescope",
		brushName = "brush_telescope",
		brushEnt = nil
	},

	{
		name = "Bottle",
		brushName = "brush_bottle",
		brushEnt = nil
	},

	{
		name = "Candle",
		brushName = "brush_candle",
		brushEnt = nil
	},

	{
		name = "Gyroscope",
		brushName = "brush_gyroscope",
		brushEnt = nil
	},

	{
		name = "Shield",
		brushName = "brush_shield",
		brushEnt = nil
	},

	{
		name = "Hammer",
		brushName = "brush_hammer",
		brushEnt = nil
	},

	{
		name = "Grate",
		brushName = "brush_grate",
		brushEnt = nil
	},

	{
		name = "Boots",
		brushName = "brush_boots",
		brushEnt = nil
	},

	{
		name = "Chest",
		brushName = "brush_chest",
		brushEnt = nil
	}
}

PrevObjectLookedAt = nil
ObjectBeingLookedAt = nil
LookStartTime = 0

-----------------------------------------------------------
function VRDemoPrint( msg )
	print( "SECRET_SHOP: " .. msg )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRDemoPrint( "OnGameplayStart()" )

	--Look for all the func brushes in the map
	VRDemoPrint( "Looking for all the look triggers in the map" )
	local allBrushes = Entities:FindAllByClassname( "func_brush" )

	for _, brush in ipairs( allBrushes ) do
		local className = brush:GetClassname()
		local entName = brush:GetName()
		if entName == "" then
			entName = "(unnamed)"
		end
		VRDemoPrint( "Found " .. className .. ": " .. entName )

		--Match up all the func_brushes in the map with the objects that they represent
		for _, object in ipairs( ObjectList ) do
			if object.brushName == entName then
				VRDemoPrint( "Matched: " .. entName .. " with: " .. object.name )
				object.brushEnt = brush
			end
		end
	end
end


-----------------------------------------------------------
function OnPlayerSpawned()
	VRDemoPrint( "OnPlayerSpawned()" )

	ScriptSystem_AddPerFrameUpdateFunction( OnUpdate )
end


-----------------------------------------------------------
function OnUpdate()
	local curTime = Time()

	--Trace from the player's eye position
	local traceTable =
	{
		ignore = player,
		startpos = player:EyePosition(),
		endpos = player:EyePosition() + ( player:EyeAngles():Forward() * 300 )
	}

	local debugColor = Vector( 255, 0, 0 )
	local traceEndPos = nil

	--Store the object that was being looked at last update
	PrevObjectLookedAt = ObjectBeingLookedAt

	if TraceLine( traceTable ) then
		--If the trace hit a func_brush entity
		if traceTable.enthit ~= nil and traceTable.enthit:GetClassname() == "func_brush" then
			debugColor = Vector( 0, 255, 0 )
			traceEndPos = traceTable.pos
			--DebugDrawText( traceTable.pos, "EntName: " .. traceTable.enthit:GetName(), false, 0 )

			--Match the hit func_brush with the object it represents
			local traceHitObject = FindObjectForBrush( traceTable.enthit )
			if traceHitObject ~= nil then
				ObjectBeingLookedAt = traceHitObject
			else
				ObjectBeingLookedAt = nil
			end
		else
			--Trace did not hit a valid entity
			ObjectBeingLookedAt = nil
		end
		--DebugDrawSphere( traceTable.pos, debugColor, 1, 5, true, 0 )
	end

	--Figure out how long the player has been looking at this object
	if ObjectBeingLookedAt ~= PrevObjectLookedAt then
		LookStartTime = curTime
	end


	--Display what the player is looking at
	if ObjectBeingLookedAt ~= nil then
		local lookingAtText = "Looking At: "
		local objectName = "NONE"
		objectName = ObjectBeingLookedAt.name
		local totalLookTime = curTime - LookStartTime
		local timeString = string.format( "%.2f", totalLookTime )
		DebugScreenTextPretty( 140, 40, 0, timeString .. " seconds", 255, 0, 0, 255, 0, "arial", 30, false )
		DebugScreenTextPretty( 10, 15, 0, lookingAtText, 255, 255, 0, 255, 0, "arial", 30, false )
		DebugScreenTextPretty( 145, 15, 0, objectName, 0, 255, 0, 255, 0, "arial", 30, true )
		DebugDrawText( traceEndPos, objectName, false, 0 )
	end
end


-----------------------------------------------------------
function FindObjectForBrush( brushEnt )
	for _, object in ipairs( ObjectList ) do
		if object.brushEnt ~= nil and object.brushEnt == brushEnt then
			return object
		end
	end

	return nil
end
