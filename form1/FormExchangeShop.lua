--兑换商店表单
FormExchangeShop={}

function FormExchangeShop.GetTabData(player)
	if not MainUISwitch.CheckOpenLevel(player,"兑换") then
		return ""
	end
	--获取分类表
	if ExchangeShop then
		ExchangeShop.GetTabData(player)
	end
	return ""
end

function FormExchangeShop.GetMainData(player,Version,Tabs_Key)
	if not MainUISwitch.CheckOpenLevel(player,"兑换") then
		return ""
	end
	--获取子分类下的物品数据      
	if ExchangeShop then
		ExchangeShop.GetMainData(player,Version,Tabs_Key)
	end
	return ""
end

function FormExchangeShop.Purchase(player,Version,Tabs_Key,item_index,item_num)
	if not MainUISwitch.CheckOpenLevel(player,"兑换") then
		return ""
	end
	--购买												  购买物品的序号，购买数量
	if ExchangeShop then
		ExchangeShop.Purchase(player,Version,Tabs_Key,item_index,item_num)
	end
	return ""
end
