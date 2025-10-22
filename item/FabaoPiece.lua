--法宝碎片合成
FabaoPiece = {}

FabaoPiece.NeedNum = 100

FabaoPiece.Config = {
    {ItemKey = "50物理系法宝" , Rand = 5000},
    {ItemKey = "50魔法系法宝" , Rand = 5000},
    {ItemKey = "50辅助系法宝" , Rand = 5000},
    {ItemKey = "50辅助系法宝2" , Rand = 5000},
}

-- 使用物品前
function FabaoPiece.on_pre_use_item(player,item,count)
    if player == nil or item == nil then
        return false
    end	
	local item_name = item:GetKeyName()
	local item_id = item:GetId()
    local item_num = FabaoPiece.NeedNum

	if FabaoPiece.Config and Lua_tools then
		local start_bag_free = Lua_tools.GetBagFree(player)
        local have_item_num = sItemSystem:GetItemAmount(player,item_id,3)

        if have_item_num < item_num then
            sLuaApp:NotifyTipsMsg(player,"法宝碎片数量不足")
            return false
        end
        if start_bag_free >= 1 then
            sItemSystem:ConsumeItemWithPriority(player, item_id, item_num, true, "system", "法宝碎片","法宝碎片合成随机法宝")
        else
		    if have_item_num == item_num then
		    	sItemSystem:ConsumeItemWithPriority(player, item_id, item_num, true, "system", "法宝碎片","法宝碎片合成随机法宝")
            else
                sLuaApp:NotifyTipsMsg(player,"包裹空间不足")
		    	return false
		    end
        end
	else
		sLuaApp:LuaDbg("FabaoPiece 或 Lua_tools 配置缺少")
		return false
	end
    local item_list = FabaoPiece.Config
    local SeatBook = Lua_tools.PlayerStartRandom(item_list,"FabaoPieceRandom",1, false, false)
    if SeatBook[1] ~= "nil" then
        Lua_tools.AddItem(player, SeatBook, "system", item_name, "")
    end
    return false
end

-- 使用物品
function FabaoPiece.on_use_item(player, item, count)
    if item == nil then
        return false
    end
end