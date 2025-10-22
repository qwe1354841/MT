RandomMoney={}
-- 货币类型固定 货币数量随机
-- 创建物品
function RandomMoney.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function RandomMoney.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function RandomMoney.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end
	local Item_Name=item:GetKeyName()
	if CurrencyGiftsConfig.Main[Item_Name] then

        -- TODO 非法输入验证
        return true

	else
		sLuaApp:LuaErr("礼包配置错误")
		return false
	end
	return false
end

-- 使用物品
function RandomMoney.on_use_item(player, item, count)
    -- player:AddIngot(10,"system", "", "")  -- 测试
    if item == nil then
        return
    end
	local Item_Name=item:GetKeyName()
	if Lua_tools then
        for i=1,count do
            
            local tb_now
            tb_now = CurrencyGiftsConfig.Main[Item_Name]['RandomMoneyList']
            if tb_now then
                for i = 1, #tb_now, 3 do
                    local genRes = sLuaApp:RandInteger(tb_now[i+1], tb_now[i+2])
                    -- sLuaApp:LuaDbg("货币类型为"..tb_now[i].."生成的随机数为===="..genRes)
                    local MoneyMap = {[1] = '金元宝', [2] = '银元宝', [4] = '金币', [5] = '银币'}
                    sLuaApp:NotifyTipsMsg(player,"你获得了"..genRes..MoneyMap[tb_now[i]])
                    Lua_tools.AddMoney(player, tb_now[i], genRes, "system", "", "")
                end
            end

		end
	end
	
end