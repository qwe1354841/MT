-- 随机礼包
RandomGifts={}

--RandomGifts.times = 1 --单个礼包给的物品种类数量
-- 创建物品 
function RandomGifts.on_item_create(item)
    if item == nil then
        return
    end
end

-- 销毁物品
function RandomGifts.on_item_destroy(item)
    if item == nil then
        return
    end
end

-- 使用物品前
function RandomGifts.on_pre_use_item(player,item,count)
    if item == nil then
        return false
    end	
	local item_name = item:GetKeyName()
	local gifts_config = RandomGiftsConfig.Main[item_name]
	if not gifts_config then 
		sLuaApp:LuaErr("RandomGiftsConfig.Main 不存在 "..item_name)
		return false
	end
	return true
end

-- 使用物品
function RandomGifts.on_use_item(player, item, count)
    if item == nil then
        return
    end
	
	local item_name = item:GetKeyName()
	local item_id = item:GetId()
	local gifts_config = RandomGiftsConfig.Main[item_name]
	if gifts_config and Lua_tools then
		-- local start_bag_free = Lua_tools.GetBagFree(player) --不再判断 直接发邮件
		-- if RandomGifts.times > start_bag_free then
			-- sLuaApp:NotifyTipsMsg(player,"包裹空间不足")
			-- return false
		-- end
		local get_item_list = {}
		for i = 1, count do
			-- local bag_free = Lua_tools.GetBagFree(player)
			-- if RandomGifts.times > bag_free then
				-- sLuaApp:NotifyTipsMsg(player,"已使用"..item:GetName().." * "..(i-1).."，剩余数量 ".. count - (i-1))
				-- return false
			-- end

			--sItemSystem:ConsumeItemWithPriority(player, item_id, 1, true, "system", "随机礼包","打开礼包")			
			
			-- +钱
			local money_type = gifts_config['MoneyType']
			local money_val = gifts_config['MoneyVal']
			if money_type and money_val and money_val ~= 0 then
				local res_money_val = RandomGifts.RewardConfigToNmber(player, money_val)
				if res_money_val > 0 then
					Lua_tools.AddMoney(player, money_type, res_money_val, "system", "随机礼包", item_name)
				end
			end
			
			--记录物品 
			if gifts_config['RandItemList'] then
				if gifts_config['Item'] then
					for _,v in ipairs(gifts_config['Item']) do
						table.insert(get_item_list, v)
					end
					--Lua_tools.AddItem(player, gifts_config['Item'], "system", "随机礼包", item_name)
				end
				for k,v in ipairs(gifts_config['RandItemList']) do
					local reward = Lua_tools.PlayerStartRandom(v['ItemRand'], "Gifts"..item_id..k, v['RandTime'])
					if reward[1] ~= "Nil" then
						for _,b in ipairs(reward) do
							table.insert(get_item_list, b)
						end
						--Lua_tools.AddItem(player, reward, "system", "随机礼包", item_name)
					end
				end
			else
				local reward = Lua_tools.PlayerStartRandom(gifts_config, "Gifts"..item_id, RandomGifts.times)
				if reward[1] ~= "Nil" then
					for _,v in ipairs(reward) do
						table.insert(get_item_list, v)
					end
					--Lua_tools.AddItem(player, reward, "system", "随机礼包", item_name)
				else
					sLuaApp:NotifyTipsMsg(player,"礼包空空如也")
				end
			end
			
		end

		-- + item
		if get_item_list and next(get_item_list) then
			
			local res_item_list = Lua_tools.DupTable(get_item_list)
			local bind = item:IsBound() and 1 or 0
			for k,v in ipairs(res_item_list) do
				if type(v) == "string" and type(res_item_list[k+2]) == "number" then
					--礼包绑定 决定 物品绑定
					if res_item_list[k+2] == 2 then
						res_item_list[k+2] = bind
					end
				end
			end

			Lua_tools.AddItem(player, res_item_list, "system", "随机礼包", item_name)
		end
	else
		sLuaApp:LuaDbg("RandomGiftsConfig 或 Lua_tools 配置缺少")
		return
	end
end

function RandomGifts.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
	]]
	if type(add_num) == "table" then
		local min_num = add_num[1]
		local max_num = add_num[2]
		
		if type(min_num) == "string" then
			min_num = assert(load(str_factor .. " return " .. min_num))()
		end
		if type(max_num) == "string" then
			max_num = assert(load(str_factor .. " return " .. max_num))()
		end
		if max_num < min_num then
			max_num,min_num = min_num,max_num
		end
		res_num = sLuaApp:RandInteger(math.floor(min_num), math.floor(max_num))
	elseif type(add_num) == "string" then
		res_num = assert(load(str_factor .. " return " .. add_num))()
	elseif type(add_num) == "number" then
		res_num = add_num
	end
	return math.floor(res_num)
end