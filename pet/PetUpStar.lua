--宠物升星
PetUpStar = {}
-- X星升到Y星需要 X个同Type宠物

function PetUpStar.GetData(player)
	local str = [[
		if PetUI then
			PetUI.PetUpStarIntConfig = ]]..Lua_tools.serialize(PetUpStarConfig.IntConfig)..[[
			PetUI.PetUpStarConsume = ]]..Lua_tools.serialize(PetUpStarConfig.Consume)..[[
			PetUI.Refresh() 
		end
	]]
	--sLuaApp:LuaErr("PetUpStar.GetData "..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetUpStar.GetPetData(player, pet_guid)
	if not pet_guid then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then return end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetUpStar "..pet_guid.." 不属于 "..player:GetName())
		return 
	end
	local pet_keyname = pet:GetKeyName()
	local pet_data = PetConfig.GetByKeyName(pet_keyname)
	if not pet_data then
		sLuaApp:LuaErr("PetUpStar pet_data 缺少"..pet_keyname)
		return
	end
	local pet_Type = pet_data.Type
	local pet_star_level = pet:GetInt("PetStarLevel")
	if pet_star_level == 0 then
		sLuaApp:LuaErr("PetUpStar pet_star_level == 0 pet_guid"..pet_guid)
		return
	end
	--sLuaApp:LuaErr("pet_Type"..pet_Type.. " pet_star_level"..pet_star_level)
	local attr_tb = PetUpStarConfig.Attr["Type_"..pet_Type]["Star_"..pet_star_level] or {}
	local consume_tb = PetUpStarConfig.Consume["Type_"..pet_Type]["Star_"..pet_star_level] or {}
	local str = [[
		if PetUI then
			PetUI.PetStarSkill["]]..pet_keyname..[["] = ]]..Lua_tools.serialize(PetUpStarConfig.StarSkill[pet_keyname] or {})..[[
			PetUI.PetStarAttr["]]..pet_guid..[["] =  ]]..Lua_tools.serialize(attr_tb)..[[
			PetUI.RefreshBreachPanel()
		end
	]]
	--Consume["Type_]]..pet_Type..[["]["Star_]]..pet_star_level..[["] = ]]..Lua_tools.serialize(consume_tb)..[[
	--sLuaApp:LuaErr("PetUpStar.GetPetData "..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetUpStar.Breach(player, pet_guid, consume_pet_tb_str, check_mod)
	--判断 pet
	if not pet_guid or not consume_pet_tb_str then return end
	local pet = sPetSystem:GetPetByGUID(pet_guid)
	if not pet then
		sLuaApp:LuaErr("PetUpStar.Breach 不存在宠物 "..pet_guid)
		return 
	end
	if pet:GetOwner() ~= player then 
		sLuaApp:LuaErr("PetUpStar "..pet_guid.." 不属于 "..player:GetName())
		return 
	end

	local pet_star_level = pet:GetInt("PetStarLevel")
	local consume_pet_tb =  sLuaApp:StrSplit(consume_pet_tb_str, ",")
	if #consume_pet_tb ~= pet_star_level then
		sLuaApp:LuaErr("PetUpStar pet_star_level "..pet_star_level.." #consume_pet_tb "..#consume_pet_tb)
		return
	end
	local pet_keyname = pet:GetKeyName()
	local pet_data = PetConfig.GetByKeyName(pet_keyname)
	if not pet_data then
		sLuaApp:LuaErr("PetUpStar pet_data 缺少"..pet_keyname)
		return
	end
	local pet_Type = pet_data.Type
	
	--新加设置宠物绑定 2022-05-07 10:26:15
	local is_bind = pet:IsBind()
	local need_set_bind = false
	
	
	local select_pet_tb = {}
	for _,v in ipairs(consume_pet_tb) do
		local consume_pet = sPetSystem:GetPetByGUID(v)
		if not consume_pet then 
			sLuaApp:LuaErr("PetUpStar.Breach 不存在宠物consume_pet "..v)
			return
		end
		if consume_pet:GetOwner() ~= player then 
			sLuaApp:LuaErr("PetUpStar "..v.." 不属于 "..player:GetName())
			return 
		end
		local consume_pet_star_level = consume_pet:GetInt("PetStarLevel")
		if consume_pet_star_level ~= pet_star_level then
			sLuaApp:NotifyTipsMsg(player, "宠物"..consume_pet:GetName().."不是"..pet_star_level.."星，无法作为升星消耗。")
			return
		end
		local consume_pet_keyname = consume_pet:GetKeyName()
		local consume_pet_data = PetConfig.GetByKeyName(consume_pet_keyname)
		if not consume_pet_data then
			sLuaApp:LuaErr("PetUpStar consume_pet_data 缺少"..consume_pet_keyname)
			return
		end
		if consume_pet_data.Type ~= pet_Type then
			sLuaApp:NotifyTipsMsg(player, "宠物"..consume_pet:GetName().."品阶不符，无法作为升星消耗。")
			return 
		end
		--判断锁定
		if consume_pet:IsLocked() then
			sLuaApp:NotifyTipsMsg(player, "宠物"..consume_pet:GetName().."已锁定，无法作为升星消耗！")
			return
		end
		--判断上阵
		if consume_pet:IsLineup() then
			sLuaApp:NotifyTipsMsg(player, "宠物"..consume_pet:GetName().."已上阵，无法作为升星消耗！")
			return
		end
		
		if PetUpStarConfig.SetBind and (PetUpStarConfig.SetBind == 1 or (PetUpStarConfig.SetBind == 2 and PetUpStarConfig.SetBindPetEx[pet_keyname])) then
			if not is_bind and consume_pet:IsBind() and not need_set_bind then
				if check_mod and check_mod == 1 then
					need_set_bind = true
				else
					local msg = "由于突破消耗的宠物"..PetDevelop.GetColor(consume_pet:GetName(),"Red").."绑定，突破后宠物"..PetDevelop.GetColor(pet:GetName(),"Red").."也将绑定，是否确认突破？"
					local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "PetUpStar.Breach(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..pet_guid..",'"..consume_pet_tb_str.."',1)")
					sLuaApp:ShowForm(player, "脚本表单", str)
					return
				end
			end
		end
		
		table.insert(select_pet_tb, consume_pet)
	end
	
	--判断消耗
	local consume_tb = PetUpStarConfig.Consume["Type_"..pet_Type]["Star_"..pet_star_level]
	local consume_money_type = consume_tb["MoneyType"]
	local consume_money_val = consume_tb["MoneyVal"]
	if consume_money_type and consume_money_val then
		if not Lua_tools.IsMoneyEnough(player, consume_money_type, consume_money_val) then
			if MoneyChange then
				local f_name = [[PetUpStar.Breach(player, ]]..pet_guid..[[, "]]..consume_pet_tb_str..[[")]]
				MoneyChange.LackMoney(player, consume_money_type, consume_money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足！")
			end
			return
		end
	end
	
	--退回宠物装备
	if not PetSystem.ReturnPetEquip(player, select_pet_tb) then return end 
	
	--扣除消耗
	if consume_money_type and consume_money_val then
		if not Lua_tools.SubMoney(player, consume_money_type, consume_money_val, "system", "宠物突破", "突破消耗") then
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足")
			return
		end
	end

	for _,v in ipairs(select_pet_tb) do
		if sPetSystem:DestroyPet(v,"system","宠物突破","突破消耗") ~= 0 then
			sLuaApp:LuaErr("PetUpStar DestroyPet 错误")
			return
		end
	end
	
	--升星
	local next_pet_star_level = pet_star_level+1 
	if PetUpStar.SetStarLevel(pet, next_pet_star_level, true) then
		sLuaApp:NotifyTipsMsg(player, "您的宠物"..pet:GetName().."突破至"..next_pet_star_level.."星")
	end
	
	--设置绑定
	if need_set_bind then
		if sPetSystem:BindPet(pet, true) ~= 0 then
			sLuaApp:LuaErr("PetUpStar.Breach BindPet 错误")
			return
		end
	end
	
	--成就相关
	if Achievement then
		Achievement.Achievement_Pet_Breach(player, next_pet_star_level, pet_guid)
	end
	
	local attr_tb = PetUpStarConfig.Attr["Type_"..pet_Type]["Star_"..pet_star_level] or {}
	local str = [[
		if PetUI then
			PetUI.PetStarAttr["]]..pet_guid..[["] =  ]]..Lua_tools.serialize(attr_tb)..[[
			PetUI.OnBreachSuccessRefresh()
		end
	]]
	-- sLuaApp:LuaErr("PetUpStar.Breach "..str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- 升到 star_level 星
function PetUpStar.SetStarLevel(pet, star_level, is_notify_tips)
	--local pet = sPetSystem:GetLineupPet(player)
	local pet_star_level = pet:GetInt("PetStarLevel")
	if pet_star_level >= star_level then
		sLuaApp:LuaErr("PetUpStar.SetStarLevel pet "..pet:GetGUID().." 已达"..star_level.."星")
		return false
	end
	local pet_keyname = pet:GetKeyName()
	local pet_data = PetConfig.GetByKeyName(pet_keyname)
	if not pet_data then
		sLuaApp:LuaErr("PetUpStar SetStarLevel  pet_data 缺少"..pet_keyname)
		return false
	end
	local pet_Type = pet_data.Type
	
	local mark = PetAttrClassify['PetStar'] or 40
	local has_attr = pet:GetDynAttrsByMark(mark)
	local attr_list = {}
	for k,v in ipairs(has_attr) do
		attr_list[v["attr"]] = v["value"]
	end
	
	local int_list = {}
	if PetUpStarConfig.IntConfig then
		for _,v in ipairs(PetUpStarConfig.IntConfig) do
			int_list[v[1]] = pet:GetInt(v[1])
		end
	end
	--sLuaApp:LuaErr("int_list "..Lua_tools.serialize(int_list))
	local star_skill_config = PetUpStarConfig.StarSkill[pet_keyname] or {}
	local fight_val_pct = 10000
	for i = pet_star_level, star_level-1 do
		-- +属性
		local attr_config = PetUpStarConfig.Attr["Type_"..pet_Type]["Star_"..i]
		if attr_config then
			for _,v in ipairs(attr_config) do
				if v["AttrName"] then
					local attr_data = AttrConfig.GetByKeyName(v["AttrName"])
					if not attr_data then
						sLuaApp:LuaErr("PetUpStar.SetStarLevel AttrConfig 缺少"..v["AttrName"])
						return false
					end
					local attr_id = attr_data.Id
					if not attr_list[attr_id] then
						attr_list[attr_id] = 0
					end
					local has_attr_value = pet:GetAttr(attr_id)
					if v["Ratio"] and v["Ratio"] ~= 0 then
						attr_list[attr_id] = math.ceil((attr_list[attr_id] + has_attr_value) * (1 + v["Ratio"]/100) - has_attr_value)
					elseif v["Value"] and v["Value"] ~= 0 then
						attr_list[attr_id] = math.ceil(attr_list[attr_id] + v["Value"])
					end
				elseif v["IntKey"] then
					if v["Ratio"] and v["Ratio"] ~= 0 then
						int_list[v["IntKey"]] = math.ceil((int_list[v["IntKey"]] * (10000 + v["Ratio"]*100))/10000) --为了精度
					elseif v["Value"] and v["Value"] ~= 0 then
						int_list[v["IntKey"]] = math.ceil(int_list[v["IntKey"]] + v["Value"])
					end
				else
					sLuaApp:LuaErr("PetUpStarConfig.Attr[Type_"..pet_Type.."][Star_"..i.."]  配置错误")
					return false
				end
			end
		else
			sLuaApp:LuaErr("PetUpStarConfig.Attr 缺少 Type_"..pet_Type.."  Star_"..i)
		end
		
		if attr_config["FightValuePct"] then
			fight_val_pct = attr_config["FightValuePct"]
		end

		-- +技能
		local skill_keyname = star_skill_config["Star_"..i] 
		if skill_keyname then
			local skill_data = SkillConfig.GetByKeyName(skill_keyname)
			if not skill_data then
				sLuaApp:LuaErr("PetUpStar SkillConfig 缺少"..skill_keyname)
				return false
			end
			local skill_container = pet:GetSkillContainer()
			local skill_id = skill_data.Id
			local new_skill = skill_container:CreateSkill(skill_id, 1, 1, true)
			if new_skill then
				new_skill:SetBind(true)
				pet:SetInt("PetUpStar_Skill_"..i, skill_id)
				if is_notify_tips then
					local player = pet:GetOwner()
					sLuaApp:NotifyTipsMsg(player, "您的宠物"..pet:GetName().."在突破时领悟了技能"..skill_data.Name)
				end
			else
				sLuaApp:LuaErr("PetUpStar  CreateSkill错误 skill_keyname"..skill_keyname)
			end
		end
	end
	
	pet:SetInt("PetStarLevel", star_level)
	local owner = pet:GetOwner()
	if owner then
		sLogServerSystem:LogPetToServer(0, owner, pet, "宠物星级", pet_star_level, star_level, "宠物升星", "")
	end
	
	pet:SetDynAttrsByMark(mark, 0)
	for k,v in pairs(attr_list) do
		pet:SetDynAttr(mark, k, v)
		--sLuaApp:LuaErr(k.." + "..v)
	end
	for k,v in pairs(int_list) do
		pet:SetInt(k,v)
		--sLuaApp:LuaErr(k.." + "..v)
	end
	
	-- +战力万分比
	local now_fight_val_pct = pet:GetFightValuePct()
	fight_val_pct = fight_val_pct - now_fight_val_pct
	if fight_val_pct > 0 then
		--sLuaApp:LuaErr("fight_val_pct"..fight_val_pct)
		if not pet:AddFightValuePct(fight_val_pct, "system", "宠物升星", "升星增加") then
			sLuaApp:LuaErr("PetUpStar AddFightValuePct 失败")
		end
	else
		if not pet:SubFightValuePct(math.abs(fight_val_pct), "system", "宠物升星", "升星扣除") then
			sLuaApp:LuaErr("PetUpStar SubFightValuePct 失败")
		end
		sLuaApp:LuaErr("PetUpStar "..pet:GetKeyName().." 升星时 战力万分比配置 减少")
	end
	pet:RecalcAttr()
	
	return true
end

function PetUpStar.smtp(player)
	local pet = sPetSystem:GetLineupPet(player)
	local pet_star_level = pet:GetInt("PetStarLevel")
	local has_attr = pet:GetDynAttrsByMark(40)
	
	
	sLuaApp:LuaErr("Name  "..pet:GetName())
	sLuaApp:LuaErr("pet_star_level "..pet_star_level)

	sLuaApp:LuaErr("has_attr "..Lua_tools.serialize(has_attr))
	
	for k,v in pairs(PetUpStarConfig.IntConfig) do
		sLuaApp:LuaErr(v[2].." = " ..pet:GetInt(v[1]))
	end
end
