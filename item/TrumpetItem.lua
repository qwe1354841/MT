-- 喇叭物品的使用脚本
local TrumpetItem = {}
_G.TrumpetItem = TrumpetItem

-- 使用物品前
function TrumpetItem.on_pre_use_item(player,item,count)
    if player == nil then
        return false
    end
    -- 跳转到喇叭频道
    local str = [[
        GUI.OpenWnd('ChatUI','index:5')
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return false
end

-- 使用物品
function TrumpetItem.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end
