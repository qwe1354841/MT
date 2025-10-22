-- 活力药剂的使用
VitalityItem = {}

VitalityItem.MedicineData = {
    ["活力药1"] = {AddValue = 250},--Name = "生龙活虎散"
    ["活力药2"] = {AddValue = 500},--Name = "龙精虎猛丸"
    ["活力药3"] = {AddValue = 1000},--Name = "龙腾虎跃丹"
}

-- 使用物品前
function VitalityItem.on_pre_use_item(player,item,count)
    -- 判断当前活力值是否需要增加
    local roleVP = player:GetVp() -- 玩家拥有的活力值
    local VpLimit = player:GetAttr(ROLE_ATTR_VP_LIMIT) -- 玩家活力值上限
    if roleVP == VpLimit then
        sLuaApp:NotifyTipsMsg(player, "活力值已满，目前无需使用")
        return false
    end
    VitalityItem.UseItem(player,item,count)
    return false
end

-- 使用物品  -- 非战斗中
function VitalityItem.on_use_item(player, item, count)
--
--    local roleVP = player:GetVp() -- 玩家拥有的活力值
--    local VpLimit = player:GetAttr(ROLE_ATTR_VP_LIMIT) -- 玩家活力值上限
--    sLuaApp:LuaDbg("活力值上限"..VpLimit.."count是"..count)
--    -- 使用的物品名称
--    local itemKeyName = item:GetKeyName()
--    local itemName = item:GetName()
--
--    local difference = VpLimit - roleVP
--    local addValue = VitalityItem.MedicineData[itemKeyName].AddValue * count
--    if difference > 0 then
--        -- 如果药品所加的值大于 其活力上限差值
--        if addValue > difference then
--            if player:AddVp(difference,"system","使用"..itemKeyName.."增加活力值","使用"..itemKeyName.."增加活力值") then
--                sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
--            else
--                sLuaApp:NotifyTipsMsg(player, itemName.."使用失败")
--                sLuaApp:LuaErr(itemKeyName.."使用失败")
--                return false
--            end
--            -- 如果 药品所加值 小于或等于 其活力值上限差值
--        else
--            if player:AddVp(addValue,"system","使用"..itemKeyName.."增加活力值","使用"..itemKeyName.."增加活力值") then
--                sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
--            else
--                sLuaApp:NotifyTipsMsg(player, itemName.."使用失败")
--                sLuaApp:LuaErr(itemKeyName.."使用失败")
--                return false
--            end
--        end
--    else
--        sLuaApp:NotifyTipsMsg(player, "活力值已满，目前无需使用")
--    end
--
--    return false
end


function VitalityItem.UseItem(player,item,count)
    local roleVP = player:GetVp() -- 玩家拥有的活力值
    local VpLimit = player:GetAttr(ROLE_ATTR_VP_LIMIT) -- 玩家活力值上限
    local itemKeyName = item:GetKeyName()
    local itemId=item:GetId()
    local itemName = item:GetName()
    --需要多少数量的药
	local AddValue = VitalityItem.MedicineData[itemKeyName].AddValue
    local needCount=math.floor((VpLimit-roleVP)/AddValue)
    local trueCount=math.min(needCount,count)
	if needCount == 0 and VpLimit-roleVP > 0 then
		--sLuaApp:LuaDbg("使用" .. itemName .. "       " .. itemKeyName .. "           ".. itemName)
		VitalityItem.UseConfirm(player, itemId, itemKeyName, itemName, AddValue, AddValue+roleVP-VpLimit)
		return
	end
	--sLuaApp:LuaDbg("尝试消耗" .. itemName)
    if sItemSystem:ConsumeItemWithId(player, itemId, trueCount, 3, "System", "VitalityItem", "使用活力药") == 0 then
        if player:AddVp(AddValue * trueCount,"system","使用"..itemKeyName.."增加活力值","使用"..itemKeyName.."增加活力值") then
            sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
            --sLuaApp:LuaDbg("活力值上限"..VpLimit.."-----------------角色当前的活力值是"..roleVP)
			if count > trueCount and (VpLimit-roleVP)/AddValue ~= needCount then
				VitalityItem.UseConfirm(player, itemId, itemKeyName, itemName, AddValue, AddValue*(trueCount+1)+roleVP-VpLimit)
			end
        else
            sLuaApp:NotifyTipsMsg(player, itemName.."使用失败")
            sLuaApp:LuaErr(itemKeyName.."使用失败")
            return
        end
    else
        sLuaApp:NotifyTipsMsg(player, "销毁道具失败")
        return
    end
end

function VitalityItem.UseConfirm(player, itemId, itemKeyName, itemName, addValue, outValue)
	local str = [[GlobalUtils.ShowServerBoxMessage("使用]]..itemName.."仅能增加"..(addValue-outValue).."点活力值（溢出"..outValue..[[点），确定使用吗？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "VitalityItem.ForceUse(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..itemId..",'"..itemKeyName.."','"..itemName.."',"..addValue..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function VitalityItem.ForceUse(player, itemId, itemKeyName, itemName, addValue)
	if sItemSystem:ConsumeItemWithId(player, itemId, 1, 3, "System", "VitalityItem", "使用活力药") == 0 then
        if player:AddVp(addValue,"system","使用"..itemKeyName.."增加活力值","使用"..itemKeyName.."增加活力值") then
            sLuaApp:NotifyTipsMsg(player, itemName.."使用成功")
            --sLuaApp:LuaDbg("活力值上限"..VpLimit.."-----------------角色当前的活力值是"..roleVP)
        else
            sLuaApp:NotifyTipsMsg(player, itemName.."使用失败")
            sLuaApp:LuaErr(itemKeyName.."使用失败")
            return false
        end
    else
        sLuaApp:NotifyTipsMsg(player, "销毁道具失败")
        return false
    end
end