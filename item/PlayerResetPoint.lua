--人物洗点丹（重洗灵丹）
PlayerResetPoint = {}

-- 创建物品
function PlayerResetPoint.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function PlayerResetPoint.on_item_destroy(item)
    if item == nil then
        return
    end
end



-- 使用物品前
function PlayerResetPoint.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	--local points_used = player:GetInt("PLAYER_PointsUsed")
	--local points_now = player:GetAttr(ROLE_ATTR_REMAIN_POINT)
	--if points_used > 0 then
	--	return true
	--else
	--	sLuaApp:NotifyTipsMsg(player, "您还没加过点！不能洗点~")
	--	return false
	--end
	--return false
	local itemKeyName=item:GetKeyName()
	local itemData = ItemConfig.GetByKeyName(itemKeyName)
	--local points_used = player:GetInt("PLAYER_PointsUsed")
	local str = [[GlobalUtils.ShowServerBoxMessage("是否需要花费<color=#FF0000ff>]].."1</color>个<color=#FF0000ff>"..itemData.Name..[[</color>重置人物属性点？")]]
	player:SetString("SYSTEM_ConfirmBox_Function", "PlayerResetPoint.ClearAllPoint(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),"..itemData.Id..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
	return false
end
-- 使用物品
function PlayerResetPoint.on_use_item(player,item,count) --一次使用多个 == 使用一个
    if item == nil then
        return
    end
	--下面是老方法
	--local points_used = player:GetInt("PLAYER_PointsUsed")
	--if points_used > 0 then
	--	player:ClearPoint()
	--	local Adder = 0
	--	if Reincarnation then
	--		if Reincarnation.Config then
	--			if Reincarnation.Config['Reincarnation_'..player:GetAttr(ROLE_ATTR_REINCARNATION)] then
	--				Adder = Reincarnation.Config['Reincarnation_'..player:GetAttr(ROLE_ATTR_REINCARNATION)]['AddRemainPoint']
	--			end
	--		end
	--	end
	--	if Adder and Adder ~= 0 then
	--		player:AddRemainPoint(Adder)
	--	end
	--	player:SetInt("PLAYER_PointsUsed", 0)
	--	sLuaApp:NotifyTipsMsg(player, "使用成功")
	--else
	--	sLuaApp:NotifyTipsMsg(player, "您还没加过点！洗点失败~")
	--end
end

function PlayerResetPoint.ClearAllPoint(player,itemId)
	--sLuaApp:LuaErr("ClearAllPoint")
	local itemKey = ItemConfig.GetById(itemId).KeyName
	local points_used = player:GetInt("PLAYER_PointsUsed")
	if points_used ~= 0 then
		if sItemSystem:ConsumeItemWithId(player, itemId, 1, 3, "system", "人物洗点", "重洗灵丹使用") == 0 then
			player:ClearPoint()
			player:SetInt("ADDPOINT_Auto",0)
			player:SetInt("PLAYER_PointsUsed", 0)
			sLuaApp:NotifyTipsMsg(player, "角色洗点成功")
			sLuaApp:NotifyTipsMsg(player, "玩家自动加点已关闭")
			player:RecalcAttr()
		else
			sLuaApp:NotifyTipsMsg(player, "道具使用失败")
		end
		--sLuaApp:NotifyTipsMsg(player, "使用成功")
	else
		sLuaApp:NotifyTipsMsg(player, "当前没有已分配的属性点可还原")
	end
end

