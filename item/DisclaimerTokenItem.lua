-- 免责令牌
local DisclaimerTokenItem = {}
_G.DisclaimerTokenItem = DisclaimerTokenItem

-- 使用物品前
function DisclaimerTokenItem.on_pre_use_item(player,item,count)
    -- 移动到御前统领处
    Lua_tools.MoveToNpc(player, 20063)
    return false
end

-- 使用物品时
function DisclaimerTokenItem.on_use_item(player, item, count)
    return false
end