--称号物品
TitleItem = {}

-- 创建物品
function TitleItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function TitleItem.on_item_destroy(item)
    if item == nil then
        return
    end
end



-- 使用物品前
function TitleItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local item_name=item:GetKeyName()
	if TitleItemConfig then
		if TitleItemConfig.title_List[item_name] then
			return true
		else
			sLuaApp:LuaErr("TitleItemConfig.title_List配置错误缺少"..item_name)
			return false
		end
	else
		sLuaApp:LuaErr("缺少TitleItemConfig")
		return false
	end
	return false
end
-- 使用物品
function TitleItem.on_use_item(player,item,count) --一次使用多个 == 使用一个
    if item == nil then
        return
    end
	local item_name=item:GetKeyName()

	local title_item = TitleItemConfig.title_List[item_name]
	if title_item['typ'] == 1 then--永久称号
		if not sTitleSystem:HasTitle(player, title_item['titleid']) then--没这个称号
			sTitleSystem:AddTitleEx( player, title_item['titleid'], 0)
			local titleConfig = TitleConfig.GetById(title_item['titleid'])
			if titleConfig then
				sLuaApp:NotifyTipsMsg(player, "获得称号"..titleConfig.Name)
			end
		end
	elseif title_item['typ'] == 0 then--限时称号
		--物品剩余时间
		local item_times = item:GetEndTime() - sLuaApp:GetTimes()
		if item_times <= 0 then
			sLuaApp:NotifyTipsMsg(player, "物品剩余时间错误")
			sLuaApp:LuaErr("物品剩余时间错误 "..player:GetName().." "..item_times.." "..item_name)
			return
		end
		if not sTitleSystem:HasTitle(player, title_item['titleid']) then--没这个称号  直接加
			sTitleSystem:AddTitleEx( player, title_item['titleid'], item_times)
			sLuaApp:NotifyTipsMsg(player, "获得称号"..item:GetName())
		else--有这个称号 需要判断称号时间和物品时间 设置时间更长的
			--GetEndTime 称号截至时间 0表示永久 -1 表示未拥有称号
			local title_times = sTitleSystem:GetEndTime(player, title_item['titleid']) - sLuaApp:GetTimes()
			if item_times > title_times then--物品时间大于称号时间 
				sTitleSystem:DelTitle( player, title_item['titleid'])
				sTitleSystem:AddTitleEx( player, title_item['titleid'], item_times)
				local titleConfig = TitleConfig.GetById(title_item['titleid'])
				if titleConfig then
					sLuaApp:NotifyTipsMsg(player, "获得称号"..titleConfig.Name)
				end
			end
		end
	end
	
end