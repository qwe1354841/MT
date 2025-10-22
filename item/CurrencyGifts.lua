-- 通用礼包
CurrencyGifts={}
-- 创建物品
function CurrencyGifts.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function CurrencyGifts.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function CurrencyGifts.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local Item_Name=item:GetKeyName()
	local is_bound = item:IsBound() and 1 or 0
	if CurrencyGiftsConfig.MainEx[Item_Name][is_bound] then
		--[[
			1.如果礼包中含有物品，要判断背包格子数量
			2.如果礼包中只有货币，则不需要判断格子数量
		--]]

		local onlyHaveMoneyList = true

		for k, v in pairs(CurrencyGiftsConfig.MainEx[Item_Name][is_bound]) do
			if k ~= "MoneyList" then
				onlyHaveMoneyList = false
				break
			end
		end

		if onlyHaveMoneyList then
			-- 礼包中只有货币
			return true
		else
			-- 礼包中含有物品
			local num=0
			local Pro=player:GetAttr(ROLE_ATTR_ROLE)
			if CurrencyGiftsConfig.MainEx[Item_Name][is_bound]['ItemList'] then
				for	k,v in ipairs(CurrencyGiftsConfig.MainEx[Item_Name][is_bound]['ItemList']) do
					if type(v)=="string" and v~="" then
						num=num+1
					end
				end
			end
			if CurrencyGiftsConfig.MainEx[Item_Name][is_bound]['ItemList_'..Pro] then
				for	k,v in ipairs(CurrencyGiftsConfig.MainEx[Item_Name][is_bound]['ItemList_'..Pro]) do
					if type(v)=="string" and v~="" then
						num=num+1
					end
				end
			end
			if Lua_tools then
				if num<=Lua_tools.GetBagFree(player) then
					return true
				else
					sLuaApp:NotifyTipsMsg(player,"背包已满")
					return false
				end
			end

		end

	else
		sLuaApp:LuaErr("礼包配置错误")
		return false
	end
	return false
end

-- 使用物品
function CurrencyGifts.on_use_item(player, item, count)
    if item == nil then
        return
    end
	local Item_Name=item:GetKeyName()  --这是keyname
	local itemName=item:GetName()  --这是name
	
	local onlyHaveMoneyList = true
	
	local is_bound = item:IsBound() and 1 or 0
	local Gifts = CurrencyGiftsConfig.MainEx[Item_Name][is_bound]
	for k, v in pairs(Gifts) do
		if k ~= "MoneyList" then
			onlyHaveMoneyList = false
			break
		end
	end
	if onlyHaveMoneyList then
		if count == 1 then
			Lua_tools.GiveGoods(player,Gifts)
		else
			local MoneyList = {}
			local MoneySite = {}
			for k,v in ipairs(Gifts.MoneyList) do
				if k/2 ~= math.floor(k/2) then
					local money_val = Gifts.MoneyList[k+1]*count
					if not MoneySite[v] then
						MoneySite[v] = #MoneyList+1
						table.insert(MoneyList, v)
						table.insert(MoneyList, money_val or 0)	
					else
						Gifts.MoneyList[MoneySite[v]] = Gifts.MoneyList[MoneySite[v]] + money_val or 0
					end
				end			
			end	
			if Lua_tools.GiveGoods(player,{['MoneyList'] = MoneyList}) then
				sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
				for k,v in ipairs(MoneyList) do
					if k/2 ~= math.floor(k/2) then
						if v ~= 2 then
							sLuaApp:NotifyTipsMsg(player, "获得"..Lua_tools.GetMoneyName(v)..MoneyList[k+1])
						end
					end
				end
			end
		end
	else
		if Lua_tools then
			for i=1,count do
				if Lua_tools.GiveGoods(player,Gifts) then
					--sLuaApp:LuaDbg("物品发放成功")
					sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
				else
					--sLuaApp:LuaDbg("物品发放失败")
					sLuaApp:NotifyTipsMsg(player, itemName.."使用失败")
				end
			end
		end
	end
end