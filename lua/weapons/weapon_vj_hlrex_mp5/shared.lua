if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 								= "weapon_vj_base"
SWEP.PrintName							= "MP5"
SWEP.Author 							= "Cpt. Hazama"
SWEP.Contact							= ""
SWEP.Purpose							= ""
SWEP.Category							= "Half-Life Resurgence"

SWEP.Slot = 2
SWEP.SlotPos = 1
SWEP.ViewModel							= "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.WorldModel							= "models/weapons/w_smg_mp5.mdl"
SWEP.HoldType 							= "smg"
SWEP.Spawnable							= true
SWEP.AdminSpawnable						= false
SWEP.UseHands							= true

SWEP.NPC_NextPrimaryFire = 0.45
SWEP.NPC_TimeUntilFire = 0
SWEP.NPC_TimeUntilFireExtraTimers = {0.1,0.2}

SWEP.Primary.Sound						= {"vj_hlr/hl2ex_weapon/mp5_fire.mp3"}
SWEP.Primary.DistantSound				= {"vj_hlr/hl2ex_weapon/mp5_fire_dist.mp3"}
SWEP.Primary.Damage						= 5
SWEP.Primary.ClipSize					= 50
SWEP.Primary.Delay						= 0.09
SWEP.Primary.Automatic 					= true
SWEP.Primary.Force						= 5
SWEP.Primary.Ammo						= "SMG1"

SWEP.PrimaryEffects_MuzzleAttachment 	= 1
SWEP.PrimaryEffects_SpawnShells 		= true
SWEP.PrimaryEffects_ShellAttachment 	= 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_RifleShell1"
SWEP.Reload_TimeUntilFinished 			= false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnFireAnimationEvent(pos,ang,event,options)
	if event == 5001 then return true end
end