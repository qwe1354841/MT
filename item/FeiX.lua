--跳转道具
FeiX = {}



-- 创建物品
function FeiX.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function FeiX.on_item_destroy(item)
    if item == nil then
        return
    end
end
-- 使用物品前
function FeiX.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
		sLuaApp:NotifyTipsMsg(player, "使用物品前")
end

-- 使用物品
function FeiX.on_use_item(player,item,count)
    if item == nil then
        return
    end
    sLuaApp:NotifyTipsMsg(player, "使用了物品")
end

