PetArtiSynthesis = {}

PetArtiSynthesis.Config = {
	AttrTab = {
		{Title = '全部属性', Subtype2 = 0},
		{Title = '多属性', Subtype2 = 1, SynTag = 2},
		{Title = '抗火', Subtype2 = 2, SynTag = 1},
		{Title = '抗风', Subtype2 = 3, SynTag = 1},
		{Title = '抗水', Subtype2 = 4, SynTag = 1},
		{Title = '抗雷', Subtype2 = 5, SynTag = 1},
		{Title = '抗物理', Subtype2 = 6, SynTag = 1},
		{Title = '抗混乱', Subtype2 = 7, SynTag = 1},
		{Title = '抗中毒', Subtype2 = 8, SynTag = 1},
		{Title = '抗昏睡', Subtype2 = 9, SynTag = 1},
		{Title = '抗封印', Subtype2 = 10, SynTag = 1},
		{Title = '抗遗忘', Subtype2 = 11, SynTag = 1},
		{Title = '抗鬼火', Subtype2 = 12, SynTag = 1},	
	},
	SynTagConfig = {
		[1] = {
			Level_2 = {MoneyType = 5, MoneyVal = 2000},
			Level_3 = {MoneyType = 5, MoneyVal = 4500},
			Level_4 = {MoneyType = 5, MoneyVal = 9000},
			Level_5 = {MoneyType = 5, MoneyVal = 12500},
			Level_6 = {MoneyType = 5, MoneyVal = 18000},
			Level_7 = {MoneyType = 5, MoneyVal = 24500},
			Level_8 = {MoneyType = 5, MoneyVal = 32000},
			Level_9 = {MoneyType = 5, MoneyVal = 40500},
			Level_10 = {MoneyType = 5, MoneyVal = 100000},
			Level_11 = {MoneyType = 5, MoneyVal = 150000},
			Level_12 = {MoneyType = 5, MoneyVal = 200000},
			Level_13 = {MoneyType = 5, MoneyVal = 500000},
			},
		[2] = {
			Level_2 = {MoneyType = 5, MoneyVal = 100000},
			Level_3 = {MoneyType = 5, MoneyVal = 200000},
			Level_4 = {MoneyType = 5, MoneyVal = 500000},
			Level_5 = {MoneyType = 5, MoneyVal = 1000000},
			},
	},
}

function PetArtiSynthesis.GetConfig(player)
	if not PetArtiSynthesis.ConfigStr then
		PetArtiSynthesis.ConfigStr = Lua_tools.serialize(PetArtiSynthesis.Config)
	end
	local str = [[if PetStoneRefineUI then
		PetStoneRefineUI.GetConfig(]]..PetArtiSynthesis.ConfigStr..[[)
	end]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function PetArtiSynthesis.Start(player, item_1, item_2)
	item_1 = tonumber(item_1)
	item_2 = tonumber(item_2)
	local item_a = sItemSystem:GetItemByGUID(item_1)
	local item_b = sItemSystem:GetItemByGUID(item_2)
	if not item_a then
		sLuaApp:LuaDbg("非有效的精炼目标")
		return
	end
	if not item_b then
		sLuaApp:LuaDbg("非有效的祭品")
		return
	end
	local playerGUID = player:GetGUID()
	if item_a:GetOwnerGUID() ~= playerGUID then
		sLuaApp:NotifyTipsMsg(player, "无效的道具")
		return
	end
	if item_b:GetOwnerGUID() ~= playerGUID then
		sLuaApp:NotifyTipsMsg(player, "无效的道具")
		return
	end
	
	local Id_1 = item_a:GetId()
	local Id_2 = item_b:GetId()
	
	if PetArtiSynthesis.Check(Id_1, Id_2) == false then
		sLuaApp:NotifyTipsMsg(player, "祭品与精炼目标不匹配")
		return
	end
	
	local Data_1 = ItemConfig.GetById(Id_1)

	local SynTag = PetArtiSynthesis.GetTag(Data_1.Subtype2)

	local itemLevel = Data_1.Itemlevel
	
	sLuaApp:LuaDbg("Subtype2 = " ..Data_1.Subtype2)
	sLuaApp:LuaDbg("itemLevel = " .. itemLevel)
	sLuaApp:LuaDbg("SynTag = " .. SynTag)
	
	local ConsumConfig = PetArtiSynthesis.Config.SynTagConfig[SynTag]['Level_'..(itemLevel+1)]
	if not ConsumConfig then
		sLuaApp:NotifyTipsMsg(player, "该炼妖石已经无法再进行精炼了")
		return
	end
	if SynTag == 1 then
		if Lua_tools.SubMoney(player, ConsumConfig.MoneyType, ConsumConfig.MoneyVal, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1)) == false then
			sLuaApp:NotifyTipsMsg(player, "您需要更多的"..Lua_tools.GetMoneyName(ConsumConfig.MoneyType))
			return
		end
		local ran = sLuaApp:RandInteger(1,10000)
		local newID = ran>5000 and (Id_1+1) or (Id_2+1)
		local bind = false
		if item_a:IsBound() == true then
			bind = true
		elseif item_b:IsBound() == true then
			bind = true
		end
		sItemSystem:ConsumeItem(item_a, 1, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))
		sItemSystem:ConsumeItem(item_b, 1, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))
		local item = sItemSystem:AddItemEx(player, newID, 1, bind, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))[1]
		
		sLuaApp:ShowForm(player, "脚本表单", "PetStoneRefineUI.RefineSuccess('"..item:GetGUID().."')")
		sLuaApp:NotifyTipsMsg(player, "合成成功")
	elseif SynTag == 2 then
		if Lua_tools.SubMoney(player, ConsumConfig.MoneyType, ConsumConfig.MoneyVal, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1)) == false then
			sLuaApp:NotifyTipsMsg(player, "您需要更多的"..Lua_tools.GetMoneyName(ConsumConfig.MoneyType))
			return
		end
		local ran = sLuaApp:RandInteger(1,10000)
		local newID = Id_1+1

		newID = newID + 10*math.ceil(ran/2500)
		if newID > 27240 then
			newID = newID - 40
		end

		local bind = false
		if item_a:IsBound() == true then
			bind = true
		elseif item_b:IsBound() == true then
			bind = true
		end
		sItemSystem:ConsumeItem(item_a, 1, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))
		sItemSystem:ConsumeItem(item_b, 1, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))
		
		local item = sItemSystem:AddItemEx(player, newID, 1, bind, "system", "炼妖石合成", "合成等级 = " .. (itemLevel+1))[1]
		
		sLuaApp:ShowForm(player, "脚本表单", "PetStoneRefineUI.RefineSuccess('"..item:GetGUID().."')")
		sLuaApp:NotifyTipsMsg(player, "合成成功")
	end
end

function PetArtiSynthesis.Check(Id_1, Id_2)
	local Data_1 = ItemConfig.GetById(Id_1)
	local Data_2 = ItemConfig.GetById(Id_2)
	
	if not Data_1 then
		return false
	end
	if not Data_2 then
		return false
	end
	if Data_1.Type ~= 7 or Data_2.Type ~= 7 then
		return false
	end
	if Data_1.Subtype ~= 2 or Data_2.Subtype ~= 2 then
		return false
	end
	if Data_1.Itemlevel ~= Data_2.Itemlevel then
		sLuaApp:LuaDbg(Data_1.Itemlevel.." ~= " .. Data_2.Itemlevel)
		return false
	end
	if PetArtiSynthesis.GetTag(Data_1.Subtype2) then
		if PetArtiSynthesis.GetTag(Data_1.Subtype2) ~= PetArtiSynthesis.GetTag(Data_2.Subtype2) then
			sLuaApp:LuaDbg(PetArtiSynthesis.GetTag(Data_1.Subtype2).." ~= " .. PetArtiSynthesis.GetTag(Data_2.Subtype2))
			return false
		end
	end
	return true
end

function PetArtiSynthesis.GetTag(Subtype2)
	for k,v in ipairs(PetArtiSynthesis.Config.AttrTab) do
		if Subtype2 == v.Subtype2 then
			return v.SynTag
		end
	end
	return nil
end