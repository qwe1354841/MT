FormDiscountShop={}

function FormDiscountShop.GetMainData(player)
	--获取商店的物品数据
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['DiscountShop'] ~= "on" then
			return ""
		end
	end
	if DiscountShop then
		DiscountShop.GetMainData(player)
	end
	return ""
end

function FormDiscountShop.Purchase(player, item_index, item_num)
	--购买								购买物品的序号 购买数量
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['DiscountShop'] ~= "on" then
			return ""
		end
	end
	if DiscountShop then
		DiscountShop.Purchase(player, item_index, item_num)
	end
	return ""
end


function FormDiscountShop.RefreshSubMoney(player)
	--刷新操作
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['DiscountShop'] ~= "on" then
			return ""
		end
	end
	if DiscountShop then
		DiscountShop.RefreshSubMoney(player)
	end
	return ""
end

