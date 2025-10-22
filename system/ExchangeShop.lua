--兑换商店
ExchangeShop={}
require "system/ExchangeShopConfig"

--获取tab
function ExchangeShop.GetTabData(player)
	if not ExchangeShopConfig.Tab then 
		sLuaApp:LuaErr("ExchangeShop.GetTabData缺少Data.ExchangeShopTab")
		return 
	end
	local str = ""
	if Lua_tools then
		str = str .. [[
			if ShopStoreUI then 
				ShopStoreUI.Tab = {}
				ShopStoreUI.Tab = ]] .. Lua_tools.serialize(ExchangeShopConfig.Tab) .. [[
				ShopStoreUI.SpecialShopName = ']]..ExchangeShopConfig.SpecialShopName..[['
				ShopStoreUI.RefreshTab()
			end ]]
	end
	--sLuaApp:LuaDbg(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	return
end	

--获取物品列表
function ExchangeShop.GetMainData(player,Version,Tabs_Key)
	ExchangeShop.CreatPetInfo()
	if not ExchangeShopConfig or not Version or not Tabs_Key then return end
	Tabs_Key = tostring(Tabs_Key)
	if not ExchangeShopConfig.Tab then 
		sLuaApp:LuaErr("ExchangeShop.GetTabData缺少Data.ExchangeShopTab")
		return 
	end
	--sLuaApp:LuaDbg("Tabs_Key:"..Tabs_Key)
	if ExchangeShopConfig.Tab[Tabs_Key] and ExchangeShopConfig.Tab[Tabs_Key]["Special"] then
		--sLuaApp:LuaDbg("打开特殊界面")
		ExchangeShop.hasOpenSpecailUI = ExchangeShopConfig.Tab[Tabs_Key]["Special"]
		local str = [[	 
			if ]]..ExchangeShopConfig.Tab[Tabs_Key]["Special"]..[[ then
				]]..ExchangeShopConfig.Tab[Tabs_Key]["Special"]..[[.SetVisible(]].."true"..[[)
			else
				GUI.OpenWnd(]]..ExchangeShopConfig.Tab[Tabs_Key]["Special"]..[[)
			end	
		]]
		--sLuaApp:LuaDbg(str)
		sLuaApp:ShowForm(player, "脚本表单", str)
		return ""
	end
	if ExchangeShopConfig.Tab[Tabs_Key] and ExchangeShopConfig.Main[Tabs_Key] then	
		if Lua_tools then
			if ExchangeShop.hasOpenSpecailUI ~= nil then
				--sLuaApp:LuaDbg("关闭已打开的特殊界面")
				local str_1 = [[ 
					if ]]..ExchangeShop.hasOpenSpecailUI..[[ then
						]]..ExchangeShop.hasOpenSpecailUI..[[.SetVisible(]].."false"..[[)
					end
				]]
				sLuaApp:ShowForm(player, "脚本表单", str_1)
			end
		if Version == ExchangeShopConfig.Version[Tabs_Key] then return end--版本相同return
			local str = ""
			str=str..[[
				if ShopStoreUI then
					ShopStoreUI.Version["]]..Tabs_Key..[["]="]]..ExchangeShopConfig.Version[Tabs_Key]..[["
					ShopStoreUI.Item_Info["]]..Tabs_Key..[["] = ]] .. Lua_tools.serialize(ExchangeShopConfig.Main[Tabs_Key]) .. [[
					ShopStoreUI.RefreshData()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	else
		sLuaApp:LuaErr("兑换商店标签序号不存在") 
	end
end

--购买
function ExchangeShop.Purchase(player,Version,Tabs_Key,item_index,item_num)
	if not ExchangeShopConfig or not Version or not Tabs_Key or not item_index or not item_num then return end
	Tabs_Key = tostring(Tabs_Key)
	if tonumber(item_num) <= 0 then return end
	if tonumber(item_num) > 0 then
		item_num = math.floor(tonumber(item_num))
	end
	local str=""
	if Version ~= ExchangeShopConfig.Version[Tabs_Key] then
		ExchangeShop.GetTabData(player)
		sLuaApp:NotifyTipsMsg(player,"商店数据已刷新，请重新尝试兑换")
		return
	end
	if not ExchangeShopConfig.Tab then 
		sLuaApp:LuaErr("ExchangeShop.GetTabData缺少Data.ExchangeShopTab")
		return 
	end
	if not ExchangeShopConfig.Tab[Tabs_Key] then
		ExchangeShop.GetTabData(player)
		sLuaApp:NotifyTipsMsg(player,"商店数据已刷新，请重新尝试兑换")
		return
	end
	if ExchangeShopConfig.Main[Tabs_Key][item_index] and Lua_tools then
		if ExchangeShop.IsBagFree(player,Tabs_Key,item_index,item_num) then--背包是否空
			local item_info = ExchangeShopConfig.Main[Tabs_Key][item_index]
			if ExchangeShop.CanBuy(player, item_info, item_num, Tabs_Key) then
				local total=ExchangeShopConfig.Main[Tabs_Key][item_index]["price"]*item_num
					--sLuaApp:LuaDbg(total)
				if ExchangeShop.SubMoney(player,Tabs_Key,total) then
					--给货
					local item_keyname=ExchangeShopConfig.Main[Tabs_Key][item_index]["keyname"]--是否绑定
					local is_bind=true
					if ExchangeShopConfig.Main[Tabs_Key][item_index]["bind"]==0 then
						is_bind=false
					end
					if ExchangeShopConfig.Tab[Tabs_Key]["IsPet"]==1 then--是否宠物
						local petdata = PetConfig.GetByKeyName(item_keyname)
						local bought = player:GetDayInt("ExchangeShopPetLimit_" .. petdata.Id)--今日已购买数量
						for i=1,item_num do
							sPetSystem:AddPetEx(player,petdata.Id,1,is_bind,"system","兑换商店","")
							sLuaApp:NotifyTipsMsg(player,"您获得了宠物"..petdata.Name)
						end
						player:SetDayInt("ExchangeShopPetLimit_"..petdata.Id, bought + item_num)
						
					elseif ExchangeShopConfig.Tab[Tabs_Key]["IsPet"]==0 then
						local ItemData = ItemConfig.GetByKeyName(item_keyname)
						local bought = player:GetDayInt("ExchangeShopItemLimit_" .. ItemData.Id)--今日已购买数量
						sItemSystem:MergeItemEx(player, ItemData.Id, item_num, is_bind, "system", "兑换商店", "")
						player:SetDayInt("ExchangeShopItemLimit_" .. ItemData.Id, bought + item_num)--今日已购买数量
						--sItemSystem:AddItemEx(player, sItemSystem:GetItemIdByKeyname(item_keyname), item_num, is_bind, "system", "兑换商店", "")
					end	
				end
			end
		end
	else
		sLuaApp:LuaErr("标签序号或物品序号不存在") 
	end
end

--判断限购	
function ExchangeShop.CanBuy(player, item_info, item_num, Tabs_Key)
	local item_keyname = item_info["keyname"]
	if not item_info["max_num"] then
		return true
	end
	local bought = 0
	if ExchangeShopConfig.Tab[Tabs_Key]["IsPet"] == 1 then
		local petdata = PetConfig.GetByKeyName(item_keyname)
		bought = player:GetDayInt("ExchangeShopPetLimit_" .. petdata.Id)--今日已购买数量
	elseif ExchangeShopConfig.Tab[Tabs_Key]["IsPet"] == 0 then
		local itemData = ItemConfig.GetByKeyName(item_keyname)
		bought = player:GetDayInt("ExchangeShopItemLimit_" .. itemData.Id)--今日已购买数量
	end
	local item_max_num = item_info["max_num"]--每日限购数量
	if item_max_num ~= 0 and item_max_num ~= 65535 then 
		if (item_max_num - bought) < item_num then
			sLuaApp:NotifyTipsMsg(player, "商品限量出售，目前无法再购买")
			return false
		end
	end	
	return true
end

--背包是否空
function ExchangeShop.IsBagFree(player,Tabs_Key,item_index,item_num) 
	if ExchangeShopConfig.Tab[Tabs_Key]["IsPet"]==0 then
		local itemData = ItemConfig.GetByKeyName(ExchangeShopConfig.Main[Tabs_Key][item_index]["keyname"])
		if itemData.Type == 6 then
			--道具为信物
			local itemCon
			if BagClassify.Mode and BagClassify.Mode == 1 then
				itemCon = player:GetItemContainer(ITEM_CONTAINER_BAG)
			else
				itemCon = player:GetItemContainer(ITEM_CONTAINER_GUARD_BAG)
			end
			if itemCon:GetFreeSiteCount() >= math.ceil(item_num/itemData.StackMax) then
				return true
			else
				sLuaApp:NotifyTipsMsg(player,"您的信物包裹空间不足,无法兑换")
				return false
			end
		else
			if Lua_tools.GetBagFree(player)>= math.ceil(item_num/itemData.StackMax) then
				return true
			else
				sLuaApp:NotifyTipsMsg(player,"您的包裹空间不足,无法兑换")
				return false
			end
		end
	elseif ExchangeShopConfig.Tab[Tabs_Key]["IsPet"]==1 then
		if Lua_tools.GetPetBagFree(player)>=item_num then
			return true
		else
			sLuaApp:NotifyTipsMsg(player,"您的宠物栏位不足,无法兑换")
			return false
		end
	end
	return false
end

--扣钱 
function ExchangeShop.SubMoney(player,Tabs_Key,total)
	local shop_tab = ExchangeShopConfig.Tab[Tabs_Key]
	if shop_tab["ConsumeType"] == "attr" then
		local attr = shop_tab["MoneyType"]
		local player_attr=player:GetAttr(attr)
		if player_attr >= total then--判断钱够不够
			assert(load("local player = sPlayerSystem:GetPlayerByGUID('"..player:GetGUID().."') return player:"..ExchangeShopConfig.FunctionList[attr][3].."("..total..",'system','兑换商店','')"))()
			return true
		else
			sLuaApp:NotifyTipsMsg(player, shop_tab["MoneyName"].."不足,无法兑换")
			return false
		end
	elseif shop_tab["ConsumeType"] == "int" then
		local player_int=player:GetInt(shop_tab["MoneyType"])
		if player_int >= total then
			player:SetInt(shop_tab["MoneyType"],(player_int-total))
			return true
		else
			sLuaApp:NotifyTipsMsg(player, shop_tab["MoneyName"].."不足,无法兑换")
			return false
		end
		
	elseif shop_tab["ConsumeType"] == "item" then
		local item_id = ItemConfig.GetByKeyName(shop_tab["MoneyType"]).Id
		local item_num = sItemSystem:GetItemAmount(player, item_id, 3) 
		if item_num >= total then
			sItemSystem:ConsumeItemWithPriority(player, item_id, total, true, "system", "兑换商店", "")
			return true
		else
			sLuaApp:NotifyTipsMsg(player, shop_tab["MoneyName"].."不足,无法兑换")
			return false
		end
	end
	return false
end

--通过兑换商店标签名打开兑换商店
function ExchangeShop.OpenExchangeShop(player, Tab_key, shop_id)
	if ExchangeShopConfig.Tab then
		local sort_tmp = {}
		for k,v in pairs(ExchangeShopConfig.Tab) do
			local tmp = {}
			tmp['Index'] = v['Index']
			tmp['tab_key'] = k
			table.insert(sort_tmp, tmp)
		end
		table.sort(sort_tmp, function(a,b)
			return a['Index'] < b['Index']
		end)
	
		for k,v in ipairs(sort_tmp) do
			if v['tab_key'] == Tab_key then
				if shop_id then
					local str = [[
						GUI.OpenWnd("ShopStoreUI","]]..k..[[,]]..shop_id..[[")
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
				else
					local str = [[
						GUI.OpenWnd("ShopStoreUI","]]..k..[[")
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
				end
				return true
			end
		end
		sLuaApp:LuaErr("兑换商店Data中没有"..Tab_key)
		return false
	else
		sLuaApp:LuaErr("缺少Data.ExchangeShopTab")
		return false
	end
end

--从ExchangeShopConfig.ActTab中加兑换商店标签
function ExchangeShop.AddTabConfig(tab_key)
	if ExchangeShopConfig.Tab then
		if ExchangeShopConfig.ActTab[tab_key] then
			ExchangeShopConfig.Tab[tab_key] = ExchangeShopConfig.ActTab[tab_key]
		else
			sLuaApp:LuaErr("不存在ExchangeShopConfig.ActTab"..tab_key)
		end
	else
		sLuaApp:LuaErr("缺少Data.ExchangeShopTab")
	end
end
--删除兑换商店标签
function ExchangeShop.DelTabConfig(tab_key)
	if ExchangeShopConfig.Tab then
		if ExchangeShopConfig.Tab[tab_key] then
			ExchangeShopConfig.Tab[tab_key] = nil
		else
			sLuaApp:LuaErr("Data.ExchangeShopTab中不存在"..tab_key)
		end
	else
		sLuaApp:LuaErr("缺少Data.ExchangeShopTab")
	end
end

function ExchangeShop.CreatPetInfo()
	for k,v in pairs(ExchangeShopConfig.Tab) do
		if v["IsPet"] == 1 then
			local petList = {}
			for a, b in ipairs(ExchangeShopConfig.Main[k]) do
				--sLuaApp:LuaDbg("尝试录入宠物"..b["keyname"])
				table.insert(petList, b["keyname"])
			end
			Lua_tools.RegisterPets(petList)
		end
	end
end