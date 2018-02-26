------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the script logic for map: vr_prefab_spawn_test
--
-------------------------------------------------------------------------------

--Entities
PrefabSpawnRelay = nil
PrefabDeleteRelay = nil

TestPrefabName = "prefabs/aperture_bts_01"
IsPrefabSpawned = false
SpawnedPrefabHandle = nil
PrefabSpawnSendTime = nil
PrefabCallbackReceiveTime = nil


-----------------------------------------------------------
function VRPrint( msg )
	print( "VR_PREFAB_LOGIC: " .. msg )
end


-----------------------------------------------------------
function OnPrecache( self, context )
	VRPrint( "OnPrecache()" )

	PrecachePrefabs( context )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRPrint( "OnGameplayStart()" )

	CurrentTime = Time()
	DeltaTime = 0

	--Get all the entity handles needed by the script
	PrefabSpawnRelay = Entities:FindByName( nil, "prefab_spawn_relay" )
	PrefabSpawnRelay:RedirectOutput( "OnTrigger", "OnPrefabSpawnRelayTriggered", thisEntity )

	PrefabDeleteRelay = Entities:FindByName( nil, "prefab_delete_relay" )
	PrefabDeleteRelay:RedirectOutput( "OnTrigger", "OnPrefabDeleteRelayTriggered", thisEntity )
end


-----------------------------------------------------------
function OnPrefabSpawnRelayTriggered()
	VRPrint( "OnPrefabSpawnRelayTriggered()" )

	--Delete the prefab first if it is already spawned
	if IsPrefabSpawned == true then
		VRPrint( "Prefab has already spawned, deleting it first." )
		OnPrefabDeleteRelayTriggered()
	end

	--Spawn the prefab and store its handle
	local position = Vector( 0, 0, 0 )
	local angles = QAngle( 0, 0, 0 )
	local callbackData = { prefabName = TestPrefabName }
	SpawnedPrefabHandle = SpawnPrefab( TestPrefabName, position, angles, PrefabSpawnedCallback, self, callbackData )
	IsPrefabSpawned = true

	VRPrint( "SpawnPrefab returned handle: " .. SpawnedPrefabHandle )
end


-----------------------------------------------------------
function OnPrefabDeleteRelayTriggered()
	VRPrint( "OnPrefabDeleteRelayTriggered()" )

	if IsPrefabSpawned == true then
		VRPrint( "Deleting spawn group with handle: " .. SpawnedPrefabHandle )
		DeleteSpawnedPrefab( SpawnedPrefabHandle )
	else
		VRPrint( "Prefab isn't currently spawned. Cannot delete." )
	end

	IsPrefabSpawned = false
end


-----------------------------------------------------------
function PrecachePrefabs( context )
	VRPrint( "PrecachePrefabs()" )

	local position = Vector( 0, 0, 0 )
	local angles = QAngle( 0, 0, 0 )

	point_prefab =
	{
		classname = "point_prefab",
		origin = position,
		angles = angles,
		targetMapName = TestPrefabName,
		fixupNames = "1"
	}

	PrecacheEntityFromTable( "point_prefab", point_prefab, context )
end


-----------------------------------------------------------
function SpawnPrefab( prefabName, position, angles, spawnCallbackFunc, spawnCallbackScope, spawnCallbackData )
	VRPrint( "PrecachePrefabs()" )

	PrefabSpawnTime = Time()
	VRPrint( "Spawning prefab on: " .. PrefabSpawnTime )
	
	SpawnTable =
	{
		point_prefab =
		{
			classname = "point_prefab",
			origin = position,
			angles = angles,
			targetMapName = prefabName,
			fixupNames = "1"
		}
	}

	return SpawnEntityListFromTableAsynchronous( SpawnTable, function( entities ) spawnCallbackFunc( spawnCallbackScope, entities, spawnCallbackData ) end )
end


-----------------------------------------------------------
function DeleteSpawnedPrefab( prefabHandle )
	VRPrint( "DeleteSpawnedPrefab()" )

	UnloadSpawnGroupByHandle( SpawnedPrefabHandle )
end


-----------------------------------------------------------
function PrefabSpawnedCallback( self, entities, callbackData )
	VRPrint( "PrefabSpawnedCallback" )

	print()

	PrefabCallbackReceiveTime = Time()
	VRPrint( "Prefab callback received on: " .. PrefabCallbackReceiveTime )

	local totalPrefabSpawnTime = PrefabCallbackReceiveTime - PrefabSpawnTime
	VRPrint( "Total prefab spawn time: " .. totalPrefabSpawnTime )

	print()
	VRPrint( "Spawned entities: " )
	local entCount = 0
	for _, ent in ipairs( entities ) do
		entCount = entCount + 1
		local className = ent:GetClassname()
		local entName = ent:GetName()
		if entName == "" then
			entName = "(unnamed)"
		end

		VRPrint( "\t" .. entCount .. ": " .. className .. ": " .. entName )
	end
	VRPrint( "Spawned " .. entCount .. " entities" )

	print()
	VRPrint( "Callback data" )
	for key, val in pairs( callbackData ) do
		VRPrint( "\t".. key .. ": " .. val)
	end
	print()
end
