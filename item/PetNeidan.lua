--装备相关表单

PetNeidan = {}

PetNeidan.List = {}

--转生消耗公式
PetNeidan.Funcion = "150+150*level+reinc*(20*level+reinc*level)*math.pow(reinc,1.3+0.17*reinc*reinc)"

--转生货币类型
PetNeidan.MoneyType = 5

--转生对应的等级上限
PetNeidan.LevelTable = {
	[0] = 100,
	[1] = 120,
	[2] = 140,
	[3] = 170,
}

--转生对应的内丹数量(保持高转大于或等于低转)
PetNeidan.NeidanNum = {
	[0] = 1,
	[1] = 2,
	[2] = 3,
	[3] = 3,
}

PetNeidan.Extract_LevelDown = 5			--吐出内丹时的降级

PetNeidan.NumMax = 3					--最大内丹数量

function PetNeidan.on_item_create(item)
	item:SetInt("ITEM_NeidanSkillID", SkillConfig.GetByKeyName(item:GetKeyName().."0").Id)
	sLuaApp:LuaDbg("内丹创建")
end

function PetNeidan.GetFunction(player)
	local str = [[ PetUI.Neidan_Funcion = "]]..PetNeidan.Funcion..[["  PetUI.Neidan_MoneyType = ]] .. PetNeidan.MoneyType
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetNeidan.GetItemSkill(keyName)
	local skill
    if PetNeidan.List then
		skill = PetNeidan.List[keyName]
	end
	if not skill or skill == 0 then
		skill = keyName
	end
	--sLuaApp:LuaDbg("技能书关联 "..skill)
	return skill
end

function PetNeidan.Use(player, pet, item)
	local index = 0
	for i = 1,3 do
		if pet:GetInt("PET_NeidanSkillID_"..i) == 0 then
			index = i
			break
		end
	end
	if index == 0 then
		sLuaApp:NotifyTipsMsg(player, "宠物的内丹技能已经满了")
		return
	end
	local Rein = pet:GetInt("PET_NeidanUnlock")
	if Rein < index then
		sLuaApp:NotifyTipsMsg(player, "宠物的内丹技能已经满了")
		return
	end
	
	local skillId = item:GetInt("ITEM_NeidanSkillID")
	local skillLv = item:GetInt("ITEM_NeidanSkillLV")
	local skillRe = item:GetInt("ITEM_NeidanSkillRE")
	local LvMax = PetNeidan.LevelTable[skillRe]
	
	if skillId == 0 then
		skillId = SkillConfig.GetByKeyName(item:GetKeyName().."0").Id
	end
	sLuaApp:LuaDbg(" skillId = " .. skillId)
	
	if not LvMax then
		sLuaApp:NotifyTipsMsg(player, "LevelTable配置错误，无法学习技能")
		return
	end
	
	local reinc = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	if skillRe > reinc then
		sLuaApp:NotifyTipsMsg(player, "内丹转生次数高于宠物转生次数，无法吞食该内丹")
		return
	end
	
	if skillRe == reinc and skillLv > pet:GetAttr(ROLE_ATTR_LEVEL) then
		sLuaApp:NotifyTipsMsg(player, "内丹等级高于宠物等级，无法吞食该内丹")
		return
	end
	
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillId)
	
	if skillData then
		sLuaApp:NotifyTipsMsg(player, "您的宠物已经学习了该技能")
		return
	end
	
	if sItemSystem:DestroyItem(item, "system", "宠物技能学习", "宠物对象："..pet:GetName()) ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "道具扣除失败")
		return
	end
	pet:SetInt("PET_NeidanSkillID_"..index, skillId)
	pet:SetInt("PET_NeidanSkillRE_"..index, skillRe)
	skillCon:CreateSkill(skillId,skillLv,LvMax,true)
	sLuaApp:NotifyTipsMsg(player, "内丹吞食成功，你的宠物习得了 "..SkillConfig.GetById(skillId).Name)
end

function PetNeidan.Extract(player, pet_guid, index)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	if Lua_tools.GetBagFree(player) < 1 then
		sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足，无法取出内丹")
		return
	end
	index = tonumber(index)
	local str = [[GlobalUtils.ShowServerBoxMessage("吐出内丹将导致内丹等级降低]]..PetNeidan.Extract_LevelDown..[[级，确定要吐出吗？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PetNeidan.Extract_Confirm('"..player:GetGUID().."','"..pet_guid.."',"..index..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetNeidan.Extract_Confirm(player_guid, pet_guid, index)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	if Lua_tools.GetBagFree(player) < 1 then
		sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足，无法取出内丹")
		return
	end
	local skillId = pet:GetInt("PET_NeidanSkillID_"..index)
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillId)
	
	if not skillData then
		sLuaApp:NotifyTipsMsg(player, "技能不存在")
		return
	end
	
	local skillLv = skillData:GetPerformance()
	skillLv = skillLv - 5
	if skillLv < 0 then
		skillLv = 0
	end
	
	local skillRe = pet:GetInt("PET_NeidanSkillRE_"..index)
	local skillKey = SkillConfig.GetById(skillId).KeyName
	local itemKey = sLuaApp:StrSplit(skillKey, skillRe)[1]
	
	local itemId = ItemConfig.GetByKeyName(itemKey).Id
	if not itemId then
		sLuaApp:NotifyTipsMsg(player, "技能没有对应的内丹道具")
		return ""
	end
	
	skillCon:DestroySkill(skillData, true)
	
	local itemList = sItemSystem:AddItemEx(player, itemId, 1, false, "system", "宠物内丹吐出", "技能ID："..skillId)
	local item = itemList[1]
	sLuaApp:LuaDbg("生成新内丹")
	if item then
		sLuaApp:LuaDbg("填充内丹属性")
		item:SetInt("ITEM_NeidanSkillID", skillId)
		item:SetInt("ITEM_NeidanSkillLV", skillLv)
		item:SetInt("ITEM_NeidanSkillRE", skillRe)
	end
	
	for i = 1,PetNeidan.NumMax do
		if i >= index then
			pet:SetInt("PET_NeidanSkillID_"..i, pet:GetInt("PET_NeidanSkillID_"..(i+1)))
			pet:SetInt("PET_NeidanSkillRE_"..i, pet:GetInt("PET_NeidanSkillRE_"..(i+1)))
		end
	end
end

function PetNeidan.Neidan_Upgrade(player, pet_guid, index)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local skillId = pet:GetInt("PET_NeidanSkillID_"..index)
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillId)
	
	if not skillData then
		sLuaApp:NotifyTipsMsg(player, "技能不存在")
		return
	end
	
	local skillLv = skillData:GetPerformance()
	local LevelMax = skillData:GetMaxPerformance()

	index = tonumber(index)
	local SkillRe = pet:GetInt("PET_NeidanSkillRE_"..index)
	if skillLv >= LevelMax then
		if PetNeidan.LevelTable[SkillRe+1] then
			local str = [[GlobalUtils.ShowServerBoxMessage("内丹等级已经达到上限，再次升级可将内丹转生，转生后内丹技能将回到0级，但等级上限提高，确定要转生吗？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetNeidan.Neidan_Reincarnation('"..player:GetGUID().."','"..pet_guid.."',"..index..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		else
			sLuaApp:NotifyTipsMsg(player, "该内丹已经无法再升级了")
			return
		end
	end
	
	if skillLv >= pet:GetAttr(ROLE_ATTR_LEVEL) then
		sLuaApp:NotifyTipsMsg(player, "内丹等级不能高于宠物等级！")
		return
	end
	
	local cost = math.ceil(assert(load("local level = "..skillLv.." local reinc = "..SkillRe.." return "..PetNeidan.Funcion))())
	
	if Lua_tools.SubMoney(player, PetNeidan.MoneyType, cost, "system", "内丹升级", "技能ID："..skillId) then
		skillData:SetPerformance(skillLv+1)
		sLuaApp:NotifyTipsMsg(player, "技能升级成功")
	else
		sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(PetNeidan.MoneyType).."不足")
		return
	end
end

function PetNeidan.Upgrade_OneKey(player, pet_guid, index)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	
	local skillId = pet:GetInt("PET_NeidanSkillID_"..index)
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillId)
	
	if not skillData then
		sLuaApp:NotifyTipsMsg(player, "技能不存在")
		return
	end
	
	local skillLv = skillData:GetPerformance()
	local LevelMax = skillData:GetMaxPerformance()
	index = tonumber(index)
	local SkillRe = pet:GetInt("PET_NeidanSkillRE_"..index)
	if skillLv >= LevelMax then
		if PetNeidan.LevelTable[SkillRe+1] then
			local str = [[GlobalUtils.ShowServerBoxMessage("内丹等级已经达到上限，再次升级可将内丹转生，转生后内丹技能将回到0级，但等级上限提高，确定要转生吗？")]]
			--local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]]..itemNum.."</color>个<color=#FF0000ff>"..ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Name..[[</color>解锁1个宠物栏位？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "PetNeidan.Neidan_Reincarnation('"..player:GetGUID().."','"..pet_guid.."',"..index..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		else
			sLuaApp:NotifyTipsMsg(player, "该内丹已经无法再升级了")
			return
		end
	end
	
	local newLevel = skillLv
	local petLevel = pet:GetAttr(ROLE_ATTR_LEVEL)
	
	if skillLv >= petLevel then
		sLuaApp:NotifyTipsMsg(player, "内丹等级不能高于宠物等级！")
		return
	end
	
	for i = skillLv,LevelMax do
		local cost = math.ceil(assert(load("local level = "..i.." local reinc = "..SkillRe.." return "..PetNeidan.Funcion))())
		if not Lua_tools.SubMoney(player, PetNeidan.MoneyType, cost, "system", "内丹升级", "技能ID："..skillId) then
			newLevel = i
			break
		end
		if i >= petLevel then
			newLevel = petLevel
			break
		end		
		if i == LevelMax then
			newLevel = LevelMax
		end
	end
	
	if newLevel == skillLv then
		sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(PetNeidan.MoneyType).."不足")
		return
	end
	
	skillData:SetPerformance(newLevel)

	sLuaApp:NotifyTipsMsg(player, ""..SkillConfig.GetById(skillId).Name.."提高到了"..newLevel.."级")
end

function PetNeidan.Neidan_Reincarnation(player_guid, pet_guid, index)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	
	local skillId = pet:GetInt("PET_NeidanSkillID_"..index)
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillId)
	
	if not skillData then
		sLuaApp:NotifyTipsMsg(player, "技能不存在")
		return
	end
	
	local skillLv = skillData:GetPerformance()
	local LevelMax = skillData:GetMaxPerformance()
	
	if skillLv < LevelMax then
		sLuaApp:NotifyTipsMsg(player, "未达到内丹转生等级")
		return
	end
	
	local SkillRe = pet:GetInt("PET_NeidanSkillRE_"..index)
	
	local petRe = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	if petRe <= SkillRe then
		sLuaApp:NotifyTipsMsg(player, "内丹转生次数不能超过宠物转生次数")
		return
	end
	
	local New_LevelMax = PetNeidan.LevelTable[SkillRe+1]
	if not New_LevelMax then
		sLuaApp:NotifyTipsMsg(player, "内丹转生次数达到上限")
		return
	end
	
	local skillKey = SkillConfig.GetById(skillId).KeyName
	local skillKey_Ori = sLuaApp:StrSplit(skillKey, ""..SkillRe)[1]
	local skillKey_New = skillKey_Ori .. (SkillRe+1)
	local skillId_New = SkillConfig.GetByKeyName(skillKey_New).Id
	
	skillCon:DestroySkill(skillData, true)
	skillCon:CreateSkill(skillId_New, 0, New_LevelMax, true)
	pet:SetInt("PET_NeidanSkillID_"..index, skillId_New)
	pet:SetInt("PET_NeidanSkillRE_"..index, SkillRe+1)
end

function PetNeidan.Pet_NeidanNumRefresh(pet)
	local Rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	local NeidanUnlock = PetNeidan.NeidanNum[Rein]
	if NeidanUnlock then
		pet:SetInt("PET_NeidanUnlock", NeidanUnlock)
	end
	pet:SetInt("PET_NeidanMax", PetNeidan.NumMax)
end

function PetNeidan.CeshiYinbi(player)
	local BindGold = 0
	for reinc = 0,3 do
		for level = 1,PetNeidan.LevelTable[reinc] do
			BindGold = BindGold + math.ceil(assert(load("local level = "..level.." local reinc = "..reinc.." return "..PetNeidan.Funcion))())
		end
	end
	if player then
		sLuaApp:NotifyTipsMsg(player, "BindGold = " .. BindGold)
	else
		sLuaApp:LuaDbg("BindGold = " .. BindGold)
	end
end

--PetNeidan.CeshiYinbi()