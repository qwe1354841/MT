--装备相关表单

FormOneKeyBuy = {}

function FormOneKeyBuy.Main(player)
	if not Data.OneKeyBuy then
		return "没有可购买的道具"
	end
	
	local player_str = 'player_'..player:GetGUID()
	local itemList = Data.OneKeyBuy[player_str]
	if not itemList then
		return "没有可购买的道具"
	end
	local Price = player:GetInt("OneKeyBuy_Price")
	if Price <= 0 then
		return "一件购买价格异常"
	end
	if Lua_tools.SubMoney(player, 1, Price, "system", "一键购买", "价格"..Price) == true then
		if Lua_tools.AddItem(player, itemList, "system", "一键购买", "价格"..Price) == true then
			player:SetInt("OneKeyBuy_Price", 0)
			Data.OneKeyBuy[player_str] = nil
			sLuaApp:ShowForm(player, "脚本表单",'GUI.DestroyWnd("OneKeyPurchaseUI")')
			return "购买成功"
		end
	end
	return ""
end

function FormOneKeyBuy.MainEx(player, itemList)
	
	return ""
end

function FormOneKeyBuy.TryBuy(player, itemList)
	--sLuaApp:LuaDbg("itemList =============== " .. itemList)
	local Tb_Item = sLuaApp:StrSplit(itemList, ",")
	local list = {}
	for k,v in ipairs(Tb_Item) do
		if k/2 == math.floor(k/2) then
			v = tonumber(v) or 0
			--sLuaApp:LuaDbg("v tonumber  type = " .. type(v))			
		end
		table.insert(list,v)
	end
	OneKeyBuy.Main(player, list)
	return ""
end
