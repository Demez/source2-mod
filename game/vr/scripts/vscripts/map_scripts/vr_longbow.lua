------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the gameplay logic for map: vr_longbow
--
-------------------------------------------------------------------------------

ScriptLogicEntity = nil
ScriptLogicScope = nil
HasUpdateFunc = false

-----------------------------------------------------------
function VRLongbowPrint( msg )
	print( "VR_LONGBOW: " .. msg )
end


-----------------------------------------------------------
function OnInit()
	VRLongbowPrint( "OnInit()" )

	--Create the logic_script entity that controls the logic for the map
	ScriptLogicEntity = SpawnScriptEnt( "LongbowLogic", "vr_longbow_logic" )
	ScriptLogicScope = ScriptLogicEntity:GetPrivateScriptScope()

	VRLongbowPrint( "Created script logic entity" )

	CallScriptLogicFunction( "OnInit" )

	if vlua.contains( ScriptLogicScope, "OnUpdate" ) then
		HasUpdateFunc = true
	end
end


-----------------------------------------------------------
function OnPrecache( context )
	VRLongbowPrint( "OnPrecache()" )

	CallScriptLogicFunction( "OnPrecache", context )
end


-----------------------------------------------------------
function OnActivate()
	VRLongbowPrint( "OnActivate()" )

	CallScriptLogicFunction( "OnActivate" )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRLongbowPrint( "OnGameplayStart()" )

	CallScriptLogicFunction( "OnGameplayStart" )
end


-----------------------------------------------------------
function OnPlayerSpawned()
	VRLongbowPrint( "OnPlayerSpawned()" )

	ScriptSystem_AddPerFrameUpdateFunction( OnUpdate )

	CallScriptLogicFunction( "OnPlayerSpawned" )
end


-----------------------------------------------------------
function OnHMDAvatarAndHandsSpawned()
	VRLongbowPrint( "OnHMDAvatarAndHandsSpawned()" )

	CallScriptLogicFunction( "OnHMDAvatarAndHandsSpawned" )
end


-----------------------------------------------------------
function OnShutdown()
	VRLongbowPrint( "OnShutdown()" )

	CallScriptLogicFunction( "OnShutdown" )
end


-----------------------------------------------------------
function OnUpdate()
	if VRLongbowPrint == false then
		return
	end

	if HasUpdateFunc then
		CallScriptLogicFunction( "OnUpdate" )
	end
end


-----------------------------------------------------------
function SpawnScriptEnt( entName, scriptName, pos, ang )
	pos = pos or Vector(0, 0, 0)
	ang = ang or QAngle(0, 0, 0)
	local spawnTable = 
	{
		classname = "logic_script",
		targetname = entName,
		vscripts = scriptName,
		origin = pos,
		angles = ang
	}
	
	local spawnedEnt = SpawnEntityFromTableSynchronous( "logic_script", spawnTable )
	return spawnedEnt
end


-----------------------------------------------------------
function CallScriptLogicFunction( functionName, params )
	if vlua.contains( ScriptLogicScope, functionName ) then 
		if params == nil then 
			ScriptLogicScope[functionName]( ScriptLogicScope )
		else 
			ScriptLogicScope[functionName]( ScriptLogicScope, params )
		end
	else
		VRLongbowPrint( "Logic ent doesn't contain function named: " .. functionName )
	end
end
