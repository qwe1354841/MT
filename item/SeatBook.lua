--阵法书
SeatBook = {}

SeatBook.Config = {
    ["阵法书1"] = 1000,
    ["阵法书2"] = 2000,
    ["阵法书3"] = 3000,
    ["阵法书4"] = 4000,
    ["阵法书5"] = 5000,
    ["阵法书6"] = 6000,
    ["阵法书7"] = 7000,
    ["阵法书8"] = 8000,
    ["阵法书9"] = 9000,
    ["阵法书10"] = 10000,
}
-- 使用物品前
function SeatBook.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end
    local itemData = ItemConfig.GetByKeyName(item:GetKeyName())
    if player:GetAttr(ROLE_ATTR_LEVEL) < itemData.Level then
        return false
    end
    local LineupContainer = player:GetLineupContainer()
    local UseLineUp = LineupContainer:GetCurrentLineup()
    local SeatKey = item:GetKeyName()
    --打开阵法界面
    local str = [[
        GUI.CloseWnd('BagUI')
        GUI.CloseWnd('CommerceUI')
        local _BattleSeatUI = GUI.GetWnd("BattleSeatUI")
        if _BattleSeatUI == nil then
            GUI.OpenWnd("BattleSeatUI","]]..(UseLineUp+1)..[[-]]..SeatBook.Config[SeatKey]..[[")
        else
            GUI.OpenWnd("BattleSeatUI","]]..(UseLineUp+1)..[[-]]..SeatBook.Config[SeatKey]..[[")
        end
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
    if count > 1 then
        sItemSystem:UseItem(player,item)
        return false
    end
    local SeatContainer = player:GetSeatContainer()
    if Lua_tools.tablecount(SeatContainer:GetSeat(SeatBook.Config[SeatKey])) == 0 then
        return true
    else
        return false
    end
end

-- 使用物品
function SeatBook.on_use_item(player, item, count)
    if item == nil then
        return false
    end
    local SeatKey = item:GetKeyName()
    if SeatSystem then
        SeatSystem.LearnSeatUseItem(player,SeatBook.Config[SeatKey])
    end
end