AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hl_ex/hgrunt_zombie.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 90
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Particle = {"blood_impact_green_01"}
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"FastAttack"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 45 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 90 -- How far does the damage go?
ENT.MeleeAttackDamage = 18
ENT.TimeUntilMeleeAttackDamage = 0.45
ENT.FootStepTimeRun = 0.21 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.3 -- Next foot step sound when it is walking
ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.GeneralSoundPitch1 = 100
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS} -- If it uses normal based animation, use this

ENT.VJC_Data = {
    CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
    ThirdP_Offset = Vector(0, 0, 0), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "ValveBiped.HC_Body_Bone", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(1, 0, 0), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombine/gear1.wav","npc/zombine/gear2.wav","npc/zombine/gear3.wav"}
ENT.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav","npc/zombie/zombie_voice_idle2.wav","npc/zombie/zombie_voice_idle3.wav","npc/zombie/zombie_voice_idle4.wav","npc/zombie/zombie_voice_idle5.wav","npc/zombie/zombie_voice_idle6.wav","npc/zombie/zombie_voice_idle7.wav","npc/zombie/zombie_voice_idle8.wav","npc/zombie/zombie_voice_idle9.wav","npc/zombie/zombie_voice_idle10.wav","npc/zombie/zombie_voice_idle11.wav","npc/zombie/zombie_voice_idle12.wav","npc/zombie/zombie_voice_idle13.wav","npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav","npc/zombie/zombie_alert2.wav","npc/zombie/zombie_alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav","npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav","npc/zombie/zombie_pain2.wav","npc/zombie/zombie_pain3.wav","npc/zombie/zombie_pain4.wav","npc/zombie/zombie_pain5.wav","npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav","npc/zombie/zombie_die2.wav","npc/zombie/zombie_die3.wav"}

ENT.GrenadeTime = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnPlayCreateSound(sdData, sdFile)
	-- sdData:SetDSP(11)
	VJ_EmitSound(self,"vj_hlr/hl2ex_npc/on.mp3")
	self.CurrentSoundLoop:Stop()
	self.CurrentSoundLoop:Play()
	timer.Simple(SoundDuration(sdFile), function() if IsValid(self) && sdData:IsPlaying() then self.CurrentSoundLoop:Stop() VJ_EmitSound(self,"vj_hlr/hl2ex_npc/off.mp3") end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetBodygroup(1,1)
	self:SetCollisionBounds(Vector(13,13,60), Vector(-13,-13,0))

	self.CurrentSoundLoop = CreateSound(self,"vj_hlr/hl2ex_npc/loop.wav")
	self.CurrentSoundLoop:SetSoundLevel(70)
	self.GrenadePulled = false
	self.GrenadeEntity = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key, activator, caller, data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "melee" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CreateGrenade()
	local grenent = ents.Create("obj_vj_grenade")
	grenent:SetPos(self:GetAttachment(self:LookupAttachment("grenade_attachment")).Pos)
	grenent:SetAngles(self:GetAttachment(self:LookupAttachment("grenade_attachment")).Ang)
	grenent:SetOwner(self)
	grenent:SetParent(self)
	grenent:Fire("SetParentAttachment","grenade_attachment",0)
	grenent.FussTime = 3.5
	grenent:Spawn()
	timer.Simple(3.485,function()
		if IsValid(self) && IsValid(grenent) then // Thanks Vrej, very cool
			grenent:SetOwner(NULL)
			grenent:SetParent(NULL)
		end
	end)
	
	self.GrenadeEntity = grenent
	self.GrenadeTime = CurTime() +3.5
	-- grenent.VJHumanTossingAway = true // Soldiers kept stealing their grenades xD
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GrenadeCode()
	if self.GrenadePulled == true then return end
	self.GrenadePulled = true
	self.AnimTbl_IdleStand = {"Idle_Grenade"}
	self.AnimTbl_Run = {VJ_SequenceToActivity(self,"Run_All_grenade")}
	self.AnimTbl_Walk = {VJ_SequenceToActivity(self,"walk_All_Grenade")}
	VJ_CreateSound(self,"npc/zombine/zombine_readygrenade"..math.random(1,2)..".wav",80,100)
	self:VJ_ACT_PLAYACTIVITY("pullGrenade",true,VJ_GetSequenceDuration(self,VJ_SequenceToActivity(self,"pullGrenade")))
	timer.Simple(VJ_GetSequenceDuration(self,VJ_SequenceToActivity(self,"pullGrenade")) -0.4,function()
		if IsValid(self) then
			self:CreateGrenade()
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled == false then
		if self:Health() < 40 && IsValid(self:GetEnemy()) && math.random(1,10) == 1 && self:GetEnemy():GetPos():Distance(self:GetPos()) < 500 then
			self:GrenadeCode()
		end
	else
		if self.VJ_TheController:KeyDown(IN_ATTACK2) then
			self:GrenadeCode()
		end
	end

	if self:GetMovementActivity() == ACT_RUN then
		self.FootStepTimeRun = 0.3
	elseif self:GetMovementActivity() == ACT_WALK then
		self.FootStepTimeWalk = 0.55
	else
		self.FootStepTimeRun = 0.3
		self.FootStepTimeWalk = 0.55
	end

	if !self.GrenadePulled then
		local enemy = self:GetEnemy()
		if !IsValid(enemy) then
			self.AnimTbl_IdleStand = {ACT_IDLE}
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_RUN}
			return
		end
		local dist = self:GetEnemy():GetPos():Distance(self:GetPos())
		if dist < 1000 then
			self.AnimTbl_Walk = {ACT_RUN}
			self.AnimTbl_Run = {ACT_RUN}
		elseif dist >= 1000 then
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_WALK}
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	if dmginfo:GetInflictor() == self.GrenadeEntity then
		dmginfo:ScaleDamage(500)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	if self:GetBodygroup(1) == 0 then return false end
	local randcrab = math.random(1,3)
	local dmgtype = dmginfo:GetDamageType()

	if hitgroup == HITGROUP_HEAD then
		randcrab = math.random(1,2)
	elseif dmgtype == DMG_CLUB or dmgtype == DMG_SLASH then
		randcrab = 1
	end
	if randcrab == 1 then
		self:SetBodygroup(1,1)
	elseif randcrab == 2 then
		self:CreateExtraDeathCorpse(
			"prop_ragdoll",
			"models/headcrabclassic.mdl",
			{Pos=self:GetAttachment(self:LookupAttachment("headcrab")).Pos}
		)
		self.Corpse:SetBodygroup(1,0)
	elseif randcrab == 3 then
		self.Corpse:SetBodygroup(1,0)
		local spawncrab = ents.Create("npc_vj_hlr2_headcrab")
		local enemy = self:GetEnemy()
		local pos = self:GetAttachment(self:LookupAttachment("headcrab")).Pos
		spawncrab:SetPos(pos)
		spawncrab:SetAngles(self:GetAngles())
		spawncrab:SetVelocity(dmginfo:GetDamageForce() /58)
		spawncrab:Spawn()
		spawncrab:Activate()
		if self.Corpse:IsOnFire() then
			spawncrab:Ignite(math.Rand(8,10),0)
		end
		timer.Simple(0.05,function()
			if IsValid(spawncrab) then
				spawncrab:SetPos(pos)
				if IsValid(enemy) then
					spawncrab:SetEnemy(enemy)
				end
			end
		end)
	end

	if self.GrenadePulled == true && CurTime() < self.GrenadeTime then
		local grenent = ents.Create("obj_vj_grenade")
		grenent:SetPos(self:GetAttachment(self:LookupAttachment("grenade_attachment")).Pos)
		grenent:SetAngles(self:GetAttachment(self:LookupAttachment("grenade_attachment")).Ang)
		grenent:SetOwner(self)
		grenent.FussTime = 1.5
		grenent:Spawn()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	self.CurrentSoundLoop:Stop()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/