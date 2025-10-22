--解锁类道具
UnlockItem={}

-- 创建物品
function UnlockItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function UnlockItem.on_item_destroy(item)
    if item == nil then
        return
    end
end



-- 使用物品前
function UnlockItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local definiteCount=0
	local needCount=0
	--sLuaApp:LuaDbg("pre count = " .. count)
	local Item_Name=item:GetKeyName()
	--sLuaApp:LuaDbg(" Item_Name ".. tostring(Item_Name))
	if Item_Name=="解锁宠物栏位" then
		if PlayerSetting then
			local MaxNum=PlayerSetting.PetBagMax or 25
			local petCon = player:GetPetContainer(1)
			local PetBagNow =petCon:GetCapacity()
			local needNum=math.floor((MaxNum-PetBagNow)/1)
			needCount=needNum
			sLuaApp:LuaDbg("pet needNum  = " .. needNum)
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--老方法 现在无用
			--if (PetBagNow+count)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	
	elseif Item_Name=="解锁宠物仓库栏位" then
		if PlayerSetting then
			local MaxNum=PlayerSetting.PetBagMax_WareHouse or 30
			local petWareCon = player:GetPetContainer(2)
			local PetWareHouseNow =petWareCon:GetCapacity()
			local needNum=math.floor((MaxNum-PetWareHouseNow)/1)
			needCount=needNum
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--if (PetWareHouseNow+count)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	elseif Item_Name=="解锁背包栏位" then
		if PlayerSetting then
			local MaxNum=PlayerSetting.BagMax or 300
			local bagCon = player:GetItemContainer(1)
			local BagNow =bagCon:GetCapacity()
			local needNum=math.floor((MaxNum-BagNow)/6)
			needCount=needNum
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--if (BagNow+count*6)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	elseif Item_Name=="解锁仓库栏位" then
		if PlayerSetting then
			local MaxNum=PlayerSetting.BagMax_WareHouse*36 or 360
			if EquipPlan.Mod and EquipPlan.Mod == 1 then
				MaxNum = MaxNum + 36
			end
			local WpetCon = player:GetItemContainer(7)
			local WareHouseNow = WpetCon:GetCapacity()
			local needNum=math.floor((MaxNum-WareHouseNow)/36)
			needCount=needNum
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--if (WareHouseNow+count*36)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	elseif Item_Name=="解锁宠物交易栏位" then
		if AuctionSystem then
			local MaxNum=AuctionSystem['AdderPetSelling'] or 5
			local PetSellingNow = player:GetInt("AuctionSystem_AdderPetSelling")
			local needNum=math.floor((MaxNum-PetSellingNow)/1)
			needCount=needNum
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--if (PetSellingNow+count)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	elseif Item_Name=="解锁道具交易栏位" then
		if AuctionSystem then
			local MaxNum=AuctionSystem['AdderItemSelling'] or 10
			local ItemSellingNow=player:GetInt("AuctionSystem_AdderItemSelling")
			local needNum=math.floor((MaxNum-ItemSellingNow)/1)
			needCount=needNum
			if count <= needNum then
				definiteCount=count
			else
				definiteCount=needNum
			end
			--if (ItemSellingNow+count)<=MaxNum then
			--	return true
			--else
			--	sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
			--	return false
			--end
		end
	end
	sLuaApp:LuaDbg(" Item_Name1 ".. tostring(item:GetKeyName()))
	if definiteCount<=0 then
		sLuaApp:NotifyTipsMsg(player,"栏位已达最大值")
	else
		UnlockItem.UseItem(player,item,definiteCount,needCount)
		if Lua_tools.SubItem(player, {Item_Name, definiteCount}, "system", "栏位钥匙", "栏位钥匙扣除道具") ==false then
			sLuaApp:NotifyTipsMsg(player,"道具消耗失败")
		end
	end


	return false
end
-- 使用物品
function UnlockItem.on_use_item(player,item,count)
    if item == nil then
        return
    end
end


function UnlockItem.UseItem(player,item,count,needCount)
	if item == nil then
		return false
	end
	local Item_Name=item:GetKeyName()

	local itemName=item:GetName()

	if Item_Name=="解锁宠物栏位" then
		local petCon = player:GetPetContainer(1)
		local PetBagNow = petCon:GetCapacity()
		petCon:SetCapacity(PetBagNow + count)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁宠物所有栏位")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁宠物栏位")
		end

	elseif Item_Name=="解锁宠物仓库栏位" then
		local petWareCon = player:GetPetContainer(2)
		local PetWareHouseNow =petWareCon:GetCapacity()
		petWareCon:SetCapacity(PetWareHouseNow+count * 5)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁宠物仓库所有栏位")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁5个宠物仓库栏位")
		end

	elseif Item_Name=="解锁背包栏位" then
		local bagCon = player:GetItemContainer(1)
		local BagNow =bagCon:GetCapacity()
		bagCon:SetCapacity(BagNow + count * 6)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁背包所有栏位")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁背包栏位")
		end

	elseif Item_Name=="解锁仓库栏位" then
		local WpetCon = player:GetItemContainer(7)
		local WareHouseNow = WpetCon:GetCapacity()
		WpetCon:SetCapacity(WareHouseNow + count * 36)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁仓库所有页面")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁了"..count.."个仓库页面")
		end
		WarehouseClassify.UnlockEquipPlan(player, count)

	elseif Item_Name=="解锁宠物交易栏位" then
		local PetSellingNow=player:GetInt("AuctionSystem_AdderPetSelling")
		player:SetInt("AuctionSystem_AdderPetSelling",PetSellingNow+count)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁所有宠物交易栏位")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁了"..count.."个宠物交易栏位")
		end

	elseif Item_Name=="解锁道具交易栏位" then
		local ItemSellingNow=player:GetInt("AuctionSystem_AdderItemSelling")
		player:SetInt("AuctionSystem_AdderItemSelling",ItemSellingNow+count)
		if needCount<=count then
			sLuaApp:NotifyTipsMsg(player,"已使用"..itemName.."解锁所有道具交易栏位")
		else
			sLuaApp:NotifyTipsMsg(player,"使用成功，解锁了"..count.."个道具交易栏位")
		end
	else
		sLuaApp:NotifyTipsMsg(player,"使用失败")
	end
end



