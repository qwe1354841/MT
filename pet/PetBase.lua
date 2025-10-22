--宠物基础表单

PetBase = {}

PetBase.UnlockSkillField = {
	Random = 100,		--万分比，几率
	Max = 3,			--最多领悟数量
}

PetBase.ReinConfig = {
	["Rein_1"] = { INTIM = 100000, MoneyType = 5, MoneyVal = 0, Attrs = {{Attr = "成长率", AttrVal = 1000},},},		--INTIM = 消耗的亲密度
	["Rein_2"] = { INTIM = 200000, MoneyType = 5, MoneyVal = 0, Attrs = {{Attr = "成长率", AttrVal = 2000},},},		--INTIM = 消耗的亲密度
	["Rein_3"] = { INTIM = 300000, MoneyType = 5, MoneyVal = 0, Attrs = {{Attr = "成长率", AttrVal = 3000},},},		--INTIM = 消耗的亲密度
	
}

--遗忘技能配置，第一次的价格为Times_1，第N次的价格为Times_N，以此类推，找不到N的时候则读取Times_Other的价格
PetBase.ForgetSkillConfig = {
	["Times_1"] = 100,
	["Times_2"] = 500,
	["Times_3"] = 1000,
	["Times_4"] = 5000,
	["Times_5"] = 10000,
	["Times_Other"] = 100000,
	["MoneyType"] = 1,
}

function PetBase.OnBorn(pet)
	pet:SetInt("PET_SkillLearnMax",GlobalConfig.GetById(1).PetSkillStudy)
	if PetNeidan then
		PetNeidan.Pet_NeidanNumRefresh(pet)
	end
	return ""
end

function PetBase.on_add_pet(pet)
	if pet then
		local petname = pet:GetKeyName()
		local petid = PetConfig.GetByKeyName(petname).Id
		local str = [[
			GUI.OpenWnd("GetPetOrGuardUI")
			GetPetOrGuardUI.SetPetId(]]..petid..[[)
		]]
		local player = pet:GetOwner()
		sLuaApp:ShowForm(player, "脚本表单", str)
		DiscountSystem.on_get_pet(player, pet)
		TitleSystem.on_get_pet(player, pet)
		
		local petData = PetConfig.GetByKeyName(petname)

		if petData.Grade >= 5 then
			pet:SetInt("God_beast_skill",0)
		end
	end
end

function PetBase.LevelUp(pet)
	
	if sLuaApp:RandInteger(1, 10000) <= PetBase.UnlockSkillField['Random'] then
		local NowSkillField = pet:GetInt("PET_ActSkillFields")
		if NowSkillField < PetBase.UnlockSkillField['Max'] then
			pet:SetInt("PET_ActSkillFields", NowSkillField + 1)
			sLuaApp:NotifyTipsMsg(pet:GetOwner(), "您的宠物 "..pet:GetName().." 在升级时解锁了一个技能栏位！")
		end
	end
	--回复忠诚度
	local PetLoyalty = pet:GetAttr(PET_ATTR_LOYALTY)
	if PetLoyalty < 100 then
		pet:AddPetClosePoint(100-PetLoyalty)
	end
	--增加亲密度
	pet:AddPetClosePoint(20)

	--自动加点
    --判断是否开启了自动加点
	if pet:GetInt("ADDPOINT_Auto") == 1 then 
		local method = pet:GetString("ADDPOINT_Method")
		if method then
			local list = sLuaApp:StrSplit(method, ",")
			--拿出要加的点数
			local point1 = tonumber(list[1])
			local point2 = tonumber(list[2])
			local point3 = tonumber(list[3])
			local point4 = tonumber(list[4])
			local point5 = tonumber(list[5])
			local proportion1 = point1/5
			local proportion2 = point2/5
			local proportion3 = point3/5
			local proportion4 = point4/5
			local proportion5 = point5/5
			--判断剩余点数是否大于5，如果大于5   将会按照玩家加点方案加点
		    local have = pet:GetAttr(ROLE_ATTR_REMAIN_POINT)
			if have >= 5 then
				if have%5 == 0 then
					--按玩家方案将剩余点数加完
					pet:AddPoint(have*proportion1, have*proportion2, have*proportion3, have*proportion4,have*proportion5)
				else
					local surplus = have%4
					pet:AddPoint((have-surplus)*proportion1, (have-surplus)*proportion2, (have-surplus)*proportion3, (have-surplus)*proportion4,(have-surplus)*proportion5)
					--将不足5的部分点数按方案加点
					if AddPoint.Auto_Mode == 1 then
						AddPoint.Not_Enough_Auto(pet,surplus,list)
						pet:SetInt("PET_PointsUsed", surplus+pet:GetInt("PET_PointsUsed"))
					else
						sLuaApp:NotifyTipsMsg(pet:GetOwner(), "您的宠物还有不能自动分配的潜能点数")
					end
				end
				pet:SetInt("PET_PointsUsed", have+pet:GetInt("PET_PointsUsed"))
			end
		end
	end
	return ""
end

function PetBase.Reincarnation(player, pet)
	if pet:Reincarnation(1) then
		if PetNeidan then
			PetNeidan.Pet_NeidanNumRefresh(pet)
		end
		pet:SetInt("PET_PointsUsed",0)
		sLuaApp:NotifyTipsMsg(player, "宠物转生成功！")
		local now_rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
		local ReinCon = PetBase.ReinConfig["Rein_"..now_rein]
		local AttrMark = PetAttrClassify.PetRein or 21
		if ReinCon then
			if ReinCon.Attrs then
				for k,v in ipairs(ReinCon.Attrs) do
					if v.Attr and v.AttrVal then
						local AttrData = AttrConfig.GetByKeyName(v.Attr)
						if AttrData then
							pet:SetDynAttr(AttrMark,AttrData.Id,v.AttrVal)
						else
							sLuaApp:LuaDbg("属性配置"..v.Attr.."不存在，脚本 PetBase.ReinConfig")
						end
					end
				end
			end
		end
	end
end

function PetBase.Rein(player)
	local pet = sPetSystem:GetLineupPet(player) 
	PetBase.Reincarnation(player, pet)
end

function PetBase.ForgetLinePetSkill(player, index)
	local pet = sPetSystem:GetLineupPet(player)
	if not pet then
		sLuaApp:NotifyTipsMsg(player,"你必须先携带一个宠物")
		return
	end
	local ForgetTimes = pet:GetInt("PET_ForgerSkillTimes")
	ForgetTimes = ForgetTimes + 1
	local MoneyType = PetBase.ForgetSkillConfig["MoneyType"]
	local MoneyVal = PetBase.ForgetSkillConfig["Times_"..ForgetTimes] or PetBase.ForgetSkillConfig["Times_Other"]
	local info = "这是该宠物第"..ForgetTimes.."次遗忘技能，需要消耗"..MoneyVal..Lua_tools.GetMoneyName(MoneyType).."，确定遗忘吗？"
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..info..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PetBase.ForgetSkill_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),sPetSystem:GetPetByGUID("..pet:GetGUID().."),"..index..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetBase.ForgetSkill_Confirm(player, pet ,index)
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法转生")
		return ""
	end
	
	local skillId = pet:GetInt("PET_SkillLearned_"..index)
	local allSkillNum = pet:GetInt("PET_ActSkillFields")
	if allSkillNum < index then
		sLuaApp:NotifyTipsMsg(player, "宠物技能数据异常")
		return ""
	end
	if skillId == 0 then
		sLuaApp:NotifyTipsMsg(player, "宠物没有该技能！")
		return ""
	end
	
	local ForgetTimes = pet:GetInt("PET_ForgerSkillTimes")
	ForgetTimes = ForgetTimes + 1
	local MoneyType = PetBase.ForgetSkillConfig["MoneyType"]
	local MoneyVal = PetBase.ForgetSkillConfig["Times_"..ForgetTimes] or PetBase.ForgetSkillConfig["Times_Other"]
	if Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "宠物技能遗忘", "遗忘技能ID = " .. skillId) == false then
		sLuaApp:NotifyTipsMsg(player, "宠物没有该技能！")
		return ""
	end
	
	local skillCon = pet:GetSkillContainer()
	skillCon:DestroySkill(skillCon:GetSkill(skillId), true)

	for i = index, allSkillNum do
		pet:SetInt("PET_SkillLearned_"..i, 0)
		local nextId = pet:GetInt("PET_SkillLearned_"..(i+1), 0)
		pet:SetInt("PET_SkillLearned_"..i, nextId)
	end
	
	pet:SetInt("PET_ForgerSkillTimes", pet:GetInt("PET_ForgerSkillTimes") + 1)
	
	sLuaApp:NotifyTipsMsg(player, ""..pet:GetName().."成功遗忘了技能【"..SkillConfig.GetById(skillId).Name.."】")
end

function PetBase.StartReincarnation(player)
	local pet = sPetSystem:GetLineupPet(player)
	if not pet then
		sLuaApp:NotifyTipsMsg(player,"你必须先携带一个宠物")
		return
	end
	local Rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	
	local info = "是否确定转生宠物："..pet:GetName().."？"
	local tb = PetBase.ReinConfig['Rein_'..(Rein+1)]
	if not tb then
		sLuaApp:NotifyTipsMsg(player,"宠物转生配置错误！")
		return
	end
	if tb.INTIM ~= 0 then
		info = info .. "（亲密度消耗："..tb.INTIM
	end
	if tb.MoneyVal ~= 0 then
		info = info .. "、"..Lua_tools.GetMoneyName(tb.MoneyType).."消耗："..tb.MoneyVal
	end
	info = info .. "）"
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..info..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PetBase.StartReincarnation_Confirm("..player:GetGUID()..","..pet:GetGUID()..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function PetBase.StartReincarnation_Confirm(player_guid, pet_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法转生")
		return ""
	end
	
	local Rein = pet:GetAttr(ROLE_ATTR_REINCARNATION)
	local Level = pet:GetAttr(ROLE_ATTR_LEVEL)
	if not PetBase.LevelConfig then
		PetBase.Intialization()
	end
	if not PetBase.LevelConfig then
		sLuaApp:NotifyTipsMsg(player,"转生系统异常")
		return
	end
	
	local ReinLv = PetBase.LevelConfig['Rein_'..Rein]
	if not PetBase.LevelConfig then
		sLuaApp:NotifyTipsMsg(player,"转生系统异常")
		return
	end
	sLuaApp:LuaDbg("Level = " .. Level .. "      ReinLv = ".. ReinLv)
	if Level ~= ReinLv then
		sLuaApp:NotifyTipsMsg(player,"您的宠物尚未达到可转生等级！")
		return
	end
	local NextCfg = PetBase.LevelConfig['Rein_'..(Rein+1)]
	if not NextCfg then
		sLuaApp:NotifyTipsMsg(player,"您的宠物已经达到转生上限了！")
		return
	end
	local tb = PetBase.ReinConfig['Rein_'..(Rein+1)]
	if not tb then
		sLuaApp:NotifyTipsMsg(player,"宠物转生配置错误！")
		return
	end
	
	if player:GetAttr(ROLE_ATTR_REINCARNATION) <= Rein then
		sLuaApp:NotifyTipsMsg(player,"宠物转生等级无法超过角色转生等级！")
		return
	end
	
	if Lua_tools.IsMoneyEnough(player, tb.MoneyType, tb.MoneyVal) == false then
		sLuaApp:NotifyTipsMsg(player,"您的"..Lua_tools.GetMoneyName(tb.MoneyType).."不足，无法转生！")
		return
	end
	
	local TarIntim = tb.INTIM
	local PetIntim = pet:GetAttr(PET_ATTR_CLOSE_POINT)
	
	if PetIntim < TarIntim then
		sLuaApp:NotifyTipsMsg(player,"您的宠物亲密度不够，无法转生！")
		return
	end
	
	if Lua_tools.SubMoney(player, tb.MoneyType, tb.MoneyVal, "system", "宠物转生", "") == false then
		sLuaApp:NotifyTipsMsg(player,"您的"..Lua_tools.GetMoneyName(tb.MoneyType).."不足，无法转生！")
		return
	end
	if pet:SubPetClosePoint(TarIntim) == false then
		sLuaApp:NotifyTipsMsg(player,"您的宠物亲密度不够，无法转生！")
		return
	end
	PetBase.Rein(player)
	PetIntimacy.Refresh(pet)
end

function PetBase.GetLinePetSkillName(player, types)
	local pet = sPetSystem:GetLineupPet(player)
	local skillTb = {}
	local NowSkillField = pet:GetInt("PET_ActSkillFields")
	if NowSkillField == 0 then
		return skillTb
	end
	for i = 1,NowSkillField do
		local skillId_Learned = pet:GetInt("PET_SkillLearned_"..i)
		if skillId_Learned ~= 0 then
			local skillData = SkillConfig.GetById(skillId_Learned)
			if skillData then
				skillTb[i] = skillData.Name
			else
				skillTb[i] = ""
			end
		end
	end
	return skillTb
end

function PetBase.ChangeName(player, pet_guid, new_name)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法改名")
		return ""
	end
	
end

function PetBase.Intialization()
	if not PetBase.LevelConfig then
		PetBase.LevelConfig = {}
		for rein = 0,10 do
			local level = 1
			local level_info = PetLevelConfig.GetByLevelReincarnation(level, rein)
			if not level_info then
				break
			end
			--sLuaApp:LuaDbg("level_1 = " .. level)
			while level_info ~= nil do
				local nextlevel = level + 90
				level_info = PetLevelConfig.GetByLevelReincarnation(nextlevel, rein)
				if level_info then
					level = nextlevel
				end
			end
			level_info = 0
			--sLuaApp:LuaDbg("level_2 = " .. level)
			while level_info ~= nil do
				local nextlevel = level + 10
				level_info = PetLevelConfig.GetByLevelReincarnation(nextlevel, rein)
				if level_info then
					level = nextlevel
				end
			end
			level_info = 0
			--sLuaApp:LuaDbg("level_3 = " .. level)
			while level_info ~= nil do
				local nextlevel = level + 1
				level_info = PetLevelConfig.GetByLevelReincarnation(nextlevel, rein)
				if level_info then
					level = nextlevel
				end
			end
			--sLuaApp:LuaDbg("level_4 = " .. level)
			PetBase.LevelConfig['Rein_'..rein] = level
		end
		--sLuaApp:LuaDbg("LevelConfig = " .. Lua_tools.serialize(PetBase.LevelConfig))
	end
end

PetBase.Intialization()