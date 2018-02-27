------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the gameplay logic for map: vr_demo_1
--
-------------------------------------------------------------------------------

Props = {}

-----------------------------------------------------------
function VRDemoPrint( msg )
	print( "VR_DEMO_1: " .. msg )
end


-----------------------------------------------------------
function OnInit()
	VRDemoPrint( "OnInit()" )

	g_VRScript.AddConVar( "VRDemoDebug", "0", "bool", getfenv( 0 ), "Enable/Disable debug draw for the vr demo" )
end


-----------------------------------------------------------
function OnActivate()
	VRDemoPrint( "OnActivate()" )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRDemoPrint( "OnGameplayStart()" )

	PrintEntityCount()
end


-----------------------------------------------------------
function OnPlayerSpawned()
	VRDemoPrint( "OnPlayerSpawned()" )

	ScriptSystem_AddPerFrameUpdateFunction( OnUpdate )
end


-----------------------------------------------------------
function PrintEntityCount()

	local classToFind = "prop_dynamic"
	print()
	VRDemoPrint( "Looking for entities of class \"" .. classToFind .. "\" at OnGameplayStart()" )
	print()

	local testEntities = Entities:FindAllByClassname( classToFind )
	local entCount = 0
	for _, foundProp in ipairs( testEntities ) do
		local className = foundProp:GetClassname()
		local entName = foundProp:GetName()
		if entName == "" then
			entName = "(unnamed)"
		end
		local modelName = foundProp:GetModelName()
		VRDemoPrint( "Found " .. className .. ": " .. entName .. ": using model: " .. modelName )
		table.insert( Props, foundProp )
		entCount = entCount + 1
	end

	print()
	VRDemoPrint( "Total Entities: " .. entCount )
	print()
end


-----------------------------------------------------------
function OnUpdate()
	if VRDemoDebug == false then
		return
	end

	local traceTable =
	{
		ignore = player,
		startpos = player:EyePosition(),
		endpos = player:EyePosition() + ( player:EyeAngles():Forward() * 300 )
	}
	
	local debugColor = Vector( 255, 0, 0 )

	if TraceLine( traceTable ) then
		if traceTable.enthit ~= nil and traceTable.enthit:GetClassname() ~= "worldspawn" then
			debugColor = Vector( 0, 255, 0 )
			DebugDrawText( traceTable.pos, "EntName: " .. traceTable.enthit:GetClassname(), false, 0 )
		end
		DebugDrawSphere( traceTable.pos, debugColor, 1, 5, true, 0 )
	end
end
