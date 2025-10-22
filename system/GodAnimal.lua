--神兽图鉴系统
GodAnimal = {}

--打开界面传数据
function GodAnimal.GetData(player)
	if not GodAnimalConfig or not GodAnimalConfig.Main then return end
	local send_tb = {}
	send_tb["SystemTips"] = GodAnimalConfig.SystemTips or "暂无简介"
	--send_tb["OverallScore"] = 0
	send_tb["Animal"] = {}
	for k,v in pairs(GodAnimalConfig.Main) do
		send_tb["Animal"][k] = {}
		send_tb["Animal"][k]["Index"] = v["Index"]
		send_tb["Animal"][k]["Grade"] = v["Grade"]
		send_tb["Animal"][k]["Icon"] = v["Icon"]
		--local item_id = ItemConfig.GetByKeyName(v["UpItem"]).Id
		--local has_item_num = sItemSystem:GetItemAmount(player, item_id, 3) + player:GetInt("GodAnimalItem_"..item_id)
		send_tb["Animal"][k]["NeedItemKeyName"] = v["UpItem"]
		local level = player:GetInt("GodAnimalLevel_"..k)
		send_tb["Animal"][k]["Level"] = level
		if GodAnimalConfig.Main[k]["Level_"..level + 1] then
			send_tb["Animal"][k]["NeedItemNum"] = GodAnimalConfig.Main[k]["Level_"..level + 1]["UpItemNum"]
		else
			send_tb["Animal"][k]["NeedItemNum"] = -1
		end
		-- if level > 0 then
			-- send_tb["OverallScore"] = send_tb["OverallScore"] + GodAnimalConfig.Main[k]["Level_"..level]["Score"]
		-- end
		send_tb["Animal"][k]["MaxLevel"] = v["MaxLevel"]
	end
	
	if not PlayerAttrClassify['GodAnimalBuff'] then
		sLuaApp:LuaErr("缺少PlayerAttrClassify[GodAnimalBuff]")
		return
	end
	send_tb["Attr"] = player:GetDynAttrsByMark(PlayerAttrClassify['GodAnimalBuff'])
	
	--sLuaApp:LuaErr("send_tb"..Lua_tools.serialize(send_tb))
	local str = [[
		if MythicalAnimalsUI then
			MythicalAnimalsUI.ServerData = ]]..Lua_tools.serialize(send_tb)..[[
			MythicalAnimalsUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player,"脚本表单", str)
	
end

--传单个的详情页
function GodAnimal.GetDetails(player, animal_name, is_levelup)
	if not GodAnimalConfig or not GodAnimalConfig.Main or not GodAnimalConfig.Main[animal_name] then
		sLuaApp:LuaErr("GodAnimalConfig.Main配置缺少"..animal_name)
		return 
	end
	local details_tb = {}
	details_tb["Model"] = GodAnimalConfig.Main[animal_name]["Model"]
	details_tb["Tips"] = GodAnimalConfig.Main[animal_name]["Tips"]
	--details_tb["Level"] = 0
	details_tb["Score"] = 0
	details_tb["NowBuff"] = {}
	--details_tb["NextBuff"]= {}
	details_tb["NowSkill"] = ""
	--details_tb["NextSkill"] = ""
	local level = player:GetInt("GodAnimalLevel_"..animal_name)
	if level == 0 then
		if GodAnimalConfig.Main[animal_name]["Level_1"]["AddBuff"] then
			details_tb["NextBuff"] = GodAnimalConfig.Main[animal_name]["Level_1"]["AddBuff"]
		end
		if GodAnimalConfig.Main[animal_name]["Level_1"]["AddSkill"] then
			details_tb["NextSkill"] = GodAnimalConfig.Main[animal_name]["Level_1"]["AddSkill"]
		end
	else
		local level_config = GodAnimalConfig.Main[animal_name]["Level_"..level]
		--details_tb["Level"] = level
		details_tb["Score"] = level_config["Score"]
		details_tb["NowBuff"] = level_config["AddBuff"]
		local next_level_config = GodAnimalConfig.Main[animal_name]["Level_"..level+1]
		if next_level_config then
			details_tb["NextBuff"] = next_level_config["AddBuff"]
		end
		if level_config["AddSkill"] then
			details_tb["NowSkill"] = level_config["AddSkill"]
		end
		if next_level_config and next_level_config["AddSkill"] then
			details_tb["NextSkill"] = next_level_config["AddSkill"] 
		end
	end
	--sLuaApp:LuaErr("details_tb"..Lua_tools.serialize(details_tb))
	local str = [[
		if MythicalAnimalsUI then
			if MythicalAnimalsUI.Details["]]..animal_name..[["] then
				MythicalAnimalsUI.Details["]]..animal_name..[["][]]..level..[[] = ]]..Lua_tools.serialize(details_tb)..[[
			end
		end
	]]
	if not is_levelup or is_levelup == 0 then
		str = str ..[[
			GUI.OpenWnd("MythicalAnimalsLvUpUI","]]..animal_name..[[")
		]]
	end
	sLuaApp:ShowForm(player,"脚本表单", str)
end



function GodAnimal.GetLevelUpShow(player, animal_name, now_level, next_level)
	local show_tb = {}
	show_tb["NowLevel"] = now_level
	show_tb["NextLevel"] = next_level
	show_tb["MaxLevel"] = GodAnimalConfig.Main[animal_name]["MaxLevel"]
	
	---客户端要求发的
	show_tb["NextMaxLevel"] = GodAnimalConfig.Main[animal_name]["MaxLevel"]
	show_tb["NowItem"] = GodAnimalConfig.Main[animal_name]["UpItem"]
	show_tb["NextItem"] = GodAnimalConfig.Main[animal_name]["UpItem"]
	
	show_tb["NowBuff"] = {}
	show_tb["NowSkill"] = ""
	if now_level > 0 then
		local level_config = GodAnimalConfig.Main[animal_name]["Level_"..now_level]
		show_tb["NowBuff"] = level_config["AddBuff"]
		if level_config["AddSkill"] then
			show_tb["NowSkill"] = level_config["AddSkill"]
		end
	end
	
	show_tb["NextBuff"] = {}
	show_tb["NextSkill"] = ""
	local next_level_config = GodAnimalConfig.Main[animal_name]["Level_"..next_level]
	show_tb["NextBuff"] = next_level_config["AddBuff"]
	if next_level_config["AddSkill"] then
		show_tb["NextSkill"] = next_level_config["AddSkill"]
	end
	
	local str = [[
		GUI.OpenWnd("LevelUpSuccessUI")
		if LevelUpSuccessUI then
			LevelUpSuccessUI.ServerData= ]]..Lua_tools.serialize(show_tb)..[[
		end	
	]]
	--sLuaApp:LuaErr("show_tb"..str)
	sLuaApp:ShowForm(player,"脚本表单", str)
end


--设置自动升级
function GodAnimal.SetAutoLevelUp(player, is_auto)
	is_auto = tonumber(is_auto)
	player:SetInt("GodAnimalAutoLevelUp", is_auto)
	if is_auto == 1 then
		sLuaApp:NotifyTipsMsg(player, "设置神兽自动升级成功!")
	elseif is_auto == 0 then
		sLuaApp:NotifyTipsMsg(player, "已取消神兽自动升级!")	
	end
end

--升级
function GodAnimal.LevelUp(player, animal_name, is_auto)
	if not GodAnimalConfig or not GodAnimalConfig.Main or not GodAnimalConfig.Main[animal_name] then
		sLuaApp:LuaErr("GodAnimalConfig.Main配置缺少"..animal_name)
		return 
	end
	local need_item_data = ItemConfig.GetByKeyName(GodAnimalConfig.Main[animal_name]["UpItem"])
	if not need_item_data then
		sLuaApp:LuaErr("GodAnimal.LevelUp 缺少need_item_keyname")
	end
	local need_item_id = need_item_data.Id
	
	local level = player:GetInt("GodAnimalLevel_"..animal_name)
	local next_level = level + 1
	local up_item_num = 0
	 --next_level_config = {}
	local next_level_config = GodAnimalConfig.Main[animal_name]["Level_"..next_level]
	--sLuaApp:LuaErr("next_level_config"..Lua_tools.serialize(next_level_config))
	if not next_level_config then
		--if not is_auto then 
			sLuaApp:NotifyTipsMsg(player, "该神兽已达到最高星，无法升星")
		--end
		return
	end
	
	up_item_num = next_level_config["UpItemNum"]
	if up_item_num == 0 then return end
	--local item_debris = sItemSystem:GetItemAmount(player, need_item_id, 3)
	local item_point = player:GetInt("GodAnimalItem_"..need_item_id)
	if item_point < up_item_num then
		local lack_num = up_item_num - item_point
		if not is_auto and OneKeyBuy then
			OneKeyBuy.Main(player,{GodAnimalConfig.Main[animal_name]["UpItem"], lack_num})
			-- local grade = GodAnimalConfig.Main[animal_name]["Grade"]
			-- if GodAnimalConfig.Grade and GodAnimalConfig.Grade["Grade_"..grade-1]["QuickBuy"] then
				-- OneKeyBuy.Main(player,{GodAnimalConfig.Grade["Grade_"..grade]["QuickBuy"], lack_num})
			-- else
				-- sLuaApp:LuaErr("GodAnimalConfig.Grade 配置缺少 QuickBuy")
			-- end
			sLuaApp:NotifyTipsMsg(player, "缺少"..lack_num.."点"..need_item_data.Name.."点数")
		end
		return
	end
	-- if item_point < up_item_num then
		-- player:SetInt("GodAnimalItem_"..need_item_id, 0)
		-- sItemSystem:ConsumeItemWithPriority(player, need_item_id, up_item_num - item_point, true, "system", "神兽图鉴","升星消耗")
	-- else
		-- player:SetInt("GodAnimalItem_"..need_item_id, item_point - up_item_num)
	-- end
	player:SetInt("GodAnimalItem_"..need_item_id, item_point - up_item_num)
	
	local level_config = {}
	if level ~= 0 then
		level_config = GodAnimalConfig.Main[animal_name]["Level_"..level]
	end
	if not next_level_config["AddBuff"] then
		sLuaApp:LuaErr("GodAnimalConfig.Main"..animal_name.."缺少 AddBuff")
	end
	if not PlayerAttrClassify['GodAnimalBuff'] then
		sLuaApp:LuaErr("缺少PlayerAttrClassify[GodAnimalBuff]")
		return
	end
	if next(next_level_config["AddBuff"]) then
		for _,v in ipairs(next_level_config["AddBuff"]) do
			local attr_data = AttrConfig.GetByKeyName(v['AttrName'])
			if type(v['AttrName']) == "string" and type(v['AttrVal']) == "number" and attr_data then
				local val = v['AttrVal']
				if next(level_config) and next(level_config["AddBuff"]) then
					for _,b in ipairs(level_config["AddBuff"]) do
						if b['AttrName'] ==  v['AttrName'] then
							val = val + player:GetDynAttr(PlayerAttrClassify['GodAnimalBuff'], attr_data.Id) - b['AttrVal']
						end
					end
				end
				player:SetDynAttr(PlayerAttrClassify['GodAnimalBuff'], attr_data.Id, val)
			else
				sLuaApp:LuaDbg("GodAnimalConfig.Main AddBuff配置错误")
			end
		end
	end
	if next_level_config["AddSkill"] and next_level_config["AddSkill"] ~= "" then
		local skill_container = player:GetSkillContainer()
		if level_config["AddSkill"] and level_config["AddSkill"] ~= "" then
			local old_skill_data = SkillConfig.GetByKeyName(level_config["AddSkill"])
			if not old_skill_data then
				sLuaApp:LuaErr("GodAnimal.LevelUp不存在技能"..level_config["AddSkill"])
				return
			end
			local skill = skill_container:GetSkill(old_skill_data.Id)
			if skill then
				skill_container:DestroySkill(skill, true)
			end
		end
		local skill_data = SkillConfig.GetByKeyName(next_level_config["AddSkill"])
		if not skill_data then
			sLuaApp:LuaErr("GodAnimal.LevelUp不存在技能"..next_level_config["AddSkill"])
			return
		end
		skill_container:CreateSkill(skill_data.Id, next_level, next_level, true)
	end

	local overall_score = player:GetInt("GodAnimalOverallScore") + next_level_config["Score"]
	if next(level_config) and next(level_config) then
		overall_score = overall_score - level_config["Score"]
	end
	player:SetInt("GodAnimalOverallScore", overall_score)
	--sLuaApp:NotifyTipsMsg(player, "升星成功！")
	player:SetInt("GodAnimalLevel_"..animal_name, next_level)
	
	GodAnimal.GetDetails(player, animal_name, 1)
	
	-- local refresh_tb = {}
	-- refresh_tb["Animal"] = {}
	-- refresh_tb["Animal"][animal_name] = {}
	-- refresh_tb["Animal"][animal_name]["Level"] = next_level
	local need_item_num = -1
	if GodAnimalConfig.Main[animal_name]["Level_"..next_level + 1] then
		need_item_num = GodAnimalConfig.Main[animal_name]["Level_"..next_level + 1]["UpItemNum"]
	end
	if not PlayerAttrClassify['GodAnimalBuff'] then
		sLuaApp:LuaErr("缺少PlayerAttrClassify[GodAnimalBuff]")
		return
	end
	--refresh_tb["Attr"] = player:GetDynAttrsByMark(PlayerAttrClassify['GodAnimalBuff'])
	local str = [[
		if MythicalAnimalsUI then
			MythicalAnimalsUI.ServerData["Animal"]["]]..animal_name..[["]["Level"] = ]]..next_level..[[
			MythicalAnimalsUI.ServerData["Animal"]["]]..animal_name..[["]["NeedItemNum"] = ]]..need_item_num..[[
			MythicalAnimalsUI.ServerData["Attr"] = ]]..Lua_tools.serialize(player:GetDynAttrsByMark(PlayerAttrClassify['GodAnimalBuff']))..[[
			MythicalAnimalsUI.Refresh()
		end
	]]
	
	--sLuaApp:LuaErr("refresh_tb"..str)
	sLuaApp:ShowForm(player,"脚本表单", str)
	--if player:GetInt("GodAnimalAutoLevelUp") == 0 then
		
	if not is_auto then
		GodAnimal.GetLevelUpShow(player, animal_name, level, next_level)
		--end
	end
end

