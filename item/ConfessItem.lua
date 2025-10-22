--赎罪道具
ConfessItem = {}

ConfessItem.Config = {
	['小赎罪券'] = 20,
}

-- 创建物品
function ConfessItem.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function ConfessItem.on_item_destroy(item)
    if item == nil then
        return
    end
end



-- 使用物品前
function ConfessItem.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	sLuaApp:LuaDbg("使用赎罪券")
	local Key =item:GetKeyName()
	local Val = ConfessItem.Config[Key]
	local NowVal = player:GetPk()
	if NowVal >= 0 then
		sLuaApp:NotifyTipsMsg(player,"您的善恶值大于0，不需要使用该物品")
		return false
	end
	if Val then
		local AddValue = Val*count
		local NeedCnt = math.ceil((0-NowVal)/Val)
		if NeedCnt >= count then
			if AddValue + NowVal > 0 then
				player:AddPk(0-NowVal,"system","使用道具增加善恶值",""..Key)
				sLuaApp:NotifyTipsMsg(player,"使用成功，您当前的善恶值为0")
				return true
			else
				player:AddPk(AddValue,"system","使用道具增加善恶值",""..Key)
				sLuaApp:NotifyTipsMsg(player,"使用成功，您当前的善恶值为"..(AddValue+NowVal))
				return true
			end
		else
			if sItemSystem:ConsumeItemWithId(player, item:GetId(), NeedCnt, 3, "System", "ConfessItem", "使用赎罪券") == 0 then
				player:AddPk(0-NowVal,"system","使用道具增加善恶值",""..Key)
				sLuaApp:NotifyTipsMsg(player,"使用成功，您当前的善恶值为0")
			end
			return false
		end
	end
	return false
end

-- 使用物品
function ConfessItem.on_use_item(player,item,count) --一次使用多个 == 使用一个
	
end