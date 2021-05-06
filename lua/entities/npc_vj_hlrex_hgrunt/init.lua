AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {
	"models/vj_hlr/hl_ex/hgrunt1.mdl",
	"models/vj_hlr/hl_ex/hgrunt2.mdl",
	"models/vj_hlr/hl_ex/hgrunt3.mdl",
	"models/vj_hlr/hl_ex/hgrunt4.mdl",
	"models/vj_hlr/hl_ex/hgrunt5.mdl"
}
ENT.StartHealth = 60
ENT.HullType = HULL_HUMAN

ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"}

ENT.BloodColor = "Red"

ENT.MeleeAttackDamage = 5

ENT.HasGrenadeAttack = true

ENT.CanFlinch = 1

ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/hgrunt/gr_alert1.wav","vj_hlr/hl1_npc/hgrunt/gr_idle1.wav","vj_hlr/hl1_npc/hgrunt/gr_idle2.wav","vj_hlr/hl1_npc/hgrunt/gr_idle3.wav"}
ENT.SoundTbl_IdleDialogue = {"vj_hlr/hl1_npc/hgrunt/gr_question1.wav","vj_hlr/hl1_npc/hgrunt/gr_question2.wav","vj_hlr/hl1_npc/hgrunt/gr_question3.wav","vj_hlr/hl1_npc/hgrunt/gr_question4.wav","vj_hlr/hl1_npc/hgrunt/gr_question5.wav","vj_hlr/hl1_npc/hgrunt/gr_question6.wav","vj_hlr/hl1_npc/hgrunt/gr_question7.wav","vj_hlr/hl1_npc/hgrunt/gr_question8.wav","vj_hlr/hl1_npc/hgrunt/gr_question9.wav","vj_hlr/hl1_npc/hgrunt/gr_question10.wav","vj_hlr/hl1_npc/hgrunt/gr_question11.wav","vj_hlr/hl1_npc/hgrunt/gr_question12.wav","vj_hlr/hl1_npc/hgrunt/gr_check1.wav","vj_hlr/hl1_npc/hgrunt/gr_check2.wav","vj_hlr/hl1_npc/hgrunt/gr_check3.wav","vj_hlr/hl1_npc/hgrunt/gr_check4.wav","vj_hlr/hl1_npc/hgrunt/gr_check5.wav","vj_hlr/hl1_npc/hgrunt/gr_check6.wav","vj_hlr/hl1_npc/hgrunt/gr_check7.wav","vj_hlr/hl1_npc/hgrunt/gr_check8.wav",}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_hlr/hl1_npc/hgrunt/gr_clear1.wav","vj_hlr/hl1_npc/hgrunt/gr_clear2.wav","vj_hlr/hl1_npc/hgrunt/gr_clear3.wav","vj_hlr/hl1_npc/hgrunt/gr_clear4.wav","vj_hlr/hl1_npc/hgrunt/gr_clear5.wav","vj_hlr/hl1_npc/hgrunt/gr_clear6.wav","vj_hlr/hl1_npc/hgrunt/gr_clear7.wav","vj_hlr/hl1_npc/hgrunt/gr_clear8.wav","vj_hlr/hl1_npc/hgrunt/gr_clear9.wav","vj_hlr/hl1_npc/hgrunt/gr_clear10.wav","vj_hlr/hl1_npc/hgrunt/gr_clear11.wav","vj_hlr/hl1_npc/hgrunt/gr_clear12.wav","vj_hlr/hl1_npc/hgrunt/gr_answer1.wav","vj_hlr/hl1_npc/hgrunt/gr_answer2.wav","vj_hlr/hl1_npc/hgrunt/gr_answer3.wav","vj_hlr/hl1_npc/hgrunt/gr_answer4.wav","vj_hlr/hl1_npc/hgrunt/gr_answer5.wav","vj_hlr/hl1_npc/hgrunt/gr_answer6.wav","vj_hlr/hl1_npc/hgrunt/gr_answer7.wav"}
ENT.SoundTbl_CombatIdle = {"vj_hlr/hl1_npc/hgrunt/gr_taunt1.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt2.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt3.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt4.wav","vj_hlr/hl1_npc/hgrunt/gr_taunt5.wav","vj_hlr/hl1_npc/hgrunt/gr_combat1.wav","vj_hlr/hl1_npc/hgrunt/gr_combat2.wav","vj_hlr/hl1_npc/hgrunt/gr_combat3.wav","vj_hlr/hl1_npc/hgrunt/gr_combat4.wav"}
ENT.SoundTbl_OnReceiveOrder = {"vj_hlr/hl1_npc/hgrunt/gr_answer1.wav","vj_hlr/hl1_npc/hgrunt/gr_answer2.wav","vj_hlr/hl1_npc/hgrunt/gr_answer3.wav","vj_hlr/hl1_npc/hgrunt/gr_answer5.wav","vj_hlr/hl1_npc/hgrunt/gr_answer7.wav"}
ENT.SoundTbl_Investigate = {"vj_hlr/hl1_npc/hgrunt/gr_investigate.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/hgrunt/gr_alert3.wav","vj_hlr/hl1_npc/hgrunt/gr_alert4.wav","vj_hlr/hl1_npc/hgrunt/gr_alert6.wav","vj_hlr/hl1_npc/hgrunt/gr_alert7.wav","vj_hlr/hl1_npc/hgrunt/gr_alert8.wav"}
ENT.SoundTbl_CallForHelp = {"vj_hlr/hl1_npc/hgrunt/gr_taunt6.wav","vj_hlr/hl1_npc/hgrunt/gr_cover2.wav","vj_hlr/hl1_npc/hgrunt/gr_cover3.wav","vj_hlr/hl1_npc/hgrunt/gr_cover4.wav","vj_hlr/hl1_npc/hgrunt/gr_cover7.wav"}
ENT.SoundTbl_WeaponReload = {"vj_hlr/hl1_npc/hgrunt/gr_cover1.wav","vj_hlr/hl1_npc/hgrunt/gr_cover2.wav","vj_hlr/hl1_npc/hgrunt/gr_cover3.wav","vj_hlr/hl1_npc/hgrunt/gr_cover4.wav","vj_hlr/hl1_npc/hgrunt/gr_cover5.wav","vj_hlr/hl1_npc/hgrunt/gr_cover6.wav","vj_hlr/hl1_npc/hgrunt/gr_cover7.wav","vj_hlr/hl1_npc/hgrunt/gr_cover8.wav","vj_hlr/hl1_npc/hgrunt/gr_cover9.wav"}
ENT.SoundTbl_GrenadeAttack = {"vj_hlr/hl1_npc/hgrunt/gr_throw1.wav","vj_hlr/hl1_npc/hgrunt/gr_throw2.wav","vj_hlr/hl1_npc/hgrunt/gr_throw3.wav","vj_hlr/hl1_npc/hgrunt/gr_throw4.wav"}
ENT.SoundTbl_OnGrenadeSight = {"vj_hlr/hl1_npc/hgrunt/gr_cover7.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert1.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert2.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert3.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert4.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert5.wav","vj_hlr/hl1_npc/hgrunt/gr_grenadealert6.wav","vj_hlr/hl1_npc/hgrunt/gr_cover1.wav"}
ENT.SoundTbl_AllyDeath = {"vj_hlr/hl1_npc/hgrunt/gr_allydeath.wav","vj_hlr/hl1_npc/hgrunt/gr_cover2.wav","vj_hlr/hl1_npc/hgrunt/gr_cover3.wav","vj_hlr/hl1_npc/hgrunt/gr_cover4.wav","vj_hlr/hl1_npc/hgrunt/gr_cover7.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/hgrunt/gr_pain1.wav","vj_hlr/hl1_npc/hgrunt/gr_pain2.wav","vj_hlr/hl1_npc/hgrunt/gr_pain3.wav","vj_hlr/hl1_npc/hgrunt/gr_pain4.wav","vj_hlr/hl1_npc/hgrunt/gr_pain5.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/hgrunt/gr_die1.wav","vj_hlr/hl1_npc/hgrunt/gr_die2.wav","vj_hlr/hl1_npc/hgrunt/gr_die3.wav"}

ENT.HECU_NextMouthMove = 0
ENT.HECU_NextMouthDistance = 0
ENT.HECU_Flexes = {
	"left_part",
	"right_part",
	"jaw_drop",
	"left_mouth_drop",
	"right_mouth_drop",
	"lower_lip"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.HECU_FoundFlexes = {}
	for i = 0,64 do
		local flex = self:GetFlexName(i)
		if VJ_HasValue(self.HECU_Flexes,flex) then
			table.insert(self.HECU_FoundFlexes,flex)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnPlayCreateSound(sdData, sdFile)
	if !self.SoundTbl_Breath[sdFile] then
		self.HECU_NextMouthMove = CurTime() + SoundDuration(sdFile)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	if math.random(1,3) == 1 && self.HECU_UsingDefaultSounds == true then
		if ent.IsVJBaseSNPC_Creature == true then
			self:PlaySoundSystem("Alert", {"vj_hlr/hl1_npc/hgrunt/gr_alert9.wav","vj_hlr/hl1_npc/hgrunt/gr_alert10.wav"})
			return
		elseif ent.IsVJBaseSNPC_Human == true or ent:IsPlayer() then
			self:PlaySoundSystem("Alert", {"vj_hlr/hl1_npc/hgrunt/gr_alert2.wav","vj_hlr/hl1_npc/hgrunt/gr_alert5.wav"})
			return
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if #self.HECU_FoundFlexes > 0 then
		if CurTime() < self.HECU_NextMouthMove then
			if self.HECU_NextMouthDistance == 0 then
				self.HECU_NextMouthDistance = math.Rand(0.1,1)
			else
				self.HECU_NextMouthDistance = 0
			end
			local val = self.HECU_NextMouthDistance
			for _,v in ipairs(self.HECU_FoundFlexes) do
				if v == "jaw_drop" then val = math.Clamp(val,0.1,0.55) end
				self:SetFlexWeight(self:GetFlexIDByName(v),val)
			end
		else
			for _,v in ipairs(self.HECU_FoundFlexes) do
				self:SetFlexWeight(self:GetFlexIDByName(v),0)
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/