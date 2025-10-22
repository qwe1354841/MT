PetSkillBook = {
}

PetSkillBook.List = {}

PetSkillBook.StudyPremise = {
	['万箭齐发'] = {["五行属性金"] = 50, ["灵性"] = 450},
	['劫火万丈'] = {["五行属性火"] = 50, ["灵性"] = 450},
	['分裂攻击'] = {["力量"] = 450},
	['枯木缠身'] = {["五行属性木"] = 50},
	['冰冻三尺'] = {["五行属性水"] = 50},
	['舍生取义'] = {["五行属性土"] = 50, ["根骨"] = 450},
	['高级分裂攻击'] = {["力量"] = 450},
	['义之金叶神'] = {["五行属性金"] = 50},
	['仁之木叶神'] = {["五行属性木"] = 50},
	['信之土叶神'] = {["五行属性土"] = 50},
	['智之水叶神'] = {["五行属性水"] = 50},
	['礼之火叶神'] = {["五行属性火"] = 50},
	['神出鬼没'] = {["五行属性水"] = 50},
	['鬼神莫测'] = {["五行属性火"] = 50},
	['大隐于朝'] = {["五行属性木"] = 50},
}

PetSkillBook.StudyRandom = {
	['随机终极技能书'] = {'分花拂柳','涅槃','化无','将死','当头棒喝','明察秋毫','作鸟兽散','以牙还牙','绝境逢生','子虚乌有','春回大地',
							'分花拂柳','将死','当头棒喝','明察秋毫','作鸟兽散','以牙还牙','绝境逢生','子虚乌有','春回大地',	
	}

}

PetSkillBook.StudyMode = {
	['普通技能书'] = {
		['成功率'] = 10000,	--万分比，有几率学习失败
		['覆盖几率'] = 0,--万分比，覆盖技能而不是新增技能的几率
		['解锁几率'] = 0,--万分比，解锁新技能格的几率，要求已有技能格都填满
		['解锁上限'] = 3, 	--最多解锁到几个技能格
		['解锁规则'] = {},
		},
	['高级技能书'] = {
		['成功率'] = 10000,	--万分比，有几率学习失败
		['覆盖几率'] = 0,--万分比，覆盖技能而不是新增技能的几率
		['解锁几率'] = 0,--万分比，解锁新技能格的几率，要求已有技能格都填满
		['解锁上限'] = 3, 	--最多解锁到几个技能格
		['解锁规则'] = {},
		},
	['终极技能书'] = {
		['成功率'] = 10000,	--万分比，有几率学习失败
		['覆盖几率'] = 0,--万分比，覆盖技能而不是新增技能的几率
		['解锁几率'] = 0,--万分比，解锁新技能格的几率，要求已有技能格都填满
		['解锁上限'] = 4, 	--最多解锁到几个技能格
		['解锁规则'] = {},
		},
	['神兽技能书'] = {
		['成功率'] = 10000,	--万分比，有几率学习失败
		['覆盖几率'] = 0,--万分比，覆盖技能而不是新增技能的几率
		['解锁几率'] = 0,--万分比，解锁新技能格的几率，要求已有技能格都填满
		['解锁上限'] = 5, 	--最多解锁到几个技能格
		['解锁规则'] = {},
		},
	['聚魄丹'] = {
		['成功率'] = 10000,	--万分比，有几率学习失败
		['覆盖几率'] = 0,--万分比，覆盖技能而不是新增技能的几率
		['解锁几率'] = 0,--万分比，解锁新技能格的几率，要求已有技能格都填满
		['解锁上限'] = 6, 	--最多解锁到几个技能格
		['解锁规则'] = {		--当解锁规则不为空表时，解锁几率项将失效
			[0] = {0,1},	--在0个技能格时，每次使用该道具将有10000的几率解锁一个技能格，累积使用1个该道具必定开下一个技能格
			[1] = {0,2},
			[2] = {0,3},
			[3] = {0,5},
			[4] = {0,10},
			[5] = {0,50},
			},
		},
}

PetSkillBook.StudyMap = {
	['Subtype_1'] = {['Grade_2'] = '普通技能书', ['Grade_3'] = "高级技能书", ['Grade_4'] = "终极技能书", ['Grade_5'] = "神兽技能书", ['Another'] = "普通技能书"},
	['Subtype_7'] = {['Another'] = '聚魄丹'},
}

PetSkillBook.UnlockSetting = {
	itemKey = "宠物技能解锁",
	itemNum = {
		[1] = 1,
		[2] = 2,
		[3] = 5,
		[4] = 15,
		[5] = 50,
		[6] = 200,
	}
}

PetSkillBook.Skill_Info = [[1.宠物最多可学习6个技能
2.天生技能不影响宠物可学习技能的数量
3.点击锁住的技能栏位，可使用道具解锁栏位]]


function PetSkillBook.OnCreateItem(item)
	local keyName = item:GetKeyName()
	local skill
    if PetSkillBook.List then
		skill = PetSkillBook.List[keyName]
	end
	if not skill or skill == 0 then
		skill = keyName
	end
	--sLuaApp:LuaDbg("技能书生成 "..keyName)
	item:SetString("PetSkill",keyName)
end

function PetSkillBook.GetItemSkill(keyName)
	local skill
    if PetSkillBook.List then
		skill = PetSkillBook.List[keyName]
	end
	if not skill or skill == 0 then
		skill = keyName
	end
	--sLuaApp:LuaDbg("技能书关联 "..skill)
	return skill
end

function PetSkillBook.OnDestroyItem(item)
	
end

function PetSkillBook.OnUseItem(item)
	
	
end

function PetSkillBook.BookStudy(player, pet_guid, item_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_id = item:GetId()
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
		return ""
	end
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)

	if itemData.Type ~= 7 then
		sLuaApp:NotifyTipsMsg(player, "并非宠物道具，无法操作")
		return ""
	end
	local subType = itemData.Subtype
	if subType == 6 then
		if PetNeidan then
			PetNeidan.Use(player, pet, item)
		end
		return ""
	end
	--if item:GetId()  == PetSkillBook.Jupodan_sec_Id then
		
		--PetSkillBook.Jupodan_Use(player, pet, item)
		--return ""
	--end
	if subType ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "并非宠物技能书，无法操作")
		return ""
	end
	
	local petname = pet:GetKeyName()
	local petData = PetConfig.GetByKeyName(petname)

	if itemData.Grade >= 5 and petData.Grade < 5 then-----------------------------
		sLuaApp:NotifyTipsMsg(player, "只有神兽等级的宠物可以学习神兽技能哦")
		return ""
	elseif itemData.Grade >= 5 and petData.Grade >= 5 then
		PetSkillBook.GodBeastSkill(player, pet_guid, item_guid)
		return ""
	end

	local premise = PetSkillBook.StudyPremise[keyName]
	if premise then
		for k,v in pairs(premise) do
			if pet:GetAttr(AttrConfig.GetByKeyName(k).Id) < v then
				sLuaApp:NotifyTipsMsg(player, "需要宠物"..AttrConfig.GetByKeyName(k).ChinaName.."属性大于或等于"..v.."时才能学习当前技能")
				return
			end
		end
	end

	local studyMode = ""
	if PetSkillBook.StudyMap then
		local map = PetSkillBook.StudyMap['Subtype_'..subType]
		if map then
			studyMode = map["Grade_"..itemData.Grade] or map["Another"]
		end
	end
	
	if not studyMode or studyMode == "" then
		sLuaApp:NotifyTipsMsg(player, "未找到对应的学习类型")
		return
	end
	
	local NowSkillField = pet:GetInt("PET_ActSkillFields")
	if NowSkillField == 0 then
		sLuaApp:NotifyTipsMsg(player, "没有已激活的技能栏位，无法学习该技能")
		return ""
	end
	
	local studyMap = PetSkillBook.StudyMode[studyMode]
	local skillKey = item:GetString("PetSkill")
	local skillID = 0
	local isRandomSkill = 0
	if skillKey == "" then
		skillKey = PetSkillBook.GetItemSkill(keyName)
		--sLuaApp:LuaDbg(" skillKey = " .. skillKey)
		local randSkills = PetSkillBook.StudyRandom[skillKey]
		if randSkills then
			skillKey = randSkills[sLuaApp:RandInteger(1,#randSkills)]
			isRandomSkill = 1
		end
		if item_id == PetSkillBook.Jupodan_sec_Id then
			skillID = item:GetInt("ITEM_PetSkill")
			if skillID == 0 then
				sLuaApp:NotifyTipsMsg(player, "这本书上没有技能哦")
				return ""
			end
		elseif skillKey == "" or not skillKey then
			sLuaApp:NotifyTipsMsg(player, "这本书上没有技能哦")
			return ""
		end
	end

	local Skills = {}
	for i = 1,NowSkillField do
		local skillId_Learned = pet:GetInt("PET_SkillLearned_"..i)
		if skillId_Learned ~= 0 then
			table.insert(Skills, skillId_Learned)
		end
	end
	
	if studyMap['覆盖几率'] == 0 then
		if NowSkillField == #Skills then
			sLuaApp:NotifyTipsMsg(player, "没有空余的技能栏位，无法学习技能")
			return
		end
	end
	
	if sLuaApp:RandInteger(1, 10000) > studyMap['成功率'] then
		sLuaApp:NotifyTipsMsg(player, "很遗憾，尽管你的宠物很聪明，但这次技能学习失败了！")
		return
	end
	local skilltb
	if skillID == 0 then
		skilltb = SkillConfig.GetByKeyName(skillKey)
		if skilltb then
			skillID = skilltb.Id
		end
	else
		skilltb = SkillConfig.GetById(skillID)
	end
	local skillCon = pet:GetSkillContainer()
	local skillData = skillCon:GetSkill(skillID)
	--sLuaApp:LuaDbg("技能Id "..skillID)
	if isRandomSkill == 1 then
		local petSkillTb = {}
		for k,v in ipairs(Skills) do
			if skillID == v then
				sLuaApp:NotifyTipsMsg(player, "很遗憾，尽管你的宠物很聪明，但这次技能学习失败了！")
				return
			end
		end
	end
	
	if skillData then
		sLuaApp:NotifyTipsMsg(player, "您的宠物已经学习了该技能")
		return
	end
	
	if sItemSystem:DestroyItem(item, "system", "宠物技能学习", "宠物对象："..pet:GetName()) ~= 0 then
		return
	end
	
	local SkillNum = #Skills
	local Name = pet:GetName()
	if SkillNum < NowSkillField then
		local Cover = 0
		if sLuaApp:RandInteger(1, 10000) <= studyMap['覆盖几率'] then
			Cover = 1
		end
		if Cover == 1 and SkillNum ~= 0 then
			local Skill_new = sLuaApp:RandInteger(1, SkillNum)
			local Skill_old = pet:GetInt("PET_SkillLearned_"..Skill_new)
			skillCon:DestroySkill(skillCon:GetSkill(Skill_old), true)
			skillCon:CreateSkill(skillID,1,1,true)
			pet:SetInt("PET_SkillLearned_"..Skill_new,skillID)
			sLuaApp:NotifyTipsMsg(player, Name .. '习得了【'..skilltb.Name..'】，但忘却了【'..SkillConfig.GetById(Skill_old).Name..'】')
		else
			skillCon:CreateSkill(skillID,1,1,true)
			pet:SetInt("PET_SkillLearned_"..(SkillNum+1),skillID)
			sLuaApp:NotifyTipsMsg(player, Name .. '习得了【'..skilltb.Name..'】')
		end
	else
		local unlocker = 0
		if Lua_tools.tablecount(studyMap['解锁规则']) ~= 0 then
			local nowNum = pet:GetInt("PET_"..item_id.."_used")
			local index = pet:GetInt("PET_ActSkillFields")
			local Rule_tb = studyMap['解锁规则'][index]
			if nowNum+1 >= Rule_tb[2] then
				unlocker = 1
			elseif sLuaApp:RandInteger(1, 10000) <= Rule_tb[1] then
				unlocker = 1
			end
			pet:SetInt("PET_"..item_id.."_used", nowNum+1)
		elseif sLuaApp:RandInteger(1, 10000) <= studyMap['解锁几率'] then
			unlocker = 1
		end	
		if unlocker == 1 then
			if NowSkillField < studyMap['解锁上限'] then
				if NowSkillField < GlobalConfig.GetById(1).PetSkillStudy then
					pet:SetInt("PET_ActSkillFields", NowSkillField + 1)
					skillCon:CreateSkill(skillID,1,1,true)
					pet:SetInt("PET_SkillLearned_"..(SkillNum+1),skillID)
					sLuaApp:NotifyTipsMsg(player, Name .. '习得了【'..skilltb.Name..'】')
				end
			end
		else
			local Skill_new = sLuaApp:RandInteger(1, SkillNum)
			local Skill_old = pet:GetInt("PET_SkillLearned_"..Skill_new)
			skillCon:DestroySkill(skillCon:GetSkill(Skill_old), true)
			skillCon:CreateSkill(skillID,1,1,true)
			pet:SetInt("PET_SkillLearned_"..Skill_new,skillID)
			sLuaApp:NotifyTipsMsg(player, Name .. '习得了【'..skilltb.Name..'】，但忘却了【'..SkillConfig.GetById(Skill_old).Name..'】')
		end
	end
end

function PetSkillBook.QuickUnlock(player)
	local pet = sPetSystem:GetLineupPet(player)
	local NowSkillField = pet:GetInt("PET_ActSkillFields")
	if NowSkillField < GlobalConfig.GetById(1).PetSkillMax then
		pet:SetInt("PET_ActSkillFields", NowSkillField + 1)
		sLuaApp:NotifyTipsMsg(player, "解锁技能栏位成功")
	end
end

PetSkillBook.SkillFuncConfig = {
	{Name = "遗忘技能", BtnName = "遗忘", Consume = {"技能遗忘丹",1}, Form = "FormPet", Func = "Skill_Delet",
		Info = [[1.每次遗忘技能将消耗1个天璇忘尘丹
2.技能遗忘后不可恢复
3.遗忘技能不会对宠物产生其他影响]]},
	{Name = "提取技能", BtnName = "提取", Consume = {"聚魄丹",1}, Form = "FormPet", Func = "Skill_Extract", 
		Info = [[1.每次提取技能将消耗1个聚魄丹
2.无论提取成功或失败，被提取的宠物都会消失
3.提取成功将得到一个拥有技能的聚魄丹
4.只有高级技能才可以被提取]]},
}

function PetSkillBook.GetSkillFuncData(player)
	sLuaApp:LuaDbg("GetSkillFuncData")
	local str = [[if PetSkillUI then
		PetSkillUI.GetConfig(]]..Lua_tools.serialize(PetSkillBook.SkillFuncConfig)..[[)
		end
		]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

PetSkillBook.Jupodan_Id = 21101				--聚魄丹ID
PetSkillBook.Jupodan_sec_Id = 21102			--提取后聚魄丹ID
PetSkillBook.Jupodan_ExtractRand = 5000		--聚魄丹提取几率(万分比)
PetSkillBook.Jupodan_CanExt = {				--可提取的技能
	[2] = {false,"普通技能"},
	[3] = {true,"高级技能"},
	[4] = {false,"终极技能"},
	[5] = {false,"神兽技能"},
}
PetSkillBook.Jupodan_Info = [[1.每次提取技能将消耗1个聚魄丹
2.无论提取成功或失败，被提取的宠物都会消失
3.提取成功将得到一个拥有技能的聚魄丹
4.只有高级技能才可以被提取]]



PetSkillBook.Yiwangdan_Info = [[1.每次遗忘技能将消耗1个天璇忘尘丹
2.技能遗忘后不可恢复
3.遗忘技能不会对宠物产生其他影响]]

function PetSkillBook.Jupodan_Extract(player, pet_guid, index)
	sLuaApp:LuaDbg("Jupodan_Extract")
	if not PetSkillBook.ExtractConsume then
		for k,v in ipairs(PetSkillBook.SkillFuncConfig) do
			if v.Name == "提取技能" then
				PetSkillBook.ExtractConsume = v.Consume
			end
		end
		if not PetSkillBook.ExtractConsume then
			sLuaApp:LuaDbg("提取技能  缺少配置 PetSkillBook.SkillFuncConfig")
			return
		end
	end
	--if not PetSkillBook.Jupodan_Id then
	--	local itemData = ItemConfig.GetByKeyName()
	--end
	local itemNum = sItemSystem:GetItemAmount(player, PetSkillBook.Jupodan_Id, 3)
	if itemNum == 0 then
		OneKeyBuy.Main(player, PetSkillBook.ExtractConsume)
		sLuaApp:NotifyTipsMsg(player,"道具不足，无法进行提取")
		return ""
	end
	local info = "无论提取成功或失败，被提取的宠物都会消失，您确定要提取该技能吗？"
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..info..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PetSkillBook.Extract_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),sPetSystem:GetPetByGUID("..pet_guid.."),"..index..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetSkillBook.Extract_Confirm(player, pet, index)
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local itemNum = sItemSystem:GetItemAmount(player, PetSkillBook.Jupodan_Id, 3)
	if itemNum == 0 then
		sLuaApp:NotifyTipsMsg(player, "你没有"..ItemConfig.GetById(PetSkillBook.Jupodan_Id).Name.."了")
		return ""
	end
	
	if index then
		index = tonumber(index)
	end
	if not index then
		sLuaApp:NotifyTipsMsg(player, "需要先选定宠物技能")
		return ""
	end
	local skillID = pet:GetInt("PET_SkillLearned_"..index)
	if skillID == 0 then
		sLuaApp:NotifyTipsMsg(player, "需要先选定宠物技能")
		return ""
	end
	local keyName = SkillConfig.GetById(skillID).KeyName
	local Grade = ItemConfig.GetByKeyName(keyName).Grade
	local tb_CanExt = PetSkillBook.Jupodan_CanExt[Grade]
	if not tb_CanExt then
		sLuaApp:NotifyTipsMsg(player, "配置异常")
		return ""
	end
	if tb_CanExt[1] == false then
		sLuaApp:NotifyTipsMsg(player, tb_CanExt[2].."无法被提取")
		return ""
	end
	sItemSystem:ConsumeItemWithId(player, PetSkillBook.Jupodan_Id, 1, 3, "system", "宠物功能", "聚魄丹提炼")
	if sPetSystem:GetLineupPet(player) == pet then 
		sPetSystem:ClrLineup(pet) 
	end
	sPetSystem:DestroyPet(pet, "system", "宠物功能", "聚魄丹提炼")
	if sLuaApp:RandInteger(1, 10000) > PetSkillBook.Jupodan_ExtractRand then
		item = sItemSystem:AddItemEx(player, PetSkillBook.Jupodan_sec_Id, 1, false, "system", "宠物功能", "聚魄丹提炼")[1]
		item:SetInt("ITEM_PetSkill", skillID)
		sLuaApp:NotifyTipsMsg(player, "提取成功！")
		return ""
	else
		sLuaApp:NotifyTipsMsg(player, "提取失败！")
		return ""
	end
end

function PetSkillBook.ForgetPetSkill(player, pet_guid, index)
	sLuaApp:LuaDbg("ForgetPetSkill")
	if not PetSkillBook.ForgetConsume then
		for k,v in ipairs(PetSkillBook.SkillFuncConfig) do
			if v.Name == "遗忘技能" then
				PetSkillBook.ForgetConsume = v.Consume
			end
		end
		if not PetSkillBook.ForgetConsume then
			sLuaApp:LuaDbg("遗忘技能  缺少配置 PetSkillBook.SkillFuncConfig")
			return
		end
	end
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	--local ForgetTimes = pet:GetInt("PET_ForgerSkillTimes")
	--ForgetTimes = ForgetTimes + 1
	--local MoneyType = PetBase.ForgetSkillConfig["MoneyType"]
	--local MoneyVal = PetBase.ForgetSkillConfig["Times_"..ForgetTimes] or PetBase.ForgetSkillConfig["Times_Other"]
	
	if not Lua_tools.IsItemEnough(player, PetSkillBook.ForgetConsume) then
		OneKeyBuy.Main(player, PetSkillBook.ForgetConsume)
		--sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Name)
		return ""
	end
	
	local info = "技能遗忘后不可恢复，确定该遗忘吗？"
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..info..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PetSkillBook.ForgetSkill_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),sPetSystem:GetPetByGUID("..pet:GetGUID().."),"..index..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetSkillBook.ForgetSkill_Confirm(player, pet ,index)
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local skillId
	local allSkillNum
	if index == 0 then
		PetSkillBook.ForgetGodBeastSkill(player, pet)
		return ""
	else
		skillId = pet:GetInt("PET_SkillLearned_"..index)
		allSkillNum = pet:GetInt("PET_ActSkillFields")
		if allSkillNum < index then
			sLuaApp:NotifyTipsMsg(player, "宠物技能数据异常")
			return ""
		end
		if skillId == 0 then
			sLuaApp:NotifyTipsMsg(player, "宠物没有该技能！")
			return ""
		end
	end
	
	local ForgetTimes = pet:GetInt("PET_ForgerSkillTimes")
	ForgetTimes = ForgetTimes + 1
	--local MoneyType = PetBase.ForgetSkillConfig["MoneyType"]
	--local MoneyVal = PetBase.ForgetSkillConfig["Times_"..ForgetTimes] or PetBase.ForgetSkillConfig["Times_Other"]
	--if Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "宠物技能遗忘", "遗忘技能ID = " .. skillId) == false then
	--	sLuaApp:NotifyTipsMsg(player, "宠物没有该技能！")
	--	return ""
	--end
	if not PetSkillBook.ForgetConsume then
		for k,v in ipairs(PetSkillBook.SkillFuncConfig) do
			if v.Name == "遗忘技能" then
				PetSkillBook.ForgetConsume = v.Consume
			end
		end
		if not PetSkillBook.ForgetConsume then
			sLuaApp:LuaDbg("遗忘技能  缺少配置 PetSkillBook.SkillFuncConfig")
			return
		end
	end
	
	if not Lua_tools.SubItem(player, PetSkillBook.ForgetConsume, "system", "宠物技能遗忘", "遗忘技能ID = " .. skillId) then
		sLuaApp:NotifyTipsMsg(player, "道具不足，无法进行遗忘")
	end
	
	local skillCon = pet:GetSkillContainer()
	skillCon:DestroySkill(skillCon:GetSkill(skillId), true)

	for i = index, allSkillNum do
		pet:SetInt("PET_SkillLearned_"..i, 0)
		local nextId = pet:GetInt("PET_SkillLearned_"..(i+1), 0)
		pet:SetInt("PET_SkillLearned_"..i, nextId)
	end
	
	pet:SetInt("PET_ForgerSkillTimes", ForgetTimes)
	
	sLuaApp:NotifyTipsMsg(player, ""..pet:GetName().."成功遗忘了技能【"..SkillConfig.GetById(skillId).Name.."】")
end

function PetSkillBook.Jupodan_Use(player, pet, item)
	

end

function PetSkillBook.Neidan_Extract(player, pet, item)
	

end

function PetSkillBook.Neidan_Use(player, pet, item)
	

end

function PetSkillBook.Neidan_Reincarnation(player, pet, item)
	

end

function PetSkillBook.UnlockSkillFields_Request(player, pet_guid)
	--sLuaApp:LuaDbg("UnlockSkillFields_Request 1")
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local NowSkillField = pet:GetInt("PET_ActSkillFields")
	if NowSkillField >= pet:GetInt("PET_SkillLearnMax") then
		sLuaApp:NotifyTipsMsg(player, "已经没有更多可解锁的技能栏位了")
		return ""
	end
	
	NowSkillField = NowSkillField + 1
	local itemNum = PetSkillBook.UnlockSetting.itemNum[NowSkillField]
	if itemNum then
		if not PetSkillBook.UnlockSetting.itemId then
			PetSkillBook.UnlockSetting.itemId = ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Id
		end
		--sLuaApp:LuaDbg("UnlockSkillFields_Request 2")
		local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]]..itemNum.."</color>个<color=#FF0000ff>"..ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Name..[[</color>解锁1个技能栏位？\n（当前拥有：]]..sItemSystem:GetItemAmount(player, PetSkillBook.UnlockSetting.itemId, 3)..[[）")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "PetSkillBook.UnlockSkillFields_Confirm('"..player:GetGUID().."','"..pet_guid.."')")
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function PetSkillBook.UnlockSkillFields_Confirm(player_guid, pet_guid)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local NowSkillField = pet:GetInt("PET_ActSkillFields")
	if NowSkillField >= pet:GetInt("PET_SkillLearnMax") then
		sLuaApp:NotifyTipsMsg(player, "已经没有更多可解锁的技能栏位了")
		return ""
	end
	NowSkillField = NowSkillField + 1
	local itemNum = PetSkillBook.UnlockSetting.itemNum[NowSkillField]
	if itemNum then
		if not PetSkillBook.UnlockSetting.itemId then
			PetSkillBook.UnlockSetting.itemId = ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Id
		end
		local haveNum = sItemSystem:GetItemAmount(player, PetSkillBook.UnlockSetting.itemId, 3)
		if haveNum < itemNum then
			OneKeyBuy.Main(player, {""..PetSkillBook.UnlockSetting.itemKey,itemNum-haveNum})
			--sLuaApp:NotifyTipsMsg(player, "你没有足够的"..ItemConfig.GetByKeyName(PetSkillBook.UnlockSetting.itemKey).Name)
			return ""
		end
		sItemSystem:ConsumeItemWithId(player, PetSkillBook.UnlockSetting.itemId, itemNum, 3, "system", "宠物功能", "聚魄丹提炼")
		pet:SetInt("PET_ActSkillFields", NowSkillField)
		sLuaApp:NotifyTipsMsg(player, "解锁技能栏位成功")
	end
end

function PetSkillBook.GetInfo(player)
	if PetSkillBook.Skill_Info then
	
	end
	if PetSkillBook.Jupodan_Info then
		
	end
end

PetSkillBook.GodBeastSkillConfig = {
	SkillBook ={
		{Key = "兵临城下", rand = 5000},
		{Key = "潮鸣电掣", rand = 3000},
		{Key = "如虎添翼", rand = 2000},
		},
	value = 50*10000
}

function PetSkillBook.GodBeastSkill(player, pet_guid, item_guid)
	local pet = sPetSystem:GetPetByGUID(tonumber(pet_guid))
	if pet:GetOwner() ~= player then
		sLuaApp:NotifyTipsMsg(player, "并非宠物拥有者，无法操作")
		return ""
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
		return ""
	end
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	if itemData.Type ~= 7 then
		sLuaApp:NotifyTipsMsg(player, "并非宠物道具，无法操作")
		return ""
	end
	local subType = itemData.Subtype
	if subType == 6 then
		if PetNeidan then
			PetNeidan.Use(player, pet, item)
		end
		return ""
	end

	if subType ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "并非宠物技能书，无法操作")
		return ""
	end
	local petname = pet:GetKeyName()
	local petData = PetConfig.GetByKeyName(petname)

	if petData.Grade < 5 then
		sLuaApp:NotifyTipsMsg(player, "该宠物不是神兽宠物，无法学习")
		return ""
	end
	
	local premise = PetSkillBook.StudyPremise[keyName]
	if premise then
		for k,v in pairs(premise) do
			if pet:GetAttr(AttrConfig.GetByKeyName(k).Id) < v then
				sLuaApp:NotifyTipsMsg(player, "需要宠物"..AttrConfig.GetByKeyName(k).ChinaName.."属性大于或等于"..v.."时才能学习当前技能")
				return
			end
		end
	end
	
	local studyMode = ""
	
	if PetSkillBook.StudyMap then
		local map = PetSkillBook.StudyMap['Subtype_'..subType]
		if map then
			studyMode = map["Grade_"..itemData.Grade] or map["Another"]
		end
	end
	
	if not studyMode or studyMode == "" then
		sLuaApp:NotifyTipsMsg(player, "未找到对应的学习类型")
		return
	end
	
	local God_beast_skill = pet:GetInt("God_beast_skill")

	if God_beast_skill ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "宠物神兽技能栏已满，无法学习该技能")
		return ""
	else
		if keyName == "随机神兽技能书" then
			local PetIntim = pet:GetAttr(PET_ATTR_CLOSE_POINT)
			local value = PetSkillBook.GodBeastSkillConfig["value"]

			if PetIntim < value then
				sLuaApp:NotifyTipsMsg(player,"您的宠物亲密度不够，无法学习该技能")
				return
			end

			local skillConfig = PetSkillBook.GodBeastSkillConfig["SkillBook"]
			local skillCon = pet:GetSkillContainer()
			local skilltb
			local rand1 = skillConfig[1]["rand"]
			local rand2 = skillConfig[2]["rand"]
			local rand3 = skillConfig[3]["rand"]
			local randNum = sLuaApp:RandInteger(1,rand1+rand2+rand3)

			if randNum > 0 and randNum <= rand1 then
				skilltb = SkillConfig.GetByKeyName(skillConfig[1]["Key"])
			elseif randNum > rand1 and randNum <= rand1 + rand2 then
				skilltb = SkillConfig.GetByKeyName(skillConfig[2]["Key"])
			elseif randNum > rand1 + rand2 and randNum <= rand1+rand2+rand3 then
				skilltb = SkillConfig.GetByKeyName(skillConfig[3]["Key"])
			end

			if pet:SubPetClosePoint(value) == false then
				sLuaApp:NotifyTipsMsg(player,"您的宠物亲密度不够，无法学习该技能")
				return
			end
			if sItemSystem:DestroyItem(item, "system", "宠物神兽技能学习", "宠物对象："..pet:GetName()) ~= 0 then
				return
			end
			skillCon:CreateSkill(skilltb.Id,1,1,true)
			pet:SetInt("God_beast_skill",skilltb.Id)
			sLuaApp:NotifyTipsMsg(player, pet:GetName() .. '消耗'..value..'亲密度，习得了【'..skilltb.Name..'】')
		else
			local skillCon = pet:GetSkillContainer()
			local skilltb = SkillConfig.GetByKeyName(keyName)
			if sItemSystem:DestroyItem(item, "system", "宠物神兽技能学习", "宠物对象："..pet:GetName()) ~= 0 then
				return
			end
			skillCon:CreateSkill(skilltb.Id,1,1,true)
			pet:SetInt("God_beast_skill",skilltb.Id)
			sLuaApp:NotifyTipsMsg(player, pet:GetName() .. '习得了【'..skilltb.Name..'】')
		end
	end
end

function PetSkillBook.ForgetGodBeastSkill(player, pet)
	local skillId = pet:GetInt("God_beast_skill")

	if skillId == 0 then
		sLuaApp:NotifyTipsMsg(player, "宠物没有该技能！")
		return ""
	end

	local ForgetTimes = pet:GetInt("PET_ForgerSkillTimes")
	ForgetTimes = ForgetTimes + 1

	if not PetSkillBook.ForgetConsume then
		for k,v in ipairs(PetSkillBook.SkillFuncConfig) do
			if v.Name == "遗忘技能" then
				PetSkillBook.ForgetConsume = v.Consume
			end
		end
		if not PetSkillBook.ForgetConsume then
			sLuaApp:LuaDbg("遗忘技能  缺少配置 PetSkillBook.SkillFuncConfig")
			return
		end
	end

	if not Lua_tools.SubItem(player, PetSkillBook.ForgetConsume, "system", "宠物技能遗忘", "遗忘技能ID = " .. skillId) then
		sLuaApp:NotifyTipsMsg(player, "道具不足，无法进行遗忘")
	end
	
	local skillCon = pet:GetSkillContainer()
	skillCon:DestroySkill(skillCon:GetSkill(skillId), true)

	pet:SetInt("PET_ForgerSkillTimes", ForgetTimes)
	pet:SetInt("God_beast_skill",0)
	
	sLuaApp:NotifyTipsMsg(player, ""..pet:GetName().."成功遗忘了技能【"..SkillConfig.GetById(skillId).Name.."】")
end