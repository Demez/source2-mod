------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the script logic for map: vr_prefab_spawn_test
--
-------------------------------------------------------------------------------

--Entities
GladosStartRelay = nil
GladosProp = nil

AnnouncerSoundSource = nil
GladosSoundSource = nil


-----------------------------------------------------------
function VRPrint( msg )
	print( "VR_GLADOS_LOGIC: " .. msg )
end


-----------------------------------------------------------
function OnPrecache( self, context )
	VRPrint( "OnPrecache()" )
end


-----------------------------------------------------------
function OnGameplayStart()
	VRPrint( "OnGameplayStart()" )

	CurrentTime = Time()
	DeltaTime = 0


	--Get all the entity handles needed by the script
	GladosStartRelay = Entities:FindByName( nil, "glados_start_relay" )
	GladosStartRelay:RedirectOutput( "OnTrigger", "OnGladosStartRelayTriggered", thisEntity )

	GladosProp = Entities:FindByName( nil, "*_glados" )

	AnnouncerSoundSource = Entities:FindByName( nil, "*_announcer_sound_source" )
	GladosSoundSource = Entities:FindByName( nil, "*_glados_sound_source" )
end


-----------------------------------------------------------
function PlayAudio( audioEnt, audioName, delay )
	delay = delay or 0

	VRPrint( "PlayAudio(): " .. audioName .. " in " .. delay .. " seconds" )

	EntFireByHandle( self, audioEnt, "SetSoundName", audioName, delay )
	EntFireByHandle( self, audioEnt, "StartSound", "", delay )
end


-----------------------------------------------------------
function OnGladosStartRelayTriggered()
	VRPrint( "OnGladosStartRelayTriggered()" )

	--Bring down GLaDOS
	EntFireByHandle( self, GladosProp, "SetPlaybackRate", "1", 6 )
	EntFireByHandle( self, GladosProp, "SetAnimation", "glados_aperture_spectacle", 7 )

	PlayAudio( AnnouncerSoundSource, "Aperture.Announcer_Meltdown01" ) --5.8s
	PlayAudio( GladosSoundSource, "Aperture.Glados_oh_its_you_01", 7 ) --5.6s
	PlayAudio( GladosSoundSource, "Aperture.Glados_congratulations_01", 14 ) --8.2s
	PlayAudio( AnnouncerSoundSource, "Aperture.Announcer_Failure02", 22 ) --4.1s
	PlayAudio( GladosSoundSource, "Aperture.Glados_dont_listen_to_him_01", 27 ) --8.8s
end

