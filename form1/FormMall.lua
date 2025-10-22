--商城表单
FormMall={}

function FormMall.GetData(player)
	if not MainUISwitch.CheckOpenLevel(player,"商城") then
		return ""
	end
	--获取兑换物品类型分类
	if Mall then
		Mall.GetData(player)
	end
	return ""
end

function FormMall.Item_Info(player,Version,Tabs_index,Classify_index)
	if not MainUISwitch.CheckOpenLevel(player,"商城") then
		return ""
	end
	--获取子分类下的物品数据      Currency_Tab[Tabs_index] , Currency_Tab[Tabs_index][Classify][Classify_index]
	if Mall then
		Mall.Item_Info(player,Version,Tabs_index,Classify_index)
	end
	return ""
end

function FormMall.Purchase(player,Version,Tabs_index,Classify_index,item_index,item_num)
	if not MainUISwitch.CheckOpenLevel(player,"商城") then
		return ""
	end
	--购买													购买物品的序号，购买数量
	if Mall then
		Mall.Purchase(player,Version,Tabs_index,Classify_index,item_index,item_num, 0)
	end
	return ""
end

-- function FormMall.New_Currency_Itemid(player)
	-- --发送所有物品ID
	-- if Mall then
		-- Mall.New_Currency_Itemid(player)
	-- end
	-- return ""
-- end

-- function FormMall.PlayerRedPointUpdate(player)
	-- --获取商城小红点
	-- if Mall then
		-- Mall.PlayerRedPointUpdate(player)
	-- end
	-- return ""
-- end


-- function FormMall.Refresh(player)
	-- --刷新商城客户端
	-- if Mall then
		-- Mall.Refresh(player)
	-- end
	-- return ""
-- end

--打开客户端时获得全部数据
function FormMall.GetAllData(player)
	if not MainUISwitch.CheckOpenLevel(player,"商城") then
		return ""
	end
	if Mall then
		Mall.GetAllData(player)
	end
	return ""
end