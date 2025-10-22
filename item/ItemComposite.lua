--技能书合成
ItemComposite = {}

ItemComposite.CompositeList = {
	["终极技能书残卷"] ={["item_Key"] = {"随机终极技能书","化无","将死","当头棒喝","明察秋毫","作鸟兽散","以牙还牙","绝境逢生","子虚乌有","春回大地","涅槃"},["Need_Num"] = 50,["MoneyVal"] = 20000},
}

function ItemComposite.Composite(player,item_KeyName,isband)
	local itemData = ItemConfig.GetByKeyName(item_KeyName)
	local money_type = 5
	if item_KeyName == "终极技能书残卷" then
		local randomNum = sLuaApp:RandInteger(1,#ItemComposite.CompositeList[item_KeyName]["item_Key"])
		local get_item_Key = ItemComposite.CompositeList[item_KeyName]["item_Key"][randomNum]
		local get_item_Data = ItemConfig.GetByKeyName(get_item_Key)
		local Need_Num = ItemComposite.CompositeList[item_KeyName]["Need_Num"]
		local MoneyVal = ItemComposite.CompositeList[item_KeyName]["MoneyVal"]
		if isband == 1 or isband == 2 then
			local isBand = true
			if isband == 1 then
				isBand = false
			end
			if Lua_tools.SubMoney(player, money_type, MoneyVal, "system", "物品合成", "合成花费") == true then
				if sItemSystem:ConsumeItemWithId(player,itemData.Id,Need_Num, isband ,"system","物品合成","合成消耗") == 0 then
					if sItemSystem:AddItemEx(player, get_item_Data.Id , 1 , isBand , "system", "技能书合成", "技能书合成") ~= {} then
						sLuaApp:NotifyTipsMsg(player, "合成成功")
					end
				end
			end
		elseif isband == 4 then 
			local player_band_itemNum = sItemSystem:GetItemAmount(player, ItemConfig.GetByKeyName(item_KeyName).Id, 2)
			if Lua_tools.SubMoney(player, money_type, MoneyVal, "system", "物品合成", "合成花费") == true then
				if sItemSystem:ConsumeItemWithId(player,itemData.Id,player_band_itemNum, 2 ,"system","物品合成","合成消耗") == 0 and sItemSystem:ConsumeItemWithId(player,itemData.Id, 50-player_band_itemNum , 1 ,"system","物品合成","合成消耗") == 0 then
					if sItemSystem:AddItemEx(player, get_item_Data.Id , 1 , true , "system", "技能书合成", "技能书合成") ~= {} then
						sLuaApp:NotifyTipsMsg(player, "合成成功")
					end
				end
			end
		end
	end
	
end
--[[
function ItemComposite.Composite(player,item_guid_list,enter_itemnum)
	local item_Str = ""
	if	item_guid_list then
		local itemguid_list = sLuaApp:StrSplit(item_guid_list, ',') --得到合成物品及数量表
		 for i = 1 , enter_itemnum * 2 , 2 do
			if sItemSystem:GetItemByGUID(itemguid_list(i)) then
				local item = sItemSystem:GetItemByGUID(itemguid_list(i))
				local item_KeyName = item:GetKeyName()
				item_Str = item_Str..item_KeyName.."," --将传进来的物品keyname拼接成字符串
			end
		end
		item_Str = string.sub(item_Str,1,-2)
		for i = 1 , enter_itemnum * 2 , 2 do
			if itemguid_list(i) then
				if type(itemguid_list(k+1)) then
					local item = sItemSystem:GetItemByGUID(tonumber(v))
					local item_KeyName = item:GetKeyName()
					local item_Name = item:GetName()
					local Get_item = ItemDisintegrate.CompositeList[item_Str]['Get_item']
					local itemData = ItemConfig.GetByKeyName(Get_item)
					
					local Need_Num = ItemDisintegrate.CompositeList[item_Str]['Need_Num']  --得到消耗物品数量表
					for a,b in pairs(Need_Num) do
						local Get_Num = ItemDisintegrate.CompositeList[item_Str]['Get_Num']
						local MoneyVal = ItemDisintegrate.CompositeList[item_Str]['MoneyVal']
						local money_type = 5
						local itemNum = sItemSystem:GetItemAmount(player, itemData.id, 3)--
						if itemNum <= Need_Num then
							sLuaApp:NotifyTipsMsg(player, "您没有足够的"..item_Name)
						else
							if Lua_tools.SubMoney(player, money_type, MoneyVal, "system", "物品合成", "合成花费") == true then
								if sItemSystem:ConsumeItem(item,Need_Num,"system","物品合成","合成消耗") == 0 then
									if sItemSystem:AddItemEx(player, itemData.id, Get_Num , item:IsBound() , "system", "物品合成", "合成得到") == true then
										sLuaApp:NotifyTipsMsg(player, "合成成功")
									end
								end
							else
								return "合成失败"
							end
						end
					end
				end
			end
		end
	end
end
--]]