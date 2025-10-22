-- 特惠商店
DiscountShop={}

require "system/DiscountShopConfig"


--@newinter DiscountShop.OpenWnd(player)
function DiscountShop.OpenWnd(player)
	sLuaApp:ShowForm(player, "脚本表单", "GUI.OpenWnd('DiscountMallUI')")
	return ""
end

--获取物品列表与全局属性
function DiscountShop.GetMainData(player)
	--sLuaApp:NotifyTipsMsg(player,"进入GetMainData")
	if not DiscountShopConfig then return end
	if player:GetInt("DiscountShopIndex") == 0 then
		player:SetInt("DiscountShopIndex", 1)
	end
	if player:GetInt("DiscountShopIndex") > #DiscountShopConfig.Main then
		player:SetInt("DiscountShopIndex", 1)
	end
	if not Data.DiscountShopGlobal then 
		sLuaApp:LuaErr("DiscountShop.GetGlobalData缺少Data.DiscountShopGlobal")
		return 
	end	
	if not Data.DiscountShopGlobal then 
		sLuaApp:LuaErr("DiscountShop.GetGlobalData缺少Data.DiscountShopGlobal")
		return 
	end
	if DiscountShop.AutoRefreshDecide(player) then
		sLuaApp:LuaErr("刷新时间已过，刷新商店") 
	end
	if DiscountShopConfig.Main[player:GetInt("DiscountShopIndex")] then
	sLuaApp:LuaErr("返回表单给客户端")
		if Lua_tools then
			local str = ""
			local index = player:GetInt("DiscountShopIndex")
			str=str..[[
				if DiscountMallUI then
					DiscountMallUI.item_info = ]] .. Lua_tools.serialize(DiscountShopConfig.Main[index]) .. [[]]
					.. DiscountShop.GetSurplusNumbers(player, index) .. [[
					DiscountMallUI.Refresh_Num = ]]..player:GetDayInt("Refresh_Num")..[[
					DiscountMallUI.Global = {}
					DiscountMallUI.Global = ]] .. Lua_tools.serialize(Data.DiscountShopGlobal) ..[[
					DiscountMallUI.Refresh()
				end 
			]]
			--sLuaApp:LuaErr("iteminfo:"..Lua_tools.serialize(DiscountShopConfig.Main[index]))
			--sLuaApp:LuaErr("global"..Lua_tools.serialize(Data.DiscountShopGlobal))
			sLuaApp:ShowForm(player, "脚本表单", str)
		end
	else
		sLuaApp:LuaErr("没有找到该商城列表") 
	end
end

--传递物品的已经购买的数量
function DiscountShop.GetSurplusNumbers(player, index)
	local str = ""
	local keyname = ""
	if index then
		local ItemData = DiscountShopConfig.Main[index]
		if ItemData then 
			for k, v in pairs(ItemData) do
				if v["limit"] then
					if v["itemkey"] then keyname = v["itemkey"] 
					elseif v["petkey"] then keyname = v["petkey"]
					end
					if player:GetString(index.."_"..keyname.."_limit", tostring(v["limit"])) == "" then
						player:SetString(index.."_"..keyname.."_limit", tostring(v["limit"]))
					end
					--sLuaApp:LuaErr("进入已购数量hasbuy")
					--sLuaApp:LuaErr(keyname)
					local hasbuy = v["limit"] - tonumber(player:GetString(index.."_"..keyname.."_limit"))
					str = str ..[[
					DiscountMallUI.item_info[]]..k..[[]["bought"] = ]] .. hasbuy
					--DiscountMallUI.item_info[k]['bought'] =hasbuy
				end
			end
		else
			sLuaApp:LuaErr("没有该商城列表")
		end
	end
	return str
end

--购买商品
function DiscountShop.Purchase(player, item_index, item_num)
	--sLuaApp:NotifyTipsMsg(player, "进入购买")
	if not DiscountShopConfig or not item_index or not item_num then 
		sLuaApp:NotifyTipsMsg(player, "缺少DiscountShopConfig或item_index或者item_num")
		return 
	end
	local DiscountShopIndex = player:GetInt("DiscountShopIndex")
	if DiscountShop.AutoRefreshDecide(player) then
		sLuaApp:NotifyTipsMsg(player,"刷新时间已过，请重新购买")
		return
	end

	if item_num == 0 then 
		--sLuaApp:NotifyTipsMsg(player, "购买数量不能为0")
		return 
	end
	if item_num > 0 then
		item_num = math.floor(tonumber(item_num))
	end
	if player:GetInt("DiscountShopIndex") == 0 then
		player:SetInt("DiscountShopIndex", 1)
	end
	local str = ""
	local DiscountShopIndex = player:GetInt("DiscountShopIndex")
	if DiscountShopConfig.Main[DiscountShopIndex][item_index] and Lua_tools then
	local item_info = DiscountShopConfig.Main[DiscountShopIndex][item_index]	--获取点击购买的那个商品信息
		local market_price = item_info["market_price"]
		local discount = item_info["discount"]
		local shop_price = (math.floor((market_price*discount)/100))
		local total = shop_price*item_num	--计算价格
		if math.floor(total) < total then
			total = math.floor(total)
		end
		if Lua_tools.IsMoneyEnough(player, item_info["money_type"], total) == false then	--货币兑换
			if MoneyChange then
				--DealShop.BuyItem(player, item_id, item_count)
				local f_name = [[DiscountShop.Purchase(player,]]..item_index..[[,]]..item_num..[[)]]
				MoneyChange.LackMoney(player, item_info["money_type"], totall, f_name)
				return ""
			end
		end
		if DiscountShop.IsBagFree(player, item_info, item_num) then	--判断包裹空间
			if DiscountShop.CanBuyNum(player, item_info, item_num) then	--判断限购数量
				if DiscountShop.SubMoney(player, item_info, total) then	--扣钱
					DiscountShop.GiveItem(player, item_info, item_index, item_num)	--给予商品
				end
			end
		end
	else
		sLuaApp:NotifyTipsMsg(player, "缺少商品信息")
	end
end

--物品限购
function DiscountShop.CanBuyNum(player, item_info, item_num)
	--local limit = item_info["limit"]
	local keyname = ""
	sLuaApp:LuaDbg(Lua_tools.serialize(item_info))
	if item_info["itemkey"] then keyname = item_info["itemkey"]
	elseif item_info["petkey"] then keyname = item_info["petkey"]
	else sLuaApp:NotifyTipsMsg(player, "物品数据出错") return false end
	local index = player:GetInt("DiscountShopIndex")
	--	1_大银币袋_limit
	local limit = tonumber(player:GetString(index.."_"..keyname.."_limit"))
	if limit then
		if item_num <= limit  then
			local sy = limit - item_num			--sLuaApp:LuaErr("sy的值："..sy)
			player:SetString(index.."_"..keyname.."_limit", tostring(sy))
			return true
		else
			sLuaApp:NotifyTipsMsg(player, "商品已售罄")
			return false
		end
	else
		sLuaApp:LuaErr("缺少limit")
	end
	return false
end

--背包空间是否足够
function DiscountShop.IsBagFree(player, item_info, item_num) 
	local keyname = ""
	if item_info["itemkey"] then
		keyname = item_info["itemkey"]
		local itemData = ItemConfig.GetByKeyName(keyname)
		--sLuaApp:LuaErr("Type-"..itemData.Type.."SubType-"..itemData.Subtype)
		if itemData.Type == 3 and itemData.Subtype == 9 then 
			if Lua_tools.GetGemBagFree(player) >= item_num then return true
			else sLuaApp:NotifyTipsMsg(player, "您的宝石包裹空间不足，无法购买！") return false end
		else
			local stack_max = itemData.StackMax	--获取物品的堆叠上限
			if Lua_tools.GetBagFree(player) >= math.ceil(item_num/stack_max) then return true
			else sLuaApp:NotifyTipsMsg(player,"您的包裹空间不足,无法购买！") return false end
		end
	elseif item_info["petkey"] then
		if Lua_tools.GetPetBagFree(player) >= item_num then return true
		else sLuaApp:NotifyTipsMsg(player,"您的宠物栏位不足,无法购买！") return false end
	else
		sLuaApp:NotifyTipsMsg(player, "物品数据出错")
		return false
	end
	return false
end

--扣钱
function DiscountShop.SubMoney(player, item_info, total)
	local Money_Type = item_info["money_type"]
	if Money_Type then
		if Lua_tools.SubMoney(player, Money_Type, total, "system", "特惠商店购物", "") then 
			return true
		else
			sLuaApp:NotifyTipsMsg(player, "您的货币不足，无法购买！")
			return false
		end
	end
	return false
end

--给予商品
function DiscountShop.GiveItem(player, item_info, item_index, item_num)
	local keyname = ""
	local is_bind = true	--是否绑定
	local str = ""
	if item_info["bind"] == 0 then
		is_bind = false
	end	
	if item_info["itemkey"] then
		keyname = item_info["itemkey"]
		local ItemData = ItemConfig.GetByKeyName(keyname)	--根据keyname获取道具信息
		sItemSystem:MergeItemEx(player, ItemData.Id, item_num, is_bind, "system", "特惠商店", "")
	elseif item_info["petkey"] then
		keyname = item_info["petkey"]
		local petdata = PetConfig.GetByKeyName(keyname)	--根据keyname获取宠物信息
		for i = 1, item_num do
			sPetSystem:AddPetEx(player, petdata.Id, 1, is_bind, "system", "特惠商店", "")
			sLuaApp:NotifyTipsMsg(player,"您获得了宠物"..petdata.Name)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "物品数据出错")
		return
	end
	local hasbuy = item_info["limit"] - tonumber(player:GetString(player:GetInt("DiscountShopIndex").."_"..keyname.."_limit"))
	str = str..[[DiscountMallUI.RefreshBuyCnt(]]..item_index..",".. hasbuy..[[)]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--刷新扣钱
function DiscountShop.RefreshSubMoney(player)
	local Refresh_Num = player:GetDayInt("Refresh_Num")
	Refresh_Num = Refresh_Num + 1
	if Refresh_Num > Data.DiscountShopGlobal["RefreshMax"] then
		Refresh_Num = Data.DiscountShopGlobal["RefreshMax"]
	end
	if Refresh_Num <= 0 then
		Refresh_Num = 1
	end
	local Money_Type = Data.DiscountShopGlobal["RefreshMoney_"..Refresh_Num][2]
	local Refresh_Consume = Data.DiscountShopGlobal["RefreshMoney_"..Refresh_Num][1]
	--sLuaApp:NotifyTipsMsg(player, "RefreshMoney_"..Refresh_Num.."/"..Money_Type.."/"..Refresh_Consume)
	if Money_Type and Refresh_Consume then
		if Lua_tools.IsMoneyEnough(player, Money_Type, Refresh_Consume) == false then
			if MoneyChange then
				--DealShop.BuyItem(player, item_id, item_count)
				local f_name = [[DiscountShop.RefreshSubMoney(player)]]
				MoneyChange.LackMoney(player, Money_Type, Refresh_Consume, f_name)
				return ""
			end
		end
	
		if not Lua_tools.SubMoney(player, Money_Type, Refresh_Consume, "system", "刷新特惠商店", "") then
			sLuaApp:NotifyTipsMsg(player, "您的货币不足,无法刷新")
			return
		end
	else
		sLuaApp:NotifyTipsMsg(player, "Money_Type和Refresh_Consume缺失")
	end
	local long = #DiscountShopConfig.Main
	local index = sLuaApp:RandInteger(1, long)
	--player:SetInt("DiscountShopIndex", index)
	while index == player:GetInt("DiscountShopIndex") do
		index = sLuaApp:RandInteger(1, long)
	end
	DiscountShop.Refresh(player, index)
end

--刷新
function DiscountShop.Refresh(player, index)
	if player:GetInt("DiscountShopIndex") == 0 then
		player:SetInt("DiscountShopIndex", 1)
	end
	local MainData = DiscountShopConfig.Main[player:GetInt("DiscountShopIndex")]
	--把限购的自定义变量清零
	sLuaApp:LuaErr("刷新前index"..player:GetInt("DiscountShopIndex").."  刷新后index"..index)
	for k, v in pairs(MainData) do
		if v["limit"] then
			local keyname = ""
			if v["itemkey"] then keyname = v["itemkey"]
			elseif v["petkey"] then keyname = v["petkey"]
			else sLuaApp:NotifyTipsMsg(player, "物品数据出错") return end
			player:SetString(player:GetInt("DiscountShopIndex").."_"..keyname.."_limit", "")
		end
	end
	player:SetDayInt("Refresh_Num", player:GetDayInt("Refresh_Num") + 1)
	player:SetInt("DiscountShopIndex", index)
	--sLuaApp:NotifyTipsMsg(player,"刷新商店页面成功")
	DiscountShop.GetMainData(player)
end

--自动刷新判断时间
function DiscountShop.AutoRefreshDecide(player)
	--sLuaApp:Str2DateTime()	将字符串时间转换成时间值，单位秒 参数strDateTime 字符串时间,时间格式:Y-m-d H:M:S或Y-m-d或H:M:S.  
	--sLuaApp::GetTimes() 取得1970年1月1日0时0分0到现在经过的秒数. 取得1970年1月1日0时0分0到现在经过的秒数.
	local Now_Time =sLuaApp:GetTimes()
	if player:GetInt("last_time") == 0 then
		player:SetInt("last_time", Now_Time)
	end
	local Last_Time = player:GetInt("last_time")
	player:SetInt("last_time", Now_Time)
	local Now_Day = sLuaApp:DaySinceEpoch(Now_Time)
	local Last_Day = sLuaApp:DaySinceEpoch(Last_Time)
	local real = false
	local gap_day = Now_Day - Last_Day

	--sLuaApp:LuaErr(gap_day.." Now_Time:"..Now_Time.." last_time:"..Last_Time)
	if gap_day > 1 then
		real = true
	elseif gap_day == 0 then
		for k, v in ipairs(Data.DiscountShopGlobal["RefreshTime"]) do
			local RefreshTime =  sLuaApp:Str2DateTime(v)
			--sLuaApp:LuaErr(RefreshTime)
			if Last_Time < RefreshTime and Now_Time > RefreshTime then
				real = true
			end
		end
	elseif gap_day == 1 then
		local long = #Data.DiscountShopGlobal["RefreshTime"]
		local gap = sLuaApp:Str2DateTime(Data.DiscountShopGlobal["RefreshTime"][long]) - sLuaApp:Str2DateTime(Data.DiscountShopGlobal["RefreshTime"][1])
		if Now_Time - Last_Time >= gap then
			real = true
		end
	end
	if real then
		DiscountShop.AutoRefresh(player)
		return true
	end
	return false
end

--自动刷新
function DiscountShop.AutoRefresh(player)
	sLuaApp:LuaErr("进入自动刷新")
	local Now_Time = sLuaApp:GetTimes()
	if sDBVarSystem:GetInt("LastRefreshTime") == 0 then
		sDBVarSystem:SetInt("LastRefreshTime", Now_Time, 1)
	end
	if not sDBVarSystem:GetInt("AutoRefreshIndex") then
		sDBVarSystem:SetInt("AutoRefreshIndex", 1, 1)
	end
	local Last_Time = sDBVarSystem:GetInt("LastRefreshTime")
	sDBVarSystem:SetInt("LastRefreshTime", Now_Time, 1)
	
	if Last_Time == Now_Time then
		sDBVarSystem:SetInt("AutoRefreshIndex", 2, 1)
	else
		local last_hour = sLuaApp:HourSinceEpoch(Last_Time)
		local now_hour = sLuaApp:HourSinceEpoch(Now_Time)
		local hour = now_hour - last_hour
		local long = #Data.DiscountShopGlobal["RefreshTime"]
		if hour > (24/long) then
			local gapindex = math.floor(hour/(24/long))
			local index = sDBVarSystem:GetInt("AutoRefreshIndex")
			for i = 1 , gapindex do
				index = index + 1
				if index > #DiscountShopConfig.Main then
					index = 1
				end
			end
			sDBVarSystem:SetInt("AutoRefreshIndex", index, 1)
		else
			sLuaApp:LuaErr("自动刷新小于时间间隔")
			sDBVarSystem:SetInt("AutoRefreshIndex", sDBVarSystem:GetInt("AutoRefreshIndex")+1, 1)
			if sDBVarSystem:GetInt("AutoRefreshIndex") > #DiscountShopConfig.Main then
				sDBVarSystem:SetInt("AutoRefreshIndex", 1, 1)
			end
			--sDBVarSystem:SetInt("LastAutoRefreshTIme", sLuaApp:GetTimes(), 1)
		end
	end
	local auto_index = sDBVarSystem:GetInt("AutoRefreshIndex")
	sLuaApp:LuaErr("sDBVarSystem:"..auto_index)
	--player:SetInt("DiscountShopIndex", )
	DiscountShop.Refresh(player, auto_index)
end



--特惠商店全局设置放入Data
function DiscountShop.Initialization()
	if not DiscountShopConfig then
		require("system/DiscountShopConfig")
	end
	if Data then
		--if not Data.DiscountShopGlobal then
			Data.DiscountShopGlobal = {}
			if DiscountShopConfig.Global then
				Data.DiscountShopGlobal = DiscountShopConfig.Global
			else	
				sLuaApp:LuaErr("缺少DiscountShopConfig.Global")
			end
		--end
	else
		sLuaApp:LuaErr("缺少Data")
	end
end

DiscountShop.Initialization()