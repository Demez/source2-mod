------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the scripts run in the vr mod.
-- Handles initialization/shutdown logic and calls into mode and map specific scripts
--
-------------------------------------------------------------------------------

--Globals
ScriptSystemUpdateFunctions = {}


-----------------------------------------------------------
function ScriptSystemPrint( msg )
	print( "SCRIPT_SYSTEM: " .. msg )
end


--Function names starting with SystemCall_ are called from C++ server code

-----------------------------------------------------------
function SystemCall_Init( self, modeName, mapName )
	ScriptSystemPrint( "SystemCall_Init() : VR Script system loaded" )
	
	_G.g_VRScript = getfenv(0).VRScriptScope

	local mapScriptName = "map_scripts/" .. mapName
	local bMapScriptLoaded = DoIncludeScript( mapScriptName, g_VRScript )

	if bMapScriptLoaded == false then
		ScriptSystemPrint( "Map script: " .. mapScriptName .. " not found." )
	else
		ScriptSystemPrint( "Map script: " .. mapScriptName .. " found and loaded. Now initializing." )
	end

	CallFunctionOnMapScript( "OnInit" )
end


-----------------------------------------------------------
function SystemCall_PostInit( self )
	ScriptSystemPrint( "SystemCall_PostInit()" )

	CallFunctionOnMapScript( "OnPostInit" )
end


-----------------------------------------------------------
function SystemCall_Precache( self, context )
	ScriptSystemPrint( "SystemCall_Precache()" )

	CallFunctionOnMapScript1Param( "OnPrecache", context )
end


-----------------------------------------------------------
function SystemCall_Activate( self )
	ScriptSystemPrint( "SystemCall_Activate()" )

	CallFunctionOnMapScript( "OnActivate" )
end


-----------------------------------------------------------
function SystemCall_OnGameplayStart( self )
	ScriptSystemPrint( "SystemCall_OnGameplayStart() " )

	CallFunctionOnMapScript( "OnGameplayStart" )
end


-----------------------------------------------------------
function SystemCall_OnPlayerSpawned()
	ScriptSystemPrint( "SystemCall_OnPlayerSpawned()" )

	CallFunctionOnMapScript( "OnPlayerSpawned" )
end


-----------------------------------------------------------
function SystemCall_OnHMDAvatarAndHandsSpawned()
	ScriptSystemPrint( "SystemCall_OnHMDAvatarAndHandsSpawned()" )

	CallFunctionOnMapScript( "OnHMDAvatarAndHandsSpawned" )
end


-----------------------------------------------------------
function SystemCall_Deactivate( self )
	ScriptSystemPrint( "SystemCall_Deactivate()" )

	CallFunctionOnMapScript( "OnDeactivate" )
end


-----------------------------------------------------------
function ScriptSystemCall_PreShutdown( self )
	ScriptSystemPrint( "SystemCall_PreShutdown()" )

	CallFunctionOnMapScript( "OnPreShutdown" )
end


-----------------------------------------------------------
function SystemCall_Shutdown( self )
	ScriptSystemPrint( "SystemCall_Shutdown()" )

	CallFunctionOnMapScript( "OnShutdown" )
end


-----------------------------------------------------------
function SystemCall_FrameUpdatePostEntityThink( self )
	--Call the all the registered update functions
	for _, func in ipairs( ScriptSystemUpdateFunctions ) do
		func()
	end
end


-----------------------------------------------------------
function CallFunctionOnMapScript( funcName )
	if vlua.contains( g_VRScript, funcName ) then
		g_VRScript[funcName]()
	end
end


-----------------------------------------------------------
function CallFunctionOnMapScript1Param( funcName, param1 )
	if vlua.contains( g_VRScript, funcName ) then
		g_VRScript[funcName]( param1 )
	end
end


-----------------------------------------------------------
function ScriptSystem_AddPerFrameUpdateFunction( updateFunction )
	if not vlua.find( ScriptSystemUpdateFunctions, updateFunction ) then
		ScriptSystemPrint( "Registered new udpate function: " .. tostring( updateFunction ) )
		table.insert( ScriptSystemUpdateFunctions, updateFunction )
	else
		ScriptSystemPrint( "Already registered update function: " .. tostring( updateFunction ) )
	end
end


-----------------------------------------------------------
function ScriptSystem_RemovePerFrameUpdateFunction( updateFunction )
	local idx = vlua.find( ScriptSystemUpdateFunctions, updateFunction )

	if idx == nil then
		ScriptSystemPrint( "Could not find udpate function to remove: " .. tostring( updateFunction ) )
		return false
	end

	table.remove( ScriptSystemUpdateFunctions, idx )
	ScriptSystemPrint( "Removed udpate function: " .. tostring( updateFunction ) )
	return true
end


-----------------------------------------------------------
-- Debugging helpers
-----------------------------------------------------------


-----------------------------------------------------------
function DebugPrint( msg )
	print( "DEBUG: " .. msg )
end


-----------------------------------------------------------
-- Script ConVars
-----------------------------------------------------------

g_ScriptConVars = {}

-----------------------------------------------------------
function AddConVar( conVarName, defaultValue, type, scope, helpText, callback )
	--Optional parameters
	helpText = helpText or ""
	callback = callback or ""

	if vlua.contains( g_ScriptConVars, conVarName ) then
		DebugPrint( "WARNING: Replacing existing script debug ConVar " .. conVarName )
	end

	-- Create a new entry for the ConVar
	local newConVar = {}
	newConVar.Name = conVarName
	newConVar.Scope = scope
	newConVar.Type = string.lower( type )
	newConVar.Help = helpText
	newConVar.Callback = callback

	table.insert( g_ScriptConVars, newConVar )

	--Set the value of the ConVar to the specified default
	SetConVarValueInternal( #g_ScriptConVars, defaultValue )

	DebugPrint( "Added ConVar: " .. conVarName )
end


-----------------------------------------------------------
function SetConVar( conVarName, value )
	local conVarIndex = FindConVarByName( conVarName )

	if conVarIndex == nil then
		DebugPrint( "ConVar with name \"" .. conVarName .. "\" not found" )
	end

	while conVarIndex ~= nil do
		SetConVarValueInternal( conVarIndex, value )

		conVarIndex = FindConVarByName( conVarName, conVarIndex )
	end
end


-----------------------------------------------------------
function GetConVar( conVarName, prevIndex )
	local ConVarIndex = FindConVarByName( conVarNem, prevIndex )

	if conVarIndex ~= nil then
		return g_ScriptConVars[conVarIndex].Scope[g_ScriptConVars[conVarIndex].Name]
	end
end


-----------------------------------------------------------
function FindConVarByName( conVarName, prevIndex )
	local lowerConVarName = string.lower( conVarName )

	--Start searching at the beginning of the list unless a prevIndex is provided
	local searchStartIndex = 1
	if prevIndex ~= nil then
		searchStartIndex = prevIndex + 1
	end

	for i = searchStartIndex, #g_ScriptConVars do
		if string.lower( g_ScriptConVars[i].Name ) == lowerConVarName then
			return i
		end
	end

	return nil
end


-----------------------------------------------------------
function SetConVarValueInternal( conVarIndex, value )
	if conVarIndex == nil then
		return
	end

	DebugPrint( "Setting value for ConVar: " .. g_ScriptConVars[conVarIndex].Name .. " Type: " .. g_ScriptConVars[conVarIndex].Type )

	local stringValue = nil

	if type( value ) ~= "string" then
		stringValue = tostring( value )
	else
		stringValue = value
	end

	--Check if the variable already exists in the given scope
	local bVariableExists = false
	if vlua.contains( g_ScriptConVars[conVarIndex].Scope, g_ScriptConVars[conVarIndex].Name ) then
		bVariableExists = true
	end

	--Set the oldValue of the ConVar if it already exists
	local oldValue = nil
	if bVariableExists then
		oldValue = tostring( g_ScriptConVars[conVarIndex].Scope[g_ScriptConVars[conVarIndex].Name] )
	end

	local newValue = nil

	--Convert the value for the ConVar to the correct type
	if g_ScriptConVars[conVarIndex].Type == "number" then
		newValue = tonumber( stringValue )
	elseif g_ScriptConVars[conVarIndex].Type == "bool" then
		local valueLower = string.lower( stringValue )
		if valueLower == "true" or valueLower == "1" or valueLower == "yes" then
			newValue = true
		else
			newValue = false
		end
	else
		newValue = stringValue
	end

	--Set the value
	g_ScriptConVars[conVarIndex].Scope[g_ScriptConVars[conVarIndex].Name] = newValue

	--Call the callback if specified
	if bVariableExists and g_ScriptConVars[conVarIndex].Callback ~= "" then
		if vlua.contains( g_ScriptConVars[conVarIndex].Scope, g_ScriptConVars[conVarIndex].Callback ) then
			g_ScriptConVars[conVarIndex].Scope[g_ScriptConVars[conVarIndex].Callback]( g_ScriptConVars[conVarIndex].Scope, g_ScriptConVars[conVarIndex].Name, oldValue, newValue )
		else 
			DebugPrint( "Callback " .. g_ScriptConVars[conVarIndex].Callback .. " not found for ConVar: " .. g_ScriptConVars[conVarIndex].Name )
		end
	end
end


-----------------------------------------------------------
function PrintConVarHelp( conVarIndex )
	if conVarIndex ~= nil then
		DebugPrint( g_ScriptConVars[conVarIndex].Name .. " \"" .. tostring( g_ScriptConVars[conVarIndex].Scope[g_ScriptConVars[conVarIndex].Name] ) .. "\" :" .. g_ScriptConVars[conVarIndex].Type .. ": " .. g_ScriptConVars[conVarIndex].Help )
	end
end


-----------------------------------------------------------
function PrintAllConVarHelp()
	DebugPrint( "Script ConVar Help. Num ConVars: " .. #g_ScriptConVars )

	for idx, conVar in pairs( g_ScriptConVars ) do
		PrintConVarHelp( idx )
	end
end


-----------------------------------------------------------
function SystemCall_GetScriptConVars( self, partial )
	local conVars = {}

	for _, conVar in ipairs( g_ScriptConVars ) do
		table.insert( conVars, conVar.Name )
	end

	return conVars
end


-----------------------------------------------------------
function SystemCall_SetScriptConVar( self, args )
	--Extract the name of the ConVar and the value from the args array
	local conVarName = ""
	local conVarValue = ""
	if #args > 1 then
		conVarName = args[2]
	end

	if #args > 2 then
		conVarValue = args[3]
	end

	--No ConVar specified, print help for all the ConVars
	if conVarName == "" then
		PrintAllConVarHelp()
	else
		--Try to find the specified ConVar
		local conVarIndex = FindConVarByName( conVarName )

		if conVarIndex == nil then
			DebugPrint( "ConVar with the name \"" .. conVarName .. "\" not found in any active scripts." )
		else
			--If no value specified then print help for the ConVar
			if conVarValue == "" then
				PrintConVarHelp( conVarIndex )
			else
				--Set the value for all the ConVars with the matching name
				while conVarIndex ~= nil do
					SetConVarValueInternal( conVarIndex, conVarValue )

					conVarIndex = FindConVarByName( conVarName, conVarIndex )
				end
			end
		end
	end
end
