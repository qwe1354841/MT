DailyItem = {}
--称号物品

--道具KeyName = 1，每日只可使用一次
--道具KeyName = "XXXX"，文本内容为组别，同组的道具加起来每天只能使用一次。建议使用中文，提示为【XXXX类道具一天只能使用一次哦】
DailyItem.Config = {
	['分钟增加经验'] = 1,
	['日常经验增加'] = 1,
}


-- 创建物品
function DailyItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function DailyItem.on_item_destroy(item)
    if item == nil then
        return
    end
end



-- 使用物品前
function DailyItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local key = item:GetKeyName()
	
	local Mark = DailyItem.Config[key]
	
	if Mark then
		if count > 1 then
			sLuaApp:NotifyTipsMsg(player, "每天只能使用一个"..item:GetName().."哦")
			return false
		end
		if type(Mark) == "number" then
			local Id = item:GetId()
			if player:GetDayInt("DailyItemUsed_"..Id) >= 1 then
				sLuaApp:NotifyTipsMsg(player, "您今天已经使用过"..item:GetName().."了")
				return false
			end
		elseif type(Mark) == "string" then
			if player:GetDayInt("DailyItemStrU_"..Mark) >= 1 then
				sLuaApp:NotifyTipsMsg(player, Mark.."类道具一天只能使用一次哦")
				return false
			end
		end
	end
	return true
end
-- 使用物品
function DailyItem.on_use_item(player,item,count) --一次使用多个 == 使用一个
    if item == nil then
        return
    end
	local key=item:GetKeyName()

	local Mark = DailyItem.Config[key]
	
	if Mark then
		if type(Mark) == "number" then
			local Id = item:GetId()
			player:SetDayInt("DailyItemUsed_"..Id , 1)
		elseif type(Mark) == "string" then
			player:SetDayInt("DailyItemStrU_"..Mark, 1)
		end
	end
end