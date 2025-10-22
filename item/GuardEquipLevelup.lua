GuardEquipLevelup = {}

function GuardEquipLevelup.Upgrading(player, item_guid, guard_guid)
	local item
	if item_guid then
		item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	end
	if not item then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行升阶")
		return
	end
	local guard = sGuardSystem:GetGuard(guard_guid)
	if item:GetOwnerGUID() ~= player:GetGUID() then
		if item:GetOwnerGUID() ~= guard:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
		if guard:GetMaster() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	end
	local item_Key = item:GetKeyName()
	
	local cosume_tb = EquipLevelupConfig[item_Key] --{Target = "男魔仙器根骨向二阶", Materials = {"仙器碎片",50}, MoneyVal = 1000, MoneyType = 1},
	local target = cosume_tb.Target
	
	local itemData = ItemConfig.GetByKeyName(target) --得到新装备的data
	if not itemData then
		GuardEquipLevelup.Upgrading_Confirm(player, guard ,item_guid)
		return
	end
	local TarRein = itemData.TurnBorn
	local TarLv = itemData.Level --装备的可装备等级
	local Rein = player:GetAttr(ROLE_ATTR_REINCARNATION) --玩家转生
	local Level = player:GetAttr(ROLE_ATTR_LEVEL) --玩家等级
	
	if Rein > TarRein then
		GuardEquipLevelup.Upgrading_Confirm(player, guard ,item_guid)
		return
	elseif Rein == TarRein and Level >= TarLv then
		GuardEquipLevelup.Upgrading_Confirm(player, guard ,item_guid)
		return
	end
	local str = [[GlobalUtils.ShowServerBoxMessage("升阶后的装备将超过侍从的可穿戴等级，是否确定升阶？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "GuardEquipLevelup.Upgrading_Confirm(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..item_guid..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function GuardEquipLevelup.Upgrading_Confirm(player, guard ,item_guid)
	local item
	--sLuaApp:LuaDbg("进入Artifcing")
	if item_guid then
		item = sItemSystem:GetItemByGUID(tonumber(item_guid))
	end
	if not item then
		sLuaApp:NotifyTipsMsg(player, "道具数据异常，无法进行升阶")
		return
	end
	if item:GetOwnerGUID() ~= player:GetGUID() then
		if item:GetOwnerGUID() ~= guard:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
		if guard:GetMaster() ~= player:GetGUID() then
			sLuaApp:NotifyTipsMsg(player, "并非道具拥有者，无法操作")
			return ""
		end
	end
	--sLuaApp:LuaDbg("item_guid = " .. item_guid .. "    keyname = " .. item:GetKeyName())
	
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

	local master = guard:GetMaster()
	if MoneyType and MoneyVal then
		if Lua_tools.IsMoneyEnough(player, MoneyType, MoneyVal) == false then
			sLuaApp:NotifyTipsMsg(player, Lua_tools.GetMoneyName(MoneyType).."不足，无法进行升阶！")
			return
		end
	end
	
	local role = player:GetAttr(ROLE_ATTR_ROLE) --角色Id
	local itemList = cosume_tb['Materials_'..role] or cosume_tb['Materials']--消耗材料列表
	
	local DefectList = Lua_tools.GetDefectList(player, itemList)
	if #DefectList ~= 0 then
		OneKeyBuy.Main(player, DefectList)
		sLuaApp:NotifyTipsMsg(player, "材料不足，无法进行升阶！")
		return
	end
	
	local target = cosume_tb.Target
	if Lua_tools.SubMoney(player, MoneyType, MoneyVal, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key) == true then
		if Lua_tools.SubItem(player, itemList, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key) == true then
			local equip_new = sItemSystem:AddItemEx(player, ItemConfig.GetByKeyName(target).Id, 1, item:IsBound(), "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)[1]
			if equip_new then
				if EquipAttrTransfer.ItemTransfer(player, item, equip_new) == true then
					local old_lv = ItemConfig.GetById(item_Id).Itemlevel or 1
					local new_lv = ItemConfig.GetById(equip_new:GetId()).Itemlevel or 1
					if old_lv < new_lv then
						local per = EquipLevelup.GetGrowPercent(player, old_lv, new_lv)
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
				sItemSystem:DestroyItem(item, "system", "装备升阶", "升阶前装备KeyName为 " .. item_Key)

				if guard then
					local ret = sItemSystem:PutOnEquip(guard,equip_new)
					if ret ~= 0 then
						sLuaApp:NotifyError(master, ret)
						sLuaApp:NotifyTipsMsg(player, "侍从装备穿戴错误")
					end
				else
					sLuaApp:NotifyTipsMsg(player, "侍从错误")
				end
			end
		end
	end
end