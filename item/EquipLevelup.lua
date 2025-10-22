EquipLevelup = {}

EquipLevelup.Attrconfig = {
	[1] = 0,--成长万分比，1的没啥用
	[2] = 1600,--成长万分比，相对于上一阶级
	[3] = 1600,--成长万分比，相对于上一阶级
	[4] = 1600,--成长万分比，相对于上一阶级
	[5] = 1600,--成长万分比，相对于上一阶级
	[6] = 1600,--成长万分比，相对于上一阶级
	[7] = 1600,--成长万分比，相对于上一阶级
	[8] = 1600,--成长万分比，相对于上一阶级
}

function EquipLevelup.GetData(player, item_guid)
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_Key = item:GetKeyName()
	local item_Id = item:GetId()
	--sLuaApp:LuaDbg("item_guid = " .. item_guid .. "   item_Key = " .. item_Key)
	local dataTb = EquipLevelupConfig[item_Key]
	if not dataTb then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行升阶")
		return
	end
	local target = dataTb.Target
	if not dataTb.GrowPer then
		local tarData = ItemConfig.GetByKeyName(target)
		
		local old_lv = ItemConfig.GetById(item_Id).Itemlevel or 1
		local new_lv = tarData.Itemlevel or 1
		dataTb.GrowPer = EquipLevelup.GetGrowPercent(player, old_lv, new_lv)
		
		dataTb.NowMax = EquipIntensify.GetIntenMax(player,item_Id)
		dataTb.NewMax = EquipIntensify.GetIntenMax(player,tarData.Id)
	end
	if Lua_tools then
		--sLuaApp:LuaDbg("表单回馈")
		
		str = [[ if EquipGrowUpUI then
				EquipGrowUpUI.serverData]].."["..item_Id.."] = " .. Lua_tools.serialize(dataTb) .. [[
				EquipGrowUpUI.Refresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

function EquipLevelup.Upgrading(player, item_guid,guard_guid)
	local item
	if item_guid then
		item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	end
	if not item then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行升阶1")
		return
	end
	guard_guid = tonumber(guard_guid)
	local guard = sGuardSystem:GetGuard(tonumber(guard_guid))
	if guard == nil then
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	else	
		local Master = guard:GetMaster()
		if item:GetOwnerGUID() ~= player:GetGUID() then
			if item:GetOwnerGUID() ~= guard:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
			if Master:GetGUID() ~= player:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
		end
	end
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_Key = item:GetKeyName()
	
	local cosume_tb = EquipLevelupConfig[item_Key]
	local target = cosume_tb.Target
	
	local itemData = ItemConfig.GetByKeyName(target)
	if not itemData then
		EquipLevelup.Upgrading_Confirm(player, item_guid)
		return
	end
	local TarRein = itemData.TurnBorn
	local TarLv = itemData.Level
	local Rein = player:GetAttr(ROLE_ATTR_REINCARNATION)
	local Level = player:GetAttr(ROLE_ATTR_LEVEL)
	
	if Rein > TarRein then
		EquipLevelup.Upgrading_Confirm(player, item_guid,guard_guid)
		return
	elseif Rein == TarRein and Level >= TarLv then
		EquipLevelup.Upgrading_Confirm(player, item_guid,guard_guid)
		return
	end
	local str = [[GlobalUtils.ShowServerBoxMessage("升阶后的装备将超过您的可穿戴等级，是否确定升阶？")]]
					player:SetString("SYSTEM_ConfirmBox_Function", "EquipLevelup.Upgrading_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_guid..","..guard_guid..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function EquipLevelup.Upgrading_Confirm(player, item_guid,guard_guid)
	local item
	sLuaApp:LuaDbg("进入Artifcing")
	if item_guid then
		item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	end
	if not item then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行升阶")
		return
	end
	local guard = sGuardSystem:GetGuard(tonumber(guard_guid))
	if guard == nil then
		if item:GetOwnerGUID() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	else	
		local Master = guard:GetMaster()
		if item:GetOwnerGUID() ~= player:GetGUID() then
			if item:GetOwnerGUID() ~= guard:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
			if Master:GetGUID() ~= player:GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
				return ""
			end
		end
	end
	sLuaApp:LuaDbg("item_guid = " .. item_guid .. "    keyname = " .. item:GetKeyName())
	
	if Lua_tools.GetBagFree(player) == 0 then
		sLuaApp:NotifyTipsMsg(player, "请至少保证有一个包裹空位！")
		return
	end
	
	local item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	local item_Key = item:GetKeyName()
	local item_Id = item:GetId()
	
	local cosume_tb = EquipLevelupConfig[item_Key]
	local MoneyType = cosume_tb.MoneyType
	local MoneyVal = cosume_tb.MoneyVal
	if MoneyType and MoneyVal then
		if Lua_tools.IsMoneyEnough(player, MoneyType, MoneyVal) == false then
			sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(MoneyType).."不足，无法进行升阶！")
			return
		end
	end
	
	local role = player:GetAttr(ROLE_ATTR_ROLE)
	local itemList = cosume_tb['Materials_'..role] or cosume_tb['Materials']
	
	local DefectList = Lua_tools.GetDefectList(player, itemList)
	if #DefectList ~= 0 then
		OneKeyBuy.Main(player, DefectList)
		sLuaApp:NotifyTipsMsg(player, "材料不足，无法进行升阶！")
		return
	end
	--if Lua_tools.IsItemEnough(player, itemList) == false then
	--	sLuaApp:NotifyTipsMsg(player, "材料不足，无法进行升阶！")
	--	return
	--end
	
	local target = cosume_tb.Target
	if Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key) == true then
		if Lua_tools.SubItem(player, itemList, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key) == true then
			sLuaApp:LuaDbg("EquipLevelup")
			local equip_new = sItemSystem:AddItemEx(player, ItemConfig.GetByKeyName(target).Id, 1, item:IsBound(), "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)[1]
			if equip_new then
				if EquipAttrTransfer.ItemTransfer(player, item, equip_new) == true then
					local old_lv = ItemConfig.GetById(item_Id).Itemlevel or 1
					local new_lv = ItemConfig.GetById(equip_new:GetId()).Itemlevel or 1
					if old_lv < new_lv then
						per = EquipLevelup.GetGrowPercent(player, old_lv, new_lv)
						local AttrList = equip_new:GetDynAttrsByMark(0)
						for k,v in ipairs(AttrList) do
							equip_new:SetDynAttr(0,v.attr,math.floor(v.value*per/10000))
						end
						EquipIntensify.RefreshAttr(equip_new)
					end
				end
				if Lua_tools.IsEquipped(player, item) == true then
					sItemSystem:ForcePutOnEquip(player, equip_new)
				end
				if item:GetOwnerGUID() == player:GetGUID() then
					sItemSystem:DestroyItem(item, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)
				else
					local ret = sItemSystem:PutOnEquip(guard,equip_new)
					if ret ~= 0 then
						sLuaApp:NotifyTipsMsg(player, "未达到穿戴要求")
					end
					sItemSystem:DestroyItem(item, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)
				end
			end
		end
	end
end

function EquipLevelup.EquipHandle(player, item, equip_new)
	local item_Key = item:GetKeyName()
	if Lua_tools.IsEquipped(player, item) then
		--此处要强制装备
	end
	sItemSystem:DestroyItem(item, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)
end

function EquipLevelup.GetGrowPercent(player, old_lv, new_lv)
	if old_lv >= new_lv then
		return 10000
	end
	local per = 10000
	for i = old_lv+1, new_lv do
		if not EquipLevelup.Attrconfig[i] then
			return nil
		end
		per = per*(EquipLevelup.Attrconfig[i]+10000)/10000
	end
	return per
end