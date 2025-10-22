local FactionRenameCard={}
_G.FactionRenameCard=FactionRenameCard
--更名卡的使用

--创建物品
function FactionRenameCard.on_item_create(item)
    if item==nil then
        return false
    end
end
--销毁物品
function FactionRenameCard.on_item_destroy(item)
    if item==nil then
        return false
    end
end
--使用道具前
function FactionRenameCard.on_pre_use_item(player,item,count)
    if item==nil then
        return false
    end
    sLuaApp:LuaDbg("帮派更名卡的使用")
    --TODO 更名UI界面缺失
    --TODO 把下面的注释还原  并换成对应的更名UI界面即可
    --当前角色是否是帮主在客户端已经进行了判断，故所以在此处不需要进行判断
    local str=[[
        GUI.OpenWnd("FactionUI")
        FactionUI.OnChangeNameBtnClick()
    ]]
    sLuaApp:ShowForm(player,"脚本表单",str)
    return false
end
--使用道具
function FactionRenameCard.on_use_item(player,item,count)
    if item==nil then
        return false
    end
end
