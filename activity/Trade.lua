--贸易
Trade = {}

Trade.FightTag = 10090
 
function Trade.GetData(player)
	if not Trade.CheckLevel(player) then return end
	--发送配置 和 记录的已选贸易品和侍从
	if not Data["Trade"] then
		sLuaApp:LuaErr("Trade.GetData 不存在 Data.Trade")
		--sLuaApp:NotifyTipsMsg(player, "贸易尚未开启")
		Trade.OnStart(0, true)
		Trade.GetData(player)
		return
	end
	Trade.DataRetrieve(player) -- 正在贸易中但没选择数据的时候 尝试重置数据
	
	local player_guid = tostring(player:GetGUID())
	if not Data["Trade"][player_guid] then
		Data["Trade"][player_guid] = {}
	end
	if not Data["Trade"][player_guid]["Select"] then
		Data["Trade"][player_guid]["Select"] = {}
	end
	local now_select = Data["Trade"][player_guid]["Select"] or {}
	
	local status = player:GetInt("Trade_Status")
	if status == 2 then
		if Trade.CheckCanStart(player) then
			Trade.GetData(player)
			return
		else
			sLuaApp:NotifyTipsMsg(player, "今日贸易已完成！")
		end
	end
	
	local event_status_tb = {}
	for i = 1, TradeConfig.MaxEventNum do
		local event_status = player:GetString("Trade_EventStatus_"..i)
		if event_status == "" then
			break
		end
		event_status_tb[i] = event_status
		--player:SetString("Trade_EventStatus_"..event_index, name..","..event_config["Icon"]..",".. 1) -- 1 未完成 2 已完成 
	end
	
	
	local str = [[
		if TradeRoadsUI then
			TradeRoadsUI.Version = "]]..Data["Trade"]["Version"]..[["
			TradeRoadsUI.Tips = "]]..TradeConfig.Tips..[["
			TradeRoadsUI.Voucher =  "]]..TradeConfig.Voucher..[["
			
			TradeRoadsUI.Status = ]]..status..[[
			TradeRoadsUI.EndTime = "]]..player:GetInt("Trade_EndTime")..[["
			TradeRoadsUI.StartTime = "]]..player:GetInt("Trade_StartTime")..[["
			TradeRoadsUI.ExtraCompletion = ]]..player:GetInt("Trade_ExtraCompletion")..[[
			TradeRoadsUI.StartTabIndex = ]]..player:GetInt("Trade_StartTab")..[[
			TradeRoadsUI.StartPlaceIndex = ]]..player:GetInt("Trade_StartPlace")..[[
			
			
			TradeRoadsUI.TradeRoadsChangeTable  = ]]..Lua_tools.serialize(Data["Trade"]["OrderList"])..[[
			TradeRoadsUI.TradeRoadsDataTable  = ]]..TradeConfig.ShowConfigStr..[[
			TradeRoadsUI.SubmitSelectDataTable = ]]..Lua_tools.serialize(now_select)..[[
			TradeRoadsUI.EventStatusTable = ]]..Lua_tools.serialize(event_status_tb)..[[
			TradeRoadsUI.RefreshAllItem()
		end
	]]
	
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr(str)
	--sLuaApp:LuaErr(Lua_tools.serialize(now_select).." "..player:GetName())
	--sLuaApp:LuaErr([[TradeRoadsUI.EventStatusTb = ]]..Lua_tools.serialize(event_status_tb))
end

function Trade.CheckCanStart(player)
	local now_time =  sLuaApp:DaySinceEpoch(0)
	local can_start_day = player:GetInt("Trade_StartDay") + 1 -- 1天刷新
	if can_start_day <= now_time then
		player:SetInt("Trade_Status" , 0)
		return true
	end
	return false
end

function Trade.ClearSelect(player)
	local player_guid = tostring(player:GetGUID())
	if Data["Trade"] and Data["Trade"][player_guid] then
		Data["Trade"][player_guid]["Select"] = {}
	end
end

function Trade.RefreshSelect(player, tab_index, place_index, order_index)
	local player_guid = tostring(player:GetGUID())
	local str = [[
		if TradeRoadsUI then
			TradeRoadsUI.tmp = ]]..Lua_tools.serialize(Data["Trade"][player_guid]["Select"][tab_index][place_index][order_index])..[[
			TradeRoadsUI.SetSubmitSelectDataTable(]]..tab_index..[[, ]]..place_index..[[,]]..order_index..[[, TradeRoadsUI.tmp)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr("RefreshSelect "..str)
end

function Trade.GetSelectConfig(player, version, tab_index, place_index, order_index)
	if not Data["Trade"] then
		sLuaApp:LuaErr("Trade.SelectGoods 不存在 Data.Trade")
		return false
	end
	if version ~= Data["Trade"]["Version"] then
		Trade.GetData(player)
		return false
	end
	if not TradeConfig.Main[tab_index] then return false end
	local place_name = TradeConfig.Main[tab_index]["Place"][place_index]
	if not place_name then return false end
	local order_name = Data["Trade"]["OrderList"][place_name][order_index]
	if not order_name then return false end
	local order_config = TradeConfig.Order[order_name]
	local place_config = TradeConfig.Place[place_name]
	return order_config, place_config
end

--选择贸易品 --需要判断选择 
--防止后续需求变化，和选择侍从分开写
function Trade.SelectGoods(player, version, tab_index, place_index, order_index, select_str)
	if not Trade.CheckLevel(player) then return end
	--sLuaApp:LuaErr("select_str "..select_str)
	if player:GetInt("Trade_Status") == 1 then
		sLuaApp:NotifyTipsMsg(player, "贸易进行中，无法选择")
		return
	end
	local order_config, place_config = Trade.GetSelectConfig(player, version, tab_index, place_index, order_index)
	if not order_config then return end
	
	local need_item_config = order_config["NeedItemEx"]
	
	--现在已选择的贸易品
	local now_select = Trade.GetNowSelect(player, tab_index, place_index, order_index)
	if not now_select["Goods"] then
		now_select["Goods"] = {}
	end
	--先清空
	now_select["Goods"] = {}
	now_select["GoodsCompletion"] = 0
	local now_select_goods = now_select["Goods"]

	--交齐的贸易品数量
	local finish_num = 0
	
	local select_tb = sLuaApp:StrSplit(select_str, ",") -- {keyname,num,bind}
	--判断是否拥有
	--判断是否需要
	for i = 1,#select_tb, 3 do
		local keyname = select_tb[i]
		local num = tonumber(select_tb[i+1])
		local bind = tonumber(select_tb[i+2])
		if not(bind == 0 or bind == 1) then
			sLuaApp:LuaErr("Trade.SelectGoods bind 错误")
			return 
		end

		local item_data = ItemConfig.GetByKeyName(keyname)
		if not item_data then
			sLuaApp:LuaErr("Trade.SelectGoods ItemConfig 不存在 " ..keyname)
			return
		end
		local has_item_num = sItemSystem:GetItemAmount(player, item_data.Id, bind + 1)
		if has_item_num < num then
			sLuaApp:NotifyTipsMsg(player, item_data.Name.. "不足，无法选择。")
			return
		end
		
		local need_num = need_item_config[keyname]
		
		if not need_num then
			sLuaApp:NotifyTipsMsg(player, "该任务不需要"..item_data.Name.. "，无法选择。")
			return
		end
		--记录 已选择
		if not now_select_goods[keyname] then
			now_select_goods[keyname] = {}
			now_select_goods[keyname]["0"] = 0 --非绑数量
			now_select_goods[keyname]["1"] = 0 --绑定数量
		end
		
		now_select_goods[keyname][tostring(bind)] = num
		
		local sum_select_num = now_select_goods[keyname]["0"] + now_select_goods[keyname]["1"]
		if sum_select_num > need_num then
			now_select_goods[keyname][tostring(bind)] = need_num - now_select_goods[keyname][tostring(1 - bind)]
		end
		
		if sum_select_num >= need_num then
			finish_num = finish_num + 1
		end

	end
		
	local sum_goods_completion = place_config["GoodsCompletion"]
	local need_finish_num = order_config["NeedFinishNum"]
	local goods_completion = math.ceil(finish_num / need_finish_num * sum_goods_completion)
	if goods_completion > sum_goods_completion then
		goods_completion = sum_goods_completion
	end
	now_select["GoodsCompletion"] = goods_completion
	
	-- sLuaApp:LuaErr(" goods_completion "..goods_completion)
	-- sLuaApp:LuaErr(" need_finish_num "..need_finish_num)
	-- sLuaApp:LuaErr(" now_select ".. Lua_tools.serialize(now_select))
	--刷新客户端
	Trade.RefreshSelect(player, tab_index, place_index, order_index)
end

--选择护送侍从
function Trade.SelectGuard(player, version, tab_index, place_index, order_index, select_str)
	if not Trade.CheckLevel(player) then return end
	--sLuaApp:LuaErr("SelectGuard  "..place_index.." ".. order_index.." "..select_str)
	if player:GetInt("Trade_Status") == 1 then
		sLuaApp:NotifyTipsMsg(player, "贸易进行中，无法选择")
		return
	end
	local order_config, place_config = Trade.GetSelectConfig(player, version, tab_index, place_index, order_index)
	if not order_config then return end
		
	local guard_con = player:GetGuardContainer()
	local select_tb = sLuaApp:StrSplit(select_str, ",") -- {keyname}

	for _,guard_keyname in ipairs(select_tb) do
		local guard_data = GuardConfig.GetByKeyName(guard_keyname)
		if not guard_data then
			sLuaApp:LuaErr("Trade.SelectGuard GuardConfig不存在 "..guard_keyname)
			return
		end
		local guard_id = guard_data.Id
		if not guard_con:HasGuard(guard_id) then
			sLuaApp:NotifyTipsMsg(player, "未拥有侍从"..guard_data.Name.."，无法选择。")
			return
		end
	end
	
	local select_num = #select_tb
	local escort_guard_num = order_config["EscortGuardNum"]
	if select_num > escort_guard_num then
		sLuaApp:NotifyTipsMsg(player, "选择侍从过多！")
		return
	end
	
	--现在已选择的侍从
	local now_select = Trade.GetNowSelect(player, tab_index, place_index, order_index)
	if not now_select["Guard"] then
		now_select["Guard"] = {}
	end
	now_select["Guard"] = Lua_tools.DupTable(select_tb)

	local sum_guard_completion = place_config["GuardCompletion"]
	local guard_completion = math.ceil(select_num / escort_guard_num * sum_guard_completion)
	if guard_completion > sum_guard_completion then
		guard_completion = sum_guard_completion
	end
	now_select["GuardCompletion"] = guard_completion
	
	--刷新客户端
	Trade.RefreshSelect(player, tab_index, place_index, order_index)
end


--开始贸易
function Trade.Start(player, version, tab_index, place_index, check_mod)
	if not Trade.CheckLevel(player) then return end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，无法开始贸易！")
		return
	end
	local check_status = player:GetInt("Trade_Status")
	if check_status == 1 then
		sLuaApp:NotifyTipsMsg(player, "贸易已在进行中，无法开始贸易！")
		return
	end
	if check_status == 2 then
		if Trade.CheckCanStart(player) then
			Trade.GetData(player)
			sLuaApp:NotifyTipsMsg(player, "贸易状态已更新！")
		else
			sLuaApp:NotifyTipsMsg(player, "今日贸易已完成，无法开始贸易！")
		end
		return
	end
	--记录的选择
	if not Data["Trade"] then
		sLuaApp:LuaErr("Trade.Start 不存在 Data.Trade")
		return
	end
	if version ~= Data["Trade"]["Version"] then
		Trade.GetData(player)
		return
	end
	if not TradeConfig.Main[tab_index] then return end
	local place_name = TradeConfig.Main[tab_index]["Place"][place_index]
	if not place_name then return end
	local place_config = TradeConfig.Place[place_name]

	local player_guid = tostring(player:GetGUID())
	if not Data["Trade"][player_guid] or not next(Data["Trade"][player_guid]["Select"]) then
		sLuaApp:NotifyTipsMsg(player, "未上交贸易品和选择护送侍从，无法开始贸易")
		return
	end
	if not Data["Trade"][player_guid]["Select"][tab_index] then
		sLuaApp:NotifyTipsMsg(player, "未上交贸易品和选择护送侍从，无法开始贸易")
		return
	end
	local place_select_data = Data["Trade"][player_guid]["Select"][tab_index][place_index]
	if not place_select_data then
		sLuaApp:NotifyTipsMsg(player, "未上交贸易品和选择护送侍从，无法开始贸易")
		return
	end
	
	local sum_goods_completion = place_config["GoodsCompletion"]
	--需要判断选择物品是否还存在 且足够 --不需要判断 是否需要该物品 且此时贸易品完成度是正确的
	--判断侍从是否不重复 -- 不需要判断 是否拥有该侍从（侍从无法删除） 且此时侍从的完成度是正确的
	local extra_order_name = ""
	local now_completion = 0 --记录当前完成度
	local sum_select_goods = {}
	local sum_select_guard = {}
	for order_index, order_select_data in ipairs(place_select_data) do
		local select_goods = order_select_data["Goods"] or {}
		for k,v in pairs(select_goods) do
			if not sum_select_goods[k] then
				sum_select_goods[k] = {}
				sum_select_goods[k]["0"] = v["0"]
				sum_select_goods[k]["1"] = v["1"]
			else
				sum_select_goods[k]["0"] = sum_select_goods[k]["0"] + v["0"]
				sum_select_goods[k]["1"] = sum_select_goods[k]["1"] + v["1"]
			end
		end
		
		local check_recommend = false
		if sum_goods_completion == order_select_data["GoodsCompletion"] then
			check_recommend = true
		end
		--记录全部选择推荐侍从的贸易单名
		local order_name = Data["Trade"]["OrderList"][place_name][order_index]
		local order_config = TradeConfig.Order[order_name]
		local escort_guard_num = order_config["EscortGuardNum"]
		local recommend_guard = order_config["RecommendGuardListEx"]
		local recommend_guard_num = 0
		local select_guard = order_select_data["Guard"] or {}
		for _,v in ipairs(select_guard) do
			if sum_select_guard[v] then
				local guard_data = GuardConfig.GetByKeyName(v)
				sLuaApp:NotifyTipsMsg(player, "选择了重复的侍从"..guard_data.Name.."，无法开始贸易")
				--清空选择
				Trade.ClearSelect(player)
				Trade.GetData(player)
				return
			else
				sum_select_guard[v] = true
			end
			
			if recommend_guard[v] then
				recommend_guard_num = recommend_guard_num + 1
			end
		end
		if check_recommend and recommend_guard_num >= escort_guard_num then
			extra_order_name = extra_order_name .. order_name .. ","
		end
		
		now_completion = now_completion + (order_select_data["GoodsCompletion"] or 0) + (order_select_data["GuardCompletion"] or 0)
	end
	
	for k,v in pairs(sum_select_goods) do
		local item_data = ItemConfig.GetByKeyName(k)
		for bind = 0, 1 do
			local has_item_num = sItemSystem:GetItemAmount(player, item_data.Id, bind + 1)
			if has_item_num < v[tostring(bind)] then
				--sLuaApp:NotifyTipsMsg(player, "选择的"..item_data.Name.."不足，无法开始贸易")
				sLuaApp:NotifyTipsMsg(player, "贸易选择状态已更新，请重新选择！")
				--清空选择
				Trade.ClearSelect(player)
				Trade.GetData(player)
				return
			end
		end
	end
	
	--给个提示
	if not check_mod or check_mod ~= 1 then
		local completion_percentage = math.ceil(now_completion / place_config["SumCompletion"] * 100)
		local str = [[GlobalUtils.ShowServerBoxMessage("当前贸易品质为]]..completion_percentage..[[%，是否确定开始贸易？")]]
		player:SetString("SYSTEM_ConfirmBox_Function", "Trade.Start(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),'"..version.."',"..tab_index..","..place_index..",1)")
		sLuaApp:ShowForm(player, "脚本表单", str)
		return
	end
	
	--扣除物品
	for k,v in pairs(sum_select_goods) do
		local item_data = ItemConfig.GetByKeyName(k)
		local item_id = item_data.Id
		for bind = 0, 1 do
			if v[tostring(bind)] > 0 then
				local res = sItemSystem:ConsumeItemWithId(player, item_id, v[tostring(bind)], bind + 1, "system", "贸易", "作为贸易品扣除")
				if res ~= 0 then
					sLuaApp:LuaErr("Trade.Start ConsumeItemWithId 错误 "..item_id)
					return
				end
			end
		end
	end
	
	--设置初始完成度
	player:SetInt("Trade_StartCompletion",now_completion)
	--额外完成度清空
	player:SetInt("Trade_ExtraCompletion", 0)
	--设置贸易状态
	player:SetInt("Trade_Status", 1)
	
	--给奖励的贸易单名
	player:SetString("Trade_ExtraOrderName", extra_order_name)
	--开始后要记录该地点的贸易单 放在player上 防止重启服务器导致贸易单改变
	player:SetString("Trade_SelectData", Lua_tools.serialize(place_select_data))
	--sLuaApp:LuaErr("Trade_SelectData  Trade_SelectDataTrade_SelectData "..Lua_tools.serialize(place_select_data))
	--记录开始的地点
	player:SetInt("Trade_StartTab", tab_index)
	player:SetInt("Trade_StartPlace", place_index)
	player:SetString("Trade_StartPlaceName", place_name)
	--清空其他地点的贸易单XXXXXXXXXX
	
	local now_time = sLuaApp:SecondSinceEpoch(0)
	--设置结束贸易点
	local need_time = place_config["Time"]
	local end_time = now_time + need_time
	--sLuaApp:LuaErr("end_time "..end_time)
	Lua_tools.Player_AddTimerPlus(player, need_time * 1000, "Trade.End", "")
	--记录贸易结束时间
	player:SetInt("Trade_EndTime", end_time)
	--记录开始时间
	player:SetInt("Trade_StartTime", now_time)
	--记录开始时间 天
	player:SetInt("Trade_StartDay", sLuaApp:DaySinceEpoch(0))
	
	--贸易事件状态清空
	for i = 1, TradeConfig.MaxEventNum do
		local event_status = player:GetString("Trade_EventStatus_"..i)
		if event_status == "" then
			break
		end
		player:SetString("Trade_EventStatus_"..i, "")
	end
	--设置触发事件节点
	local event_trigger = place_config["EventTrigger"]
	for k,v in ipairs(event_trigger) do
		if v <= 0 or v >= 100 then
			sLuaApp:LuaErr("Trade.Start EventTrigger 配置错误 "..v)
			break
		end
		local event_need_time = math.floor(need_time * v / 100)
		local event_start_time = now_time + event_need_time
		--sLuaApp:LuaErr("event_start_time "..event_start_time)
		Lua_tools.Player_AddTimerPlus(player, event_need_time * 1000, "Trade.StartEvent", k..","..event_start_time)
	end
	Trade.GetData(player)
	sLuaApp:NotifyTipsMsg(player, "贸易开始")
	
end

--触发事件
function Trade.StartEvent(player, timer_guid, params)
	local now_time = sLuaApp:SecondSinceEpoch(0)
	local end_time = player:GetInt("Trade_EndTime")
	if end_time == 0 or now_time >= end_time then
		sLuaApp:LuaErr("Trade.StartEvent end_time "..end_time .. " now_time " ..now_time.." "..player:GetName().." 贸易事件因贸易已结束未触发")
		return
	end

	local params_tb = sLuaApp:StrSplit(params, ",")
	local event_index = params_tb[1]
	local event_start_time = tonumber(params_tb[2])
	
	local place_name = player:GetString("Trade_StartPlaceName")
	local place_config = TradeConfig.Place[place_name]
	if not place_config then
		sLuaApp:LuaErr("Trade.StartEvent TradeConfig.Place 不存在"..place_name)
		return
	end
	local event_list = place_config["EventList"]
	local event_key = event_list[sLuaApp:RandInteger(1, #event_list)]
	local event_config = TradeConfig.Event[event_key]
	if not event_config then
		sLuaApp:LuaErr("Trade.StartEvent TradeConfig.Event 不存在"..event_key)
		return
	end
	local name = event_config["Name"]
	--如果此时超过了结束时间，则此时事件标记为已超时
	if event_start_time > now_time + 5 then
		sLuaApp:LuaErr(player:GetName().." 贸易事件 "..event_index.." 因已超过开始时间未触发")
		player:SetString("Trade_EventStatus_"..event_index, name..","..event_config["Icon"]..",".. 3) -- 1 未完成 2 已完成 3 已超时
		return
	end
	player:SetString("Trade_EventStatus_"..event_index, name..","..event_config["Icon"]..",".. 1) -- 1 未完成 2 已完成 3 已超时
	
	local npc = Trade.RefreshNPC(player, event_key, event_index)
	if npc then
		local info = event_config["Info"]
		info = string.gsub(info, "$place", place_name)
		local point_index = npc:GetInt("Trade_PointIndex")
		local point_config = event_config["Map"][point_index]
		local map_data = MapConfig.GetByKeyName(point_config[1])
		if not map_data then
			sLuaApp:LuaErr("Trade.StartEvent MapConfig 不存在 "..point_config[1])
			return
		end
		local point_str = PetDevelop.GetColor(map_data.Name.."("..point_config[2]..","..point_config[3]..")", "Red")
		info = string.gsub(info, "$map", point_str)
		
		local duration = event_config["Duration"]
		info = info .."限时"..PetDevelop.GetColor(ShiLian.GetTimeStr(duration), "Red").."！"
		local res = sMailSystem:SendMailEx(0, "贸易", player:GetGUID(), 1, name, info, {}, {}, {})
		if res == 0 then
			sLuaApp:LuaErr("Trade.StartEvent SendMailEx 错误" .. player:GetName() .." " .. event_key)
			return
		end
		--记一下npc位置
		local event_status_str = player:GetString("Trade_EventStatus_"..event_index)
		event_status_str = event_status_str .. ","..point_config[1]..","..point_config[2]..","..point_config[3]..","..npc:GetName()
		player:SetString("Trade_EventStatus_"..event_index, event_status_str)
		--设置超时
		Lua_tools.Player_AddTimerPlus(player, duration * 1000, "Trade.SetEventOvertime", tostring(event_index))
	end
	--可能界面是打开的
	Trade.GetData(player)
end

--设置事件超时
function Trade.SetEventOvertime(player, timer_guid, event_index)
	local status_str = player:GetString("Trade_EventStatus_"..event_index)
	local status_tb = sLuaApp:StrSplit(status_str, ",")
	if tonumber(status_tb[3]) == 1 and tonumber(status_tb[3]) ~= 3 then
		player:SetString("Trade_EventStatus_"..event_index, status_tb[1]..","..status_tb[2]..",".. 3)
	end
end

--刷NPC
function Trade.RefreshNPC(player, event_key, event_index)
	local event_config = TradeConfig.Event[event_key]
		
	local point_index = sLuaApp:RandInteger(1, #event_config["Map"])
	local point_config = event_config["Map"][point_index]
	local map_data = MapConfig.GetByKeyName(point_config[1])
	if not map_data then
		sLuaApp:LuaErr("Trade.EventFunc MapConfig 不存在 "..point_config[1])
		return false
	end
	local map = sMapSystem:GetMapById(map_data.Id)
	local point_tb = sMapSystem:GetRandomPoint(map, point_config[2], point_config[3], point_config[4])

	local npc_data = NpcConfig.GetByKeyName(event_config["NPCKeyname"])
	if not npc_data then
		sLuaApp:LuaErr("Trade.EventFunc NpcConfig 不存在 "..event_config["NPCKeyname"])
		return false
	end
	local npc_id = npc_data.Id
	local npc = nil
	if event_config["Move"] == 0 then
		local dir = point_config[5] or sLuaApp:RandInteger(0, 7)
		npc = sNpcSystem:CreateNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, dir, 0)
	elseif event_config["Move"] == 1 then
		npc = sNpcSystem:CreateMoveNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, 0)
	end
	if not npc then
		sLuaApp:LuaErr("Trade.EventFunc 创建npc失败")
		return false
	end
	npc:SetInt("Trade_PointIndex", point_index) -- 地点配置序号
	npc:SetVisible(player) --设置可见
	local duration = event_config["Duration"]
	sLuaTimerSystem:AddTimerEx(npc, duration*1000,1,"Trade.DestroyNPC", "")
	
	npc:SetString("Trade_EventKey",event_key)
	npc:SetString("Trade_EventIndex", event_index)
	
	-- if event_config["MonID"] then
		-- npc:SetInt("Trade_MonID", event_config["MonID"])
	-- end
	return npc
end


function Trade.StartFight(player, npc, option_index)
	if not npc then return end
	--local mon_id = npc:GetInt("Trade_MonID")
	local event_key = npc:GetString("Trade_EventKey")
	local event_config = TradeConfig.Event[event_key]
	if not event_config then
		sLuaApp:LuaErr("Trade.StartFight TradeConfig.Event 不存在"..event_key)
		return
	end
	local option_config = event_config["Option"]
	if not option_config then
		sLuaApp:LuaErr("Trade.StartFight TradeConfig.Event 不存在 Option"..event_key)
		return
	end
	if not option_config[option_index] then return end
	local mon_id = option_config[option_index]["MonID"]
	if sFightSystem:StartTagPVE(player, mon_id, Trade.FightTag, "Trade", "FightCallBack", "") then
		sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Trade", "OnResult")
		player:SetInt("Trade_FightNPCGUID", npc:GetGUID())
		player:SetString("Trade_FightNPCEventIndex", npc:GetString("Trade_EventIndex"))
		player:SetString("Trade_FightNPCEventKey", event_key)
	else
		sLuaApp:LuaErr("Trade.StartFight StartTagPVE失败")
	end
end

--战斗完回调
function Trade.FightCallBack(typ, tag, custom)
end

--人物完成战斗回调
function Trade.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Trade", "OnResult")
	local trade_status = player:GetInt("Trade_Status")
	if victory == 2 then
		if trade_status == 1 then -- 贸易未结束
			local event_key = player:GetString("Trade_FightNPCEventKey")
			--记录事件额外完成度
			Trade.RecordExtraCompletion(player, event_key)
						
			local event_index = player:GetString("Trade_FightNPCEventIndex")
			local status_str = player:GetString("Trade_EventStatus_"..event_index)
			local status_tb = sLuaApp:StrSplit(status_str, ",")
			player:SetString("Trade_EventStatus_"..event_index, status_tb[1]..","..status_tb[2]..",".. 2)
		else
			sLuaApp:NotifyTipsMsg(player, "贸易不在进行中！")
		end
		
		local npc = sNpcSystem:GetNpcByGUID(player:GetInt("Trade_FightNPCGUID"))
		if npc then
			sNpcSystem:DestroyNpc(npc)
		end
	end
	player:SetInt("Trade_FightNPCGUID", 0)
	player:SetString("Trade_FightNPCEventIndex", "")
	player:SetString("Trade_FightNPCEventKey", "")
end

function Trade.DestroyNPC(npc, timer, p)
	sNpcSystem:DestroyNpc(npc)
end

--NPC对话事件
function Trade.NPCTalk(player, npc, option_index)
	if not npc then return end
	local trade_status = player:GetInt("Trade_Status")
	if trade_status == 1 then
		local event_key = npc:GetString("Trade_EventKey")
		--记录事件额外完成度
		Trade.RecordExtraCompletion(player, event_key)
		
		local event_index = npc:GetString("Trade_EventIndex")
		local status_str = player:GetString("Trade_EventStatus_"..event_index)
		local status_tb = sLuaApp:StrSplit(status_str, ",")
		player:SetString("Trade_EventStatus_"..event_index, status_tb[1]..","..status_tb[2]..",".. 2)
		--sLuaApp:NotifyTipsMsg(player, " ")
		
		sNpcSystem:DestroyNpc(npc)
	else
		sLuaApp:NotifyTipsMsg(player, "贸易不在进行中！")
	end
end

--NPC上交钱事件
function Trade.HandUp(player, npc, option_index, check_mod)
	if not npc then return end
	local trade_status = player:GetInt("Trade_Status")
	if trade_status == 1 then
		local event_key = npc:GetString("Trade_EventKey")
		local event_config = TradeConfig.Event[event_key]
		if not event_config then
			sLuaApp:LuaErr("Trade.HandUp TradeConfig.Event 不存在"..event_key)
			return
		end
		local option_config = event_config["Option"]
		if not option_config then
			sLuaApp:LuaErr("Trade.StartFight TradeConfig.Event 不存在 Option"..event_key)
			return
		end
		if not option_config[option_index] then return end
		local needs_config = option_config[option_index]["Needs"]
		if not needs_config then return end
		
		local need_money = false
		local need_item = false
		if needs_config["MoneyType"] and needs_config["MoneyVal"] and needs_config["MoneyVal"] > 0 then
			need_money = true
		end
		if needs_config["Item"] and next(needs_config["Item"]) then
			need_item = true
		end
		if not check_mod or check_mod ~= 1 then
			local msg = "该选项将消耗"
			if need_money then
				local money_msg = "#OFFSET<X:0,Y:-8#IMAGE"..GuildCashTreeNPC.MoneyIcon[needs_config["MoneyType"]].."#OFFSETEND>#"..needs_config["MoneyVal"]
				msg = msg .. money_msg .."，"
			end
			if need_item then
				for k,v in ipairs(needs_config["Item"]) do
					if type(v) == "string" then
						local item_data = ItemConfig.GetByKeyName(v)
						if not item_data then
							sLuaApp:LuaErr("Trade.HandUp ItemConfig 不存在 "..v)
							return
						end
						msg = msg .. "【"..item_data.Name .."】*"..needs_config["Item"][k+1] .. "，"
					end
				end
			end
			msg = msg .. "是否确定？"
			local str = [[GlobalUtils.ShowServerBoxMessage("]]..msg..[[")]]
			player:SetString("SYSTEM_ConfirmBox_Function", "Trade.HandUp(sPlayerSystem:GetPlayerByGUID("..player:GetGUID().."),sNpcSystem:GetNpcByGUID("..npc:GetGUID().."),"..option_index..",1)")
			sLuaApp:ShowForm(player, "脚本表单", str)
			return
		end
		
		if need_money then
			if not Lua_tools.IsMoneyEnough(player, needs_config["MoneyType"], needs_config["MoneyVal"]) then
				if MoneyChange then
					local f_name = [[Trade.HandUp(player,sNpcSystem:GetNpcByGUID(]]..npc:GetGUID()..[[),]]..option_index..[[,1)]]
					MoneyChange.LackMoney(player, needs_config["MoneyType"], needs_config["MoneyVal"], f_name)
				else
					sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(needs_config["MoneyType"]).."不足！")
				end
				return
			end
		end
		if need_item then
			if not Lua_tools.IsItemEnough(player, needs_config["Item"]) then
				sLuaApp:NotifyTipsMsg(player, "需要的物品不足！")
				-- if OneKeyBuy then -- 设计上这个地方不加 一键购买
					-- local defect_list = Lua_tools.GetDefectList(player, needs_config["Item"])
					-- OneKeyBuy.Main(player, defect_list)
				-- end
				return
			end
		end
		if need_money then
			if not Lua_tools.SubMoney(player, needs_config["MoneyType"], needs_config["MoneyVal"], "system", "贸易", "贸易事件中交钱") then
				sLuaApp:NotifyTipsMsg(player, "您的"..Lua_tools.GetMoneyName(needs_config["MoneyType"]).."不足！")
				sLuaApp:LuaErr("Trade.HandUp Lua_tools.SubMoney 失败")
				return
			end
		end
		if need_item then
			if not Lua_tools.SubItem(player, needs_config["Item"], "system", "贸易", "贸易事件中交钱") then
				sLuaApp:LuaErr("Trade.HandUp Lua_tools.SubItem 失败")
				return
			end
		end
		
		Trade.NPCTalk(player, npc) -- 完成事件
	else
		sLuaApp:NotifyTipsMsg(player, "贸易不在进行中！")
	end
end



--记录事件额外完成度
function Trade.RecordExtraCompletion(player, event_key)
	local event_config = TradeConfig.Event[event_key]
	if not event_config then
		sLuaApp:LuaErr("Trade.RecordExtraCompletion TradeConfig.Event 不存在"..event_key)
		return
	end
	--记录额外完成度
	local reward_completion = event_config["RewardCompletion"]
	if reward_completion then
		local res_completion = 0
		if type(reward_completion) == "table" then
			res_completion = sLuaApp:RandInteger(reward_completion[1], reward_completion[2])
		elseif type(reward_completion) == "number" then
			res_completion = reward_completion
		end
	
		local extra_completion = player:GetInt("Trade_ExtraCompletion") + res_completion
		player:SetInt("Trade_ExtraCompletion", extra_completion)
		local msg = ""
		if res_completion < 0 then
			msg = "已降低部分贸易品质！"
		else
			msg = "已提升部分贸易品质！"
		end
		sLuaApp:NotifyTipsMsg(player, msg)
	end
end


--贸易到点结束
function Trade.End(player, timer_guid, params)
	--sLuaApp:LuaErr("Trade.End " ..player:GetName())
	local player_guid = player:GetGUID()
	-- local place_index = player:GetInt("Trade_StartPlace")
	local place_name = player:GetString("Trade_StartPlaceName")
	local place_config = TradeConfig.Place[place_name]
	if not place_config then
		sLuaApp:LuaErr("Trade.End TradeConfig.Place 不存在 "..place_name)
		return
	end
	--计算完成度 给票据
	local extra_completion = player:GetInt("Trade_ExtraCompletion")
	local start_completion = player:GetInt("Trade_StartCompletion")
	--sLuaApp:NotifyTipsMsg(player, "extra_completion "..extra_completion .. "  start_completion " ..start_completion)--XXXXXXXXXXXXXX
	local voucher_config = place_config["VoucherNum"] or 0
	local tmp_str = [[
		local RealCompletion =]]..(extra_completion + start_completion)..[[
		local SumCompletion = ]]..place_config["SumCompletion"]..[[
	]]
	local voucher_num = assert(load(tmp_str.." return " .. voucher_config))()
	if voucher_num < 0 then
		voucher_num = 0
	end
	--sLuaApp:LuaErr("voucher_num "..voucher_num)
	
	local tab_index = player:GetInt("Trade_StartTab")
	local tab_config = TradeConfig.Main[tab_index]
	if not tab_config then
		sLuaApp:LuaErr("Trade.End TradeConfig.Main 不存在 "..tab_index)
		return
	end
	local voucher_keyname = TradeConfig.Voucher
	local item_data = ItemConfig.GetByKeyName(voucher_keyname)
	if not item_data then
		sLuaApp:LuaErr("Trade.End ItemConfig 不存在 "..voucher_keyname)
		return
	end
	local reward_item = {voucher_keyname, voucher_num, 1}
	Lua_tools.SendItemMail(player_guid, {['ItemList'] = reward_item}, "贸易", "贸易结束", "贸易已完成，大唐商会根据您本次贸易品质发放贸易票据。")
	
	--额外奖励
	local extra_reward_item = {}
	local extra_order_name_str = player:GetString("Trade_ExtraOrderName")
	local extra_order_name = sLuaApp:StrSplit(extra_order_name_str, ",")
	for _,v in ipairs(extra_order_name) do
		local order_config = TradeConfig.Order[v]
		if order_config and order_config["GuardReward"] then
			local reward_config = order_config["GuardReward"]
			if reward_config["Item"] and next(reward_config["Item"]) then
				for _,j in ipairs(reward_config["Item"]) do
					table.insert(extra_reward_item, j)
				end
			end
			if reward_config["RandItemList"] and next(reward_config["RandItemList"]) then
				for a,b in ipairs(reward_config["RandItemList"]) do
					local res_item_list = Lua_tools.PlayerStartRandom(b["ItemRand"], "贸易_"..v..a, b["RandTime"])
					for _,j in ipairs(res_item_list) do
						table.insert(extra_reward_item, j)
					end
				end
			end
		end
	end
	if next(extra_reward_item) then
		Lua_tools.SendItemMail(player_guid, {['ItemList'] = extra_reward_item}, "贸易", "贸易结束", "您的侍从完美完成了任务，为您带来了额外的宝物。")
	end
	
	--设置贸易状态
	player:SetInt("Trade_Status", 2)
	
	--清空全部选择
	Trade.ClearSelect(player)
	--清空记录数据
	Trade.ClearRecord(player)
	
	--可能界面是打开的
	Trade.GetData(player)
end

--清除记录数据
function Trade.ClearRecord(player)
	player:SetInt("Trade_StartCompletion", 0)
	player:SetInt("Trade_ExtraCompletion", 0)
	player:SetString("Trade_ExtraOrderName", "")
	player:SetString("Trade_SelectData", "")
	player:SetInt("Trade_StartTab", 0)
	player:SetInt("Trade_StartPlace", 0)
	player:SetString("Trade_StartPlaceName", "")
	player:SetInt("Trade_EndTime", 0)
	
	local player_guid = tostring(player:GetGUID())
	if Data["Trade"] and Data["Trade"][player_guid] then
		Data["Trade"][player_guid]["Select"] = {}
	end
end

--返回当前已选择
function Trade.GetNowSelect(player, tab_index, place_index, order_index)
	local player_guid = tostring(player:GetGUID())
	if not Data["Trade"][player_guid] then
		Data["Trade"][player_guid] = {}
	end
	if not Data["Trade"][player_guid]["Select"] then
		Data["Trade"][player_guid]["Select"] = {}
	end
	if not Data["Trade"][player_guid]["Select"][tab_index] then
		for tab_i = 1,tab_index do
			if not Data["Trade"][player_guid]["Select"][tab_i] then
				Data["Trade"][player_guid]["Select"][tab_i] = {}
			end
		end
	end
	if not Data["Trade"][player_guid]["Select"][tab_index][place_index] then
		for place_i = 1,place_index do
			if not Data["Trade"][player_guid]["Select"][tab_index][place_i] then
				Data["Trade"][player_guid]["Select"][tab_index][place_i] = {}
				--sLuaApp:LuaErr("创建 tab_index "..tab_index .." place_index "..place_i .."为空")
			end
		end
	end
	if not Data["Trade"][player_guid]["Select"][tab_index][place_index][order_index] then
		for order_i = 1,order_index do
			if not Data["Trade"][player_guid]["Select"][tab_index][place_index][order_i] then
				Data["Trade"][player_guid]["Select"][tab_index][place_index][order_i] = {}
				-- 顺便把贸易单名称记一下
				local place_name = TradeConfig.Main[tab_index]["Place"][place_index]
				local order_name = Data["Trade"]["OrderList"][place_name][order_i]
				Data["Trade"][player_guid]["Select"][tab_index][place_index][order_i]["OrderName"] = order_name
			end
		end
	end
	return Data["Trade"][player_guid]["Select"][tab_index][place_index][order_index]
end

--如果服务器重启导致 Data清空
function Trade.DataRetrieve(player)
	if player:GetInt("Trade_Status") ~= 1 then return end
	local player_guid = tostring(player:GetGUID())
	if Data["Trade"][player_guid] then
		return
	end
	Data["Trade"][player_guid] = {}
	local tab_index = player:GetInt("Trade_StartTab")
	local place_index = player:GetInt("Trade_StartPlace")
	if tab_index == 0 or place_index == 0 then return end
	local place_select_data = player:GetString("Trade_SelectData")
	--sLuaApp:LuaErr("Trade_SelectData "..place_select_data)
	if place_select_data == "" then return end
	Data["Trade"][player_guid]["Select"] = {}
	for tab_i = 1,tab_index do
		if not Data["Trade"][player_guid]["Select"][tab_i] then
			Data["Trade"][player_guid]["Select"][tab_i] = {}
		end
	end
	for place_i = 1,place_index do
		if not Data["Trade"][player_guid]["Select"][tab_index][place_i] then
			Data["Trade"][player_guid]["Select"][tab_index][place_i] = {}
		end
	end
	--sLuaApp:LuaErr("DataRetrieve"..Lua_tools.serialize(place_select_data))
	Data["Trade"][player_guid]["Select"][tab_index][place_index] = assert(load("return "..place_select_data))()
end

function Trade.CheckLevel(player)
	local act_id = sVarSystem:GetInt("Trade_ActivityID")
	local act_data = ActivityConfig.GetById(act_id)
	if not act_data then
		sLuaApp:LuaErr("Trade.CheckLevel ActivityConfig 不存在 "..act_id)
		return false
	end
	local level_min = act_data.LevelMin
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsgEx(player, "不到"..level_min.."级无法参与贸易！")
		return false
	end
	return true
end
		
 -- 活动开始前回调
function Trade.OnDeclare(id, seconds)
end

--每天活动开启时 初始化今日所有贸易单
-- 活动开始回调
function Trade.OnStart(id, is_normal)
	sVarSystem:SetInt("Trade_ActivityID", id)
	if not Data["Trade"] then
		Data["Trade"] = {}
	end
	if not Data["Trade"]["OrderList"] then
		Data["Trade"]["OrderList"] = {}
	end
	for k,v in pairs(TradeConfig.Place) do
		Data["Trade"]["OrderList"][k] = {}
		for i = 1, (v["OrderNum"] or 1) do
			local order_name = v["OrderList"][sLuaApp:RandInteger(1, #v["OrderList"])]
			table.insert(Data["Trade"]["OrderList"][k], order_name)
		end
	end
	Data["Trade"]["Version"] = tostring(sLuaApp:SecondSinceEpoch(0))
	--sLuaApp:LuaErr(Lua_tools.serialize(Data["Trade"]))
end

-- 活动结束回调
function Trade.OnStop(id)
	sVarSystem:SetInt("Trade_ActivityID", 0)
end

-- 玩家点击参与活动回调
function Trade.OnJoin(id, player)
	local npc_data = NpcConfig.GetByKeyName(TradeConfig.StartNPC)
	if not npc_data then
		sLuaApp:LuaErr("Trade.OnJoin NpcConfig 不存在 ".. TradeConfig.StartNPC)
		return
	end
	Lua_tools.MoveToNpc(player, npc_data.Id)
end

-- 玩家客户端查询数据回调
function Trade.OnQuery(id, player)
	local show_item = TradeConfig.ShowItem or "30001,61022"
	
	local status = player:GetInt("Trade_Status")
	local is_joined = 0
	if status == 2 then
		if not Trade.CheckCanStart(player) then
			is_joined = 1
		end
	end
	local str = is_joined..":1:0:0:"..show_item..":2:"..(ActivitySystem.Act_GetClassify("Trade") or "5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

