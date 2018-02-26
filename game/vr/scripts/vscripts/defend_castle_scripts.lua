------------ Copyright (c) Valve Corporation, All rights reserved. ------------
--
-- Controls the gameplay logic for map: defend_castle
--
-------------------------------------------------------------------------------

CastleHealth = 100

-----------------------------------------------------------
function OnHurtCastle()

	CastleHealth = CastleHealth - 1
	EntFire( self, "text_health", "SetMessage", CastleHealth .. "%", nil )

end

-----------------------------------------------------------
function OnBulletTouch( args )

	if args.activator ~= nil then
		if args.activator:GetName() == "castle" then
			OnHurtCastle()
			StartSoundEventFromPosition( "Example.src1_3d", args.caller:GetOrigin() )
		end

		if args.activator:IsPlayer() ~= true then
			local effectTable = 
			{
				entity = nil,
				position = args.caller:GetOrigin(),
				effectname = "particles/hunter_projectile/hunter_projectile_explosion_2g.vpcf"
			}
			CreateEffect( effectTable )
			args.caller:Kill()
		end
	end

end

-----------------------------------------------------------
function OnBadguyTouch( args )

	if args.activator ~= nil then
		if args.activator:GetName() == "badguy" or args.activator:GetName() == "badguy2" then
			local effectTable = 
			{
				entity = nil,
				position = args.caller:GetOrigin(),
				effectname = "particles/creatures/goo_mine/goo_mine_explosion.vpcf"
			}
			CreateEffect( effectTable )
			StartSoundEventFromPosition( "Flesh_Bloody.ImpactHard", args.activator:GetOrigin() )
			args.caller:Kill()
			args.activator:Kill()
		elseif args.activator:GetName() == "castle" then
			OnHurtCastle()
			StartSoundEventFromPosition( "Example.src1_3d", args.caller:GetOrigin() )
			local normal = ( args.activator:GetOrigin() - args.caller:GetOrigin() ):Normalized()
			local effectTable = 
			{
				entity = nil,
				position = args.caller:GetOrigin(),
				direction = normal,
				effectname = "particles/impact_fx/impact_plaster_cheap.vpcf"
			}
			CreateEffect( effectTable )
		end
	end

end