--商会
DealShop = {}

DealShop.typeName = {
    [0] = "装备",
    [1] = "宠物",
    [2] = "侍从",
    [3] = "天赋",
    [4] = "其他",
}

DealShop.subTypeName = {
    [0] = "装备强化",
    [1] = "千叠寒铁",
    [2] = "10级制造书",
    [3] = "20级制造书",
    [4] = "30级制造书",
    [5] = "40级制造书",
    [6] = "50级制造书",
    [7] = "60级制造书",
    [8] = "70级制造书",
    [9] = "80级制造书",
    [10] = "宠物蛋",
    [11] = "宠物培养",
    [12] = "普通宠物秘籍",
    [13] = "高级宠物秘籍",
    [14] = "超级宠物秘籍",
    [15] = "特殊宠物秘籍",
    [16] = "宠物项圈",
    [17] = "宠物盔甲",
    [18] = "宠物护符",
    [20] = "侍从培养",
    [21] = "侍从信物",
    [30] = "花果山",
    [31] = "西海龙宫",
    [32] = "慈恩寺",
    [33] = "流沙界",
    [34] = "净坛禅院",
    [35] = "酆都",
    [40] = "阵法",
    [41] = "染料",
    [42] = "宝石",
    [43] = "杂物",
}

function DealShop.GetExchangeData(player)
	if player == nil then
		return ""
	end
	sLuaApp:LuaDbg(" DealShop.GetExchangeData(player)")
	local str = [[
		if CommerceUI then
			if not CommerceUI.typeName then
				CommerceUI.typeName = {}
			end
			if not CommerceUI.subTypeName then
				CommerceUI.subTypeName = {}
			end
			CommerceUI.typeName = ]]..Lua_tools.serialize(DealShop.typeName)..[[
			CommerceUI.subTypeName = ]]..Lua_tools.serialize(DealShop.subTypeName)..[[
			CommerceUI.RefreshCfg()
		end
	]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    return ""
end

function DealShop.GetBuyRecord(player)
	sLuaApp:LuaDbg(" DealShop.GetBuyRecord(player)")
	if sVarSystem:GetDayInt("ExchangeAllLimit") == 0 then
		DealShop.Init()
		DealShop.GetBuyRecord(player)
		sLuaApp:NotifyTipsMsgEx(player, "商会已刷新")
		return ""
	end
	if FunctionSwitch.AllFuncitonConfig['Exchange'] ~= "on" then
		return ""
	end
	if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
		local countRes  = DealShop.InitTable(Data.ExchangeTodayBuyRecord, "count")
		local priceRes  = DealShop.InitTable(Data.ExchangeTodayBuyRecord, "MoneyVal")
		local limitup   = DealShop.InitTable(Data.ExchangeTodayBuyRecord, "limitup")
		local limitdown = DealShop.InitTable(Data.ExchangeTodayBuyRecord, "limitdown")
		local tendency  = DealShop.InitTable(Data.ExchangeTodayBuyRecord, "tendency")
		local restendency = {}
		for k, v in pairs(tendency) do
			if v ~= 0 then
				restendency[k] = v
			end
		end
		
		if Data.ExchangeTodayBuyRecord and next(Data.ExchangeTodayBuyRecord) ~= nil then
			local str = [[
				if CommerceUI then
					CommerceUI.ServerData.allBuyCnt = ]]..Lua_tools.serialize(countRes)..[[
					CommerceUI.ServerData.NowPrice = ]]..Lua_tools.serialize(priceRes)..[[
					CommerceUI.ServerData.limitup = ]]..Lua_tools.serialize(limitup)..[[
					CommerceUI.ServerData.limitdown = ]]..Lua_tools.serialize(limitdown)..[[
					CommerceUI.ServerData.tendency = ]]..Lua_tools.serialize(restendency)..[[
					CommerceUI.Refresh()
				end
			]]
			--sLuaApp:LuaDbg(str)
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		else
			local str = [[
				if CommerceUI then
					CommerceUI.ServerData.allBuyCnt = {}
					CommerceUI.ServerData.NowPrice = {}
					CommerceUI.ServerData.limitup = {}
					CommerceUI.ServerData.limitdown = {}
					CommerceUI.ServerData.tendency = {}
					CommerceUI.Refresh()
				end
			]]
			--sLuaApp:LuaDbg(str)
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end
	else
		local player_guid = tostring(player:GetGUID())
		if Data.ExchangeOnceLimit and next(Data.ExchangeOnceLimit) ~= nil then
			if Data.ExchangeOnceLimit[player_guid] and next(Data.ExchangeOnceLimit[player_guid]) then
				local str = [[
					if CommerceUI then
						CommerceUI.ServerData.allBuyCnt = ]]..Lua_tools.serialize(Data.ExchangeOnceLimit[player_guid])..[[
						CommerceUI.Refresh()
					end
				]]
				--sLuaApp:LuaDbg(str)
				sLuaApp:ShowForm(player, "脚本表单", str)
				return ""
			else
				local str = [[
					if CommerceUI then
						CommerceUI.Refresh()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
				return ""
			end
		else
			local str = [[
				if CommerceUI then
					CommerceUI.Refresh()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end
	end
end

--初始化一下表格
function DealShop.InitTable(tb, key)
	local res = {}
	if Data.ExchangeTodayBuyRecord and next(Data.ExchangeTodayBuyRecord) ~= nil then
		for k, v in pairs(Data.ExchangeTodayBuyRecord) do
			res[tonumber(k)] = v[key]
		end
	end
	return res
end

function DealShop.Remake(player)
	Data.ExchangeTodayBuyRecord = nil
	Data.ExchangeOnceLimit = nil
	Data.ExchangeTodayBuyRecord = {}
	Data.ExchangeOnceLimit = {}
	return true
end

-- 购买物品
function DealShop.BuyItem(player, item_id, item_count)
	sLuaApp:LuaDbg("购买物品")
	if player == nil then
		return ""
	end
	if FunctionSwitch.AllFuncitonConfig['Exchange'] ~= "on" then
		return ""
	end
	if sVarSystem:GetDayInt("ExchangeAllLimit") == 0 then
		DealShop.Init()
		DealShop.GetBuyRecord(player)
		sLuaApp:NotifyTipsMsgEx(player, "商会已刷新，请重新操作")
		return ""
	end
	
	local player_guid = tostring(player:GetGUID())
	if Lua_tools then
		local itemData = ItemConfig.GetById(item_id)
		local exchangeData = ExchangeConfig.GetById(item_id)
		if item_count > exchangeData.BuyMax then
			sLuaApp:NotifyTipsMsgEx(player, "超出最大单次购买数量限制")
			return ""
		end
		local subMoneyVal = exchangeData.Buy
		--Data报错，将道具idtostring一下
		local item_id = tostring(item_id)
		
		--number为0即为不限购道具
		if exchangeData.Number == 0 then
			if Lua_tools.IsMoneyEnough(player, 5, item_count*subMoneyVal) == false then
				if MoneyChange then
					--DealShop.BuyItem(player, item_id, item_count)
					local f_name = [[DealShop.BuyItem(player,]]..item_id..[[,]]..item_count..[[)]]
					MoneyChange.LackMoney(player, 5, item_count*subMoneyVal, f_name)
					return ""
				end
			end
			if Lua_tools.SubMoney(player, 5, item_count*subMoneyVal, "商会系统", "购买商会道具", "购买商会道具扣除银币") then
				if not Lua_tools.AddItem(player, {itemData.KeyName, item_count}, "商会系统", "购买商会道具", "购买商会道具给予物品") then
					sLuaApp:NotifyTipsMsgEx(player, "给予物品失败")
					return ""
				end
			else
				sLuaApp:NotifyTipsMsgEx(player, "银币不足")
				return ""
			end
			return ""
		end
		if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
			if Data.ExchangeTodayBuyRecord[item_id] ~= nil then
				if item_count + Data.ExchangeTodayBuyRecord[item_id]["count"]  > exchangeData.Number then
					sLuaApp:NotifyTipsMsgEx(player, "超出该道具购买限制，无法购买")
					return ""
				end
				if Data.ExchangeTodayBuyRecord[item_id]["limitup"] ~= 0 then
					sLuaApp:NotifyTipsMsgEx(player, itemData.Name.."暂时进入涨停状态，无法继续购买")
					return ""
				end
				local NowPrice = Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"]
				if NowPrice + item_count*exchangeData.Float > exchangeData.Buy*(1 + (exchangeData.Up/10000)) then
					sLuaApp:LuaDbg("NowPrice:"..NowPrice)
					sLuaApp:LuaDbg("NowPrice:"..exchangeData.Buy*(1 + (exchangeData.Up/10000)))
					local count = (exchangeData.Buy*(1 + (exchangeData.Up/10000)) - NowPrice) / exchangeData.Float
					local final_count, _a = math.modf(count)
					sLuaApp:LuaDbg("final_count:"..final_count)
					local str = [[GlobalUtils.ShowServerBoxMessage("该次购买仅可购买]]..final_count..[[个，购买之后]]..itemData.Name..[[将进入涨停状态，是否购买？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormExchange.BuyItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_id..", "..final_count..")")
					sLuaApp:ShowForm(player, "脚本表单", str)
					return ""
				end
				
				if Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] ~= nil then
					subMoneyVal = Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"]
				end
				
			else
				if item_count > exchangeData.Number then
					sLuaApp:NotifyTipsMsgEx(player, "超出该道具购买限制，无法购买")
					return ""
				end
			end
		else
			if Data.ExchangeOnceLimit and next(Data.ExchangeOnceLimit) ~= nil then
				if Data.ExchangeOnceLimit[player_guid] then
					if Data.ExchangeOnceLimit[player_guid][item_id] then
						if item_count + Data.ExchangeOnceLimit[player_guid][item_id] > exchangeData.Number then
							sLuaApp:NotifyTipsMsgEx(player, "超出该道具购买限制，无法购买")
							return ""
						end
					else
						if item_count > exchangeData.Number then
							sLuaApp:NotifyTipsMsgEx(player, "超出该道具购买限制，无法购买")
							return ""
						end
					end
					
				end
			end
		end
		--获得包裹剩余空间后调整的，减少修改幅度所以直接提前求出对应剩余（信物/宝石）背包格子
		local FreeBagCount = 0
		local BagTypeStr = ""
		if itemData.Type == 6 then --物品为信物
			FreeBagCount = Lua_tools.GetTokenBagFree(player)
			BagTypeStr = "信物"
		elseif itemData.Type == 3 and itemData.Subtype == 9 then
			FreeBagCount = Lua_tools.GetGemBagFree(player)
			BagTypeStr = "宝石"
		else
			FreeBagCount = Lua_tools.GetBagFree(player)
		end
		if FreeBagCount >= math.ceil(item_count/itemData.StackMax) then
			if Lua_tools.IsMoneyEnough(player, 5, item_count*subMoneyVal) == false then
				if MoneyChange then
					--DealShop.BuyItem(player, item_id, item_count)
					local f_name = [[DealShop.BuyItem(player,]]..item_id..[[,]]..item_count..[[)]]
					MoneyChange.LackMoney(player, 5, item_count*subMoneyVal, f_name)
					return ""
				end
			end
			if Lua_tools.SubMoney(player, 5, item_count*subMoneyVal, "商会系统", "购买商会道具", "购买商会道具扣除银币") then
				if Lua_tools.AddItem(player, {itemData.KeyName, item_count}, "商会系统", "购买商会道具", "购买商会道具给予物品") then
					if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
						--全服限购版本
						sLuaApp:LuaDbg("ExchangeAllLimit:"..sVarSystem:GetDayInt("ExchangeAllLimit"))
						if Data.ExchangeTodayBuyRecord ~= nil then
							--sLuaApp:LuaDbg(type(itemData.Id).."   "..type(item_count))
							--sLuaApp:LuaDbg(itemData.Id.."   "..item_count)
							if Data.ExchangeTodayBuyRecord[item_id] ~= nil then
								sLuaApp:LuaDbg("该道具被购买过, 叠加")
								Data.ExchangeTodayBuyRecord[item_id]["count"] = Data.ExchangeTodayBuyRecord[item_id]["count"] + item_count
							else
								sLuaApp:LuaDbg("该道具未被购买过, 创建")
								Data.ExchangeTodayBuyRecord[item_id] = {count = item_count, MoneyVal = exchangeData.Buy, tendency = 0, limitup = 0, limitdown = 0}
							end
							DealShop.RefreshBuyRecord(player, item_id, item_count)
							local str = [[
								if CommerceUI then
									CommerceUI.GetOnSellItemData()
								end
							]]
							sLuaApp:ShowForm(player, "脚本表单", str)
							return ""
						else
							sLuaApp:LuaDbg("ExchangeTodayBuyRecord为空")
							return ""
						end
					else
						--非全服限购版本
						if player:GetDayInt("ExchangeOnceLimit") == 0 then
							--sLuaApp:LuaDbg("player_guid:"..player_guid)
							if Data.ExchangeOnceLimit then	
								Data.ExchangeOnceLimit[player_guid] = {}
								Data.ExchangeOnceLimit[player_guid][item_id] = item_count
								player:SetDayInt("ExchangeOnceLimit", 1)
							else
								Data.ExchangeOnceLimit = {}
								Data.ExchangeOnceLimit[player_guid] = {}
								Data.ExchangeOnceLimit[player_guid][item_id] = item_count
								player:SetDayInt("ExchangeOnceLimit", 1)
							end
						else
							if Data.ExchangeOnceLimit then
								--sLuaApp:LuaDbg("player_guid:"..player_guid)
								if Data.ExchangeOnceLimit[player_guid] then
									if Data.ExchangeOnceLimit[player_guid][item_id] ~= nil then
										--sLuaApp:LuaDbg("有值，叠加")
										Data.ExchangeOnceLimit[player_guid][item_id] = Data.ExchangeOnceLimit[player_guid][item_id] + item_count
									else
										--sLuaApp:LuaDbg("没值，创建")
										Data.ExchangeOnceLimit[player_guid][item_id] = item_count
									end
								else
									Data.ExchangeOnceLimit[player_guid] = {}
									Data.ExchangeOnceLimit[player_guid][item_id] = item_count
								end
							else
								sLuaApp:LuaDbg("Data.ExchangeOnceLimit没值")
								return ""
							end
						end
						DealShop.GetBuyRecord(player)
						local str = [[
							if CommerceUI then
								CommerceUI.GetOnSellItemData()
							end
						]]
						sLuaApp:ShowForm(player, "脚本表单", str)
						return ""
					end
				else
					sLuaApp:NotifyTipsMsgEx(player, "给予物品失败")
					return ""
				end
			else
				sLuaApp:NotifyTipsMsgEx(player, "银币不足")
				return ""
			end
		else
			sLuaApp:NotifyTipsMsgEx(player, BagTypeStr.."包裹空间不足")
			return ""
		end
	end
end


--购买之后刷新数据
function DealShop.RefreshBuyRecord(player, item_id, item_count)
	--sLuaApp:LuaDbg("购买之后刷新数据：itemid类型："..type(item_id))
	local exchangeData = ExchangeConfig.GetById(tonumber(item_id))
	if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
		--全服限购版本
		local NowPrice = item_count*exchangeData.Float + Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"]
		sLuaApp:LuaDbg("NowPrice/exchangeData.Buy:"..NowPrice/exchangeData.Buy)
		if NowPrice/exchangeData.Buy >= (1 + (exchangeData.Up)/10000) then
			Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] = NowPrice
			Data.ExchangeTodayBuyRecord[item_id]["tendency"] = 1
			Data.ExchangeTodayBuyRecord[item_id]["limitup"] = 1
			Data.ExchangeTodayBuyRecord[item_id]["limitdown"] = 0
			DealShop.GetBuyRecord(player)
			return ""
		else
			local tendency = 0
			local limitdown = 0
			if NowPrice/exchangeData.Buy <= (1 - (exchangeData.Down)/10000) then
				limitdown = 1
			end
			for k, v in pairs(Data.ExchangeTodayBuyRecord) do
				sLuaApp:LuaDbg("k:"..k.."   vcount:"..v.count.."   vMVal:"..v.MoneyVal)
			end
			sLuaApp:LuaDbg("NowPrice/exchangeData.Buy:"..NowPrice/exchangeData.Buy)
			if NowPrice/exchangeData.Buy > 1 then
				tendency = 1
			elseif NowPrice/exchangeData.Buy < 1 then
				tendency = -1
			end
			Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] = NowPrice
			Data.ExchangeTodayBuyRecord[item_id]["tendency"] = tendency
			Data.ExchangeTodayBuyRecord[item_id]["limitdown"] = limitdown
			DealShop.GetBuyRecord(player)
			return ""
		end
	end
end

function DealShop.SellItem(player, item_guid, item_count)
	sLuaApp:LuaDbg("卖出商品")
	--sLuaApp:LuaDbg("item_count:"..item_count)
	--sLuaApp:LuaDbg("item_guid:"..item_guid)
	local item = sItemSystem:GetItemByGUID(item_guid)
	if item == nil then
		return ""
	end
	if item:GetOwnerGUID() ~= player:GetGUID() then
		return ""
	end
	if sVarSystem:GetDayInt("ExchangeAllLimit") == 0 then
		DealShop.Init()
		DealShop.GetBuyRecord(player)
		sLuaApp:NotifyTipsMsgEx(player, "商会已刷新，请重新操作")
		return ""
	end
	
	local item_id = item:GetId()
	sLuaApp:LuaDbg("item_id:"..item_id)
	item_count = tonumber(item_count)
	if player == nil then
		return ""
	end
	if FunctionSwitch.AllFuncitonConfig['Exchange'] ~= "on" then
		return ""
	end
	if not item_id or not item_count then
		return ""
	end
	if item_count <= 0 then
		return ""
	end
	
	local exchangeData = ExchangeConfig.GetById(item_id)
	local itemData = ItemConfig.GetById(item_id)
	--不限购，将不会对商会道具价格浮动产生影响
	if exchangeData.Number == 0 then
		if sItemSystem:GetItemAmount(player, tonumber(item_id), 3) >= item_count then
			if item_count > exchangeData.SellMax then
				sLuaApp:NotifyTipsMsgEx(player, "超出最大单次卖出数量限制")
				return ""
			end
			if sItemSystem:ConsumeItem(item, item_count, "商会系统", "商会系统卖出道具", "商会系统卖出道具扣除道具") == 0 then
				Lua_tools.AddMoney(player, 5, exchangeData.Sell * item_count)
				local str = [[
					if CommerceUI then
						CommerceUI.OnSellRefresh()
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
				sLuaApp:NotifyTipsMsgEx(player, "出售商会商品【"..itemData.Name.."】*"..item_count)
				return ""
			else
				sLuaApp:LuaDbg("扣除物品失败")
				sLuaApp:NotifyTipsMsgEx(player, "出售道具失败")
				return ""
			end
		else
			sLuaApp:NotifyTipsMsgEx(player, "玩家物品数量不足")
			return ""
		end
		return ""
	end
	--Data报错，将道具idtostring一下
	local item_id = tostring(item_id)
	if Lua_tools then
		if sItemSystem:GetItemAmount(player, tonumber(item_id), 3) >= item_count then
			--local itemData = ItemConfig.GetById(item_id)
			--local exchangeData = ExchangeConfig.GetById(item_id) 
			if item_count > exchangeData.SellMax then
				sLuaApp:NotifyTipsMsgEx(player, "超出最大单次卖出数量限制")
				return ""
			end
			if Data.ExchangeTodayBuyRecord[item_id] ~= nil then
				local NowPrice = Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"]
				if Data.ExchangeTodayBuyRecord[item_id]["limitdown"] ~= 0 then
					sLuaApp:NotifyTipsMsgEx(player, itemData.Name.."暂时进入跌停状态，无法继续出售")
					return ""
				end
				if NowPrice - item_count*exchangeData.Float < exchangeData.Buy*(1 - (exchangeData.Down/10000)) then
					sLuaApp:LuaDbg("NowPrice111:"..NowPrice)
					sLuaApp:LuaDbg("NowPrice222:"..exchangeData.Buy*(1 - (exchangeData.Down/10000)))
					local count = (NowPrice - exchangeData.Buy*(1 - (exchangeData.Down/10000)))/exchangeData.Float
					local final_count, _a = math.modf(count)
					sLuaApp:LuaDbg("final_count:"..final_count)
					local str = [[GlobalUtils.ShowServerBoxMessage("该次出售仅可出售]]..final_count..[[个，出售之后]]..itemData.Name..[[将进入跌停状态，是否出售？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "FormExchange.SellItem(sPlayerSystem:GetPlayerByGUID("..player:GetGUID()..	"),"..item_guid..", "..final_count..")")
					sLuaApp:ShowForm(player, "脚本表单", str)
					return ""
				end
			end
			if sItemSystem:ConsumeItem(item, item_count, "商会系统", "商会系统卖出道具", "商会系统卖出道具扣除道具") == 0 then
			--if Lua_tools.SubItem(player, {itemData.KeyName, item_count}, "商会系统", "商会系统卖出道具", "商会系统卖出道具扣除道具") then
				Lua_tools.AddMoney(player, 5, exchangeData.Sell * item_count)
				if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
					--全服限购版本
					if Data.ExchangeTodayBuyRecord ~= nil then
						if Data.ExchangeTodayBuyRecord[item_id] == nil then
							Data.ExchangeTodayBuyRecord[item_id] = {count = 0, MoneyVal = exchangeData.Buy, tendency = 0, limitup = 0, limitdown = 0}
						end
						DealShop.RefreshSellRecord(player, item_id, item_count)
					else
						sLuaApp:LuaDbg("Data.ExchangeTodayBuyRecord为空")
						return ""
					end
					sLuaApp:NotifyTipsMsgEx(player, "出售商会商品【"..itemData.Name.."】*"..item_count)
					return ""
				else
					DealShop.GetBuyRecord(player)
					local str = [[
						if CommerceUI then
							CommerceUI.OnSellRefresh()
						end
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
					sLuaApp:NotifyTipsMsgEx(player, "出售商会商品【"..itemData.Name.."】*"..item_count)
					return ""
				end
			else
				sLuaApp:LuaDbg("扣除物品失败")
				sLuaApp:NotifyTipsMsgEx(player, "出售道具失败")
			end
		else
			sLuaApp:LuaDbg("玩家物品数量不足")
			sLuaApp:NotifyTipsMsgEx(player, "玩家物品数量不足")
			return ""
		end
	else
		sLuaApp:LuaDbg("找不到Lua_tools配置")
		return ""
	end
end

--卖出之后刷新数据
function DealShop.RefreshSellRecord(player, item_id, item_count)
	sLuaApp:LuaDbg("卖出之后刷新数据,itemid类型："..type(item_id))
	local exchangeData = ExchangeConfig.GetById(tonumber(item_id))
	if FunctionSwitch.AllFuncitonConfig["ExchangeAllServerLimit"] == "on" then
		--全服限购版本
		sLuaApp:LuaDbg("全服限购版本")
		local NowPrice = Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] - item_count*exchangeData.Float
		sLuaApp:LuaDbg("NowPrice/exchangeData.Buy:"..NowPrice/exchangeData.Buy)
		if NowPrice/exchangeData.Buy <= (1 - (exchangeData.Down)/10000) then
			sLuaApp:LuaDbg("卖出导致道具涨停")
			Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] = NowPrice
			Data.ExchangeTodayBuyRecord[item_id]["tendency"] = -1
			Data.ExchangeTodayBuyRecord[item_id]["limitup"] = 0
			Data.ExchangeTodayBuyRecord[item_id]["limitdown"] = 1
			DealShop.GetBuyRecord(player)
			local str = [[
				if CommerceUI then
					CommerceUI.OnSellRefresh()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		else
			sLuaApp:LuaDbg("卖出道具")
			local tendency = 0
			local limitup = 0
			if NowPrice/exchangeData.Buy >= (1 + (exchangeData.Up)/10000) then
				limitup = 1
			end
			sLuaApp:LuaDbg("NowPrice/exchangeData.Buy:"..NowPrice/exchangeData.Buy)
			
			if NowPrice/exchangeData.Buy > 1 then
				tendency = 1
			elseif NowPrice/exchangeData.Buy < 1 then
				tendency = -1
			end
			sLuaApp:LuaDbg("tendency"..tendency)
			Data.ExchangeTodayBuyRecord[item_id]["MoneyVal"] = NowPrice
			Data.ExchangeTodayBuyRecord[item_id]["tendency"] = tendency
			Data.ExchangeTodayBuyRecord[item_id]["limitup"] = limitup
			DealShop.GetBuyRecord(player)
			local str = [[
				if CommerceUI then
					CommerceUI.OnSellRefresh()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			return ""
		end
	else
		return ""
	end
end

function DealShop.Init()
	sLuaApp:LuaDbg("sVarSystem:GetDayInt:"..sVarSystem:GetDayInt("ExchangeAllLimit"))
	if sVarSystem:GetDayInt("ExchangeAllLimit") == 0 then
		Data.ExchangeTodayBuyRecord = nil
		Data.ExchangeOnceLimit = nil
		Data.ExchangeTodayBuyRecord = {}
		Data.ExchangeOnceLimit = {}
		sVarSystem:SetDayInt("ExchangeAllLimit", 1)
		local str = [[
			if CommerceUI then
				CommerceUI.GetData()
			end
		]]
		sLuaApp:ShowFormToAll("脚本表单",str)
		return ""
	end
end
DealShop.Init()



