--装备转换
EquipChange = {}

--未绑定的物品转换后是否转为绑定
EquipChange.ChangeBind = 1

EquipChange.Config = {
	["Weapon"] = {
		["ShowName"] = "武器",
		["Requirement"] = {--基本条件 -item表中所有条件相同的物品之间可相互转换
			--武器
			["Type"] = 1,
			["Subtype"] = 1,
			["Level"] = {1, 120}, -- {最小值，最大值} --不同值会分为不同的转换表
			["Grade"] = {1, 5}
		},
		--字段相同时，无法转换
		["RestrictSame"] = {"Subtype2"}, --武器转换 同种武器不可转换
		--转换前黑名单
		["PreBlacklist"] = {
			-- 逐个判断 满足条件不会进入转换表
			["Script"] = {"GuangZhuang"},
			["KeyName"] = {
				"谪剑仙的神器","谪剑仙的圣器",
				"烟云客的神器","烟云客的圣器",
				"冥河使的神器","冥河使的圣器",
				"神霄卫的神器","神霄卫的圣器",
				"雨师君的神器","雨师君的圣器",
				"傲红莲的神器","傲红莲的圣器",
				"阎魔令的神器","阎魔令的圣器",
				"青丘狐的神器","青丘狐的圣器",
				"海鲛灵的神器","海鲛灵的圣器",
				"飞翼姬的神器","飞翼姬的圣器",
				"花弄影的神器","花弄影的圣器",
				"凤凰仙的神器","凤凰仙的圣器",
			},
		},
		--转换后黑名单
		["AfterBlacklist"] = {
			-- 逐个判断 满足条件不会进入转换表
			["BindType"] = {2}, 
			["KeyName"] = {
				"谪剑仙的神器","谪剑仙的圣器",
				"烟云客的神器","烟云客的圣器",
				"冥河使的神器","冥河使的圣器",
				"神霄卫的神器","神霄卫的圣器",
				"雨师君的神器","雨师君的圣器",
				"傲红莲的神器","傲红莲的圣器",
				"阎魔令的神器","阎魔令的圣器",
				"青丘狐的神器","青丘狐的圣器",
				"海鲛灵的神器","海鲛灵的圣器",
				"飞翼姬的神器","飞翼姬的圣器",
				"花弄影的神器","花弄影的圣器",
				"凤凰仙的神器","凤凰仙的圣器",
			},
		},

		
		["Consume"] = {
			["Base"] = {"三味炼炉", 2},--基础消耗
			["CheckRole"] = {"三味炼炉", 1},--转换后的物品的使用角色 是已使用过的角色
		},
	},
}

EquipChange.Tips = [[1.<color=#ff133f>同等级</color>、<color=#ff133f>同品质</color>的武器间可以任意转换，不改变武器的属性。\n]]
EquipChange.Tips = EquipChange.Tips..[[2.无论转换前的武器是否为绑定，转换后的武器均会<color=#ff133f>绑定</color>，无法买卖交易。\n]]
EquipChange.Tips = EquipChange.Tips..[[3.每次成功转换角色，会获得1次免费转换武器的机会。此次数<color=#ff133f>不累加</color>，每次转换角色时重置。\n]]
EquipChange.Tips = EquipChange.Tips..[[4.转换武器时，优先消耗免费转换次数，次数为0时，才消耗道具。\n]]
EquipChange.Tips = EquipChange.Tips..[[5.若转换后的武器可使用的角色是玩家曾用过的角色，消耗的道具数量将减半。]]




function EquipChange.GetData(player, config_type, is_open_wnd, is_success)
	if not Data["EquipChange"] then
		sLuaApp:LuaErr("EquipChange.GetData 不存在 Data[EquipChange] ")
		return
	end
	if not Data["EquipChange"][config_type] then
		sLuaApp:LuaErr("EquipChange.GetData Data[EquipChange] 不存在 "..config_type)
		return
	end
	
	local can_change_config = Data["EquipChange"][config_type]["CanChange"]
	local item_con = player:GetItemContainer(ITEM_CONTAINER_BAG)
	local bag_item = item_con:GetItemList()
	local can_change_item = {}
	for _,v in ipairs(bag_item) do
		if can_change_config[v:GetKeyName()] then
			table.insert(can_change_item, tostring(v:GetGUID()))
		end
	end
	local main_config = EquipChange.Config[config_type]
	if not main_config then
		 sLuaApp:LuaErr("EquipChange.GetData EquipChange.Config 不存在 " ..config_type)
	end
	local consume_config = main_config["Consume"] or {}
	
	local str = [[]]
	if is_open_wnd then
		str = str .. [[
			GUI.OpenWnd("EquipTransferUI")
			if EquipTransferUI then
				EquipTransferUI.EquipTransferTips = "]]..EquipChange.Tips..[["
				EquipTransferUI.EquipTransferConsume = ]]..Lua_tools.serialize(consume_config)..[[
			end
		]]
	end
	if is_success then
		str = str .. [[
			if EquipTransferUI then
				EquipTransferUI.TransferSuccess()
			end
		]]
	end
	
	str = str .. [[
		if EquipTransferUI then
			EquipTransferUI.EquipTransferTable = ]]..Lua_tools.serialize(can_change_item)..[[
			EquipTransferUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
end

function EquipChange.GetChangeData(player, item_keyname, config_type)
	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not item_data then
		sLuaApp:LuaErr("EquipChange.GetChangeData ItemConfig不存在 "..item_keyname)
		return
	end
	local change_config = EquipChange.Config[config_type]
	if not EquipChange.CheckItem(item_data, change_config) then
		sLuaApp:NotifyTipsMsg(player,"该物品无法转换")
		return
	end
	
	if not Data["EquipChange"] then 
		sLuaApp:LuaErr("EquipChange.GetChangeData 缺少 Data[EquipChange]")
		return 
	end
	local main_config = Data["EquipChange"][config_type]
	local item_can_change_tb = main_config["CanChange"]
	if not item_can_change_tb[item_keyname] then
		sLuaApp:LuaErr("EquipChange.GetChangeData 物品 " ..item_keyname .." 不可转换")
		return
	end
	
	local item_change_tb = main_config["Change"]
	for _,v in ipairs(main_config["Check"]) do
		local data_value = item_data[v]
		item_change_tb = item_change_tb[tostring(data_value)]
		if not item_change_tb then
			sLuaApp:LuaErr("EquipChange.GetChangeData 不存在" ..item_keyname .." 配置 "..v .." ".. data_value)
			return
		end
	end
	local str = [[
		if EquipTransferUI then
			GUI.OpenWnd("EquipTransferTargetUI")
			if EquipTransferTargetUI then
				EquipTransferTargetUI.AfterEquipTable = ]]..Lua_tools.serialize(item_change_tb)..[[
				EquipTransferTargetUI.RefreshAfterEquipTable("]]..item_keyname..[[")
			end
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
end

function EquipChange.GetFreeChangeNum(player, config_type)
	player:SetInt("EquipChange_FreeChangeNum_"..config_type, 1)
end

function EquipChange.Start(player, old_item_guid, new_item_keyname, check_mod, config_type)
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return
	end

	if not old_item_guid or not new_item_keyname or not check_mod or not config_type then return end
	old_item_guid = tonumber(old_item_guid)
	new_item_keyname = tostring(new_item_keyname)
	
	local change_config = EquipChange.Config[config_type]
	local show_name = change_config["ShowName"]
	
	local item = sItemSystem:GetItemByGUID(old_item_guid)
	if not item then return end
	if item:GetOwnerGUID() ~= player:GetGUID() then return end
	local item_con = item:GetItemContainer()
	if item_con:GetContainerType() ~= ITEM_CONTAINER_BAG then
		sLuaApp:NotifyTipsMsg(player, "物品不在包裹中")
		return
	end
	
	if not Data["EquipChange"] then 
		sLuaApp:LuaErr("EquipChange.Start 缺少 Data[EquipChange]")
		return 
	end
	local main_config = Data["EquipChange"][config_type]
	if not main_config then return end
	local item_keyname = item:GetKeyName()
	if item_keyname == new_item_keyname then
		sLuaApp:NotifyTipsMsg(player, "当前"..show_name.."与转换后"..show_name.."完全一致，无需转换")
		return
	end
	
	--绑定判断
	if check_mod and check_mod == 0 and EquipChange.ChangeBind == 1 then
		local is_bind = item:IsBound()
		if not is_bind then
			local str = [[GlobalUtils.ShowServerBoxMessage("当前]]..show_name..[[没有绑定，转换后得到的]]..show_name..[[将变为绑定，是否确认转换？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "EquipChange.Start(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."), "..old_item_guid..",'".. new_item_keyname.."',1, '"..config_type.."')")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
	end
	
	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not EquipChange.CheckItem(item_data, change_config) then
		sLuaApp:NotifyTipsMsg(player,"该物品无法转换")
		return
	end
	
	local item_can_change_tb = main_config["CanChange"]
	if not item_can_change_tb[item_keyname] then
		sLuaApp:LuaErr("EquipChange.Start 物品 " ..item_keyname .." 不可转换")
		return
	end
	
	local item_change_tb = main_config["Change"]
	for _,v in ipairs(main_config["Check"]) do
		local data_value = item_data[v]
		item_change_tb = item_change_tb[tostring(data_value)]
		if not item_change_tb then
			sLuaApp:LuaErr("EquipChange.Start 不存在" ..item_keyname .." 配置 "..v .." ".. data_value)
			return
		end
	end
	if not item_change_tb[new_item_keyname] then
		sLuaApp:NotifyTipsMsg(player, "无法转换为"..new_item_keyname)
		sLuaApp:LuaErr("EquipChange.Start 不存在转换物品 " ..new_item_keyname .." 配置")
		return
	end

	if not EquipChange.CheckRestrict(item_keyname, new_item_keyname, change_config["RestrictSame"] or {}) then 
		sLuaApp:NotifyTipsMsg("无法转换为该"..show_name)
		sLuaApp:LuaErr("EquipChange.CheckRestrict false "..item_keyname.."  "..new_item_keyname)
		return
	end
	local new_item_data = ItemConfig.GetByKeyName(new_item_keyname)
	if not new_item_data then
		sLuaApp:LuaErr("EquipChange.Start ItemConfig 缺少 "..new_item_keyname)
		return
	end

	--消耗判断
	local free_change_num = player:GetInt("EquipChange_FreeChangeNum_"..config_type)
	if free_change_num <= 0 then
		local consume_config = change_config["Consume"]
		local consume_item = consume_config["Base"]
		if consume_config["CheckRole"] then
			local item_role = new_item_data.Role
			if item_role ~= 0 then
				if player:GetInt("ChangeOccu_UsedRole_"..item_role) == 1 then
					consume_item = consume_config["CheckRole"]
				end
			end
			item_role = new_item_data.Role2
			if item_role ~= 0 then
				if player:GetInt("ChangeOccu_UsedRole_"..item_role) == 1 then
					consume_item = consume_config["CheckRole"]
				end
			end
		end
		if not Lua_tools.IsItemEnough(player, consume_item) then
			if OneKeyBuy then
				local defect_list = Lua_tools.GetDefectList(player, consume_item)
				OneKeyBuy.Main(player, defect_list)
			else
				sLuaApp:NotifyTipsMsg("转换"..show_name.."所需物品不足")
			end
			return
		end
		if not Lua_tools.SubItem(player, consume_item, "system", "转换"..show_name, "转换"..show_name.."消耗") then
			sLuaApp:LuaErr("EquipChange.Start Lua_tools.SubItem 错误")
			return
		end
	else
		player:SetInt("EquipChange_FreeChangeNum_"..config_type, free_change_num - 1)
	end
	
	--开始转换
	if EquipChange.Change(player, item, new_item_keyname) then
		sLuaApp:NotifyTipsMsg(player, show_name.."转换成功")
		EquipChange.GetData(player, config_type, false, true)
	end
end

function EquipChange.Change(player, old_item, new_item_keyname)
	--基础属性--强化--耐久--宝石--特技特效
	local mark_tb = {
		EquipAttrClassify["Primordial"] or 0,
		--EquipAttrClassify["EquipIntensify"] or 10, -- 因为武器光效
		--EquipAttrClassify["EquipLight"] or 20,
	}
	local custom_key_tb = {
		----强化
		--"EQUIP_IntensifyLevel",
		--耐久
		"DurableMax",
		"DurableNow",
		"FailNow",
		"FailMax",
		"RepairItemList",
		"Coefficient",
		--特技特效
		"Equip_Stunt",
		"Equip_SpecialEffect",
	}
	local custom_key_string_tb = {
		SuitConfig.Main['Sign_STR'] or "equip_suit_keyname",
	}
	--宝石
	for i = 1, EquipGem.MaxGemNum do
		table.insert(mark_tb, EquipAttrClassify["EquipGemSlot_" .. i])
		table.insert(custom_key_tb, "ITEM_GemId_" .. i)
	end
	
	local attrs_tb = {}
	attrs_tb["DynAttr"] = {}
	attrs_tb["Custom"] = {}
	attrs_tb["CustomString"] = {}
	
	for _,mark in ipairs(mark_tb) do
		attrs_tb["DynAttr"][mark] = old_item:GetDynAttrsByMark(mark)
	end
	for _,custom_key in ipairs(custom_key_tb) do
		attrs_tb["Custom"][custom_key] = old_item:GetInt(custom_key)
	end
	for _,custom_key_string in ipairs(custom_key_string_tb) do
		attrs_tb["CustomString"][custom_key_string] = old_item:GetString(custom_key_string)
	end
	--强化单独处理 武器光效跟着强化走
	local intensify_level = old_item:GetInt("EQUIP_IntensifyLevel")
	
	local is_bind = old_item:IsBound()
	if not is_bind and EquipChange.ChangeBind == 1 then
		is_bind = true
	end
	
	if sItemSystem:DestroyItem(old_item, "system", "物品转换", "转换消耗") ~= 0 then
		sLuaApp:LuaErr("EquipChange.Change DestroyItem错误")
		return false
	end
	
	local new_item_id = sItemSystem:GetItemIdByKeyname(new_item_keyname)
	local item_list = sItemSystem:AddItemEx(player, new_item_id, 1, is_bind, "system", "物品转换", "转换获得")
	local new_item = item_list[1]
	if not new_item then 
		sLuaApp:LuaErr("EquipChange.Change 未获得new_item")
		return false
	end
		
	for k,v in pairs(attrs_tb["DynAttr"]) do
		new_item:SetDynAttrsByTable(k, v)
	end
	for k,v in pairs(attrs_tb["Custom"]) do
		new_item:SetInt(k,v)
	end
	for k,v in pairs(attrs_tb["CustomString"]) do
		new_item:SetString(k,v)
	end
	if intensify_level > 0 then
		EquipIntensify.SetEquipIntensifyLevel(player, new_item, intensify_level, 1)
	end
	
	return true
end

function EquipChange.CheckRestrict(item_keyname, new_item_keyname, restrict_config)
	if not next(restrict_config) then return true end
	local old_item_data = ItemConfig.GetByKeyName(item_keyname)
	local new_item_data = ItemConfig.GetByKeyName(new_item_keyname)
	if not old_item_data or not new_item_data then return false end
	for _,v in ipairs(restrict_config) do
		if old_item_data[v] == new_item_data[v] then
			return false
		end
	end
	return true
end

function EquipChange.CheckItem(item_data, change_config)
	local requirement = change_config["Requirement"]
	for x,y in pairs(requirement) do
		local config_value = item_data[x]
		local typ = type(y)
		if typ == "number" then
			if config_value ~= y then
				return false
			end
		elseif typ == "table" then
			if not (config_value >= y[1] and config_value <= y[2]) then
				return false
			end
		end
	end
	return true
end
	
function EquipChange.Initilization()
	if not Data then
		sLuaApp:LuaErr("EquipChange.Initilization not Data")
		return
	end
	Data["EquipChange"] = {}
	local all_item_config = ItemConfig.GetTableData()
	
	for k,v in pairs(EquipChange.Config) do
		if not v["Requirement"] then return end

		Data["EquipChange"][k] = {}
		Data["EquipChange"][k]["CanChange"] = {} -- 转换前表
		Data["EquipChange"][k]["Change"] = {} -- 转换后表
		Data["EquipChange"][k]["Check"] = {} --需要判断的字段
		
		for x,y in pairs(v["Requirement"]) do
			if type(y) == "table" then
				table.insert(Data["EquipChange"][k]["Check"], x)
			end
		end	
		
		local pre_black_list = {}
		if v["PreBlacklist"] then
			for i,j in pairs(v["PreBlacklist"]) do
				pre_black_list[i] = {}
				for _,b in ipairs(j) do
					pre_black_list[i][b] = true
				end
			end
		end
		
		local after_black_list = {}
		if v["AfterBlacklist"] then
			for i,j in pairs(v["AfterBlacklist"]) do
				after_black_list[i] = {}
				for _,b in ipairs(j) do
					after_black_list[i][b] = true
				end
			end
		end

		for _,item_config in ipairs(all_item_config) do
			local is_change = true
			while is_change do
				if not EquipChange.CheckItem(item_config, v) then
					is_change = false
					break
				end
				break
			end
			
			local is_can_change = true --可以转换 转换前
			for m,n in pairs(pre_black_list) do
				local config_value = item_config[m]
				if n[config_value] then
					is_can_change = false
					break
				end
			end
			
			local item_keyname = item_config["KeyName"]
			if is_change and is_can_change then
				--table.insert(Data["EquipChange"][k]["CanChange"], item_config["KeyName"])
				Data["EquipChange"][k]["CanChange"][item_keyname] = true
			end
			
			for m,n in pairs(after_black_list) do--可以被转换 转换后
				local config_value = item_config[m]
				if n[config_value] then
					is_change = false
					break
				end
			end
			if is_change then
				local library = Data["EquipChange"][k]["Change"]
				for _,n in ipairs(Data["EquipChange"][k]["Check"]) do
					local config_value = item_config[n]
					config_value = tostring(config_value)
					if not library[config_value] then
						library[config_value] = {}
					end
					library = library[config_value]
				end
				library[item_keyname] = true
				--table.insert(library, item_config["KeyName"])
			end
		end
	end
	
	--sLuaApp:LuaErr(Lua_tools.serialize(Data["EquipChange"]))
	-- sLuaApp:LuaErr("EquipChange.Initilization()2222")
end
--EquipChange.Initilization()