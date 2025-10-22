local BattleMeritToken={}
_G.BattleMeritToken=BattleMeritToken
--战功牌的使用

--创建物品
function BattleMeritToken.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function BattleMeritToken.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function BattleMeritToken.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    sLuaApp:LuaDbg("战功牌的使用")
    return false
end
--使用道具
function BattleMeritToken.on_use_item(player,item,count)
    if item==nil then
        return false
    end


end
