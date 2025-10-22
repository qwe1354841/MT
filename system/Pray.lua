--祈福
Pray = {}

local GuardLevel = {
    [1] = "超",
	[2] = "N",
	[3] = "R",
	[4] = "SR",
	[5] = "SSR",
}

local Colors = {
	['Item'] = {
		"FCFCFCFF",
		"46DC5FFF",
		"42B1F0FF",
		"E852FFFF",		--紫色
		"FF8C00FF"		--橙色
		},
	['Pet'] = {
		"FCFCFCFF",
		"46DC5FFF",
		"42B1F0FF",
		"FF8C00FF",		--橙色
		"E852FFFF",		--紫色
		"FF8C00FF"		--橙色
	},
	['Guard'] = {
		"FCFCFCFF",
		"46DC5FFF",
		"42B1F0FF",
		"E852FFFF",		--紫色
		"FF8C00FF"		--橙色
		-- "FF8C00FF",
		-- "E852FFFF",
		-- "42B1F0FF",
		-- "46DC5FFF",
	},
}

--区分不同模式的祈福功能
function Pray.GetMainConfig(pray_index, tab_index)
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		if not PrayConfig.Main[tab_index] then
			return nil
		end
		return PrayConfig.Main[tab_index][pray_index]
	else
		return PrayConfig.Main[pray_index]
	end
end
function Pray.GetSelectIndex(pray_index, tab_index)
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		return tab_index.."_"..pray_index
	else
		return pray_index
	end
end
--检查限时
function Pray.CheckTime(tab_index)
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		if not tab_index or tab_index == 0 then 
			sLuaApp:LuaErr("Pray.CheckTime tab_index "..tostring(tab_index))
			return false
		end
		local tab_config = PrayConfig.Main[tab_index]
		if not tab_config then
			return false
		end
		if tab_config["TimeLimitType"] and tab_config["TimeLimitConfig"] then
			local now_sec = sLuaApp:SecondSinceEpoch(0)
			if not (now_sec >= tab_config["CheckTime"][1] and now_sec <= tab_config["CheckTime"][2]) then
				return false
			end
		end
	end
	return true
end

function Pray.GetData(player)
	if not (PrayConfig and PrayConfig.ShowDataStr) then return end
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Pray'] ~= "on" then
			return
		end
	end

	local str = ""
	--兼容新模式
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		str = [[
			if Pray_2UI then
				Pray_2UI.ServerData = ]]..PrayConfig.ShowDataStr..[[
				Pray_2UI.FreeTimeUsed = ]].. Pray.GetFreeTime(player) ..[[
				Pray_2UI.Refresh()
			end
		]]
	else
		str = [[
			if PrayUI then
				PrayUI.ServerData = ]]..PrayConfig.ShowDataStr..[[
				PrayUI.FreeTimeUsed = ]].. Pray.GetFreeTime(player) ..[[
				PrayUI.Refresh()
			end
		]]
	end

	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

function Pray.StartDraw(player, pray_index, draw_type, tab_index)
	if not (PrayConfig and PrayConfig.Main and pray_index and draw_type and tab_index) then return end
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['Pray'] ~= "on" then
			return
		end
	end
	
	pray_index = tonumber(pray_index)
	draw_type = tonumber(draw_type)
	tab_index = tonumber(tab_index)
	if not Pray.CheckTime(tab_index) then 
		sLuaApp:NotifyTipsMsg(player, "未在限定时间内，无法祈福！")
		return 
	end
	local config = Pray.GetMainConfig(pray_index, tab_index)
	if not config then return end
	if player:GetString("PrayDelayReward") ~= "" then
		sLuaApp:NotifyTipsMsg(player, "你还有奖励未领取")
		Pray.DelayGet(player)
		return
	end
	
	local isFree = 0
	local need_nums = 1
	local show_time = PrayConfig.PlayInterval or 380
	local select_index = Pray.GetSelectIndex(pray_index, tab_index)
	if draw_type == 1 then
		local now_time = sLuaApp:SecondSinceEpoch(0)
		local next_freetime = player:GetInt("PrayNextFreeTime"..select_index)
		local freetime_used = player:GetDayInt("PrayFreeTimeUsed"..select_index)
		if next_freetime <= now_time and freetime_used < config.DayFreeMax then
			isFree = 1
			player:SetInt("PrayIsFreeGet", 1)
			player:SetInt("PrayNextFreeTime"..select_index, now_time + config.FreeTimes)
			player:SetDayInt("PrayFreeTimeUsed"..select_index, freetime_used + 1)
		end
	elseif draw_type == 2 then
		need_nums = 10
		show_time = show_time * 10
	else
		return
	end
	
	if isFree == 0 then
		local cos_item_data = ItemConfig.GetByKeyName(config["ItemKey"])
		if cos_item_data then
			local item_id = cos_item_data.Id
			local has_num = sItemSystem:GetItemAmount(player, item_id, 3)
			if has_num < need_nums then
				Pray.PopupPayWnd(player, pray_index, draw_type, tab_index)
				return
			else
				sItemSystem:ConsumeItemWithPriority(player, item_id, need_nums, true, "system", "祈福","祈福消耗")
			end
		end
	end
	local reward_tb = Pray.RollStart(player, pray_index, draw_type, tab_index)
	local reward_tb_str = Lua_tools.serialize(reward_tb)
	player:SetString("PrayDelayReward", reward_tb_str)
	local str = ""
	--兼容新模式
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		str = [[
			if Pray_2UI then
				Pray_2UI.ShowData = ]]..reward_tb_str..[[
				Pray_2UI.FreeTimeUsed = ]].. Pray.GetFreeTime(player) ..[[
				Pray_2UI.SummonLotteryReward()
			end
		]]
	else
		str = [[
			if PrayUI then
				PrayUI.ShowData = ]]..reward_tb_str..[[
				PrayUI.FreeTimeUsed = ]].. Pray.GetFreeTime(player) ..[[
				PrayUI.SummonLotteryReward()
			end
		]]
	end
	--sLuaApp:LuaErr(str)
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_LOGOUT, "Pray", "DelayGet")
	sLuaTimerSystem:AddTimerEx(player, 500 + show_time,1, "Pray.DelayGet","")
	
	--密藏目标进度
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.PrayCount(player, 5, need_nums)				--任意祈福
		if select_index == 1 then
			SeasonPassQuestFunc.PrayCount(player, 8, need_nums)         --地仙祈福
		elseif select_index == 2 then
			SeasonPassQuestFunc.PrayCount(player, 9, need_nums)         --飞仙祈福
		elseif select_index == 3 then
			SeasonPassQuestFunc.PrayCount(player, 10, need_nums)        --天神祈福
		end
	end
end

--提示购买
function Pray.PopupPayWnd(player, pray_index, draw_type, tab_index)
	local config = Pray.GetMainConfig(pray_index, tab_index)
	if not config then return end
	
	local item_name = ItemConfig.GetByKeyName(config["ItemKey"]).Name
	if config.MoneyType == "Item" then
		sLuaApp:NotifyTipsMsg(player, "您的"..item_name.."数量不足，无法祈福！")
		return
	end
	local basic_item_name = ItemConfig.GetByKeyName(config["BasicItem"]).Name
	local num = draw_type == 2 and 10 or 1
	local str = [[
		GlobalUtils.ShowServerBoxMessage("您的]]..item_name..[[数量不足，是否通过]]..(draw_type == 2 and config.TenthPrice or config.OncePrice)..Lua_tools.GetMoneyName(config.MoneyType)..[[购买]]..basic_item_name..[[*]]..num..[[？将赠送]]..item_name..[[*]]..num..[[！")
	]]
	player:SetString("SYSTEM_ConfirmBox_Function", "Pray.PayForItem("..player:GetGUID()..","..pray_index..","..draw_type..","..tab_index..")")
	sLuaApp:ShowForm(player, "脚本表单", str)
end
function Pray.PayForItem(player_guid, pray_index, draw_type, tab_index)
	local player = sPlayerSystem:GetPlayerByGUID(player_guid)
	pray_index = tonumber(pray_index)
	draw_type = tonumber(draw_type)	
	tab_index = tonumber(tab_index)	
	local config = Pray.GetMainConfig(pray_index, tab_index)
	if not config then return end

	if Lua_tools.GetBagFree(player) < 2 then
		sLuaApp:NotifyTipsMsg(player, "你的包裹不足，请先清理包裹~")
		return
	end
	local money_type = config.MoneyType
	local money_val = (draw_type == 2 and config.TenthPrice or config.OncePrice)
	if Lua_tools.SubMoney(player, money_type, money_val, "system", "祈福", "祈福券购买") then
		local num = (draw_type == 2 and 10 or 1)
		sItemSystem:MergeItemEx(player, sItemSystem:GetItemIdByKeyname(config.BasicItem), num, true, "system", "祈福", "祈福券购买")
		sItemSystem:MergeItemEx(player, sItemSystem:GetItemIdByKeyname(config.ItemKey), num, true, "system", "祈福", "祈福券购买")
		Pray.StartDraw(player, pray_index, draw_type, tab_index)
	else
		if MoneyChange then
			local f_name = [[Pray.PayForItem(]]..player_guid..[[,]]..pray_index..[[,]]..draw_type..[[,]]..tab_index..[[)]]
			MoneyChange.LackMoney(player, money_type, money_val, f_name)
		else
			sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(money_type).."不足！")
		end
	end
end

--延迟获得奖励
function Pray.DelayGet(player)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_LOGOUT, "Pray", "DelayGet")
	
	local reward_tb_str = player:GetString("PrayDelayReward")
	if reward_tb_str == "" then return end
	player:SetString("PrayDelayReward", "")
	
	local goodtable = assert(load("return "..reward_tb_str))()
	
	if player:GetInt("PrayIsFreeGet") == 1 then
		if #goodtable.Orders == 1 then
			if goodtable.ItemList[3] then
				goodtable.ItemList[3] = 1
			elseif goodtable.PetList then
				goodtable.PetList[2] = 1
			end
		end
	end
	player:SetInt("PrayIsFreeGet", 0)
	if type(goodtable.ItemList) == 'table' then
		Lua_tools.GiveGoods(player, goodtable)
	end
	--成就
	if Achievement then
		Achievement.Achievement_Prayer(player)
	end
end

--roll 返回奖励表  -pray_index奖励表index -draw_type 1 单抽 2 十连抽
function Pray.RollStart(player, pray_index, draw_type, tab_index)
	pray_index = tonumber(pray_index)
	draw_type = tonumber(draw_type)
	tab_index = tonumber(tab_index)
	local select_index = Pray.GetSelectIndex(pray_index, tab_index)
	if not PrayConfig.RandGuarantees or not PrayConfig.RandGuarantees[select_index] then
		sLuaApp:LuaErr("Pray.RollStart 不存在PrayConfig.RandGuarantees"..select_index)
		return
	end
	local pray_config = Pray.GetMainConfig(pray_index, tab_index)

	local times = 1 --抽卡次数
	local guarantees_time = 0 --第几次拿到保底
	if draw_type == 2 then --只有十连抽带保底
		guarantees_time = sLuaApp:RandInteger(1, 10)
		times = 10
	end
	
	local answer_reward = {}
	answer_reward["ItemList"] = {}
	answer_reward["PetList"] = {}
	answer_reward["GuardList"] = {}
	answer_reward["Orders"] = {}
	--玩家信息 ['Type'] == "Condition" 时进行判断
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local sex = player:GetAttr(ROLE_ATTR_GENDER)
	local role = player:GetAttr(ROLE_ATTR_ROLE)

	for i = 1, times do
		local reward = {}
		local is_normal = 1 -- 1 == 普通，2 == 稀有 -- 控制声音
		local rand = sLuaApp:RandInteger(1, 10000)
		if rand <= pray_config["Guarantees_Rand"] or i == guarantees_time then
			local selet_index = Pray.GetSelectIndex(pray_index, tab_index)
			if player:GetInt("Pray_IsFirstPray") == 0 and (selet_index == 1 or selet_index == "1_1") then
				player:SetInt("Pray_IsFirstPray", 1)
				reward = PrayConfig.FirstItem
			else
				local reward_index = Pray.RanderIndex(PrayConfig.RandGuarantees[select_index])
				reward = pray_config["Rewards_Guarantees"][reward_index]
			end
			is_normal = 2
		else
			local reward_index = Pray.RanderIndex(PrayConfig.RandNormal[select_index])
			reward = pray_config["Rewards_Normal"][reward_index]
		end
		if next(reward) then
			-- 根据条件选择具体reward
			if reward["Type"] == "Condition" then
				local is_select = 0
				for _,v in ipairs(reward) do
					while is_select == 0 and type(v) == "table" do
						if v.Sex and v.Sex ~= sex then			--玩家性别判定，1男2女
							break
						end
						if v.Level then
							if type(v.Level) == "number" then
								if v.Level ~= level then			--玩家等级判定
									break
								end
							elseif type(v.Level) == "table" then
								if v.Level[1] > level or v.Level[2] < level then			--玩家等级判定
									break
								end
							else
								break
							end
						end
						if v.Role and v.Role ~= role then
							break
						end
						reward = v
						is_select = 1
						break
					end
				end
				if is_select == 0 then
					if reward[1] and reward[1]["KeyName"] then
						sLuaApp:LuaErr("Pray.RollStart 不存在符合玩家的条件 PrayConfig.Main表-KeyName "..reward[1]["KeyName"])
					end
					reward = {Type = "Item", KeyName = "小银币袋", Num = 2, Rand = 300}
				end
			end
			
			--奖励配置表转GiveGoods需求表
			if reward["Type"] == "Item" then
				if reward["Advert"] and reward["Advert"] == 1 then
					local item_data = ItemConfig.GetByKeyName(reward["KeyName"])
					if item_data then
						local grade = item_data.Grade
						sLuaApp:LuaDbg(player:GetName().."抽到了"..item_data.KeyName)
						local msg = "<color=#FFD700FF>"..player:GetName().."</color>在祈福中获得了<color=#"..(Colors['Item'][grade] or "FF8C00FF")..">"..item_data.Name.."*"..reward["Num"].."</color>！"
						sLuaApp:NotifyTopMsgToAll(1, msg)
					end
				end
				table.insert(answer_reward["ItemList"], reward["KeyName"])
				table.insert(answer_reward["ItemList"], reward["Num"])
				table.insert(answer_reward["ItemList"], reward["Bind"] or 1)
				table.insert(answer_reward["ItemList"], is_normal)
				table.insert(answer_reward["Orders"], 1)
			elseif reward["Type"] == "Pet" then
				if reward["Advert"] and reward["Advert"] == 1 then
					local Pet_data = PetConfig.GetByKeyName(reward["KeyName"])
					if Pet_data then
						local grade = Pet_data.Grade
						sLuaApp:LuaDbg(player:GetName().."抽到了"..Pet_data.KeyName)
						local msg = "<color=#FFD700FF>"..player:GetName().."</color>在祈福中获得了宠物<color=#"..(Colors['Pet'][grade] or "FF8C00FF")..">"..Pet_data.Name.."</color>！"
						sLuaApp:NotifyTopMsgToAll(1, msg)
					end
				end
				table.insert(answer_reward["PetList"], reward["KeyName"])
				table.insert(answer_reward["PetList"], reward["Bind"] or 1)
				table.insert(answer_reward["PetList"], reward["PetLevel"] or 0)
				table.insert(answer_reward["PetList"], is_normal)
				table.insert(answer_reward["Orders"], 2)
			elseif reward["Type"] == "Guard" then
				local guard_data = GuardConfig.GetByKeyName(reward["KeyName"])
				if not guard_data then
					sLuaApp:LuaErr("Pray  GuardConfig 缺少 " ..reward["KeyName"])
					return
				end
				local guard_id = guard_data.Id
				local guard_con = player:GetGuardContainer()
				if guard_con:HasGuard(guard_id) then
					local call_item_id = guard_data.CallItemIcon
					local call_item_num = guard_data.ItemNumber
					call_item_num = math.ceil(call_item_num*(Lua_tools.GuardToPiece or 0.5))
					if call_item_num <= 0 then
						call_item_num = 1
					end
					local call_item_keyName = ItemConfig.GetById(call_item_id).KeyName
					table.insert(answer_reward["ItemList"], call_item_keyName)
					table.insert(answer_reward["ItemList"], call_item_num)
					table.insert(answer_reward["ItemList"], reward["Bind"] or 1)
					table.insert(answer_reward["ItemList"], is_normal)
					table.insert(answer_reward["Orders"], 1)
				else
					if reward["Advert"] and reward["Advert"] == 1 then
						local grade = guard_data.Grade
						local grade_str = GuardLevel[grade] or "超"
						sLuaApp:LuaDbg(player:GetName().."抽到了"..guard_data.KeyName)
						local msg = "<color=#FFD700FF>"..player:GetName().."</color>在祈福中获得了"..grade_str.."级侍从<color=#"..(Colors['Guard'][grade] or "FF8C00FF")..">"..guard_data.Name.."</color>！"
						sLuaApp:NotifyTopMsgToAll(1, msg)
					end
					table.insert(answer_reward["GuardList"], reward["KeyName"])
					table.insert(answer_reward["GuardList"], reward["Bind"] or 1)
					table.insert(answer_reward["GuardList"], is_normal)
					table.insert(answer_reward["Orders"], 3)
				end
			end
		end
	end
	--sLuaApp:LuaErr("answer_reward"..Lua_tools.serialize(answer_reward))
	return answer_reward
end

function Pray.RanderIndex(randtable)
	local rand = sLuaApp:RandInteger(1, randtable[#randtable])
	for i = 1,#randtable-1 do
		if rand <= randtable[i+1] and rand > randtable[i] then
			return i
		end
	end
end

function Pray.GetFreeTime(player)
	local free_time_tb = {}
	if PrayConfig.Mode and PrayConfig.Mode == 2 then
		for tab_index, config in ipairs(PrayConfig.Main) do
			free_time_tb[tab_index] = {}
			for pray_index in ipairs(config) do
				free_time_tb[tab_index][pray_index] = player:GetDayInt("PrayFreeTimeUsed"..tab_index.."_"..pray_index)
			end
		end
	else
		for pray_index in ipairs(PrayConfig.Main) do
			free_time_tb[pray_index] = player:GetDayInt("PrayFreeTimeUsed"..pray_index)
		end
	end

	local free_time_tb_str = Lua_tools.serialize(free_time_tb)
	return free_time_tb_str
end