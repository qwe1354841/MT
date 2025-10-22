--宠物合成
PetMix = {}
--主宠绑定技能保留  --主宠和副宠的所有非绑技能都有概率保留

PetMix.MajorPetType = {2,3} -- 可做为主宠的宠物type
PetMix.MajorPetLevel = 30 -- 主宠最低等级

PetMix.MinorPetType = {2,3} --可做为副宠的宠物type
PetMix.MinorPetLevel = 30 -- 副宠最低等级

-- 客户端显示tips
PetMix.Tips = [[1.合成后宠物的星级不会改变。\n2.合成后宠物的技能有几率保留。\n3.主宠绑定和突破技能不会消失。\n4.使用合成幸运符和大幸运符将会提高技能保留几率。]]

-- 合成后 每个非绑技能保留的百分比
PetMix.SkillSaveProbability = 30

--幸运符 -- 提高 每个技能保留的百分比
PetMix.LuckyJuJu = {
	{["ItemKeyName"] = "合成超幸运符", ["Probability"] = 70, ["Show"] = 0},
	{["ItemKeyName"] = "合成大幸运符", ["Probability"] = 45, ["Show"] = 1},
	{["ItemKeyName"] = "合成幸运符", ["Probability"] = 20, ["Show"] =1},
}

-- 合成后宠物最大技能数 -- 0表示无限制 -- 合成前技能数量超过限制，无法合成 
PetMix.MaxSkillNum = 0

function PetMix.GetData(player)
	local str = [[
		if PetUI then
			PetUI.PetMixServerData = ]]..PetMix.GetDataTbStr..[[
			PetUI.RefreshSynthesis()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetMix.StartMix(player, major_pet_guid, minor_pet_guid, juju_keyname, is_juju_bind, check_mod)
	if not major_pet_guid or not minor_pet_guid or not juju_keyname then return end
	juju_keyname = tostring(juju_keyname)
	--sLuaApp:LuaErr("is_juju_bind "..is_juju_bind)
	--判断宠物
	local major_pet = PetMix.CheckPet(player, major_pet_guid)
	if not major_pet then return end
	if major_pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "主宠已锁定，无法合成！")
		return
	end	
	if major_pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "主宠已上阵，无法合成！")
		return
	end
	local major_pet_data = PetConfig.GetById(major_pet:GetId())
	if not PetMix.MajorPetTypeEx[major_pet_data.Type] then
		sLuaApp:LuaErr("PetMix.StartMix  宠物type不符 "..major_pet_guid)
		return
	end
	local major_pet_level = major_pet:GetAttr(ROLE_ATTR_LEVEL)
	if major_pet_level < PetMix.MajorPetLevel then
		sLuaApp:LuaErr("PetMix.StartMix  MajorPetLevel 不足 "..major_pet_guid)
		sLuaApp:NotifyTipsMsg(player, "主宠等级不足！")
		return
	end
	
	local minor_pet = PetMix.CheckPet(player, minor_pet_guid)
	if not minor_pet then return end
	if minor_pet:IsLocked() then
		sLuaApp:NotifyTipsMsg(player, "副宠已锁定，无法合成！")
		return
	end
	if minor_pet:IsLineup() then
		sLuaApp:NotifyTipsMsg(player, "副宠已上阵，无法合成！")
		return
	end
	local minor_pet_data = PetConfig.GetById(minor_pet:GetId())
	if not PetMix.MinorPetTypeEx[minor_pet_data.Type] then
		sLuaApp:LuaErr("PetMix.StartMix  宠物type不符 "..minor_pet_guid)
		return
	end
	local minor_pet_level = minor_pet:GetAttr(ROLE_ATTR_LEVEL)
	if minor_pet_level < PetMix.MinorPetLevel then
		sLuaApp:LuaErr("PetMix.StartMix  MinorPetLevel 不足 "..minor_pet_guid)
		sLuaApp:NotifyTipsMsg(player, "副宠等级不足！")
		return
	end
	--检查技能数
	if PetMix.MaxSkillNum > 0 then
		local major_skill_num = #PetMix.GetSkillTb(major_pet)
		if major_skill_num >=  PetMix.MaxSkillNum then
			sLuaApp:NotifyTipsMsg(player, "主宠技能数量达到"..PetMix.MaxSkillNum.."个，无法合成！")
			return
		end
		local minor_skill_num = #PetMix.GetSkillTb(minor_pet)
		if minor_skill_num >=  PetMix.MaxSkillNum then
			sLuaApp:NotifyTipsMsg(player, "副宠技能数量达到"..PetMix.MaxSkillNum.."个，无法合成！")
			return
		end
	end
	
	local save_probability = PetMix.SkillSaveProbability -- 保存技能的概率
	-- 周师傅要一个测试用
	local test_extra_probability = player:GetInt("PetMix_TestProbability")
	if test_extra_probability ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "测试额外增加幸运值 ".. test_extra_probability)
	end
	save_probability = save_probability + test_extra_probability
	
	local major_pet_is_bind = major_pet:IsBind()
	local need_set_pet_bind = false
	--判断物品
	if juju_keyname ~= "-1" then
		local extra_probability = PetMix.LuckyJuJuEx[juju_keyname]
		if not extra_probability then
			sLuaApp:LuaErr("PetMix.StartMix LuckyJuJuEx不存在 ".. juju_keyname)
			return
		end
		save_probability = save_probability + extra_probability
		
		local juju_id = sItemSystem:GetItemIdByKeyname(juju_keyname)
		is_juju_bind = tonumber(is_juju_bind)
		if is_juju_bind ~= 1 and is_juju_bind ~= 2 then
			sLuaApp:LuaErr("PetMix.StartMix  is_juju_bind == "..is_juju_bind)
			return
		end
		local has_item_num = sItemSystem:GetItemAmount(player, juju_id, is_juju_bind)
	--	local has_item_num = juju:GetAmount()
		local juju_data = ItemConfig.GetById(juju_id)
		if not juju_data then 
			sLuaApp:LuaErr("PetMix.StartMix ItemConfig 缺少"..juju_id)
			return
		end
		local juju_name = juju_data.Name
		if has_item_num < 1 then
			sLuaApp:NotifyTipsMsg(player, juju_name .."数量不足！")
			return
		end
		-- 幸运符绑定 合成后宠物也绑定 （周师傅要求的）
		--local juju_is_bind = juju:IsBound()
		if juju_is_bind == 2 then
			if not check_mod or check_mod ~= 1 then
				local tip_msg =  PetDevelop.GetColor(juju_name,"Red") .."为"..PetDevelop.GetColor("绑定状态","Red").."，合成后的宠物也会被"..PetDevelop.GetColor("绑定","Red").."，您是否确认合成？"
				local str = [[GlobalUtils.ShowServerBoxMessage("]]..tip_msg..[[")]]
				player:SetString("SYSTEM_ConfirmBox_Function", "PetMix.StartMix(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..major_pet_guid..","..minor_pet_guid..",'"..juju_keyname.."',"..(is_juju_bind or 2) ..",1)")
				sLuaApp:ShowForm(player, "脚本表单", str)
				return
			else
				if not major_pet_is_bind then
					need_set_pet_bind = true
				end
			end
		end
	end
	--宠物绑定 等级置为1
	if not need_set_pet_bind then
		local minor_pet_is_bind = minor_pet:IsBind()
		if major_pet_is_bind or (not major_pet_is_bind and minor_pet_is_bind) then -- 主宠绑定时也要提示（周师傅要求的）
			if not check_mod or check_mod ~= 1 then
				local pet_name_str = PetDevelop.GetColor(major_pet_is_bind and major_pet:GetName() or minor_pet:GetName(),"Red")
				local tip_msg = (major_pet_is_bind and "主宠" or "副宠") .. pet_name_str .."为"..PetDevelop.GetColor("绑定状态","Red").."，合成后的宠物也会被"..PetDevelop.GetColor("绑定","Red").."，您是否确认合成？"
				local str = [[GlobalUtils.ShowServerBoxMessage("]]..tip_msg..[[")]]
				player:SetString("SYSTEM_ConfirmBox_Function", "PetMix.StartMix(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..major_pet_guid..","..minor_pet_guid..",'"..juju_keyname.."',"..(is_juju_bind or 2) ..",1)")
				sLuaApp:ShowForm(player, "脚本表单", str)
				return
			else
				if not major_pet_is_bind then
					need_set_pet_bind = true
				end
			end
		end
	end
	
	--退回宠物装备
	if not PetSystem.ReturnPetEquip(player, {major_pet, minor_pet}) then return end 
	
	if need_set_pet_bind then
		sPetSystem:BindPet(major_pet, true)
	end
	if sPetSystem:SetLevel(major_pet, 1) ~= 0 then
		sLuaApp:LuaErr("PetMix.StartMix SetLevel 错误")
		return
	end
	--去掉所有属性点
	major_pet:ClearPoint()
	if not major_pet:SetRemainPoint(0, "system", "宠物合成", "合成后清除属性点") then
		sLuaApp:LuaErr("PetMix.StartMix SetRemainPoint 错误")
		return
	end
	
	-- if not major_pet:SubExp(major_pet:GetExp(), "system", "宠物合成", "合成后重置等级") then
		-- sLuaApp:LuaErr("major_pet:SubExp 失败")
		-- return
	-- end
	
	--消耗物品
	if juju_keyname ~= "-1" then
		-- local juju = sItemSystem:GetItemByGUID(juju_guid)
		-- if sItemSystem:ConsumeItem(juju, 1, "system", "宠物合成", "合成消耗") ~= 0 then
			-- sLuaApp:LuaErr("PetMix.StartMix   ConsumeItem 错误")
			-- return
		-- end
		local juju_id = sItemSystem:GetItemIdByKeyname(juju_keyname)
		if sItemSystem:ConsumeItemWithId(player, juju_id, 1, tonumber(is_juju_bind), "system", "宠物合成", "合成消耗") ~= 0 then
			sLuaApp:LuaErr("PetMix.StartMix   ConsumeItemWithId 错误")
			return
		end
	end

	local major_skill_con = major_pet:GetSkillContainer()
	local minor_skill_con = minor_pet:GetSkillContainer()
	local major_has_skill_tb = PetMix.GetSkillTb(major_pet)
	local all_skill_num = #major_has_skill_tb
	local minor_has_skill_tb = PetMix.GetSkillTb(minor_pet)
	local minor_bind_skill_id_tb = {}
	for _,v in ipairs(minor_has_skill_tb) do
		if not v:IsBind() then
			table.insert(minor_bind_skill_id_tb, v:GetId())
		end
	end
	
	if sPetSystem:DestroyPet(minor_pet, "system", "宠物合成", "宠物合成消耗副宠") ~= 0 then
		sLuaApp:LuaErr("PetMix.StartMix DestroyPet 错误")
		return
	end

	local has_skill_id_tb = {} --已有技能无需创建
	--保留技能
	for _,v in ipairs(major_has_skill_tb) do
		if v:IsBind() then
			has_skill_id_tb[v:GetId()] = true
		else
			local rand = sLuaApp:RandInteger(1,100)
			if rand > save_probability then -- 未保留技能
				sLogServerSystem:LogPetToServer(0, player, major_pet, "宠物合成未保留技能", v:GetId(), 0, "宠物合成删除未保留技能", "")
				major_skill_con:DestroySkill(v,true)
				all_skill_num = all_skill_num - 1
			else
				has_skill_id_tb[v:GetId()] = true
			end
		end
	end
	for _,v in ipairs(minor_bind_skill_id_tb) do
		if PetMix.MaxSkillNum > 0 then
			if all_skill_num >= PetMix.MaxSkillNum then
				--sLuaApp:LuaErr(all_skill_num)
				break
			end
		end
		local rand = sLuaApp:RandInteger(1,100)
		if rand <= save_probability and not has_skill_id_tb[v] then
			local new_skill = major_skill_con:CreateSkill(v, 1,1,true)
			sLogServerSystem:LogPetToServer(0, player, major_pet, "宠物合成获得技能", 0, v, "宠物合成获得技能", "")
			all_skill_num = all_skill_num + 1
		end
	end
	
	sLuaApp:NotifyTipsMsg(player, "合成成功！")
	--成就
	if Achievement then
		Achievement.Achievement_Pet_Other(player)
	end
	--通知刷新
	local str = [[
		if PetUI then
			PetUI.RefreshOnSynthesis()
		end
	]]
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetMix.GetSkillTb(pet)
	local res_skill_tb = {}
	local skill_tb = pet:GetSkillContainer():GetSkills()
	
	local star_skill = {}
	if PetUpStarConfig.StarSkill then
		local pet_keyname = pet:GetKeyName()
		if PetUpStarConfig.StarSkill[pet_keyname] then
			for _,v in pairs(PetUpStarConfig.StarSkill[pet_keyname]) do
				star_skill[v] = true
			end
		end
	end
	
	local except_skill = PetDevelopConfig.SkillStudyExceptEx or {}
	local rein_skill = MountsConfig.SkillConfig or {}
	for _,v in ipairs(skill_tb) do
		local skill_keyname = SkillConfig.GetById(v:GetId()).KeyName
		if not (star_skill[skill_keyname] or except_skill[v:GetId()] or rein_skill[v:GetId()]) then
			table.insert(res_skill_tb, v)
			-- sLuaApp:LuaErr(pet:GetKeyName() .. "res_skill_tb  "..skill_keyname)
		-- else
			-- sLuaApp:LuaErr(pet:GetKeyName() .. "except_skill  "..skill_keyname)
		end
	end
	return res_skill_tb
end

function PetMix.CheckPet(player, pet_guid)
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetMix 不存在宠物 ")
		return false
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetMix "..pet:GetGUID().." 不属于 "..player:GetName())
		return false
	end
	return pet
end

--测试用 @newinter PetMix.b(player, probability)
function PetMix.b(player, probability)
	player:SetInt("PetMix_TestProbability", tonumber(probability))
	sLuaApp:NotifyTipsMsg(player, "设置测试幸运为".. probability)
end
--测试用 @newinter PetMix.e(player)
function PetMix.e(player)
	player:SetInt("PetMix_TestProbability", 0)
	sLuaApp:NotifyTipsMsg(player, "取消测试幸运")
end

function PetMix.Initialization()
	PetMix.MajorPetTypeEx = {}
	for _,v in ipairs(PetMix.MajorPetType) do
		PetMix.MajorPetTypeEx[v] = true
	end
	
	PetMix.MinorPetTypeEx = {}
	for _,v in ipairs(PetMix.MinorPetType) do
		PetMix.MinorPetTypeEx[v] = true
	end
	
	PetMix.LuckyJuJuEx = {}
	PetMix.LuckyJuJuShow = {}
	for _,v in ipairs(PetMix.LuckyJuJu) do
		PetMix.LuckyJuJuEx[v["ItemKeyName"]] = v["Probability"]
		table.insert(PetMix.LuckyJuJuShow, {v["ItemKeyName"], v["Show"]})
	end
	
	PetMix.GetDataTb = {}
	PetMix.GetDataTb["MajorPetType"] = PetMix.MajorPetTypeEx
	PetMix.GetDataTb["MajorPetLevel"] = PetMix.MajorPetLevel
	PetMix.GetDataTb["MinorPetType"] = PetMix.MinorPetTypeEx
	PetMix.GetDataTb["MinorPetLevel"] = PetMix.MinorPetLevel
	PetMix.GetDataTb["Tips"] = PetMix.Tips
	PetMix.GetDataTb["LuckyJuJu"] = PetMix.LuckyJuJuShow
	PetMix.GetDataTbStr = Lua_tools.serialize(PetMix.GetDataTb)
end
PetMix.Initialization()