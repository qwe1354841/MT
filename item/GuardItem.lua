-- 侍从物品的使用
local GuardItem = {}
_G.GuardItem = GuardItem


-- 获取侍从所需要的碎片数量
GuardItem.getAmount = 50

-- 使用物品前
function GuardItem.on_pre_use_item(player,item,count)

    local guardItemId = item:GetId()
    --local itemKeyName = item:GetKeyName()
    --local index = string.find(itemKeyName, "信物")
    --local guardKeyName = string.sub(itemKeyName,1, index -1)
    --local guardId = GuardConfig.GetByKeyName(guardKeyName).Id
    --
    ---- 判断是否已经拥有此侍从
    --local GuardContainer = player:GetGuardContainer()
    --if GuardContainer:HasGuard(guardId) then
    --    GuardItem.OpenGuardUI(player,guardItemId)
    --else
    --    -- 判断碎片数量是否足够
    --    local amount = sItemSystem:GetItemAmount(player,guardItemId,3)
    --    if amount < GuardItem.getAmount then
    --        GuardItem.OpenGuardUI(player,guardItemId)
    --    else
    --        sLuaApp:ShowForm(player, "脚本表单", " CL.SendNotify(NOTIFY.GuardOpeUpdate, 1,".. guardId .." )")
    --    end
    --
    --end

    -- 打开侍从界面
    -- 添加等级判断
    -- 获取玩家等级
    local role_level = player:GetAttr(ROLE_ATTR_LEVEL)
    local open_level = 13

    if MainUISwitch and MainUISwitch.Config and MainUISwitch.Config['侍从'].OpenLevel then
        open_level = MainUISwitch.Config['侍从'].OpenLevel
    end
    -- 如果玩家等级未达标，不能打开界面
    if role_level >= open_level then
        GuardItem.OpenGuardUI(player, guardItemId)
    else
        sLuaApp:NotifyTipsMsg(player, '您需要达到'..open_level..'才能打开侍从界面')
    end


    return false
end

-- 使用物品
function GuardItem.on_use_item(player, item, count)

end

-- 打开侍从界面
function GuardItem.OpenGuardUI(player,itemId)
    local str = [[
    GUI.OpenWnd("GuardUI")
    GuardUI.FragmentItemIdChangeToGuardId(]].. itemId ..[[)
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
end