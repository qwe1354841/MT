--阵法书残卷
LackingSeatBook = {}

LackingSeatBook.NeedNum = 5

LackingSeatBook.Config = {
    {ItemKey = "阵法书1" , Rand = 5000},
    {ItemKey = "阵法书2" , Rand = 5000},
    {ItemKey = "阵法书3" , Rand = 5000},
    {ItemKey = "阵法书4" , Rand = 5000},
    {ItemKey = "阵法书5" , Rand = 5000},
    {ItemKey = "阵法书6" , Rand = 5000},
    {ItemKey = "阵法书7" , Rand = 5000},
    {ItemKey = "阵法书8" , Rand = 5000},
    {ItemKey = "阵法书9" , Rand = 5000},
    {ItemKey = "阵法书10" , Rand = 5000},
}

-- 使用物品前
function LackingSeatBook.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end	
	local item_name = item:GetKeyName()
	local item_id = item:GetId()
    local item_num = LackingSeatBook.NeedNum

	if LackingSeatBook.Config and Lua_tools then
		local start_bag_free = Lua_tools.GetBagFree(player)
        local have_item_num = sItemSystem:GetItemAmount(player,item_id,3)

        if have_item_num < item_num then
            sLuaApp:NotifyTipsMsg(player,"阵法书残卷数量不足")
            return false
        end

        if start_bag_free >= 1 then
            sItemSystem:ConsumeItemWithPriority(player, item_id, item_num, true, "system", "阵法残卷","阵法残卷合成阵法书")
        else
		    if have_item_num == item_num then
		    	sItemSystem:ConsumeItemWithPriority(player, item_id, item_num, true, "system", "阵法残卷","阵法残卷合成阵法书")
            else
                sLuaApp:NotifyTipsMsg(player,"包裹空间不足")
		    	return false
		    end
        end
	else
		sLuaApp:LuaDbg("LackingSeatBook 或 Lua_tools 配置缺少")
		return false
	end
    local item_list = LackingSeatBook.Config
    local SeatBook = Lua_tools.PlayerStartRandom(item_list,"LackingSeatBookRandom",1, false, false)
    if SeatBook[1] ~= "nil" then
        Lua_tools.AddItem(player, SeatBook, "system", item_name, "")
    end
    return false
end

-- 使用物品
function LackingSeatBook.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end