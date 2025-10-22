--装备强化
EquipIntensify = {}

--装备强化配置版本(修改配置需要改变版本号)
EquipIntensify.Version = "0107.24"

--强化最高等级(修改最高等级需要注意合成消耗配置中有无相应配置)
EquipIntensify.MaxIntensifyLevel = 20

--强化幸运加值(万分比)
EquipIntensify.LuckyAddNum = 200

--装备子类别表  部位系数表
EquipIntensify.SubType_Tb = {
	[1] = {
		[0] = 4,	--武器
	},
	[2] = {
		[1] = 2,	--头盔
		[2] = 2,	--护甲
		[3] = 2,	--护腰
		[5] = 2,	--挂坠
	},
	[3] = {
		[1] = 1,	--戒指
		[2] = 1,	--项链
		[3] = 1,	--护腕
		[4] = 1,	--靴子
	},
}

--光无限武器系数表
EquipIntensify.GuangCoefficient = {
	[1] = {
		[0] = 1,
	},        
	[2] = {
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[5] = 1,
	},        
	[3] = {   
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 1,
	},
}

--属性系数表
EquipIntensify.AttrCoefficient = {
	['战斗速度'] = 1,	
	['血量上限'] = 2,	
	['法力上限'] = 2,	
	['法术防御'] = 1,	
	['物理防御'] = 1,	
	['物理攻击'] = 1,	
	['法术攻击'] = 1,	
}

--装备品级系数表
EquipIntensify.GradeCoefficient = {
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[4] = 1,
	[5] = 1,
}

--强化公式配置
EquipIntensify.formula = {
	[0]  = "(8665*(IntensifLevel^2) + 37482*IntensifLevel + 48035)/40000",	--新手装备配置为0级，强化按40级装备来计算
	[1]  = "(7150*(IntensifLevel^2) + 15255*IntensifLevel + 58842)/40000",
	[10] = "(7150*(IntensifLevel^2) + 15255*IntensifLevel + 58842)/40000",
	[15] = "(7150*(IntensifLevel^2) + 15255*IntensifLevel + 58842)/40000",
	[20] = "(7400*(IntensifLevel^2) + 26834*IntensifLevel + 43298)/40000",
	[25] = "(7400*(IntensifLevel^2) + 26834*IntensifLevel + 43298)/40000",
	[30] = "(8396*(IntensifLevel^2) + 29128*IntensifLevel + 47333)/40000",
	[35] = "(8396*(IntensifLevel^2) + 29128*IntensifLevel + 47333)/40000",
	[40] = "(8665*(IntensifLevel^2) + 37482*IntensifLevel + 48035)/40000",
	[45] = "(8665*(IntensifLevel^2) + 37482*IntensifLevel + 48035)/40000",
	[50] = "(9766*(IntensifLevel^2) + 41340*IntensifLevel + 50439)/40000",
	[55] = "(9766*(IntensifLevel^2) + 41340*IntensifLevel + 50439)/40000",
	[60] = "(9924*(IntensifLevel^2) + 52355*IntensifLevel + 34228)/40000",
	[65] = "(9924*(IntensifLevel^2) + 52355*IntensifLevel + 34228)/40000",
	[70] = "(11009*(IntensifLevel^2) + 54372*IntensifLevel + 38833)/40000",
	[75] = "(11009*(IntensifLevel^2) + 54372*IntensifLevel + 38833)/40000",
	[80] = "(11205*(IntensifLevel^2) + 64268*IntensifLevel + 32228)/40000",
	[85] = "(11205*(IntensifLevel^2) + 64268*IntensifLevel + 32228)/40000",
	[90] = "(11490*(IntensifLevel^2) + 74878*IntensifLevel + 22535)/40000",
	[95] = "(11490*(IntensifLevel^2) + 74878*IntensifLevel + 22535)/40000",
	[100] = "(11705*(IntensifLevel^2) + 86623*IntensifLevel + 14737)/40000",
	[105] = "(11705*(IntensifLevel^2) + 86623*IntensifLevel + 14737)/40000",
	[110] = "(12759*(IntensifLevel^2) + 87235*IntensifLevel + 31675)/40000",
	[115] = "(12759*(IntensifLevel^2) + 87235*IntensifLevel + 31675)/40000",
	[120] = "(13864*(IntensifLevel^2) + 86716*IntensifLevel + 53965)/40000",
	[125] = "(13864*(IntensifLevel^2) + 86716*IntensifLevel + 53965)/40000",
	[130] = "(14864*(IntensifLevel^2) + 86716*IntensifLevel + 53965)/40000",
}

--合成消耗与公式配置
EquipIntensify.ConsumeConfig = {
	[1] = {Level = 0, MoneyType = 5, MoneyVal = 10000, ItemList = {"装备强化石", 1},
		InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		safeItem = {"强化保固石",1}, Success = 10000, FailReduce = 0, FailReduce_safe = 0}, 
	[2] = {Level = 1, MoneyType = 5, MoneyVal = 20000, ItemList = {"装备强化石", 2}, 
		InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		safeItem = {"强化保固石",1}, Success = 9500, FailReduce = 0, FailReduce_safe = 0}, 
	[3] = {Level = 2, MoneyType = 5, MoneyVal = 30000, ItemList = {"装备强化石", 3}, 
		InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		safeItem = {"强化保固石",2}, Success = 9000, FailReduce = 0, FailReduce_safe = 0}, 
	[4] = {Level = 3, MoneyType = 5, MoneyVal = 50000, ItemList = {"装备强化石", 5}, 
		InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		safeItem = {"强化保固石",2}, Success = 8500, FailReduce = 0, FailReduce_safe = 0}, 
	[5] = {Level = 4, MoneyType = 5, MoneyVal = 70000, ItemList = {"装备强化石", 8}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",3}, Success = 8000, FailReduce = {2, 3}, FailReduce_safe = 0}, 
	[6] = {Level = 5, MoneyType = 5, MoneyVal = 90000, ItemList = {"装备强化石", 12}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",3}, Success = 7500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[7] = {Level = 6, MoneyType = 5, MoneyVal = 120000, ItemList = {"装备强化石", 16}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",4}, Success = 7000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[8] = {Level = 7, MoneyType = 5, MoneyVal = 150000, ItemList = {"装备强化石", 20}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",4}, Success = 6500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[9] = {Level = 8, MoneyType = 5, MoneyVal = 180000, ItemList = {"装备强化石", 30}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",5}, Success = 6000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[10] = {Level = 9, MoneyType = 5, MoneyVal = 220000, ItemList = {"装备强化石", 40}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",5}, Success = 5500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[11] = {Level = 10, MoneyType = 5, MoneyVal = 260000, ItemList = {"装备强化石2", 1}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",10}, Success = 5000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[12] = {Level = 11, MoneyType = 5, MoneyVal = 300000, ItemList = {"装备强化石2", 2}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",10}, Success = 4500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[13] = {Level = 12, MoneyType = 5, MoneyVal = 350000, ItemList = {"装备强化石2", 3},
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",12}, Success = 4000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[14] = {Level = 13, MoneyType = 5, MoneyVal = 400000, ItemList = {"装备强化石2", 5}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",12}, Success = 3500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[15] = {Level = 14, MoneyType = 5, MoneyVal = 450000, ItemList = {"装备强化石2", 8}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",15}, Success = 3000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[16] = {Level = 15, MoneyType = 5, MoneyVal = 510000, ItemList = {"装备强化石2", 12}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",15}, Success = 2500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[17] = {Level = 16, MoneyType = 5, MoneyVal = 570000, ItemList = {"装备强化石2", 16}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient",
		 safeItem = {"强化保固石",18}, Success = 2000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[18] = {Level = 17, MoneyType = 5, MoneyVal = 630000, ItemList = {"装备强化石2", 20}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",18}, Success = 1500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[19] = {Level = 18, MoneyType = 5, MoneyVal = 700000, ItemList = {"装备强化石2", 30}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 1000, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[20] = {Level = 19, MoneyType = 5, MoneyVal = 800000, ItemList = {"装备强化石2", 40}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[21] = {Level = 20, MoneyType = 5, MoneyVal = 1000000, ItemList = {"装备强化石2", 40}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 500, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[22] = {Level = 21, MoneyType = 5, MoneyVal = 1700000, ItemList = {"装备强化石3", 2}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[23] = {Level = 22, MoneyType = 5, MoneyVal = 1800000, ItemList = {"装备强化石3", 3}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[24] = {Level = 23, MoneyType = 5, MoneyVal = 1900000, ItemList = {"装备强化石3", 4}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[25] = {Level = 24, MoneyType = 5, MoneyVal = 2000000, ItemList = {"装备强化石3", 5}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[26] = {Level = 25, MoneyType = 5, MoneyVal = 2100000, ItemList = {"装备强化石3", 6}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[27] = {Level = 26, MoneyType = 5, MoneyVal = 2200000, ItemList = {"装备强化石3", 7}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[28] = {Level = 27, MoneyType = 5, MoneyVal = 2300000, ItemList = {"装备强化石3", 8}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[29] = {Level = 28, MoneyType = 5, MoneyVal = 2400000, ItemList = {"装备强化石3", 9}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[30] = {Level = 29, MoneyType = 5, MoneyVal = 2500000, ItemList = {"装备强化石3", 10}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",20}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
	[31] = {Level = 30, MoneyType = 5, MoneyVal = 2600000, ItemList = {"装备强化石4", 1}, 
		 InteRange = "formula*GradeCoefficient*AttrCoefficient*PositionCoefficient*GuangCoefficient", 
		 safeItem = {"强化保固石",30}, Success = 300, FailReduce = {2, 4}, FailReduce_safe = 0}, 
}

EquipIntensify.CanIntensifyList = {
	[1] = 1,		--武器
	[2] = 1,		--防具
	[3] = 1,		--饰品
}

function EquipIntensify.GetEquipData(player, Version)
	--sLuaApp:LuaDbg("获取数据")
	local str = ""
	if Version == EquipIntensify.Version then
		str = [[
			if EquipEnhanceUI then
				EquipEnhanceUI.RefreshCfgNoChange()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else 
		local dataTb = EquipIntensify.initialize()
		if Lua_tools then
			--sLuaApp:LuaDbg("表单回馈")
			str = [[ if EquipEnhanceUI then
						EquipEnhanceUI.serverData = ]] .. Lua_tools.serialize(dataTb) .. [[
						EquipEnhanceUI.Refresh()
					end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

function EquipIntensify.GetConfig(player)
	--sLuaApp:LuaDbg("访问GetConfig")
end

function EquipIntensify.SubItemIntensify(player, item_guid, safeMode, bindMode, guard_guid, isInherit)
	--sLuaApp:LuaDbg("装备强化强化操作")
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return ""
	end
	safeMode = tonumber(safeMode)
	bindMode = tonumber(bindMode)
	local IntensifyIsBind = true
	if bindMode == 1 then
		IntensifyIsBind = false
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if not item then
		sLuaApp:LuaErr("该装备不存在")
		return ""
	end
	if item:GetOwnerGUID() ~= player:GetGUID() then
		sLuaApp:LuaErr("装备 - "..item:GetOwnerGUID().."不属于玩家 - "..player:GetGUID())
		return ""
	end
	
	if not item:GetInt("EQUIP_IntensifyLevel") then
		item:SetInt("EQUIP_IntensifyLevel", 0)
	end
	local Inte_level = item:GetInt("EQUIP_IntensifyLevel")
	if Inte_level < 0 then
		Inte_level = 0
	end
	local next_level = Inte_level + 1
	if next_level > EquipIntensify.MaxIntensifyLevel then
		sLuaApp:NotifyTipsMsg(player, "您的装备等级已达最高级，无法再强化")
		return ""
	end
	
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	if itemData.Type ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "并非装备，无法操作")
		return ""
	end
	if itemData.Subtype == 4 then
		sLuaApp:NotifyTipsMsg(player, "该部位无法强化")
		return ""
	end
	
	--是否是光无限武器
	local isGuang = false
	if item:GetString("EquipCreateRule") ~= "" then
		isGuang = true
	end
	local GuangC = 1
	
	--装备类别
	local PositionC = 1
	local ItemSubType = tonumber(itemData.Subtype)
	local ItemSubType2 = tonumber(itemData.Subtype2)
	--sLuaApp:LuaDbg("SubType:"..ItemSubType.."  SubType2:"..ItemSubType2)
	if ItemSubType == 1 then
		PositionC = EquipIntensify.SubType_Tb[ItemSubType][0]
	else
		PositionC = EquipIntensify.SubType_Tb[ItemSubType][ItemSubType2]
	end
	if not PositionC then
		sLuaApp:LuaErr("装备部位系数不存在")
		return ""
	end
	
	--强化消耗
	local inte_tb = EquipIntensify.ConsumeConfig[next_level]
	if not inte_tb then
		sLuaApp:LuaErr("强化配置"..next_level.."不存在")
		return ""
	end
	
	if not inte_tb.InteRange then
		sLuaApp:LuaErr("强化等级"..next_level.."的InteRange不存在")
		return ""
	end
	
	local DefectList = Lua_tools.GetDefectList(player, inte_tb.ItemList)
	if #DefectList ~= 0 then
		if safeMode == 1 then
			local New_need = Lua_tools.GetDefectList(player, inte_tb.safeItem)
			for k,v in ipairs(New_need) do
				table.insert(DefectList, v)
			end
		end
		OneKeyBuy.Main(player, DefectList)
		--sLuaApp:NotifyTipsMsg(player, "道具不足，不能强化")
		return
	end
	if safeMode == 1 and Lua_tools.IsItemEnough(player, inte_tb.safeItem) == false then
		local All_need = {}
		for k,v in ipairs(inte_tb.ItemList) do
			table.insert(All_need, v)
		end
		for k,v in ipairs(inte_tb.safeItem) do
			table.insert(All_need, v)
		end
		OneKeyBuy.Main(player, Lua_tools.GetDefectList(player, All_need))
		--sLuaApp:NotifyTipsMsg(player, "道具不足，不能强化")
		return ""
	end
	
	if Lua_tools.IsMoneyEnough(player, inte_tb.MoneyType, inte_tb.MoneyVal) == false then
		if MoneyChange then
				
			local f_name = [[EquipIntensify.SubItemIntensify(sPlayerSystem:GetPlayerByGUID(]]..player:GetGUID()..[[),]]..item_guid..[[,]]..safeMode..[[,]]..bindMode..[[,]]..guard_guid..[[)]]
			MoneyChange.LackMoney(player, inte_tb.MoneyType, inte_tb.MoneyVal, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(inte_tb.MoneyType).."不足，不能强化")
		end
		return ""
	end
	
	--sLuaApp:LuaDbg("非绑定："..tostring(IntensifyIsBind))
	--sLuaApp:LuaDbg("装备是否绑定:"..tostring(item:IsBound()))
	local AllItemList = {}
	for k,v in ipairs(inte_tb.ItemList) do
		table.insert(AllItemList, v)
	end
	if safeMode == 1 then
		for k,v in ipairs(inte_tb.safeItem) do
			table.insert(AllItemList, v)
		end
	end
	if item:IsBound() then
		sLuaApp:LuaDbg("装备绑定")
		if EquipIntensify.SubItemIsBind(player, AllItemList, "system", "EquipIntensify", "强化对象："..keyName.." 对象guid："..item_guid.."  目标层数："..next_level, IntensifyIsBind) == false then
			sLuaApp:NotifyTipsMsg(player, "道具不足，不能强化")
			return ""
		end
	else
		if EquipIntensify.CheckNeedBind(player, AllItemList, IntensifyIsBind, item_guid, bindMode, safeMode, guard_guid) == "question" then
			return ""
		end
		local res = EquipIntensify.SubItemIsBind(player, AllItemList, "system", "EquipIntensify", "强化对象："..keyName.." 对象guid："..item_guid.."  目标层数："..next_level, IntensifyIsBind, item_guid, bindMode, safeMode, guard_guid)
		if res == false then
			sLuaApp:NotifyTipsMsg(player, "道具不足，不能强化")
			return ""
		end
	end
	
	if Lua_tools.SubMoney(player, inte_tb.MoneyType, inte_tb.MoneyVal, "system", "EquipIntensify", "强化对象："..keyName.." 对象guid："..item_guid.."  目标层数："..next_level) == false then
		sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(inte_tb.MoneyType).."不足，不能强化")
		return ""
	end
	
	--装备品级系数
	local EquipGrade = tonumber(itemData.Grade)
	local GradeC = EquipIntensify.GradeCoefficient[EquipGrade]
	--装备部位系数
	--local PositionC = EquipIntensify.PositionCoefficient[tonumber(ItemSubType)][Position]
	--local PositionC = EquipIntensify.SubType_Tb[ItemSubType][ItemSubType2]["Cof"]
	
	local EquipLevel = tonumber(itemData.Itemlevel)
	
	if not GradeC then
		sLuaApp:LuaDbg("装备品级系数不存在")
		return ""
	end
	
	local AttrList = item:GetDynAttrsByMark(0)
	local mark = EquipAttrClassify.EquipIntensify or 10
	local LuckAddition = item:GetInt("EQUIP_LuckAddition") or 0
	if isGuang then
		if ItemSubType == 1 then
			GuangC = EquipIntensify.GuangCoefficient[ItemSubType][0]
		else
			GuangC = EquipIntensify.GuangCoefficient[ItemSubType][ItemSubType2]
		end
	end
	sLuaApp:LuaDbg("GuangC:"..tostring(GuangC))
	if sLuaApp:RandInteger(1, 10000) <= (inte_tb.Success + LuckAddition) then
	--if 0 <= (inte_tb.Success + LuckAddition) then
		local inte_tb = EquipIntensify.ConsumeConfig[next_level]
		if inte_tb == nil then
			sLuaApp:LuaErr("等级"..next_level.."的强化配置不存在")
		end
		item:SetInt("EQUIP_LuckAddition", 0)
		for k,v in ipairs(AttrList) do
			--sLuaApp:LuaDbg(type(v.attr)..v.attr)
			local attrData = AttrConfig.GetById(v.attr)
			--属性系数
			local AttrC = EquipIntensify.AttrCoefficient[attrData.KeyName]
			if AttrC then
				local LastFormule = inte_tb.InteRange
				sLuaApp:LuaDbg(LastFormule)
				--最终系数
				local Attr_Value = 0
				if type(LastFormule) == "string" then
					Attr_Value = assert(load("local IntensifLevel = "..next_level.." local formula = "..EquipIntensify.formula[EquipLevel].." local GradeCoefficient = "..GradeC.." local AttrCoefficient = "..AttrC.." local PositionCoefficient = "..PositionC.." local GuangCoefficient = "..GuangC.." return "..LastFormule)())
				else
					sLuaApp:NotifyTipsMsg(player, "未找到该等级装备强化配置公式")
					return ""
				end
				Attr_Value = math.floor(Attr_Value )
				--sLuaApp:LuaDbg("装备属性加值："..Attr_Value.."  type:"..type(Attr_Value))
				--sLuaApp:LuaDbg("v.attr："..v.attr.."  type:"..type(v.attr))
				--sLuaApp:LuaDbg("mark:"..mark)
				--sLuaApp:LuaDbg("EQUIP_IntensifyLevel:"..item:GetInt("EQUIP_IntensifyLevel"))
				item:SetDynAttr(mark,v.attr,Attr_Value)
			end
		end
		item:SetInt("EQUIP_IntensifyLevel", next_level)
		if isInherit ~= 1 then
			str = [[ if EquipEnhanceUI then
					EquipEnhanceUI.OnBuildSucces()
				end
			]]
		end
		--sLuaApp:LuaDbg(str)
		--sLuaApp:NotifyTipsMsg(player, "强化成功！该装备已强化至+"..next_level)
		--sLuaApp:LuaDbg(itemData.Type.."  "..itemData.Subtype.."   "..type(itemData.Subtype).." "..type(itemData.Type))
		if itemData.Type == 1 and itemData.Subtype == 1 then
			EquipLight.IntensifyLVLight(player, item)
		end
		sLuaApp:ShowForm(player, "脚本表单", str)
		if AttributeEnhance then
			AttributeEnhance.Equip_Strengthen_level(player)
		end
		if Achievement then
			Achievement.Equip_Achievement(player)
		end
		if SevenDayCallBack then
			SevenDayCallBack.Equip(player,item:GetInt("EQUIP_IntensifyLevel"))
		end
		return ""
	else
		local Reduce = safeMode == 1 and inte_tb.FailReduce_safe or inte_tb.FailReduce
		if type(Reduce) == "table" then
			Reduce = sLuaApp:RandInteger(Reduce[1], Reduce[2])
		end
		if type(Reduce) ~= "number" then
			sLuaApp:NotifyTipsMsg(player, "降级配置错误")
			return
		end
		if Reduce > 0 then
			Inte_level = Inte_level - Reduce
			local inte_tb = EquipIntensify.ConsumeConfig[Inte_level]
			if inte_tb == nil then
				sLuaApp:LuaErr("等级"..Inte_level.."的强化配置不存在")
				return
			end
			if inte_tb.InteRange == nil then
				sLuaApp:LuaErr("等级"..Inte_level.."的强化配置的InteRange不存在")
				return
			end
			--sLuaApp:LuaDbg("inte_tb['InteRange']:"..inte_tb["InteRange"])
			for k,v in ipairs(AttrList) do
				local attrData = AttrConfig.GetById(v.attr)
				--属性系数
				local AttrC = EquipIntensify.AttrCoefficient[attrData.KeyName]
				if AttrC then
					--最终系数
					--local LastC = GradeC * PositionC * AttrC
					local LastFormule = inte_tb.InteRange
					--sLuaApp:LuaDbg("最终系数值："..LastC)
					local Attr_Value = 0
					if type(LastFormule) == "string" then
						Attr_Value = assert(load("local IntensifLevel = "..Inte_level.." local formula = "..EquipIntensify.formula[EquipLevel].." local GradeCoefficient = "..GradeC.." local AttrCoefficient = "..AttrC.." local PositionCoefficient = "..PositionC.." local GuangCoefficient = "..GuangC.." return "..LastFormule)())
					else
						sLuaApp:NotifyTipsMsg(player, "未找到该等级装备强化配置公式")
						return ""
					end
					Attr_Value = math.floor(Attr_Value)
					--sLuaApp:LuaDbg("装备属性加值："..Attr_Value)
					item:SetDynAttr(mark,v.attr,Attr_Value)
				end
			end
		end
		local LuckAddition = item:GetInt("EQUIP_LuckAddition")
		if LuckAddition >= 6000 then
			item:SetInt("EQUIP_LuckAddition", 6000)
		else
			item:SetInt("EQUIP_LuckAddition", (LuckAddition + EquipIntensify.LuckyAddNum))
		end
		item:SetInt("EQUIP_IntensifyLevel", Inte_level)
		str = [[ if EquipEnhanceUI then
				EquipEnhanceUI.OnBuildFail()
			end
		]]
		if Reduce == 0 then
			sLuaApp:NotifyTipsMsg(player, "强化失败！强化等级未发生变化")
		else
			sLuaApp:NotifyTipsMsg(player, "强化失败！强化等级跌落至+"..Inte_level)
		end
		if itemData.Type == 1 and itemData.Subtype == 1 then
			EquipLight.IntensifyLVLight(player, item)
		end
		sLuaApp:ShowForm(player, "脚本表单", str)
		if AttributeEnhance then
			AttributeEnhance.Equip_Strengthen_level(player)
		end
		if Achievement then
			Achievement.Equip_Achievement(player)
		end
		return ""
	end
end

function EquipIntensify.SubItemIsBind(player, itemList, sender, reason, detail, bind)
	if not sender then
		sender = "system"
	end
	if not reason then
		reason = ""
	end
	if not detail then
		detail = ""
	end
	if itemList then
		for k,v in ipairs(itemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if itemList[k+1] then
						if type(itemList[k+1]) == "number" then
							num = itemList[k+1]
						end
					end
					if num > 0 then
						local itemID = sItemSystem:GetItemIdByKeyname(item)
						if sItemSystem:GetItemAmount(player, itemID, 3) >= num then
							sItemSystem:ConsumeItemWithPriority(player, itemID, num, bind, sender, reason, detail)
						else
							return false
						end
					end
				end		
			end
		end
		return true
	end
end

function EquipIntensify.CheckNeedBind(player, ItemList, bind, item_guid, bindMode, safeMode, guard_guid)
	if ItemList then
		local question = false
		for k,v in ipairs(ItemList) do
			local item = ""
			local num = 1
			if type(v) == "string" then
				item = v
				if item ~= "" then
					if ItemList[k+1] then
						if type(ItemList[k+1]) == "number" then
							num = ItemList[k+1]
						end
					end
					if num > 0 then
						local itemID = sItemSystem:GetItemIdByKeyname(item)
						if sItemSystem:GetItemAmount(player, itemID, 3) >= num then
							if sItemSystem:GetItemAmount(player, itemID, 1) < num then
								question = true
							else
								if sItemSystem:GetItemAmount(player, itemID, 2) > 0 then  
									if bind then
										question = true
									end
								end
							end
						end
					end
				end
			end		
		end
		if question then
			local str = [[GlobalUtils.ShowServerBoxMessage("您使用的道具中包含绑定道具，该操作会使您的装备变为绑定，是否继续？")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "EquipIntensify.Continue(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_guid..", "..bindMode..", "..safeMode..", "..guard_guid..")")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return "question"
		end
	end
	return false
end


function EquipIntensify.Continue(player, item_guid, bindMode, safeMode, guard_guid)
	--sLuaApp:LuaDbg("进入continue"..item_guid..", "..bindMode..", "..safeMode)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	item:SetBound()
	EquipIntensify.SubItemIntensify(player, item_guid, safeMode, bindMode, guard_guid)
end

function EquipIntensify.initialize()
	local dataTb = {}
	local resTable = {}
	local GuangTable = {}
	dataTb.Config = EquipIntensify.ConsumeConfig
	dataTb.AllowList = EquipIntensify.CanIntensifyList
	dataTb.MaxIntensifyLevel = EquipIntensify.MaxIntensifyLevel
	dataTb.formula = EquipIntensify.formula
	dataTb.AttrCoefficient = {}
	for k,v in pairs(EquipIntensify.AttrCoefficient) do
		dataTb.AttrCoefficient[AttrConfig.GetByKeyName(k).Id] = v
	end
	dataTb.GradeCoefficient = EquipIntensify.GradeCoefficient
	dataTb.Version = EquipIntensify.Version
	for k, v in ipairs(EquipIntensify.SubType_Tb) do
		resTable[k] = {}
		for m, n in pairs(v) do
			resTable[k][m] = n
		end
	end
	for k, v in ipairs(EquipIntensify.GuangCoefficient) do
		GuangTable[k] = {}
		for m, n in pairs(v) do
			GuangTable[k][m] = n
		end
	end
	dataTb.PositionCoefficient = resTable
	dataTb.GuangCoefficient = GuangTable
	--sLuaApp:LuaDbg(Lua_tools.serialize(dataTb))
	return dataTb
end

function EquipIntensify.initializeEx()
	local dataTb = {}
	local resTable = {}
	local GuangTable = {}
	dataTb.AllowList = EquipIntensify.CanIntensifyList
	dataTb.MaxIntensifyLevel = EquipIntensify.MaxIntensifyLevel
	dataTb.formula = EquipIntensify.formula
	dataTb.AttrCoefficient = {}
	for k,v in pairs(EquipIntensify.AttrCoefficient) do
		dataTb.AttrCoefficient[AttrConfig.GetByKeyName(k).Id] = v
	end
	dataTb.GradeCoefficient = EquipIntensify.GradeCoefficient
	dataTb.Version = EquipIntensify.Version
	for k, v in ipairs(EquipIntensify.SubType_Tb) do
		resTable[k] = {}
		for m, n in pairs(v) do
			resTable[k][m] = n
		end
	end
	for k, v in ipairs(EquipIntensify.GuangCoefficient) do
		GuangTable[k] = {}
		for m, n in pairs(v) do
			GuangTable[k][m] = n
		end
	end
	dataTb.GuangCoefficient = GuangTable
	dataTb.PositionCoefficient = resTable
	return dataTb
end

function EquipIntensify.player_on_login(player)
	--sLuaApp:LuaDbg("玩家上线发送装备强化最大等级配置")
	local str = [[
		UIDefine.MaxIntensifyLevel = ]]..EquipIntensify.MaxIntensifyLevel..[[
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--@newinter EquipIntensify.SetEquipIntensifyLevel(player, 360675717925372096, 10)
--isInherit 操作是否显示强化成功界面 传1为不显示，其他为显示
function EquipIntensify.SetEquipIntensifyLevel(player, item, lv, isInherit)
	--sLuaApp:LuaDbg("装备强化强化操作")
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中，无法执行该操作")
		return false
	end
	
	local IntensifyIsBind = true
	--local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	if not item:GetInt("EQUIP_IntensifyLevel") then
		item:SetInt("EQUIP_IntensifyLevel", 0)
	end
	
	local Inte_level = item:GetInt("EQUIP_IntensifyLevel")
	if Inte_level < 0 then
		Inte_level = 0
	end
	local next_level = 1
	if lv > 0 and lv <= EquipIntensify.MaxIntensifyLevel then
		next_level = lv
	else
		sLuaApp:NotifyTipsMsg(player, "装备等级超出强化上限或不合法")
		return false
	end
	--local next_level = Inte_level + 1
	if next_level > EquipIntensify.MaxIntensifyLevel then
		sLuaApp:NotifyTipsMsg(player, "您的装备等级已达最高级，无法再强化")
		return false
	end
	
	local inte_tb = EquipIntensify.ConsumeConfig[next_level]
	if not inte_tb then
		sLuaApp:LuaErr("强化配置"..next_level.."不存在")
		return false
	end
	if not inte_tb.InteRange then
		sLuaApp:LuaErr("强化等级"..next_level.."的InteRange不存在")
		return false
	end
	
	local keyName = item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(keyName)
	if itemData.Type ~= 1 then
		sLuaApp:NotifyTipsMsg(player, "并非装备，无法操作")
		return false
	end
	if itemData.Subtype == 4 then
		sLuaApp:NotifyTipsMsg(player, "该部位无法强化")
		return false
	end
	
	--装备类别
	local PositionC = 1
	local ItemSubType = tonumber(itemData.Subtype)
	local ItemSubType2 = tonumber(itemData.Subtype2)
	--sLuaApp:LuaDbg("SubType:"..ItemSubType.."  SubType2:"..ItemSubType2)
	if ItemSubType == 1 then
		PositionC = EquipIntensify.SubType_Tb[ItemSubType][0]
	else
		PositionC = EquipIntensify.SubType_Tb[ItemSubType][ItemSubType2]
	end
	if not PositionC then
		sLuaApp:LuaErr("装备强化中，部位系数表数据缺失")
		return false
	end
	--sLuaApp:LuaDbg("非绑定："..tostring(IntensifyIsBind))
	--sLuaApp:LuaDbg("装备是否绑定:"..tostring(item:IsBound()))
	
	--装备品级系数
	local EquipGrade = tonumber(itemData.Grade)
	local GradeC = EquipIntensify.GradeCoefficient[EquipGrade]
	--装备部位系数
	--local PositionC = EquipIntensify.PositionCoefficient[tonumber(ItemSubType)][Position]
	--local PositionC = EquipIntensify.SubType_Tb[ItemSubType][ItemSubType2]["Cof"]
	local EquipLevel = tonumber(itemData.Itemlevel)
	
	--是否是光无限武器
	local GuangC = 1
	if item:GetString("EquipCreateRule") ~= "" then
		if ItemSubType == 1 then
			GuangC = EquipIntensify.GuangCoefficient[ItemSubType][0]
		else
			GuangC = EquipIntensify.GuangCoefficient[ItemSubType][ItemSubType2]
		end
	end
	if not GuangC then
		sLuaApp:LuaErr("光无限装备系数不存在")
		return ""
	end
	
	if not GradeC then
		sLuaApp:LuaDbg("装备品级系数不存在")
		return false
	end
	if not PositionC then
		sLuaApp:LuaDbg("装备部位系数不存在")
		return false
	end
	
	local AttrList = item:GetDynAttrsByMark(0)
	local mark = EquipAttrClassify.EquipIntensify or 10
	local LuckAddition = item:GetInt("EQUIP_LuckAddition") or 0
	item:SetInt("EQUIP_LuckAddition", 0)
	for k,v in ipairs(AttrList) do
		--sLuaApp:LuaDbg(type(v.attr)..v.attr)
		local attrData = AttrConfig.GetById(v.attr)
		--属性系数
		local AttrC = EquipIntensify.AttrCoefficient[attrData.KeyName]
		if AttrC then
			local LastFormule = inte_tb.InteRange
			--最终系数
			local Attr_Value = 0
			if type(LastFormule) == "string" then
				Attr_Value = assert(load("local IntensifLevel = "..next_level.." local formula = "..EquipIntensify.formula[EquipLevel].." local GradeCoefficient = "..GradeC.." local AttrCoefficient = "..AttrC.." local PositionCoefficient = "..PositionC.." local GuangCoefficient = "..GuangC.." return "..LastFormule)())
			else
				sLuaApp:NotifyTipsMsg(player, "未找到该等级装备强化配置公式")
				return false
			end
			Attr_Value = math.floor(Attr_Value )
			--sLuaApp:LuaDbg("装备属性加值："..Attr_Value.."  type:"..type(Attr_Value))
			--sLuaApp:LuaDbg("v.attr："..v.attr.."  type:"..type(v.attr))
			--sLuaApp:LuaDbg("mark:"..mark)
			--sLuaApp:LuaDbg("EQUIP_IntensifyLevel:"..item:GetInt("EQUIP_IntensifyLevel"))
			item:SetDynAttr(mark,v.attr,Attr_Value)
		end
	end
	item:SetInt("EQUIP_IntensifyLevel", next_level)
	if player:GetType() == GUID_PLAYER then
		if isInherit ~= 1 then
			local str = [[ if EquipEnhanceUI then
					EquipEnhanceUI.OnBuildSucces()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
	--sLuaApp:NotifyTipsMsg(player, "强化成功！该装备已强化至+"..next_level)
	--sLuaApp:LuaDbg(itemData.Type.."  "..itemData.Subtype.."   "..type(itemData.Subtype).." "..type(itemData.Type))
	if itemData.Type == 1 and itemData.Subtype == 1 then
		EquipLight.IntensifyLVLight(player, item)
	end
	
	if AttributeEnhance then
		AttributeEnhance.Equip_Strengthen_level(player)
	end
	if Achievement then
		Achievement.Equip_Achievement(player)
	end
	return true
end

function EquipIntensify.CheckRedPoint(player)
	local TB_EquipIntensify = {}
	local WhetherRedPoint = "false"
	local record = 0
	--local ItemContainer_TB = {1,5}			--1指背包  5指装备中
	local Bag_ItemContainer = player:GetItemContainer(1)
	local Bag_ItemList = Bag_ItemContainer:GetItemList() 
	TB_EquipIntensify["Bag"] = {}
	for k,v in pairs(Bag_ItemList) do
		local keyName = v:GetKeyName()
		local itemData = ItemConfig.GetByKeyName(keyName)
		local CanIntensify = false
		local guid = tostring(v:GetGUID())
		if itemData.Type == 1 and itemData.Subtype ~= 4 and itemData.Subtype ~= 7 then
			CanIntensify = EquipIntensify.CheckCanIntensify_RedPoint(player, v)
			if CanIntensify == true and record == 0 then
				WhetherRedPoint = "true"
				record = 1
			end
			local TB = {}
			TB["ConsumeItem"] = {}
			TB["Consume"] = {}	
			local Level = v:GetInt("EQUIP_IntensifyLevel")
			if Level >= 0 and Level < EquipIntensify.MaxIntensifyLevel then
				Level = Level + 1
			end
			if EquipIntensify.ConsumeConfig[Level] then
				TB["ConsumeItem"] = EquipIntensify.ConsumeConfig[Level].ItemList
				TB["Consume"].MoneyType = EquipIntensify.ConsumeConfig[Level].MoneyType
				TB["Consume"].MoneyVal = EquipIntensify.ConsumeConfig[Level].MoneyVal
			end
			if not TB_EquipIntensify["Bag"][guid] then
				TB_EquipIntensify["Bag"][guid] = {}
			end
			TB["CanIntensify"] = tostring(CanIntensify)
			table.insert(TB_EquipIntensify["Bag"][guid], TB)
		end
	end
	
	local Equip_ItemContainer = player:GetItemContainer(5)
	local Equip_ItemList = Equip_ItemContainer:GetItemList() 
	TB_EquipIntensify["Equip"] = {}
	for k,v in pairs(Equip_ItemList) do
		local keyName = v:GetKeyName()
		local itemData = ItemConfig.GetByKeyName(keyName)
		local CanIntensify = false
		local guid = tostring(v:GetGUID())
		if itemData.Type == 1 and itemData.Subtype ~= 4 and itemData.Subtype ~= 7 then
			CanIntensify = EquipIntensify.CheckCanIntensify_RedPoint(player, v)
			if CanIntensify == true and record == 0 then
				WhetherRedPoint = "true"
				record = 1
			end
			local TB = {}
			TB["ConsumeItem"] = {}
			TB["Consume"] = {}	
			local Level = v:GetInt("EQUIP_IntensifyLevel")
			if Level >= 0 and Level < EquipIntensify.MaxIntensifyLevel then
				Level = Level + 1
			end
			if EquipIntensify.ConsumeConfig[Level] then
				TB["ConsumeItem"] = EquipIntensify.ConsumeConfig[Level].ItemList
				TB["Consume"].MoneyType = EquipIntensify.ConsumeConfig[Level].MoneyType
				TB["Consume"].MoneyVal = EquipIntensify.ConsumeConfig[Level].MoneyVal
			end
			if not TB_EquipIntensify["Equip"][guid] then
				TB_EquipIntensify["Equip"][guid] = {}
			end
			TB["CanIntensify"] = tostring(CanIntensify)
			table.insert(TB_EquipIntensify["Equip"][guid], TB)
		end
	end
	TB_EquipIntensify["ClientCheckItem"] = EquipIntensify.ClientCheckItem
	TB_EquipIntensify["ConsumeConfig"] = EquipIntensify.ConsumeConfig
	TB_EquipIntensify["MaxIntensifyLevel"] = EquipIntensify.MaxIntensifyLevel
	TB_EquipIntensify["WhetherRedPoint"] = WhetherRedPoint
	return TB_EquipIntensify
end

function EquipIntensify.CheckCanIntensify_RedPoint(player, item)
	
	if not item:GetInt("EQUIP_IntensifyLevel") then
		item:SetInt("EQUIP_IntensifyLevel", 0)
	end
	
	local Inte_level = item:GetInt("EQUIP_IntensifyLevel")
	if Inte_level < 0 then
		Inte_level = 0
	end
	local next_level = 1
	if Inte_level >= 0 and Inte_level < EquipIntensify.MaxIntensifyLevel then
		next_level = Inte_level + 1
	else
		--sLuaApp:NotifyTipsMsg(player, "装备等级超出强化上限或不合法")
		return false
	end
	if next_level >= EquipIntensify.MaxIntensifyLevel then
		--sLuaApp:NotifyTipsMsg(player, "您的装备等级已达最高级，无法再强化")
		return false
	end
	
	--强化消耗
	local inte_tb = EquipIntensify.ConsumeConfig[next_level]
	if not inte_tb then
		--sLuaApp:NotifyTipsMsg(player, "强化配置"..next_level.."不存在")
		return false
	end
	
	if Lua_tools.IsMoneyEnough(player, inte_tb.MoneyType, inte_tb.MoneyVal) == false then
		--sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(inte_tb.MoneyType).."不足，不能强化")
		return false
	end
	local ConsumeKeyName = EquipIntensify.ConsumeConfig[next_level]["ItemList"][1]
	local ConsumeNum = EquipIntensify.ConsumeConfig[next_level]["ItemList"][2]
	if ConsumeKeyName and ConsumeNum then
		if sItemSystem:GetItemAmount(player, sItemSystem:GetItemIdByKeyname(ConsumeKeyName), 3) < ConsumeNum then
			--sLuaApp:NotifyTipsMsg(player, "强化道具不足，不能强化")
			return false
		end
	end
	return true
end

function EquipIntensify.Initialization()
	local TB = {}
	if not EquipIntensify.ClientCheckItem then
		EquipIntensify.ClientCheckItem = {}
	end
	if EquipIntensify.ConsumeConfig then
		for i = 1, #EquipIntensify.ConsumeConfig do
			if EquipIntensify.ConsumeConfig[i] then
				if EquipIntensify.ConsumeConfig[i].ItemList then
					for k, v in pairs(EquipIntensify.ConsumeConfig[i].ItemList) do
						if type(v) == "string" then
							--table.insert(EquipIntensify.ClientCheckItem, v)
							if not TB[v] then
								TB[v] = v
							end
						end
					end
				end
			end
		end
	end
	for k, v in pairs(TB) do
		table.insert(EquipIntensify.ClientCheckItem, v)
	end
	--sLuaApp:LuaErr(Lua_tools.serialize(EquipIntensify.ClientCheckItem))
end

EquipIntensify.Initialization()