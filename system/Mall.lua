--商城
Mall={}
--传商城标签
--require("system/MallConfig")
function Mall.GetData(player)
	if not MallConfig.Currency_Tab then return end
	local str = ""
	if Lua_tools then
		str = str .. [[
			if MallUI then 
				MallUI.Currency_Tab = ]] .. Lua_tools.serialize(MallConfig.Currency_Tab)
		if FunctionSwitch.AllFuncitonConfig.MallFree == "on" then
			str = str..[[
				MallUI.MallFreeTipsInfo = ']]..MallFree.ReturnConfig.TipsInfo..[['
			]]
		end
		str = str..[[
				MallUI.RefreshTab()
			end 
		]]
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
	return
end	

--传某个标签下的物品列表
function Mall.Item_Info(player,Version,Tabs_index,Classify_index)
	if not Version or not Tabs_index or not Classify_index then	
		return 
	end
	Tabs_index=tonumber(Tabs_index)
	Classify_index=tonumber(Classify_index)
	if Version==MallConfig.Version[Tabs_index][Classify_index] then 
		return 
	end--版本相同return
	
	local str = ""
	local Money_Tab=MallConfig.Currency_Tab[Tabs_index]
	local Classify_name = Money_Tab['Classify'][Classify_index]
	if Money_Tab and Classify_name then
		if MallConfig.MainPro[Tabs_index] then
			local Main_Classify=MallConfig.MainPro[Tabs_index][Classify_name] 
			if Main_Classify then
				if Lua_tools then
					local str_Currency={}
					str_Currency[Tabs_index]={}
					str_Currency[Tabs_index][Classify_name]=MallConfig.MainPro[Tabs_index][Classify_name]
					str=str..[[
						if MallUI then
							MallUI.Version]].."["..Tabs_index.."]["..Classify_index.."]"..[[="]]..MallConfig.Version[Tabs_index][Classify_index]..[["
							MallUI.Currency_Classify_Item=]].. Lua_tools.serialize(str_Currency) .. [[]]
							.. Mall.GetSurplusNumbers(player,Tabs_index,Classify_name) .. [[
							MallUI.RefreshData(]]..Tabs_index..[[,]]..Classify_index..[[)
						end
					]]
				end
			end
		end
		if str ~= "" then
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	else
		sLuaApp:LuaErr("商城表tab配置错误")
	end
	return
end

--传限购物品的已购数量
function Mall.GetSurplusNumbers(player,Tabs_index,Classify_name)
	local str = ""
	if Tabs_index and Classify_name then
		local Main_Classify=MallConfig.MainPro[Tabs_index][Classify_name]
		if Main_Classify then 
			for k,v in pairs(Main_Classify) do
				if v["total_num"] then 
					str = str ..[[
					MallUI.Currency_Classify_Item[]]..Tabs_index..[[][']]..Classify_name..[['][]]..k..[[]['total']=]] ..player:GetInt("SHOPITEMLIMITTIME_TOTAL_" .. v["Id"])--getint-SHOPITEMLIMITTIME_TOTAL_1056 限制单个玩家总共可购买数量的物品的id
				elseif v["max_num"] ~= 0 then
					str = str ..[[
					MallUI.Currency_Classify_Item[]]..Tabs_index..[[][']]..Classify_name..[['][]]..k..[[]['bought']=]] ..player:GetDayInt("SHOPITEMLIMITTIME_BOUGHT_" .. v["Id"])--getint-SHOPITEMLIMITTIME_BOUGHT_1057 每日限购的物品的id
				end
			end
		else
			sLuaApp:LuaErr("商城表Main配置错误")
		end
	end
	return str
end

--购买
function Mall.Purchase(player,Version,Tabs_index,Classify_index,item_index,item_num,check_mod)
	if not Tabs_index or not Version or not Classify_index or not item_index or not item_num then return end
	Tabs_index=tonumber(Tabs_index)
	Classify_index=tonumber(Classify_index)
	item_index=tonumber(item_index)
	if tonumber(item_num) <= 0 then return end
	if tonumber(item_num) > 0 then
		item_num = math.floor(tonumber(item_num))
	end
	
	--判断版本
	if Version~=MallConfig.Version[Tabs_index][Classify_index] then
		Mall.Item_Info(player,Version,Tabs_index,Classify_index)
		sLuaApp:NotifyTipsMsg(player,"商店数据已刷新，请重新尝试购买")	
		return
	end
	
	local Classify_name = MallConfig.Currency_Tab[Tabs_index]['Classify'][Classify_index]
	local item_info=MallConfig.MainPro[Tabs_index][Classify_name][item_index]
	
	--判断是否 是今天的商品
	if item_info.weekday then
		local now_weekday = sLuaApp:WeekDay(0)
		if item_info.weekday ~= now_weekday then
			sLuaApp:NotifyTipsMsg(player, "购买失败，请重新尝试购买")
			return
		end
	end

	if Classify_name and Lua_tools then
		--判断限购
		if Mall.CanBuy(player,item_info,item_num) then
			--判断背包
			if Mall.BagFree(player,item_info,item_num) then
				--判断钱是否够--扣钱--写入限购
				if Mall.SubMoney(player,Tabs_index,Classify_index,item_index,item_num,Version,check_mod) then
					--给物品
					Mall.GiveItem(player,item_info,item_num)
				end
			end
		end
	end
end
--判断限购	
function Mall.CanBuy(player,item_info,item_num)
	--local item_info=MallConfig.MainPro[Tabs_index][Classify_name][item_index]
	local item_id = item_info["Id"]
	local total = player:GetInt("SHOPITEMLIMITTIME_TOTAL_" .. item_id)--已购买总数量
	local bought = player:GetDayInt("SHOPITEMLIMITTIME_BOUGHT_" .. item_id)--今日已购买数量

	local item_total_num = item_info["total_num"]--总限购数量 
	local item_max_num = item_info["max_num"]--每日限购数量
	if item_total_num then 
		if (item_total_num - total) < item_num then
			sLuaApp:NotifyTipsMsg(player, "商品限量出售，目前无法再购买")
			return false
		end

	elseif item_max_num ~= 0 and item_max_num ~= 65535 then 
		if (item_max_num - bought) < item_num then
			sLuaApp:NotifyTipsMsg(player, "商品限量出售，目前无法再购买")
			return false
		end
	end	
	return true

end
--判断背包
function Mall.BagFree(player,item_info,item_num)
	--local item_info=MallConfig.MainPro[Tabs_index][Classify_name][item_index]

	if item_info["template_type"] == 0 then--区分物品or宠物
		local item_keyname=item_info["keyname"]
		local stack_max = ItemConfig.GetByKeyName(item_keyname).StackMax
		if item_info["is_gem"] and item_info["is_gem"] == 1 then --区分宝石
			if Lua_tools.GetGemBagFree(player) >= math.ceil(item_num/stack_max) then
				return true
			else
				sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足，无法购买！")
				return false
			end
		else
			if Lua_tools.GetBagFree(player) >= math.ceil(item_num/stack_max) then
				return true
			else
				sLuaApp:NotifyTipsMsg(player, "您的包裹空间不足，无法购买！")
				return false
			end
		end
	elseif item_info["template_type"] == 1 then 
		if Lua_tools.GetPetBagFree(player) >= item_num then
			return true
		else
			sLuaApp:NotifyTipsMsg(player, "您的宠物栏位不足，无法购买！")
			return false
		end
	end
	sLuaApp:LuaErr("商城表template_type配置错误")
	return false
end

function Mall.CheckCost(player, total_price, Tabs_index, Money_Name,Classify_index,item_index,item_num,Version, check_mod)
	if check_mod and check_mod == 1 then return true end
	if not MallConfig.CostTips then	return true end
	local check_money_val = MallConfig.CostTips[Tabs_index]
	if not check_money_val then return true end
	if check_money_val > total_price then return true end
	local msg = "本次消费将消耗"..total_price..Money_Name.."，是否确认？"
	local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "Mall.Purchase(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),'"..Version.."',"..Tabs_index..","..Classify_index..","..item_index..","..item_num..",1)")
	sLuaApp:ShowForm(player, "脚本表单", str)
	return false
end

--判断钱是否够--扣钱
function Mall.SubMoney(player,Tabs_index,Classify_index,item_index,item_num,Version,check_mod)
	local Classify_name = MallConfig.Currency_Tab[Tabs_index]['Classify'][Classify_index]
	local item_info=MallConfig.MainPro[Tabs_index][Classify_name][item_index]
	local Money_Tab=MallConfig.Currency_Tab[Tabs_index]
	local Money_Type=Money_Tab["Money_Type"]
	local Money_Name = Money_Tab["Name"]
	local item_price=item_info["price"]
	if item_price and Money_Type then
		local total_price = math.floor(item_price*(item_info["discount"]/100)) * item_num
		if not Mall.CheckCost(player, total_price, Tabs_index, Money_Name,Classify_index,item_index,item_num,Version,check_mod) then return end--金额过大提示
		if Lua_tools.SubMoney(player, Money_Type, total_price, "system", "商城购物", "") then--扣钱
			--判断是否触发免单
			MallFree.CheckFree(player, total_price, item_info["keyname"])
			--写入限购 可拆分
			local str=""
			local item_id = item_info["Id"]
			local total = player:GetInt("SHOPITEMLIMITTIME_TOTAL_" .. item_id)--已购买总数量
			local bought = player:GetDayInt("SHOPITEMLIMITTIME_BOUGHT_" .. item_id)--今日已购买数量
			if item_info["total_num"] then 
				player:SetInt("SHOPITEMLIMITTIME_TOTAL_".. item_id,(total + item_num))
				str =str.. [[
					if MallUI then 
						MallUI.RefreshBuyCnt(]]..Tabs_index..",'"..Classify_name.."',"..item_index..",'total',"..(total + item_num)..[[)
					end
				]]
			elseif item_info["max_num"] ~= 0 then 
				--Mall.PlayerRedPointUpdate(player)--刷新红点
				player:SetDayInt("SHOPITEMLIMITTIME_BOUGHT_" .. item_id,(bought + item_num))
				str =str.. [[
					if MallUI then 
						MallUI.RefreshBuyCnt(]]..Tabs_index..",'"..Classify_name.."',"..item_index..",'bought',"..(bought + item_num)..[[)
					end
				]]
			end
			if str ~= "" then
				sLuaApp:ShowForm(player, "脚本表单", str)
			end
			return true
		else
			--兑换货币
			if MoneyChange then
				local f_name = [[Mall.Purchase(player,"]]..Version..[[",]]..Tabs_index..[[,]]..Classify_index..[[,]]..item_index..[[,]]..item_num..[[,1)]]
				MoneyChange.LackMoney(player, Money_Type, total_price, f_name)
			else
				sLuaApp:NotifyTipsMsg(player, "您的"..Money_Name.."不足")
			end
			return false
		end
	else
		return false
	end
end

function Mall.GiveItem(player,item_info,item_num)
	local item_keyname=item_info["keyname"]
	if item_info["template_type"]== 0 then--区分物品or宠物
		local ItemData = ItemConfig.GetByKeyName(item_keyname)
		sItemSystem:MergeItemEx(player, ItemData.Id, item_num, false, "system", "商城购物", "")
	elseif item_info["template_type"]== 1 then 
		local PetData = PetConfig.GetByKeyName(item_keyname)
		for i = 1, item_num do 
			sPetSystem:AddPetEx(player,PetData.Id,1,false,"system","商城购物","")
			sLuaApp:NotifyTipsMsg(player,"您获得了宠物"..PetData.Name)
		end
	end
end
function Mall.GetAllData(player)
	if not player then return end
	local str = ""
	if Lua_tools then
		str = str .. [[
			if GlobalUtils then 
				GlobalUtils.MallItemData = ]] .. Lua_tools.serialize(MallConfig.Main) .. [[
				GlobalUtils.MallItemType = ]] .. Lua_tools.serialize(MallConfig.Currency_Tab) .. [[
				GlobalUtils.RefreshMallData()
			end ]]
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end
