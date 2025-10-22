--装备相关表单

PlayerFirstLogin = {}

PlayerFirstLogin.RoleWeapon = {
--谪剑仙
	[31] = {10401,12101,12301,12501,12601},
--飞翼姬
	[32] = {10301,12201,12401,12501,12601},
--烟云客
	[33] = {10501,12101,12301,12501,12601},
--冥河使
	[34] = {10901,12101,12301,12501,12601},
--阎魔令
	[35] = {10101,12101,12301,12501,12601},
--雨师君
	[36] = {10201,12101,12301,12501,12601},
--神霄卫
	[37] = {10601,12101,12301,12501,12601},
--傲红莲
	[38] = {11101,12201,12401,12501,12601},
--花弄影
	[39] = {10701,12201,12401,12501,12601},
--青丘狐
	[40] = {11201,12201,12401,12501,12601},
--海鲛灵
	[41] = {10901,12201,12401,12501,12601},
--凤凰仙
	[42] = {10801,12201,12401,12501,12601},
}

PlayerFirstLogin.BornPet = {   
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	10008,
	10009,
	10010,
}

PlayerFirstLogin.BornItem = {"血药-3",20}

function PlayerFirstLogin.Main(player)
	sLuaApp:LuaDbg("PlayerFirstLogin")
	--EquipBuild.Initialization(0)
	if not player then
		sLuaApp:LuaDbg("回调未取出player")
		return
	end
	if not PlayerSetting then
		require("player/PlayerSetting")
	end
	if PlayerSetting then
		if PlayerSetting.PlayerIntialize(player) == false then
			sLuaApp:LuaDbg("玩家 "..player:GetName().."(guid:" .. player:GetGUID(player) .. ")初始化设置失败")
		end
	end
	
	local role = player:GetAttr(ROLE_ATTR_ROLE)
	if PlayerFirstLogin.RoleWeapon then
		if PlayerFirstLogin.RoleWeapon[role] and #PlayerFirstLogin.RoleWeapon[role]>0 then
			for i=1,#PlayerFirstLogin.RoleWeapon[role],1 do
				local weapon_id = PlayerFirstLogin.RoleWeapon[role][i]
				local item = sItemSystem:AddItemEx( player, weapon_id, 1, true, "system", "角色出生武器发放", "nil")
				if #item > 0 then
					sLuaApp:LuaDbg("type = "..type(item))
					sItemSystem:PutOnEquip(player, item[1])
				end
			end
		end
	end
		
	--加钱
	player:AddBindGold(880000, "system", "角色出生银币发放", "nil")
	
	--给宠物
	--if PlayerFirstLogin.BornPet then
	--	local pet_rand = PlayerFirstLogin.BornPet[sLuaApp:RandInteger(1, #PlayerFirstLogin.BornPet)]
	--	local pet = sPetSystem:AddPetEx(player, pet_rand, 1, false, "system", "角色出生宠物发放", "nil")
	--	if pet then
	--		sPetSystem:SetLineup(pet)
	--	end
	--end
	
	--给药
	Lua_tools.AddItem(player, PlayerFirstLogin.BornItem, "system", "角色出生药品发放", "nil")
	--给双倍点
	local double_exp = DoubleExp.FirstLoginNum or 1000
	player:SetInt("FreezeDoubleExpPoint", double_exp)
	
	--设置心法
	if PlayerSkill then
		PlayerSkill.FirstLogin(player)
	end
	if PetSystem then
		player:SetInt("PetBagLevelupUnlock", PetSystem.MaxUnLockNum)
	end
	
	--给侠义值
	if Assist then
		Assist.SetFreePoint(player)
	end
	
	--设置已使用角色 门派
	if ChangeOccu then
		ChangeOccu.SetUsed(player)
	end

	--设置自动加点
	local str = [[
		GlobalProcessing.BornAutoPoint(]]..(1)..[[, ']]..player:GetGUID()..[[')
	]]
	sLuaApp:ShowForm(player,"脚本表单",str)
	
	--解锁基础表情包
	player:AddEmoji(1)
	return ""
end