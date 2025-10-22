--更名卡
RenameCard={}

--创建物品
function RenameCard.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function RenameCard.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function RenameCard.on_pre_use_item(player,item,count)
    sLuaApp:LuaDbg("更名卡的使用")
    if item==nil then
        return false
    end
    local str=[[
        GUI.OpenWnd("RoleRenameUI")
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return false
end
--使用道具
function RenameCard.on_use_item(player,item,count)
    if item==nil then
        return false
    end
end
