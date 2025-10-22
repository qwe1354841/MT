--密藏
SeasonPass = {}

--如果配置文件修改路径, 此处也要一并修改
require("system/SeasonPassConfig")

function SeasonPass.GetInitializedData(player)
	if not SeasonPassConfig.Item then
		return
	end
	if not SeasonPassConfig.LevelUpExp then
		return
	end
	local time = sDBVarSystem:GetInt("RechargeSystem_SeasonPass_ActingState")
	if not time or not SeasonPassConfig.Time or not SeasonPassConfig.Time[time] or not SeasonPassConfig.Time[time + 1] then
		return
	end
	if not SeasonPassConfig.Switch or SeasonPassConfig.Switch ~= "on" then
		return
	end
	if not SeasonPassConfig.PriceConfig then
		return
	end
	if not SeasonPassConfig.MaxLevel then
		return
	end
	if not SeasonPassConfig.GoodRewardLevel then
		return
	end
	if not SeasonPassConfig.ExchangeShop then
		return
	end
	if not SeasonPassConfig.NormalItem then
		return
	end
	if not SeasonPassConfig.LuxuriousItem then
		return
	end
	
	local QuestList = SeasonPass.GetQuestList(player)
	if not QuestList then
		return
	end
	local PersonalQuestInfo = SeasonPass.GetPersonalQuestInfo(player)
	if not PersonalQuestInfo or not next(PersonalQuestInfo) then
		return
	end
	local TB = SeasonPass.TakeTable(player)
	local HighRefreshRateDataTB = SeasonPass.HighRefreshRateData(player)
	if not TB or not HighRefreshRateDataTB then
		return ""
	end
	local ExchangeTB = SeasonPass.GetPersonalExchangeShopInfo(player)
	if not ExchangeTB then
		return ""
	end
	if Lua_tools then
		local str = [[
			if SeasonPassUI then
				if not SeasonPassUI.RewardItem then
					SeasonPassUI.RewardItem = {}
				end
				if not SeasonPassUI.PlayerInfo then
					SeasonPassUI.PlayerInfo = {}
				end
				if not SeasonPassUI.QuestList then
					SeasonPassUI.QuestList = {}
				end
				SeasonPassUI.RewardItem = ]]..Lua_tools.serialize(SeasonPassConfig.Item)..[[
				SeasonPassUI.LevelUpExp = ]]..SeasonPassConfig.LevelUpExp..[[
				SeasonPassUI.Time = ]]..Lua_tools.serialize({SeasonPassConfig.Time[time], SeasonPassConfig.Time[time+1]})..[[
				SeasonPassUI.PriceConfig = ]]..Lua_tools.serialize(SeasonPassConfig.PriceConfig)..[[
				SeasonPassUI.MaxLevel = ]]..SeasonPassConfig.MaxLevel..[[
				SeasonPassUI.GoodRewardLevel = ]]..SeasonPassConfig.GoodRewardLevel..[[
				SeasonPassUI.BuyLevelCost = ]]..SeasonPassConfig.BuyLevelCost..[[
				SeasonPassUI.ExchangeShopRoughInfo = ]]..Lua_tools.serialize(SeasonPassConfig.ExchangeShop)..[[
				SeasonPassUI.QuestList = ]]..Lua_tools.serialize(QuestList)..[[
				SeasonPassUI.PersonalQuestInfo = ]]..Lua_tools.serialize(PersonalQuestInfo)..[[
				SeasonPassUI.ReceivedItem = ]]..Lua_tools.serialize(TB)..[[
				SeasonPassUI.PlayerInfo = ]]..Lua_tools.serialize(HighRefreshRateDataTB)..[[
				SeasonPassUI.PersonalExchangeInfo = ]]..Lua_tools.serialize(ExchangeTB)..[[
				SeasonPassUI.NormalItem = ]]..Lua_tools.serialize(SeasonPassConfig.NormalItem)..[[
				SeasonPassUI.LuxuriousItem = ]]..Lua_tools.serialize(SeasonPassConfig.LuxuriousItem)..[[
				SeasonPassUI.RefreshServerData()
				SeasonPassUI.CreateMainPage()
			end ]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:LuaErr("没有Lua_tools")
	end
	return ""
end

function SeasonPass.GetData(player, pageNum)
	pageNum = tonumber(pageNum)
	local TB = SeasonPass.TakeTable(player)
	local HighRefreshRateDataTB = SeasonPass.HighRefreshRateData(player)
	if not TB or not HighRefreshRateDataTB then
		return ""
	end
	local PersonalQuestInfo = SeasonPass.GetPersonalQuestInfo(player)
	if not PersonalQuestInfo or not next(PersonalQuestInfo) then
		return
	end
	local QuestList = SeasonPass.GetQuestList(player)
	if not QuestList then
		return
	end
	if Lua_tools then
		local str = [[
			if SeasonPassUI then
				if not SeasonPassUI.PlayerInfo then
					SeasonPassUI.PlayerInfo = {}
				end
				SeasonPassUI.ReceivedItem = ]]..Lua_tools.serialize(TB)..[[
				SeasonPassUI.PlayerInfo = ]]..Lua_tools.serialize(HighRefreshRateDataTB)..[[
				SeasonPassUI.PersonalQuestInfo = ]]..Lua_tools.serialize(PersonalQuestInfo)..[[
				SeasonPassUI.QuestList = ]]..Lua_tools.serialize(QuestList)..[[
				SeasonPassUI.RefreshServerData()
			end ]]
		if pageNum then
			str = str..[[
				if SeasonPassUI then
					SeasonPassUI.ServertabList(]]..pageNum..[[,3)
				end
			]]
		end
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:LuaErr("没有Lua_tools")
	end
	return ""
end

function SeasonPass.HighRefreshRateData(player)
	if not SeasonPassConfig.MaxLevel then
		return nil
	end
	local TB = {}
	TB.Level = player:GetInt("SeasonPassLevel")
	TB.Exp = player:GetInt("SeasonPassExp")
	TB.TokenOwn = player:GetInt("SeasonPassTokenOwn")
	if TB.Level == 0 then
		TB.Level = 1
		player:SetInt("SeasonPassLevel", 1)
	end
	TB.Bought = player:GetString("SeasonPassBuy")
	TB.LuxuriousBought = player:GetString("SeasonPassLuxuriousBuy")
	if TB.Bought == "" then
		TB.Bought = "false"
	end
	if TB.LuxuriousBought == "" then
		TB.LuxuriousBought = "false"
	end
	return TB
end

function SeasonPass.TakeTable(player)
	local TB = {}
	for i = 1, SeasonPassConfig.MaxLevel do
		for j = 1, 3 do
			local TOF = player:GetString("SeasonPassReceivedItem"..tostring(i).."_"..tostring(j))
			if TOF == "true" then
				if not TB[tostring(i)] then
					TB[tostring(i)] = {}
				end
				table.insert(TB[tostring(i)], j)
			end
		end
	end
	return TB
end

function SeasonPass.GetQuestList(player)
	if not SeasonPassConfig.QuestList or not next(SeasonPassConfig.QuestList) then
		return nil
	end
	local RoleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
	local RoleReincarnation = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local TB = {["DailyQuest"] = {},["WeeklyQuest"] = {},["OnceQuest"] = {},}
	for k, v in pairs(SeasonPass.QuestIdList) do
		local Unlock = v.Unlock
		if Unlock and next(Unlock) then
			if not Unlock.RoleAttrReincarnation or Unlock.RoleAttrReincarnation <= RoleReincarnation then
				if Unlock.RoleLevel and Unlock.RoleLevel <= RoleLevel then
					table.insert(TB[v.Type], v)
				elseif not Unlock.RoleLevel then
					table.insert(TB[v.Type], v)
				end
			end
		else
			table.insert(TB[v.Type], v)
		end
	end
	return TB
end

function SeasonPass.GetPersonalQuestInfo(player)
	local TB = {}
	for i = 1, #SeasonPassConfig.QuestList.DailyQuest do
		local Id = tostring(SeasonPassConfig.QuestList.DailyQuest[i].Id)
		if not TB[Id] then
			TB[Id] = {}
		end
		local para = SeasonPass.GetQuestProgress(player, Id)
		local FinishQuest = player:GetDayString("SeasonPassFinishQuest_"..Id)
		if FinishQuest == "" then
			FinishQuest = "false"
		end
		TB[Id].Count = para
		TB[Id].ShowCount = math.floor(para/SeasonPassConfig.QuestList.DailyQuest[i].Coefficient)
		TB[Id].FinishQuest = FinishQuest
	end
	for i = 1, #SeasonPassConfig.QuestList.WeeklyQuest do
		local Id = tostring(SeasonPassConfig.QuestList.WeeklyQuest[i].Id)
		if not TB[Id] then
			TB[Id] = {}
		end
		local para = SeasonPass.GetQuestProgress(player, Id)
		local FinishQuest = player:GetWeekString("SeasonPassFinishQuest_"..Id)
		if FinishQuest == "" then
			FinishQuest = "false"
		end
		TB[Id].Count = para
		TB[Id].ShowCount = math.floor(para/SeasonPassConfig.QuestList.WeeklyQuest[i].Coefficient)
		TB[Id].FinishQuest = FinishQuest
	end
	for i = 1, #SeasonPassConfig.QuestList.OnceQuest do
		local Id = tostring(SeasonPassConfig.QuestList.OnceQuest[i].Id)
		if not TB[Id] then
			TB[Id] = {}
		end
		local para = SeasonPass.GetQuestProgress(player, Id)
		local FinishQuest = player:GetString("SeasonPassFinishQuest_"..Id)
		if FinishQuest == "" then
			FinishQuest = "false"
		end
		TB[Id].Count = para
		TB[Id].ShowCount = math.floor(para/SeasonPassConfig.QuestList.OnceQuest[i].Coefficient)
		TB[Id].FinishQuest = FinishQuest
	end
	return TB
end

function SeasonPass.GetSingleItem(player, para1, para2)
	para1 = tonumber(para1)
	para2 = tonumber(para2)
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	local Level = player:GetInt("SeasonPassLevel")
	if Level < para1 then
		sLuaApp:NotifyTipsMsg(player, "等级不足，无法领取")
		return ""
	end
	local itemList = SeasonPass.ItemData(para1, para2)  --{keyname, num}
	if not itemList then
		--sLuaApp:NotifyTipsMsg(player, "数据错误")
		sLuaApp:LuaErr("数据错误")
		return ""
	elseif not next(itemList) then
		sLuaApp:NotifyTipsMsg(player, "没有可获取奖励")
		return ""
	end
	local TOF = player:GetString("SeasonPassReceivedItem"..tostring(para1).."_"..tostring(para2))
	if TOF == "true" then
		sLuaApp:NotifyTipsMsg(player, "已经领取过奖励了")
		return ""
	elseif TOF == "false" or TOF == "" then
		local itemKeyName = itemList[1]
		if itemKeyName ~= "密藏代币" then
			Lua_tools.AddItem(player, itemList)
		else
			local val = itemList[2]
			SeasonPass.GetToken(player, val)
		end
		player:SetString("SeasonPassReceivedItem"..tostring(para1).."_"..tostring(para2), "true")
		SeasonPass.UpdateReceivedItem(player, para1, para2)
		SeasonPass.SeasonPassRedPointRefresh(player)

		local HighRefreshRateDataTB = SeasonPass.HighRefreshRateData(player)
		if not HighRefreshRateDataTB then
			return ""
		end
		local str = [[
			if SeasonPassUI then
				SeasonPassUI.PlayerInfo = ]]..Lua_tools.serialize(HighRefreshRateDataTB)..[[
			end ]]
		sLuaApp:ShowForm(player, "脚本表单", str)
		return ""
	end
	return ""
end

function SeasonPass.GetAllItem(player, para1)		--para1  等级
	para1 = tonumber(para1)
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	local Level = player:GetInt("SeasonPassLevel")
	if Level < para1 then
		sLuaApp:NotifyTipsMsg(player, "等级不足，无法领取")
		return ""
	end
	local AddItemList, itemList, Token = SeasonPass.AllCanReceivedItemData(player, para1)  --{keyname, num}
	if not AddItemList then
		--sLuaApp:NotifyTipsMsg(player, "数据错误")
		sLuaApp:LuaErr("数据错误")
		return ""
	elseif not next(AddItemList) and Token == 0 then
		sLuaApp:NotifyTipsMsg(player, "没有可获取奖励")
		return ""
	end
	for k,v in pairs(itemList) do
		for m,n in pairs(v) do
			player:SetString("SeasonPassReceivedItem"..k.."_"..tostring(n), "true")
		end
	end
	Lua_tools.AddItem(player, AddItemList)
	if Token ~= 0 then
		SeasonPass.GetToken(player, Token)
		SeasonPass.GetData(player, 1)
	else
		SeasonPass.GetData(player, 1)
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
	return ""
end

function SeasonPass.UpdateReceivedItem(player, para1, para2)
	local str = [[
		if SeasonPassUI then
			SeasonPassUI.UpdateReceivedItem(]]..para1..[[,]]..para2..[[)
		end ]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

function SeasonPass.ItemData(para1, para2)
	para1 = tonumber(para1)
	para2 = tonumber(para2)
	if not para1 or not para2 then
		return nil
	end
	if not SeasonPassConfig.Item[para1] then
		sLuaApp:NotifyTipsMsg(player, "数据错误")
		sLuaApp:LuaErr("数据错误")
		return nil
	end
	local itemList = nil
	if para2 == 1 then
		itemList = SeasonPassConfig.Item[para1].LowValue
	elseif para2 == 2 then
		itemList = SeasonPassConfig.Item[para1].HighValue[1]
	elseif para2 == 3 then
		itemList = SeasonPassConfig.Item[para1].HighValue[2]
	end
	return itemList
end

function SeasonPass.AllCanReceivedItemData(player, para1)
	para1 = tonumber(para1)
	if not para1 then
		return nil
	end
	local Bought = player:GetString("SeasonPassBuy")
	if Bought == "" then
		Bought = "false"
	end
	local itemList = {}
	local TB = {}
	local Token = 0
	local Level = player:GetInt("SeasonPassLevel")
	if Level < para1 then
		sLuaApp:LuaErr("数据错误  全部领取等级有误")
		return nil
	end
	if Bought == "true" then
		for i = 1, para1 do
			for j = 1, 3 do
				local TOF = player:GetString("SeasonPassReceivedItem"..tostring(i).."_"..tostring(j))
				local ListTB = {}
				if TOF ~= "true" then
					if not TB[tostring(i)] then
						TB[tostring(i)] = {}
					end
					if j == 1 then
						ListTB = SeasonPassConfig.Item[i].LowValue
					elseif j == 2 then
						ListTB = SeasonPassConfig.Item[i].HighValue[1]
					elseif j == 3 then
						ListTB = SeasonPassConfig.Item[i].HighValue[2]
					end
					if ListTB and next(ListTB) then
						if ListTB[1] ~= "密藏代币" then
							for k,v in pairs(ListTB) do
								table.insert(itemList, v)
							end
						else
							Token = Token + ListTB[2]
						end
						table.insert(TB[tostring(i)], j)
					end
				end
			end
		end
	else
		for i = 1, para1 do
			local TOF = player:GetString("SeasonPassReceivedItem"..tostring(i).."_1")
			local ListTB = {}
			if TOF ~= "true" then
				if not TB[tostring(i)] then
					TB[tostring(i)] = {}
				end
				ListTB = SeasonPassConfig.Item[i].LowValue
				if ListTB and next(ListTB) then
					if ListTB[1] ~= "密藏代币" then
						for k,v in pairs(ListTB) do
							table.insert(itemList, v)
						end
					else
						Token = Token + ListTB[2]
					end
					table.insert(TB[tostring(i)], 1)
				end
			end
		end
	end
	return itemList, TB, Token
end

--客户端-任务页点击"完成"按钮后触发
function SeasonPass.FinishQuest(player, Quest_Id)
	Quest_Id = tonumber(Quest_Id)
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	if Quest_Id and SeasonPass.QuestIdList[tostring(Quest_Id)] then
		local QuestProgress = SeasonPass.GetQuestProgress(player, Quest_Id)
		if QuestProgress >= SeasonPass.QuestIdList[tostring(Quest_Id)].Count then
			local QuestStatus, QuestType = SeasonPass.GetQuestStatus(player, Quest_Id)
			if QuestStatus ~= "true" then
				local Num = SeasonPass.QuestIdList[tostring(Quest_Id)].Exp
				local result = SeasonPass.AddSeasonPassExp(player, Quest_Id, QuestType, Num)
				if result == "true" then
					sLuaApp:NotifyTipsMsg(player, "经验获取成功")
					SeasonPass.GetData(player, 2)
				elseif result == "MaxLevel" then
					sLuaApp:NotifyTipsMsg(player, "密藏等级已到上限")
					SeasonPass.GetData(player, 2)
				end
			end
		end
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
	return ""
end

--用于获取特定任务完成状态
function SeasonPass.GetQuestStatus(player, Quest_Id)
	Quest_Id = tonumber(Quest_Id)
	if SeasonPass.QuestIdList[tostring(Quest_Id)] then
		local Quest_Type = SeasonPass.QuestIdList[tostring(Quest_Id)].Type
		local FinishQuest = "true"
		if Quest_Type == "DailyQuest" then
			FinishQuest = player:GetDayString("SeasonPassFinishQuest_"..Quest_Id)
		elseif Quest_Type == "WeeklyQuest" then
			FinishQuest = player:GetWeekString("SeasonPassFinishQuest_"..Quest_Id)
		elseif Quest_Type == "OnceQuest" then
			FinishQuest = player:GetString("SeasonPassFinishQuest_"..Quest_Id)
		end
		return FinishQuest, Quest_Type
	end
	return "true", ""		--"true"代表该任务已经完成
end

--用于获取特定任务完成进度
function SeasonPass.GetQuestProgress(player, Quest_Id)
	Quest_Id = tonumber(Quest_Id)
	if not player or not Quest_Id then
		return ""
	end
	local CurCount = 0
	local QuestInfo = SeasonPass.QuestIdList[tostring(Quest_Id)]
	if not QuestInfo then
		sLuaApp:LuaErr("没有QuestInfo, 配置文件有误")
		return ""
	end
	if SeasonPassConfig.QuestKeyWord and SeasonPassConfig.QuestKeyWord[tostring(Quest_Id)] then
		if SeasonPassConfig.QuestKeyWord[tostring(Quest_Id)] then
			local str_factor = [[
				local playerGuid = ]]..player:GetGUID()..[[
			]]
			assert(load(str_factor.." "..SeasonPassConfig.QuestKeyWord[tostring(Quest_Id)]))()
		end
	end
	if QuestInfo.QuestId and type(QuestInfo.QuestId) == "number" then
		local quest_state = sQuestSystem:IsFinished(player, QuestInfo.QuestId)
		if quest_state then
			CurCount = 1
		end
	else
		if QuestInfo.Type == "DailyQuest" then
			CurCount = player:GetDayInt("SeasonPassQuest_"..Quest_Id)
		elseif QuestInfo.Type == "WeeklyQuest" then
			CurCount = player:GetWeekInt("SeasonPassQuest_"..Quest_Id)
		elseif QuestInfo.Type == "OnceQuest" then
			CurCount = player:GetInt("SeasonPassQuest_"..Quest_Id)
		end
	end
	return CurCount
end

--增加密藏经验(用于客户端点击"完成"任务后或者直接购买等级)
function SeasonPass.AddSeasonPassExp(player, Quest_Id, QuestType, Num, BuyLevelNum)
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	if not BuyLevelNum then
		Quest_Id = tonumber(Quest_Id)
		QuestType = tostring(QuestType)
		Num = tonumber(Num)
		if not player or not Quest_Id or not QuestType or not Num then
			return ""
		end
	else
		BuyLevelNum = tonumber(BuyLevelNum)
		if not BuyLevelNum then
			return ""
		else
			Num = BuyLevelNum * SeasonPassConfig.LevelUpExp
		end
	end
	local Level = player:GetInt("SeasonPassLevel")
	local Exp = player:GetInt("SeasonPassExp") + Num
	if Level < SeasonPassConfig.MaxLevel then
		if Exp >= SeasonPassConfig.LevelUpExp then
			local a = math.floor(Exp / SeasonPassConfig.LevelUpExp)
			Exp = Exp - a * SeasonPassConfig.LevelUpExp
			Level = Level + a
			if Level >= SeasonPassConfig.MaxLevel then
				Level = SeasonPassConfig.MaxLevel
				Exp = SeasonPassConfig.LevelUpExp
			end
		end
		if QuestType == "DailyQuest" then
			player:SetInt("SeasonPassLevel", Level)
			player:SetInt("SeasonPassExp", Exp)
			player:SetDayString("SeasonPassFinishQuest_"..Quest_Id, "true")
		elseif QuestType == "WeeklyQuest" then
			player:SetInt("SeasonPassLevel", Level)
			player:SetInt("SeasonPassExp", Exp)
			player:SetWeekString("SeasonPassFinishQuest_"..Quest_Id, "true")
		elseif QuestType == "OnceQuest" then
			player:SetInt("SeasonPassLevel", Level)
			player:SetInt("SeasonPassExp", Exp)
			player:SetString("SeasonPassFinishQuest_"..Quest_Id, "true")
		elseif QuestType == "BuyExp" then
			if Lua_tools then
				local money_val = BuyLevelNum * SeasonPassConfig.BuyLevelCost
				--sLuaApp:LuaDbg("money_val = "..tostring(money_val))
				if Lua_tools.SubMoney(player, 1, money_val, "system", "SeasonPass", "SeasonPassBuyExp") then
					player:SetInt("SeasonPassLevel", Level)
					player:SetInt("SeasonPassExp", Exp)
					SeasonPass.GetData(player, 1)
					local str = [[
						if SeasonPassUI then
							SeasonPassUI.BuyExpInterfaceCloseClick()
						end ]]
					sLuaApp:ShowForm(player, "脚本表单", str)
					sLuaApp:NotifyTipsMsg(player, "密藏经验购买成功")
				else
					sLuaApp:NotifyTipsMsg(player, "您的金元宝不够哦~")
					return "false"
				end
			end
		elseif QuestType == "GiveExp" then
			player:SetInt("SeasonPassLevel", Level)
			player:SetInt("SeasonPassExp", Exp)
			SeasonPass.GetData(player, 1)
		else
			return "false"
		end
		SeasonPass.SeasonPassRedPointRefresh(player)
		return "true"
	else
		Level = SeasonPassConfig.MaxLevel
		Exp = SeasonPassConfig.LevelUpExp
		player:SetInt("SeasonPassLevel", Level)
		player:SetInt("SeasonPassExp", Exp)
		if QuestType == "DailyQuest" then
			player:SetDayString("SeasonPassFinishQuest_"..Quest_Id, "true")
		elseif QuestType == "WeeklyQuest" then
			player:SetWeekString("SeasonPassFinishQuest_"..Quest_Id, "true")
		elseif QuestType == "OnceQuest" then
			player:SetString("SeasonPassFinishQuest_"..Quest_Id, "true")
		end
		--SeasonPass.SeasonPassRedPointRefresh(player)
		return "MaxLevel"
	end
	return "false"
end

function SeasonPass.GetPersonalExchangeShopInfo(player)
	if not player then
		return nil
	end
	local TB = {}
	for i = 1, #SeasonPassConfig.ExchangeShop do
		TB[i] = player:GetInt("ExchangeShopBuyNum"..i)
	end
	return TB
end

function SeasonPass.GetToken(player, val)
	val = tonumber(val)
	if not player or not val then
		return nil
	end
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	local TokenOwn = player:GetInt("SeasonPassTokenOwn")
	player:SetInt("SeasonPassTokenOwn", TokenOwn + val)
	--sLuaApp:NotifyTipsMsg(player, "Token获取成功")
	return ""
end

function SeasonPass.ExchangeItem(player, ItemIndex, ItemNum)
	ItemIndex = tonumber(ItemIndex)
	ItemNum = tonumber(ItemNum)
	if not ItemIndex or not ItemNum or not SeasonPassConfig.ExchangeShop then
		sLuaApp:NotifyTipsMsg(player, "兑换失败！")
		return ""
	end
	if ItemNum <= 0 then
		sLuaApp:NotifyTipsMsg(player, "兑换失败！")
	end
	if not SeasonPass.CheckFunctionOpen(player) then
		return ""
	end
	if SeasonPassConfig.ExchangeShop[ItemIndex] then
		local Name = SeasonPassConfig.ExchangeShop[ItemIndex].Name
		local RemainNum = 0
		if SeasonPassConfig.ExchangeShop[ItemIndex].MaxBuy ~= 0 then
			RemainNum = SeasonPassConfig.ExchangeShop[ItemIndex].MaxBuy - player:GetInt("ExchangeShopBuyNum"..ItemIndex)
			if ItemNum > RemainNum then
				ItemNum = RemainNum
			end
		end
		local Cost = ItemNum * SeasonPassConfig.ExchangeShop[ItemIndex].TokenCost
		if Cost < 0 then
			sLuaApp:LuaErr("配置错误")
			sLuaApp:NotifyTipsMsg(player, "兑换失败！")
			return ""
		end
		local TokenOwn = player:GetInt("SeasonPassTokenOwn")
		if Cost <= TokenOwn then
			local Bind = SeasonPassConfig.ExchangeShop[ItemIndex].Bind or 1
			local TB = {}
			TB[1] = Name
			TB[2] = ItemNum
			TB[3] = Bind
			if Lua_tools.AddItem(player, TB) then
				sLogServerSystem:LogToServer(0, player, "密藏兑换", 0, ItemNum, tostring(Name), tostring(ItemNum))
				player:SetInt("SeasonPassTokenOwn", TokenOwn - Cost)
				local a = player:GetInt("ExchangeShopBuyNum"..ItemIndex)
				player:SetInt("ExchangeShopBuyNum"..ItemIndex, a + ItemNum)
				local NewTB = SeasonPass.GetPersonalExchangeShopInfo(player)
				local NewHighTB = SeasonPass.HighRefreshRateData(player)
				if NewTB and NewHighTB then
					if Lua_tools then
						local str = [[
							if SeasonPassUI then
								SeasonPassUI.PersonalExchangeInfo = ]]..Lua_tools.serialize(NewTB)..[[
								SeasonPassUI.PlayerInfo = ]]..Lua_tools.serialize(NewHighTB)..[[
								SeasonPassUI.ExchangePageItemInfoRefresh()
								SeasonPassUI.ExchangePageTokenInfoRefresh()
							end ]]
						sLuaApp:ShowForm(player, "脚本表单", str)
					else
						sLuaApp:LuaErr("没有Lua_tools")
					end
				else
					sLuaApp:LuaErr("没有NewTB   NewHighTB")
				end
			end
		else
			sLuaApp:NotifyTipsMsg(player, "代币不足，兑换失败！")
			return ""
		end
	else
		return ""
	end
end

function SeasonPass.SetData(player, para1, para2, para3)
	if para1 and para2 then
		para1 = tonumber(para1)
		para2 = tonumber(para2)
		local Level = player:GetInt("SeasonPassLevel")
		if Level < para1 then
			player:SetInt("SeasonPassLevel", para1)
		end
		player:SetInt("SeasonPassExp", 0)
		player:SetString("SeasonPassReceivedItem"..tostring(para1).."_"..tostring(para2), "true")
		sLuaApp:NotifyTipsMsg(player, "SetData设置成功  "..tostring(para1).."_"..tostring(para2))
	end
	if para3 then
		para3 = tonumber(para3)
		player:SetInt("SeasonPassExp", para3)
		sLuaApp:NotifyTipsMsg(player, "SetData设置成功  "..tostring(para3))
	end
	return ""
end

function SeasonPass.Activation(player, GoodsName)
	GoodsName = tostring(GoodsName)
	if not player or not GoodsName then
		return ""
	end
	for i = 1, #SeasonPassConfig.PriceConfig do
		if SeasonPassConfig.PriceConfig[i].Goods == GoodsName then
			SeasonPass.Buy(player, i)
		end
	end
end

function SeasonPass.Buy(player, para)
	para = tonumber(para)
	if not player or not para then
		return ""
	end
	if SeasonPass.CheckFunctionOpen(player) then
		player:SetString("SeasonPassBuy", "true")
		if para == 1 then
			if SeasonPassConfig.PurchaesPageNormal then
				if SeasonPassConfig.PurchaesPageNormal.GiveItem and next(SeasonPassConfig.PurchaesPageNormal.GiveItem) then
					local TB = {}
					for i = 1, #SeasonPassConfig.PurchaesPageNormal.GiveItem do
						for j = 1, #SeasonPassConfig.PurchaesPageNormal.GiveItem[i] do
							table.insert(TB, SeasonPassConfig.PurchaesPageNormal.GiveItem[i][j])
						end
					end
					Lua_tools.AddItem(player, TB)
				end
				if SeasonPassConfig.PurchaesPageNormal.GiveToken and SeasonPassConfig.PurchaesPageNormal.GiveToken > 0 then
					SeasonPass.GetToken(player, SeasonPassConfig.PurchaesPageNormal.GiveToken)
				end
				if SeasonPassConfig.PurchaesPageNormal.GiveExp and SeasonPassConfig.PurchaesPageNormal.GiveExp > 0 then
					SeasonPass.AddSeasonPassExp(player, 0, "GiveExp", 0, math.floor(SeasonPassConfig.PurchaesPageNormal.GiveExp/SeasonPassConfig.LevelUpExp))
				end
			end
		elseif para == 2 then
			if SeasonPassConfig.PurchaesPageLuxurious then
				if SeasonPassConfig.PurchaesPageLuxurious.GiveItem and next(SeasonPassConfig.PurchaesPageLuxurious.GiveItem) then
					local TB = {}
					for i = 1, #SeasonPassConfig.PurchaesPageLuxurious.GiveItem do
						for j = 1, #SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i] do
							table.insert(TB, SeasonPassConfig.PurchaesPageLuxurious.GiveItem[i][j])
						end
					end
					Lua_tools.AddItem(player, TB)
				end
				if SeasonPassConfig.PurchaesPageLuxurious.GiveToken and SeasonPassConfig.PurchaesPageLuxurious.GiveToken > 0 then
					SeasonPass.GetToken(player, SeasonPassConfig.PurchaesPageLuxurious.GiveToken)
				end
				if SeasonPassConfig.PurchaesPageLuxurious.GiveExp and SeasonPassConfig.PurchaesPageLuxurious.GiveExp > 0 then
					SeasonPass.AddSeasonPassExp(player, 0, "GiveExp", 0, math.floor(SeasonPassConfig.PurchaesPageLuxurious.GiveExp/SeasonPassConfig.LevelUpExp))
				end
			end
			player:SetString("SeasonPassLuxuriousBuy", "true")
		end
		SeasonPass.GetData(player, 1)
		sLuaApp:NotifyTipsMsg(player, SeasonPassConfig.PriceConfig[para].Name.."购买成功")
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
	return ""
end

--(新增)用于统计"目标"栏中涉及主线、支线或者环任务相关目标的完成次数
function SeasonPass.on_quest_finish_ex(player,quest_id)
	if SeasonPass.QuestTB and SeasonPass.QuestTB[tostring(quest_id)] then
		SeasonPassQuestFunc.UpdateQuestProgress(player, SeasonPass.QuestTB[tostring(quest_id)])
	end
end

function SeasonPass.TestFinishQuest(player, QuestId, para)
	player:SetInt("SeasonPassQuest_"..QuestId, para)
	sLuaApp:NotifyTipsMsg(player, "SeasonPassQuest_设置成功  "..QuestId.."_"..para)
	return ""
end

function SeasonPass.ResetData(player)
	player:SetInt("SeasonPassLevel", 1)
	player:SetInt("SeasonPassExp", 0)
	player:SetString("SeasonPassBuy", "false")
	player:SetString("SeasonPassLuxuriousBuy", "false")
	player:SetInt("SeasonPassTokenOwn", 0)
	for i = 1, SeasonPassConfig.MaxLevel do
		for j = 1, 3 do
			player:SetString("SeasonPassReceivedItem"..tostring(i).."_"..tostring(j), "false")
		end
	end
	for i = 1, #SeasonPassConfig.QuestList.DailyQuest do
		player:SetDayInt("SeasonPassQuest_"..SeasonPassConfig.QuestList.DailyQuest[i].Id, 0)
		player:SetDayString("SeasonPassFinishQuest_"..SeasonPassConfig.QuestList.DailyQuest[i].Id, "false")
	end
	for i = 1, #SeasonPassConfig.QuestList.WeeklyQuest do
		player:SetWeekInt("SeasonPassQuest_"..SeasonPassConfig.QuestList.WeeklyQuest[i].Id, 0)
		player:SetWeekString("SeasonPassFinishQuest_"..SeasonPassConfig.QuestList.WeeklyQuest[i].Id, "false")
	end
	for i = 1, #SeasonPassConfig.QuestList.OnceQuest do
		player:SetInt("SeasonPassQuest_"..SeasonPassConfig.QuestList.OnceQuest[i].Id, 0)
		player:SetString("SeasonPassFinishQuest_"..SeasonPassConfig.QuestList.OnceQuest[i].Id, "false")
	end
	for i = 1, #SeasonPassConfig.ExchangeShop do
		player:SetInt("ExchangeShopBuyNum"..i, 0)
	end
	--sLuaApp:NotifyTipsMsg(player, "ResetData设置成功")
	SeasonPass.SeasonPassRedPointRefresh(player)
	return ""
end

--玩家上线时, FormLogin调用
function SeasonPass.Login(player)
	if not player then
		return
	end
	SeasonPass.VersionChange(player)
	if SeasonPass.CheckFunctionOpen(player) then
		SeasonPass.LoginAddTimer(player)
		local TB = SeasonPass.CheckRedPoint(player)
		if Lua_tools then
			local str = [[
				if GlobalProcessing then
					if not GlobalProcessing.SeasonPass_FunctionSwitch then
						GlobalProcessing.SeasonPass_FunctionSwitch = ""
					end
					if not GlobalProcessing.SeasonPass_OpenLevel then
						GlobalProcessing.SeasonPass_OpenLevel = 100
					end
					GlobalProcessing.SeasonPass_FunctionSwitch = ']]..SeasonPassConfig.Switch..[['
					GlobalProcessing.SeasonPass_OpenLevel = ]]..SeasonPassConfig.OpenLevel..[[
				end
				if MainSysOpen then
					MainSysOpen.SetBtn(RoleAttr.RoleAttrLevel, CL.GetAttr(RoleAttr.RoleAttrLevel))
				end
				if GlobalProcessing then
					if not GlobalProcessing.SeasonPassRedPoint then
						GlobalProcessing.SeasonPassRedPoint = {}
					end
					GlobalProcessing.SeasonPassRedPoint = ]]..Lua_tools.serialize(TB)..[[
					GlobalProcessing.SeasonPassRedPointRefresh()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	else
		if Lua_tools then
			local str = [[
				if GlobalProcessing then
					if not GlobalProcessing.SeasonPass_FunctionSwitch then
						GlobalProcessing.SeasonPass_FunctionSwitch = ""
					end
					if not GlobalProcessing.SeasonPass_OpenLevel then
						GlobalProcessing.SeasonPass_OpenLevel = 100
					end
					GlobalProcessing.SeasonPass_FunctionSwitch = ']].."off"..[['
					GlobalProcessing.SeasonPass_OpenLevel = ]]..SeasonPassConfig.OpenLevel..[[
				end
				if MainSysOpen then
					MainSysOpen.SetBtn(RoleAttr.RoleAttrLevel, CL.GetAttr(RoleAttr.RoleAttrLevel))
				end
			]]
			if SeasonPassConfig.Switch and SeasonPassConfig.Switch == "on" then
				local RoleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
				if RoleLevel and tonumber(RoleLevel) and SeasonPassConfig.OpenLevel then
					if tonumber(RoleLevel) >= SeasonPassConfig.OpenLevel then
						str = str..[[
							if SeasonPassUI then
								SeasonPassUI.OnExit()
								CL.SendNotify(NOTIFY.ShowBBMsg,"本期密藏已结束")
							end
						]]
					end
				end
			end
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	end
end

--玩家升级时进行判定
function SeasonPass.RoleLevelUp(player)
	if not player then
		return
	end
	--SeasonPass.VersionChange(player)
	if SeasonPass.CheckFunctionOpen(player) then
		local TB = SeasonPass.CheckRedPoint(player)
		if Lua_tools then
			local str = [[
				if GlobalProcessing then
					if not GlobalProcessing.SeasonPass_FunctionSwitch then
						GlobalProcessing.SeasonPass_FunctionSwitch = ""
					end
					if not GlobalProcessing.SeasonPass_OpenLevel then
						GlobalProcessing.SeasonPass_OpenLevel = 100
					end
					GlobalProcessing.SeasonPass_FunctionSwitch = ']]..SeasonPassConfig.Switch..[['
					GlobalProcessing.SeasonPass_OpenLevel = ]]..SeasonPassConfig.OpenLevel..[[
				end
				if MainSysOpen then
					MainSysOpen.SetBtn(RoleAttr.RoleAttrLevel, CL.GetAttr(RoleAttr.RoleAttrLevel))
				end
				if GlobalProcessing then
					if not GlobalProcessing.SeasonPassRedPoint then
						GlobalProcessing.SeasonPassRedPoint = {}
					end
					GlobalProcessing.SeasonPassRedPoint = ]]..Lua_tools.serialize(TB)..[[
					GlobalProcessing.SeasonPassRedPointRefresh()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			SeasonPass.GetData(player)
		end
	end
end

--检测活动是否在开启状态
function SeasonPass.CheckFunctionOpen(player)
	if SeasonPassConfig and SeasonPassConfig.Switch then
		if SeasonPassConfig.Switch ~= "on" then
			return false
		end
	else
		return false
	end
	local Version = sDBVarSystem:GetInt("RechargeSystem_SeasonPass_ActingState")
	local sec = sLuaApp:GetTimes()
	if not Version or not SeasonPassConfig.Time or not SeasonPassConfig.Time[Version] or not SeasonPassConfig.Time[Version + 1] then
		return false
	end
	local ConfigTime1 = sLuaApp:Str2DateTime(SeasonPassConfig.Time[Version])
	local ConfigTime2 = sLuaApp:Str2DateTime(SeasonPassConfig.Time[Version + 1])
	--sLuaApp:NotifyTipsMsg(player, "Version  = "..Version)
	--sLuaApp:NotifyTipsMsg(player, "sec  = "..sec)
	--sLuaApp:NotifyTipsMsg(player, "ConfigTime1  = "..ConfigTime1)
	--sLuaApp:NotifyTipsMsg(player, "ConfigTime2  = "..ConfigTime2)
	--sLuaApp:LuaErr("SeasonPass.CheckFunctionOpen(player)     Version = "..Version)
	if ConfigTime1 > sec or sec > ConfigTime2 then
		return false
	end
	if player then
		local RoleLevel = player:GetAttr(ROLE_ATTR_LEVEL)
		if RoleLevel and tonumber(RoleLevel) and SeasonPassConfig.OpenLevel then
			if tonumber(RoleLevel) < SeasonPassConfig.OpenLevel then
				return false
			end
		else
			return false
		end
	end
	return true
end

--(服务器)判断小红点(规则: 未满级时才会显示任务小红点; 或有奖励未领时才会显示奖励小红点)
function SeasonPass.CheckRedPoint(player)
	if not player then
		return nil
	end
	if not SeasonPass.CheckFunctionOpen(player) then
		return nil
	end
	local TB = {LevelMax = "true", RewardRemain = {}, QuestCanFinish = {},}
	local SeasonPassLevel = player:GetInt("SeasonPassLevel")
	if SeasonPassLevel < SeasonPassConfig.MaxLevel then
		TB.LevelMax = "false"
	end
	for k,v in pairs(SeasonPass.QuestIdList) do	--k是QuestId, string
		local QuestProgress = SeasonPass.GetQuestProgress(player, k)
		if QuestProgress >= SeasonPass.QuestIdList[k].Count then
			local QuestStatus, QuestType = SeasonPass.GetQuestStatus(player, k)
			if QuestStatus ~= "true" and SeasonPassConfig.QuestList[QuestType] then
				if not TB.QuestCanFinish[QuestType] then
					TB.QuestCanFinish[QuestType] = "true"
				end
			end
		end
	end
	local Bought = player:GetString("SeasonPassBuy")
	if Bought == "" then
		Bought = "false"
	end
	local ReceivedItem = {}
	if Bought == "true" then
		local IsBreak = "false"
		for i = 1, SeasonPassLevel do
			for j = 1, 3 do
				local TOF = player:GetString("SeasonPassReceivedItem"..tostring(i).."_"..tostring(j))
				if TOF ~= "true" then
					if j == 1 then
						if SeasonPassConfig.Item[i].LowValue and next(SeasonPassConfig.Item[i].LowValue) then
							table.insert(TB.RewardRemain, tostring(i).."_"..tostring(j))
							IsBreak = "true"
							break
						end
					elseif j == 2 then
						if SeasonPassConfig.Item[i].HighValue and SeasonPassConfig.Item[i].HighValue[1] and next(SeasonPassConfig.Item[i].HighValue[1]) then
							table.insert(TB.RewardRemain, tostring(i).."_"..tostring(j))
							IsBreak = "true"
							break
						end
					elseif j == 3 then
						if SeasonPassConfig.Item[i].HighValue and SeasonPassConfig.Item[i].HighValue[2] and next(SeasonPassConfig.Item[i].HighValue[2]) then
							table.insert(TB.RewardRemain, tostring(i).."_"..tostring(j))
							IsBreak = "true"
							break
						end
					end
				end
			end
			if IsBreak == "true" then
				break
			end
		end
	elseif Bought == "false" then
		for i = 1, SeasonPassLevel do
			local TOF = player:GetString("SeasonPassReceivedItem"..tostring(i).."_1")
			if TOF ~= "true" then
				if SeasonPassConfig.Item[i].LowValue and next(SeasonPassConfig.Item[i].LowValue) then
					table.insert(TB.RewardRemain, tostring(i).."_1")
					break
				end
			end
		end
	end
	--sLuaApp:LuaErr(Lua_tools.serialize(TB))
	return TB
end

function SeasonPass.SeasonPassRedPointRefresh(player)
	local TB = SeasonPass.CheckRedPoint(player)
	--sLuaApp:LuaErr("SeasonPassRedPointRefresh      =======")
	if not TB or not next(TB) then
		return ""
	end
	if Lua_tools then
		local str = [[
			if GlobalProcessing then
				if not GlobalProcessing.SeasonPassRedPoint then
					GlobalProcessing.SeasonPassRedPoint = {}
				end
				GlobalProcessing.SeasonPassRedPoint = ]]..Lua_tools.serialize(TB)..[[
				GlobalProcessing.SeasonPassRedPointRefresh()
			end
			if SeasonPassUI then
				SeasonPassUI.RedPointRefresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
	--sLuaApp:LuaErr("SeasonPassRedPointRefresh      --------------------")
end

function SeasonPass.VersionChange(player)
	local playerVersion = player:GetInt("SeasonPassVersion")
	local Version = sDBVarSystem:GetInt("RechargeSystem_SeasonPass_ActingState")
	--sLuaApp:NotifyTipsMsg(player, "Version  = "..Version)
	if Version and playerVersion ~= Version then
		SeasonPass.ResetData(player)
		player:SetInt("SeasonPassVersion", Version)
		--SeasonPass.GetInitializedData(player)
	end
	return ""
end

function SeasonPass.LoginAddTimer(player)
	if not player then
		return false
	end
	local SeasonPassLoginTimerGuid = player:GetInt("SeasonPassLoginTimerGuid")
	if sLuaTimerSystem:HasTimer(SeasonPassLoginTimerGuid) then
		sLuaTimerSystem:DisableTimer(SeasonPassLoginTimerGuid)
		--sLuaApp:LuaErr("SeasonPass定时器删除完毕      --------------------")
	end
	--local LoginSec = player:GetDayInt("SeasonPassQuest_1")
	local LoginSec = SeasonPassQuestFunc.GetTodayOnlineSec(player)
	--sLuaApp:LuaErr("LoginSec = "..LoginSec)
	local TotalSec = tonumber(SeasonPass.QuestIdList["1"].Count)
	--sLuaApp:LuaErr("TotalSec = "..TotalSec)
	if TotalSec and TotalSec > LoginSec then
		local NewTimerGuid = sLuaTimerSystem:AddTimerEx(player, (TotalSec - LoginSec) * 1000,1, "SeasonPass.SeasonPassRedPointRefresh", "")
		player:SetInt("SeasonPassLoginTimerGuid", NewTimerGuid)
		--sLuaApp:LuaErr("SeasonPass定时器设定完毕      --------------------")
	end
end

function SeasonPass.ScheduleCallBack(timer, param)
	--sLuaApp:LuaErr("ScheduleCallBack      --------------------")
	local playerlist = sPlayerSystem:GetAllPlayers()
	for k, v in pairs(playerlist) do
        sLuaTimerSystem:AddTimerEx(v, 1000,1, "SeasonPass.Login", "")
		--SeasonPass.Login(v)
    end
end

function SeasonPass.Initilization()
	if not SeasonPass.QuestIdList then
		SeasonPass.QuestIdList = {}
	end
	if not SeasonPassConfig.QuestList then
		return
	end
	SeasonPass.QuestTB = {}
	for k,v in pairs(SeasonPassConfig.QuestList) do
		for m,n in pairs(v) do
			if not SeasonPass.QuestIdList[tostring(n.Id)] then
				SeasonPass.QuestIdList[tostring(n.Id)] = {}
			end
			n.ShowCount = n.Count / n.Coefficient
			n.Type = k
			SeasonPass.QuestIdList[tostring(n.Id)] = n
			if n.QuestId and type(n.QuestId) == "number" then
				SeasonPass.QuestTB[tostring(n.QuestId)] = n.Id
			end
		end
	end
	for k,v in pairs(SeasonPassConfig.Time) do
		--sScheduleSystem:CreateSchedule(0, v[1], "NaoShi","SetCreateNPC", v[2]..","..id)
		--if k%2 == 0 then
			sScheduleSystem:CreateSchedule(0, v, "SeasonPass","ScheduleCallBack", "")
		--end
	end
	--sLuaApp:LuaErr(Lua_tools.serialize(SeasonPass.QuestIdList))
end

SeasonPass.Initilization()