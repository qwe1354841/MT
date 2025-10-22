--宠物装备洗炼
PetEquipArtifice = {}

--默认最大洗炼次数
PetEquipArtifice.DefaultMaxArtificeNum = {
	["宠物项圈"] = 20,--"Level + Grade",
	["宠物盔甲"] = 20,--"Level + Grade",
	["宠物护符"] = 20,--"Level + Grade",
	["宠物饰品"] = 20,--"Level + Grade",
}
--单个装备最大洗炼次数  没有配置表示取默认最大洗炼次数   配置为-1表示最大洗炼无限次，不记录当前洗炼次数
PetEquipArtifice.MaxArtificeNum = {
	-- ["15级项圈"] = 5,
	-- ["45级项圈蓝"] = -1,
	-- ["15级项圈紫"] = 15,
}

--属性随机数量的几率
PetEquipArtifice.AttrNum = {
	[1] = 1000,
	[2] = 100,
	[3] = 10,
	[4] = 0,
	[5] = 0,
	[6] = 0,
	[7] = 0,
}

--品质等级无区别的宠物饰品用
PetEquipArtifice.ConsumeEx = {
	-- ["ItemKeyName"] = {MoneyType = 5, MoneyVal = 1, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 1}  --MoneyVal ConsumeNum 为number
	["0级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 1},
	["5级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 1000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 2},	
	["15级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 1500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 2},
	["25级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 2000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 3},
	["35级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 2500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 3},	
	["45级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 3000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 4},
	["55级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 3500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 4},
	["65级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 4000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},		
	["75级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 4500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},
	["85级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 5000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},
	["95级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 5500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},		
	["105级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 6000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},
	["115级参战宠物饰品"] = {MoneyType = 5, MoneyVal = 6500, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 5},
	["神兽饰品"] = {MoneyType = 5, MoneyVal = 12000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 8},		
	["仙兽饰品"] = {MoneyType = 5, MoneyVal = 10000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 6},
	["魔兽饰品"] = {MoneyType = 5, MoneyVal = 15000, ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = 10},
}

PetEquipArtifice.Consume = {
	["MoneyType"] = 5, 
	["MoneyVal"] = "Level * 50 + 500",
	["Grade_1"] = {ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = "1 * math.floor(Level / 20 + 0.5) + 1"},
	["Grade_2"] = {ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = "1 * math.floor(Level / 20 + 0.5) + 1"},
	["Grade_3"] = {ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = "2 * math.floor(Level / 20 + 0.5) + 1"},
	["Grade_4"] = {ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = "2 * math.floor(Level / 20 + 0.5) + 1"},
	["Grade_5"] = {ConsumeKeyName = "宠物装备洗炼石", ConsumeNum = "3 * math.floor(Level / 20 + 0.5) + 1"},
}

--有字色区分，根据K=（属性值-下限值）/（上限值-下限值）判断，0<=K<0.2无色，0.2<=K<0.4绿，0.4<=K<0.7蓝，0.7<=K<0.9紫，0.9以上橙，
PetEquipArtifice.AttrColor = {
	[1] = 0,--"#FFFFFFff",
	[2] = 0.2,--"#46DC5Fff",
	[3] = 0.4,--"#42B1F0ff",
	[4] = 0.7,--"#E855FFff",
	[5] = 0.9,--"#FF8700ff",
	--[6] = ,--"#FF0000ff",
}


--同一装备类型 attr相同时会覆盖  --Rand = -1 时 表示额外添加该属性
PetEquipArtifice.AttrRandom = {
	["宠物项圈"] =  {
		["Grade_1"] = {
		--	{attr = "血量上限", minValue = 100, maxValue = 20000, Rand = -1},
			{attr = "物理攻击", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "法术攻击", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "封印", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "力量", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "灵力", minValue = 1, maxValue = 5, Rand = 500},
		},
		["Grade_2"] = {
			{attr = "物理攻击", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "法术攻击", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "封印", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "力量", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "灵力", minValue = 1, maxValue = 5, Rand = 500},
		},
		["Grade_3"] = {
			{attr = "物理攻击", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "法术攻击", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "封印", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "力量", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "灵力", minValue = 2, maxValue = 10, Rand = 500},
		},
		["Grade_4"] = {
			{attr = "物理攻击", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "法术攻击", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "封印", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "力量", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "灵力", minValue = 3, maxValue = 15, Rand = 500},
		},
		["Grade_5"] = {
			{attr = "物理攻击", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "法术攻击", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "封印", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "力量", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "灵力", minValue = 4, maxValue = 20, Rand = 500},
		},
	},
	["宠物盔甲"] = { 
		["Grade_1"] = {
			{attr = "法术防御", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "物理防御", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "封抗", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "体质", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "耐力", minValue = 1, maxValue = 5, Rand = 500},		
		},
		["Grade_2"] = {
			{attr = "法术防御", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "物理防御", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "封抗", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "体质", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "耐力", minValue = 1, maxValue = 5, Rand = 500},	
		},
		["Grade_3"] = {
			{attr = "法术防御", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "物理防御", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "封抗", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "体质", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "耐力", minValue = 2, maxValue = 10, Rand = 500},	
		},
		["Grade_4"] = {
			{attr = "法术防御", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "物理防御", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "封抗", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "体质", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "耐力", minValue = 3, maxValue = 15, Rand = 500},	
		},
		["Grade_5"] = {
			{attr = "法术防御", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "物理防御", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "封抗", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "体质", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "耐力", minValue = 4, maxValue = 20, Rand = 500},	
		},
	},	
	["宠物护符"] = { 
		["Grade_1"] = {
			{attr = "血量上限", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "战斗速度", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "体质", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "敏捷", minValue = 1, maxValue = 5, Rand = 500},
		},
		["Grade_2"] = {
			{attr = "血量上限", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "战斗速度", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "体质", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "敏捷", minValue = 1, maxValue = 5, Rand = 500},
		},
		["Grade_3"] = {
			{attr = "血量上限", minValue = 60, maxValue = 450, Rand = 500},
			{attr = "战斗速度", minValue = 30, maxValue = 225, Rand = 500},
			{attr = "体质", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "敏捷", minValue = 2, maxValue = 10, Rand = 500},
		},
		["Grade_4"] = {
			{attr = "血量上限", minValue = 80, maxValue = 600, Rand = 500},
			{attr = "战斗速度", minValue = 40, maxValue = 300, Rand = 500},
			{attr = "体质", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "敏捷", minValue = 3, maxValue = 15, Rand = 500},
		},
		["Grade_5"] = {
			{attr = "血量上限", minValue = 100, maxValue = 750, Rand = 500},
			{attr = "战斗速度", minValue = 50, maxValue = 375, Rand = 500},
			{attr = "体质", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "敏捷", minValue = 4, maxValue = 20, Rand = 500},
		},
	},
	["宠物饰品"] = { 
		["Grade_1"] = {
			{attr = "物暴率", minValue = 10, maxValue = 75, Rand = 500},
			{attr = "法暴率", minValue = 10, maxValue = 75, Rand = 500},
			{attr = "力量", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "灵力", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "敏捷", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "耐力", minValue = 1, maxValue = 5, Rand = 500},	
		},
		["Grade_2"] = {
			{attr = "物暴率", minValue = 10, maxValue = 75, Rand = 500},
			{attr = "法暴率", minValue = 10, maxValue = 75, Rand = 500},
			{attr = "力量", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "灵力", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "敏捷", minValue = 1, maxValue = 5, Rand = 500},
			{attr = "耐力", minValue = 1, maxValue = 5, Rand = 500},	
		},
		["Grade_3"] = {
			{attr = "物暴率", minValue = 15, maxValue = 112, Rand = 500},
			{attr = "法暴率", minValue = 15, maxValue = 112, Rand = 500},
			{attr = "力量", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "灵力", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "敏捷", minValue = 2, maxValue = 10, Rand = 500},
			{attr = "耐力", minValue = 2, maxValue = 10, Rand = 500},	
		},
		["Grade_4"] = {
			{attr = "物暴率", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "法暴率", minValue = 20, maxValue = 150, Rand = 500},
			{attr = "力量", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "灵力", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "敏捷", minValue = 3, maxValue = 15, Rand = 500},
			{attr = "耐力", minValue = 3, maxValue = 15, Rand = 500},	
		},
		["Grade_5"] = {
			{attr = "物暴率", minValue = 25, maxValue = 188, Rand = 500},
			{attr = "法暴率", minValue = 25, maxValue = 188, Rand = 500},
			{attr = "力量", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "灵力", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "敏捷", minValue = 4, maxValue = 20, Rand = 500},
			{attr = "耐力", minValue = 4, maxValue = 20, Rand = 500},	
		},
	},
	
}

--在打开修理界面时发
function PetEquipArtifice.GetData(player)
    if FunctionSwitch.AllFuncitonConfig.PetEquipArtifice ~= "on" then
		return ""
	end
	local str = [[
		PetEquipRepairUI.PetEquipArtifice_Consume =]].. Lua_tools.serialize(PetEquipArtifice.Consume)..[[
		PetEquipRepairUI.PetEquipArtifice_ConsumeEx =]].. Lua_tools.serialize(PetEquipArtifice.ConsumeEx)..[[
	]]
	return str 
end

function PetEquipArtifice.GetItem(player, item_guid)
	if not item_guid then return false end
	item_guid = tonumber(item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if not item then
		sLuaApp:LuaDbg("PetEquipArtifice.GetItem 不存在装备"..item_guid)
		return false
	end
	
	local owner = item:GetItemContainer():GetOwner()
	local owner_type = owner:GetType()
	if owner_type == GUID_PLAYER then
		if owner ~= player then
			sLuaApp:LuaErr("PetEquipArtifice "..item_guid.." 装备主人非"..player:GetName())
			return false
		end
	elseif owner_type == GUID_PET then
		if owner:GetOwner() ~= player then
			sLuaApp:LuaErr("PetEquipArtifice "..item_guid.." 装备主人的主人非"..player:GetName())
			return false
		end
	else
		sLuaApp:LuaErr("PetEquipArtifice  owner_type 错误 "..owner_type)
		return false
	end
	return item
end

-- @newinter PetEquipArtifice.Artificing(player, 360675519509954566)
function PetEquipArtifice.Artificing(player, item_guid)
	------ 判断装备 --
	local item = PetEquipArtifice.GetItem(player, item_guid)
	if not item then return end
	
	local item_keyname = item:GetKeyName()
	local item_data = ItemConfig.GetByKeyName(item_keyname)
	if not item_data then
		sLuaApp:LuaErr("PetEquipArtifice not item_data    keyname"..item_keyname)
		return
	end
	if item:GetMajorType() ~= ITEM_TYPE_EQUIP then
		sLuaApp:LuaDbg(item_guid.."不是装备")
		return
	end
	if item:GetSubType() ~= EQUIP_PET_EQUIP then
		sLuaApp:LuaDbg(item_guid.."不是宠物装备")
		return
	end

	local item_type = PetEquipArtifice.GetItemType(item)
	if item_type == "" then return end

	if not PetEquipArtifice.AttrRandom[item_type] then
		sLuaApp:LuaDbg(item_guid.."未找到对应item_type "..item_type.." 配置")	
		return
	end
	
	-- 判断洗炼最大次数
	local now_artifice_num = item:GetInt("PetEquipArtifice_NowArtificeNum")
	local max_artifice_num = item:GetInt("PetEquipArtifice_MaxArtificeNum")
	if max_artifice_num ~= -1 then
		if now_artifice_num >= max_artifice_num then
			sLuaApp:NotifyTipsMsg(player, "此装备洗炼次数已满，无法洗炼")
			return
		end
	end
	
	-------- 检查消耗 --
	sLuaApp:LuaDbg("PetEquipArtifice.StartArtifice")
	if not PetEquipArtifice.Consume or not next(PetEquipArtifice.Consume) then
		sLuaApp:LuaDbg("缺少EquipArtifice_Consume")
		return
	end
	local consume_tb = {}
	local item_grade = item_data.Grade
	if PetEquipArtifice.ConsumeEx[item_keyname] then
		consume_tb = PetEquipArtifice.ConsumeEx[item_keyname]
	else
		consume_tb = PetEquipArtifice.GetConsumeTb(item_grade, item_data.Level)
	end
	--sLuaApp:LuaDbg("consume_tb"..serialize(consume_tb))
	if not next(consume_tb) then
		sLuaApp:LuaDbg("PetEquipArtifice consume_tb 为空")
		return
	end
	local consume_money_type = consume_tb["MoneyType"]
	local consume_money_val = consume_tb["MoneyVal"]
	local consume_item_keyname = consume_tb["ConsumeKeyName"]
	local consume_item_num = consume_tb["ConsumeNum"]
	local consume_item_id = sItemSystem:GetItemIdByKeyname(consume_item_keyname)
	
	if consume_money_type and consume_money_val then
		if not Lua_tools.IsMoneyEnough(player, consume_money_type, consume_money_val) then
			if MoneyChange then
				local f_name = [[PetEquipArtifice.Artificing(player,]]..item_guid..[[)]]
				MoneyChange.LackMoney(player, consume_money_type, consume_money_val, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足！")
			end
			return
		end
	end

	if consume_item_keyname and consume_item_num then
		local has_item_num = sItemSystem:GetItemAmount(player, consume_item_id, 3)
		if has_item_num < consume_item_num then
			local consume_item_data = ItemConfig.GetByKeyName(consume_item_keyname)
			if not consume_item_data then
				sLuaApp:LuaErr("PetEquipArtifice  not consume_item_data")
				return
			end
			if OneKeyBuy then
				local defect_list = Lua_tools.GetDefectList(player, {consume_item_keyname, consume_item_num})
				OneKeyBuy.Main(player, defect_list)
			else
				sLuaApp:NotifyTipsMsg(player, "您的".. consume_item_data.Name .."不足！")		
			end
			return
		end
	end
	
	if consume_money_type and consume_money_val then
		if not Lua_tools.SubMoney(player, consume_money_type, consume_money_val, "system", "宠物装备洗练", "洗练消耗") then
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(consume_money_type).."不足")
			return
		end
	end
	if consume_item_keyname and consume_item_num and consume_item_num > 0 then
		if sItemSystem:ConsumeItemWithPriority(player, consume_item_id, consume_item_num, true, "system", "宠物装备洗练", "洗练消耗")["code"] ~= 0  then
			sLuaApp:LuaErr("PetEquipArtifice  player"..player:GetName().."  ConsumeItemWithPriority错误")
			return
		end
	end
	
	-- ------- 清属性 --
	-- local mark = EquipAttrClassify["PetEquipArtifice"] or 51
	-- item:SetDynAttrsByMark(mark, 0)
	------- 加属性 --
	if not PetEquipArtifice.RandomTable or not PetEquipArtifice.RandNum then
		PetEquipArtifice.Initialization()
	end
	-- 获得洗练条数
	local attr_num = PetEquipArtifice.GetRandIndex(PetEquipArtifice.RandNum, {}, 1)[1]
	if not attr_num then
		sLuaApp:LuaErr("PetEquipArtifice attr_num错误")
		return
	end

	local attr_rander = PetEquipArtifice.RandomTable[item_type]["Grade_"..item_grade]
	if not attr_rander then
		sLuaApp:LuaErr("PetEquipArtifice 缺少rander   item_guid"..item_guid)
		return
	end
	--sLuaApp:LuaDbg("attr_rander" .. Lua_tools.serialize(attr_rander))
	local attr_index_tb = PetEquipArtifice.GetRandIndex(attr_rander,PetEquipArtifice.RequiredTable[item_type]["Grade_"..item_grade] or {}, attr_num)
	--sLuaApp:LuaDbg("attr_index_tb"..Lua_tools.serialize(attr_index_tb))

	local attr_config = PetEquipArtifice.AttrRandom[item_type]["Grade_"..item_grade]
	local save_attr_tb = {}
	for _,v in ipairs(attr_index_tb) do
		local attr_id, attr_val, color_index = PetEquipArtifice.GetAttrTb(attr_config[v], item_data)
		if attr_id and attr_val then
			table.insert(save_attr_tb, {attr_id, attr_val, color_index})
			--item:SetDynAttr(mark, attr_id, attr_val)
		end
	end
	local save_attr_tb_str = Lua_tools.serialize(save_attr_tb)
	item:SetString("PetEquipArtifice_SaveAttrTb", save_attr_tb_str)	
	
	if max_artifice_num ~= -1 then
		now_artifice_num = now_artifice_num + 1
		item:SetInt("PetEquipArtifice_NowArtificeNum", now_artifice_num)
	end
	
	--密藏
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.UpdateQuestProgress(player, 59)
	end
	
	--PetEquipRepairUI.RecordAttrTb["]]..item_guid..[["] = ]]..save_attr_tb_str..[[
	local str = [[
		if PetEquipRepairUI then
			PetEquipRepairUI.RefreshOnClearClick()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetEquipArtifice.SaveAttrChange(player, item_guid)
	local item = PetEquipArtifice.GetItem(player, item_guid)
	if not item then return end
	local save_attr_tb_str = item:GetString("PetEquipArtifice_SaveAttrTb")
	if save_attr_tb_str == "" then
		sLuaApp:NotifyTipsMsg(player, "当前无可替换属性，请先洗炼！")
		--sLuaApp:LuaErr("PetEquipArtifice.SaveAttrChange save_attr_tb_str为空 ".. item_guid)
		return
	end
	-- 清属性
	local mark = EquipAttrClassify["PetEquipArtifice"] or 51
	item:SetDynAttrsByMark(mark, 0)
	-- 加属性
	local save_attr_tb = assert(load("return "..save_attr_tb_str))()
	for _,v in ipairs(save_attr_tb) do
		item:SetDynAttr(mark, v[1], v[2])
		sLogServerSystem:LogItemToServer(0, player, item, "宠物装备洗炼属性"..v[1] , 0, v[2], "宠物装备保存洗炼属性", "")
	end
	item:SetString("PetEquipArtifice_NowAttrTb", save_attr_tb_str)
	item:SetString("PetEquipArtifice_SaveAttrTb", "")
	--重计算
	local owner = item:GetItemContainer():GetOwner()
	local owner_type = owner:GetType()
	if owner_type == GUID_PET then
		owner:RecalcAttr()
	end
	sLuaApp:NotifyTipsMsg(player, "替换成功！")
	
	local str = [[
		if PetEquipRepairUI then
			PetEquipRepairUI.RefreshOnReplaceClick()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

-- function PetEquipArtifice.GetAttrChange(player, item_guid)
	-- local item = PetEquipArtifice.GetItem(player, item_guid)
	-- if not item then return end
	-- local save_attr_tb_str = item:GetString("PetEquipArtifice_SaveAttrTb")
	-- if save_attr_tb_str == "" then
		-- save_attr_tb_str = "{}"
	-- end
	-- local str = [[
		-- if PetEquipRepairUI then
			-- PetEquipRepairUI.RecordAttrTb["]]..item_guid..[["] = ]]..save_attr_tb_str..[[
			-- PetEquipRepairUI.RefreshClearAttrs()
		-- end
	-- ]]
	-- sLuaApp:ShowForm(player, "脚本表单", str)
-- end

function PetEquipArtifice.GetItemType(item)
	local item_type = ""
	local item_subtype2 = item:GetSubType2() 
	if item_subtype2 == PET_EQUIP_COLLOR then
		item_type = "宠物项圈"
	elseif item_subtype2 == PET_EQUIP_ARMOR then
		item_type = "宠物盔甲"
	elseif item_subtype2 == PET_EQUIP_AMULET then
		item_type = "宠物护符"
	elseif item_subtype2 == PET_EQUIP_ACCESSORY then
		item_type = "宠物饰品"
	else
		sLuaApp:LuaErr(item:GetKeyName() .."SubType未识别装备类型")
	end
	return item_type
end

function PetEquipArtifice.SetMaxArtificeNum(item)
	local item_keyname = item:GetKeyName()
	local max_artifice_num = PetEquipArtifice.MaxArtificeNum[item_keyname]
	if not max_artifice_num then
		local item_type = PetEquipArtifice.GetItemType(item)
		if item_type == "" then return end
		local add_num = PetEquipArtifice.DefaultMaxArtificeNum[item_type]
		local item_data = ItemConfig.GetByKeyName(item_keyname)
		max_artifice_num = PetEquipArtifice.RewardConfigToNmber(add_num, item_data)	
	end
	item:SetInt("PetEquipArtifice_MaxArtificeNum", max_artifice_num)
	--sLuaApp:LuaErr("max_artifice_num "..max_artifice_num)
end


function PetEquipArtifice.GetRandIndex(t_rander, required_tb, times)
	--进行随机
	local rander = Lua_tools.DupTable(t_rander)
	--sLuaApp:LuaErr("rander"..Lua_tools.serialize(rander))
	local index_tb = Lua_tools.DupTable(required_tb)
	if times >= #rander then
		--times = #rander
		for i = 2 ,#rander do
			table.insert(index_tb, rander[i][1])
		end
	else
		for s = 1,times do
			local rand = sLuaApp:RandInteger(1,rander[#rander][2])
			for i = 1, #rander-1 do
				if rand <= rander[i+1][2] and rand > rander[i][2] then
					table.insert(index_tb,rander[i+1][1])
					local diff = rander[i+1][2] - rander[i][2]
					table.remove(rander, i+1)
					for j = i+1, #rander do
						rander[j][2] = rander[j][2] - diff
					end
					break
				end
			end
		end
	end
	--sLuaApp:LuaErr("index_tb  "..Lua_tools.serialize(index_tb))
	return index_tb
end

function PetEquipArtifice.GetConsumeTb(item_grade, item_level)
	local consume_tb = {}
	if PetEquipArtifice.Consume["MoneyVal"] and PetEquipArtifice.Consume["MoneyType"] then
		consume_tb["MoneyType"] = PetEquipArtifice.Consume["MoneyType"]
		if type(PetEquipArtifice.Consume["MoneyVal"]) == "number" then
			consume_tb["MoneyVal"] = PetEquipArtifice.Consume["MoneyVal"]
		elseif type(PetEquipArtifice.Consume["MoneyVal"]) == "string" then
			consume_tb["MoneyVal"] = assert(load("local Level = "..item_level.." return "..PetEquipArtifice.Consume["MoneyVal"]))()
		else
			sLuaApp:LuaErr("PetEquipArtifice.Consume MoneyVal 配置错误")
		end
	end
	local consume_item = PetEquipArtifice.Consume["Grade_"..item_grade]
	if consume_item and consume_item["ConsumeKeyName"] and consume_item["ConsumeNum"] then 
		consume_tb["ConsumeKeyName"] =  consume_item["ConsumeKeyName"]
		if type(consume_item["ConsumeNum"]) == "number" then
			consume_tb["ConsumeNum"] = consume_item["ConsumeNum"]
		elseif type(consume_item["ConsumeNum"]) == "string" then
			consume_tb["ConsumeNum"] = assert(load("local Level = "..item_level.." return "..consume_item["ConsumeNum"]))()
		else
			sLuaApp:LuaErr("PetEquipArtifice.Consume ConsumeNum 配置错误")
		end
		
	end
	return consume_tb
end

function PetEquipArtifice.GetAttrTb(attr_tb, item_data) 
	local attr_data = AttrConfig.GetByKeyName(attr_tb["attr"])
	if not attr_data then
		sLuaApp:LuaErr("PetEquipCreate.ItemCreate AttrConfig不存在"..attr_tb["attr"])
		return
	end
	local val_min = PetEquipArtifice.RewardConfigToNmber(attr_tb["minValue"], item_data)
	local val_max = PetEquipArtifice.RewardConfigToNmber(attr_tb["maxValue"], item_data)
	if val_min > val_max then
		val_min,val_max = val_max,val_min
	end
	local attr_val = sLuaApp:RandInteger(val_min,val_max)
	
	local color_index = 1
	local k = (attr_val - val_min)/(val_max - val_min)
	for i = #PetEquipArtifice.AttrColor, 1, -1 do
		if k >= PetEquipArtifice.AttrColor[i] then
			color_index = i
			break
		end
	end
	
	return attr_data.Id, attr_val, color_index
end
function PetEquipArtifice.RewardConfigToNmber(add_num, item_data)
	if type(add_num) == "string" then
		local str_factor = [[
			local Level = ]]..item_data.Level..[[
			local Grade = ]]..item_data.Grade..[[
		]]
		return math.floor(assert(load(str_factor .. " return " .. add_num))())
	elseif type(add_num) == "number" then
		return math.floor(add_num)
	end
end

PetEquipArtifice.RandomTable = {} --{{index,rand_sum}}
PetEquipArtifice.RequiredTable = {} --{index}
PetEquipArtifice.RandNum = {} --{{index,rand_sum}}
function PetEquipArtifice.Initialization()
	--初始化随机表数据
	for x,y in pairs(PetEquipArtifice.AttrRandom) do
		PetEquipArtifice.RandomTable[x] = {}
		PetEquipArtifice.RequiredTable[x] = {}
		for k,v in pairs(y) do
			--PetEquipArtifice.RandomTable[k] = {}
			--for i,j in pairs(v) do
			PetEquipArtifice.RandomTable[x][k] = {{0,0}}
			PetEquipArtifice.RequiredTable[x][k] = {}
			local rand = 0
			for a,b in ipairs(v) do
				if b.Rand == -1 then
					table.insert(PetEquipArtifice.RequiredTable[k], a)
				else
					local tb_len = #PetEquipArtifice.RandomTable[x][k]
					rand = rand + (b.Rand or 1000)
					PetEquipArtifice.RandomTable[x][k][tb_len+1] = {a, rand}
				end
			end
			--end
		end
	end
	
	if PetEquipArtifice.AttrNum then
		PetEquipArtifice.RandNum = {{0,0}}
		local rand = 0
		for k,v in ipairs(PetEquipArtifice.AttrNum) do
			local tb_len = #PetEquipArtifice.RandNum
			rand = rand + v
			PetEquipArtifice.RandNum[tb_len+1] = {k, rand}
			--PetEquipArtifice.RandNum[k+1] = rand
		end
	end
	-- sLuaApp:LuaDbg("PetEquipArtifice.RandomTable"..Lua_tools.serialize(PetEquipArtifice.RandomTable))
	-- sLuaApp:LuaDbg("PetEquipArtifice.RequiredTable"..Lua_tools.serialize(PetEquipArtifice.RequiredTable))
	-- sLuaApp:LuaDbg("PetEquipArtifice.RandNum"..Lua_tools.serialize(PetEquipArtifice.RandNum))
end
PetEquipArtifice.Initialization()