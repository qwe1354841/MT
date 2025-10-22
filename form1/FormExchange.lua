--商会相关

FormExchange = {}

function FormExchange.GetExchangeData(player)
	if FunctionSwitch.AllFuncitonConfig['Exchange'] ~= "on" then
		return ""
	end
	if not MainUISwitch.CheckOpenLevel(player,"交易行","商会") then
		return ""
	end
	if DealShop then
		DealShop.GetExchangeData(player)
	end
	return ""
end

function FormExchange.Init()
	if sVarSystem:GetDayInt("ExchangeAllLimit") == 0 then
		Data.ExchangeTodayBuyRecord = nil
		Data.ExchangeOnceLimit = nil
		Data.ExchangeTodayBuyRecord = {}
		Data.ExchangeOnceLimit = {}
		sVarSystem:SetDayInt("ExchangeAllLimit", 1)
	end
end
FormExchange.Init()

-- 刷新购买记录
function FormExchange.GetBuyRecord(player)
	if player == nil then
		return ""
	end
	if not MainUISwitch.CheckOpenLevel(player,"交易行","商会") then
		return ""
	end
	if DealShop then
		DealShop.GetBuyRecord(player)
	end
	return ""
	
end

-- 购买物品
function FormExchange.BuyItem(player, item_id, item_count)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","商会") then
		return ""
	end
	if DealShop then
		DealShop.BuyItem(player, item_id, item_count)
	end
	return ""
end


--卖出商品
function FormExchange.SellItem(player, item_guid, item_count)
	if not MainUISwitch.CheckOpenLevel(player,"交易行","商会") then
		return ""
	end
	if DealShop then
		DealShop.SellItem(player, item_guid, item_count)
	end
	return ""
	
end