--VIP经验卡
VIPExpCard = {}
VIPExpCard.Config = {
	["VIP经验卡1"] = 2000,
	["VIP经验卡2"] = 4000,
	["VIP经验卡3"] = 10000,
	["VIP经验卡4"] = 20000,
	["VIP经验卡5"] = 100000,
	["VIP1卡"] = 2000,
	["VIP2卡"] = 8000,
	["VIP3卡"] = 10000,
	["VIP经验卡"] = 2000000,
}
-- 创建物品
function VIPExpCard.on_item_create(item)
	sLuaApp:LuaDbg("000")
    if item == nil then
        return
    end
end

-- 销毁物品
function VIPExpCard.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function VIPExpCard.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	if VipConfig then
		if player:GetAttr(ROLE_ATTR_VIP) >= VipConfig.MaxVipLevel then
			sLuaApp:NotifyTipsMsg(player, "恭喜神壕您已达到最大VIP等级")
			return false
		end
	else
		sLuaApp:LuaErr("缺少VipConfig")
		return false
	end
	local item_name=item:GetKeyName()
	if VIPExpCard.Config then
		if VIPExpCard.Config[item_name] then
			return true
		else
			sLuaApp:LuaErr("VIPExpCard.Config配置错误缺少"..item_name)
			return false
		end
	else
		sLuaApp:LuaErr("缺少VIPExpCard.Config")
		return false
	end
	return false
end
-- 使用物品
function VIPExpCard.on_use_item(player, item, count)
    if item == nil then
        return
    end
	local item_name=item:GetKeyName()
	local add_exp = VIPExpCard.Config[item_name] * count
	if VipExp then
		VipExp.on_sub_ingot(player, add_exp, "system", item_name, "")
		VipExp.on_recharge(player, add_exp, "system", item_name, "")
		sLuaApp:NotifyTipsMsg(player, "恭喜获得"..add_exp.."点VIP经验")
	else
		sLuaApp:LuaErr("缺少VipExp")
	end
end