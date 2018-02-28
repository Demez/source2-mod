------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the gameplay logic for map: defend_castle
--
-------------------------------------------------------------------------------

Props = {}
LastUpdateTime = nil

Timers = { 0, 0 }
SpawnDelays = { 8.0, 20.0 }
TotalActiveBadguys = 0

NextHopTime = 0

Castle = nil
TemplateBadguy = nil
TemplateBadguy2 = nil
TemplateBullet = nil

ShootPos = nil

RangedDistance = 160.0
ShootPower = 1.25
MaxActiveBadguys = 25

PrecacheList = 
{    
    {
        classname = "info_particle_system",
        effect_name = "particles/hunter_projectile/hunter_projectile_explosion_2g.vpcf"
    },
    
    {
        classname = "info_particle_system",
        effect_name = "particles/creatures/goo_mine/goo_mine_explosion.vpcf"
    },

    {
        classname = "info_particle_system",
        effect_name = "particles/impact_fx/impact_plaster_cheap.vpcf"
    }
}

-----------------------------------------------------------
function OnPrecache( context )

	for _, val in ipairs(PrecacheList) do
		PrecacheEntityFromTable(nil, val, context)
	end

end

-----------------------------------------------------------
function OnInit()

end

-----------------------------------------------------------
function OnActivate()

end

-----------------------------------------------------------
function OnGameplayStart()

end

-----------------------------------------------------------
function OnPlayerSpawned()

	LastUpdateTime = Time()
	ScriptSystem_AddPerFrameUpdateFunction( OnUpdate )

	Castle = Entities:FindByName( nil, "castle" )
	TemplateBadguy = Entities:FindByName( nil, "template_badguy" )
	TemplateBadguy2 = Entities:FindByName( nil, "template_badguy2" )
	TemplateBullet = Entities:FindByName( nil, "template_bullet" )

end

-----------------------------------------------------------
function OnUpdate()

	local castlePos = Castle:GetAbsOrigin()

	-- spawn walking guy
	RunSpawner( TemplateBadguy, 1 )
	InitPosition( TemplateBadguy, "badguy", castlePos )

	-- spawn shooting guy
	RunSpawner( TemplateBadguy2, 2 )
	InitPosition( TemplateBadguy2, "badguy2", castlePos )

	ShootBulletAt( TemplateBullet, "bullet", castlePos )

	-- update badguys
	if NextHopTime < Time() then
		TotalActiveBadguys = 0

		-- nudge a random bad guy toward castle
		local badguys = Entities:FindAllByName( "badguy" )
		--local randomBadguy = badguys[ RandomInt( 1, #badguys ) ]

		for _, foundBadguy in ipairs(badguys) do
			TotalActiveBadguys = TotalActiveBadguys + 1

			if RandomInt( 0, 1 ) == 0 then
				NudgeTowardPoint( foundBadguy, castlePos, 40.0 )
			end
		end

		-- nudge a random bad guy toward castle
		local badguys2 = Entities:FindAllByName( "badguy2" )

		for _, foundBadguy2 in ipairs(badguys2) do
			TotalActiveBadguys = TotalActiveBadguys + 1

			if RandomInt( 0, 2 ) == 0 then
				local toCastle = foundBadguy2:GetAbsOrigin() - castlePos
				if toCastle:Length() > RangedDistance then
					NudgeTowardPoint( foundBadguy2, castlePos, 40.0 )
				else
					if ShootPos == nil then
						CreateFromTemplate( Entities:FindByName( nil, "template_bullet" ) )
						ShootPos = foundBadguy2:GetAbsOrigin()
					end
				end
			end
		end

		NextHopTime = Time() + RandomFloat( 0.5, 1.0 )
	end

	LastUpdateTime = Time()
end

-----------------------------------------------------------
function RunSpawner( template, type, delay )

	if Timers[ type ] < Time() then
		if TotalActiveBadguys < MaxActiveBadguys then
			-- spawn the bad guy
			CreateFromTemplate( template )

			Timers[ type ] = Time() + SpawnDelays[ type ]
		end
	end

end

-----------------------------------------------------------
function NudgeTowardPoint( ent, point, power )

	local moveDir = point - ent:GetAbsOrigin()
	moveDir = moveDir:Normalized()
	moveDir.z = 1
	ent:ApplyAbsVelocityImpulse( moveDir * power )

	StartSoundEvent( "Grenade.Blip", ent )

end

-----------------------------------------------------------
function InitPosition( template, name, center )

	local newBadGuy = Entities:FindByNameNearest( name, template:GetAbsOrigin(), 128 )
	if newBadGuy ~= nill then
		-- pick a position to spawn
		local randomRad = math.rad( RandomFloat( 0, 360.0 ) );
		local spawnPos = center
		spawnPos.x = spawnPos.x + math.cos( randomRad ) * 256.0
		spawnPos.y = spawnPos.y + math.sin( randomRad ) * 256.0

		newBadGuy:SetOrigin( spawnPos )
	end

end

-----------------------------------------------------------
function CreateFromTemplate( template )

	EntFireByHandle( self, template, "ForceSpawn", nil, nil )

end

-----------------------------------------------------------
function ShootBulletAt( template, name, targetPos )

	local bullet = Entities:FindByNameNearest( name, template:GetAbsOrigin(), 128 )
	if bullet ~= nil and ShootPos ~= nil then
		-- pick a position to spawn
		local toTarget = ( targetPos - ShootPos )
		bullet:SetOrigin( ShootPos + toTarget:Normalized() * 8.0 )
		NudgeTowardPoint( bullet, targetPos, toTarget:Length() * ShootPower )
		ShootPos = nil
	end

end
