--奇遇红包

AdventureItem={}

AdventureItem.Config={
    ["100奇遇值"]=100,
    ["奇遇红包甲"]=30,
    ["奇遇红包乙"]=20,
    ["奇遇红包丙"]=15,
    ["奇遇红包丁"]=10,
}

--创建物品
function AdventureItem.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function AdventureItem.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function AdventureItem.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    local itemKeyName=item:GetKeyName()
    if not AdventureItem.Config[itemKeyName] then
        sLuaApp:LuaErr("AdventureItem.Config缺少"..itemKeyName )
        return false
    end

    return true
end
--使用道具
function AdventureItem.on_use_item(player,item,count)
    if item==nil then
        return false
    end
    local itemKeyName=item:GetKeyName()
    local addValue=AdventureItem.Config[itemKeyName]*count

    if not player:AddAdv(addValue,"system","使用奇遇红包","玩家增加奇遇值") then
        sLuaApp:LuaDbg("使用奇遇红包失败！")
        sLuaApp:NotifyTipsMsg(player,"系统错误")
        return false
    else
        sLuaApp:NotifyTipsMsg(player,"您获得了奇遇值"..addValue)
    end
    sLuaApp:LuaDbg("玩家的奇遇值==="..tostring(player:GetAdv()))
end