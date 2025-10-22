--表情包解锁
EmojiUnlock = {}

EmojiUnlock.Config = {
	['包子表情包'] = {Mark = 2, Days = 30},
}


-- 创建物品
function EmojiUnlock.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function EmojiUnlock.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function EmojiUnlock.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local key = item:GetKeyName()
	
	local Marks = EmojiUnlock.Config[key]
	
	if Marks.Mark then
		--解锁内容待填
		if player:HasEmoji(Marks.Mark) then
			sLuaApp:NotifyTipsMsgEx(player, "您已经解锁过该表情包，无法再次使用")
			return false
		end
		sLuaApp:NotifyTipsMsgEx(player, "解锁表情包成功！")
		player:AddEmoji(Marks.Mark)
		if Marks.Days then
			--Marks.Days*24*3600*1000
			Lua_tools.Player_AddTimerPlus(player, Marks.Days*24*3600*1000, "EmojiUnlock.DelEmoji", ""..Marks.Mark)
		end
		return true
	end
	return false
end
-- 使用物品
function EmojiUnlock.on_use_item(player,item,count) --一次使用多个 == 使用一个
    
end

--删除表情包
function EmojiUnlock.DelEmoji(player, timer_id, Mark)
	Mark = tonumber(Mark)
	if Mark then
		player:DelEmoji(Mark)
		sLuaApp:NotifyTipsMsgEx(player, "您的表情包过期了")
	end
end