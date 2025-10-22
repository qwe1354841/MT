--天降宝箱活动
TianJiangBaoXiang = {}

-- 活动开始前回调
function TianJiangBaoXiang.OnDeclare(id, seconds)
end

-- 活动开始回调
function TianJiangBaoXiang.OnStart(id, is_normal)
	local act_name = ActivityConfig.GetById(id).Name
	sLuaApp:NotifyTopMsgToAll( 1, act_name.."活动开始了!")
	--设置定时刷新
	TianJiangBaoXiang.RefreshBox(1, ""..id)--活动开始刷一波
	local t_guid = sLuaTimerSystem:AddTimer(TianJiangBaoXiangConfig.RefreshTime*1000, -1,"TianJiangBaoXiang.RefreshBox", ""..id)
	sVarSystem:SetInt("ACTIVITY_TianJiangBaoXiang_RefreshTimer", t_guid)
end

-- 活动结束回调
function TianJiangBaoXiang.OnStop(id)
	local t_guid = sVarSystem:GetInt("ACTIVITY_TianJiangBaoXiang_RefreshTimer")
	sLuaTimerSystem:DisableTimer(t_guid)
	sVarSystem:SetInt("ACTIVITY_TianJiangBaoXiang_RefreshTimer", 0)
	local act_name = ActivityConfig.GetById(id).Name
	sLuaApp:NotifyTopMsgToAll( 1, act_name.."活动结束!")
end

-- 玩家点击参与活动回调
function TianJiangBaoXiang.OnJoin(id, player)
	--跳到有怪的地图
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
		return
	end
	local join_num = player:GetDayInt("TianJiangBaoXiang_Join_Num")
	if join_num >= TianJiangBaoXiangConfig.join_max then
		sLuaApp:NotifyTipsMsg(player, "今天已经开了够多的宝箱，无法再参加了。")
		return
	end
	local level_min = ActivityConfig.GetById(id).LevelMin
	if not level_min then return end
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "不到"..level_min.."级是没有能力开启宝箱的！")
		return
	end
	local refresh_list = TianJiangBaoXiangConfig.Refresh
	if next(refresh_list) then
		local tmp_num = 0
		local goto_map_id = 0
		local map_id = 0
		for k,_ in pairs(refresh_list) do
			map_id = MapConfig.GetByKeyName(k).Id
			local map_box_num = sVarSystem:GetInt("TianJiangBaoXiang_"..map_id.."_BoxNum")
			if map_box_num > tmp_num then
				tmp_num = map_box_num
				goto_map_id = map_id
			end
		end
		if goto_map_id ~=0 then
			local map = sMapSystem:GetMapById(goto_map_id)
			--中心点坐标
			local x = math.floor(map:GetWidth()/2)
			local y = math.floor(map:GetHeight()/2)
			local range = math.min(x,y)
			if Lua_tools.Jump(player, map, x, y, range) then
				local str = [[
					GUI.CloseWnd("ActivityPanelUI")
				]]
				sLuaApp:ShowForm(player, "脚本表单", str)
			else
				sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
			end
		else
			sLuaApp:NotifyTipsMsg(player, "来晚啦，所有宝箱里的宝物已被各位少侠收入囊中！")
			return
		end
	end
end

-- 玩家客户端查询数据回调
function TianJiangBaoXiang.OnQuery(id, player)
	local join_num = player:GetDayInt("TianJiangBaoXiang_Join_Num")
	local active_num = player:GetDayInt("TianJiangBaoXiang_Active_Num")
	
	local show_item = TianJiangBaoXiangConfig.ShowItem or "61024,61025,36008,36011"
	local str = join_num..":"..TianJiangBaoXiangConfig.join_max..":"..active_num..":"..TianJiangBaoXiangConfig.active_max..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("TianJiangBaoXiang") or "1,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--按时刷新
function TianJiangBaoXiang.RefreshBox(t_guid, id)
	if not TianJiangBaoXiangConfig.Refresh or not TianJiangBaoXiangConfig.BoxKeyname then return end
	
	local map_msg = ""
	for k,_ in pairs(TianJiangBaoXiangConfig.Refresh) do
		map_msg = map_msg .. k .."，"
	end
	map_msg = string.sub(map_msg, 1, -4)
	sLuaApp:NotifyTopMsgToAll( 1, "<color=#FFFFFFFF>天降宝箱~~~<color=#FFD700FF>"..map_msg.."</color>刷出大量宝箱，大家快去抢啊！</color>")
	
	id = tonumber(id)
	for k,v in pairs(TianJiangBaoXiangConfig.Refresh) do
		local map_id = MapConfig.GetByKeyName(k).Id
		local map = sMapSystem:GetMapById(map_id)
		local x = math.floor(map:GetWidth()/2)
		local y = math.floor(map:GetHeight()/2)
		local range = math.max(x,y) --刷怪范围
		
		local npc_id = NpcConfig.GetByKeyName(TianJiangBaoXiangConfig.BoxKeyname).Id
		if v['Move'] == 1 then
			for i=1, v['Num'] do
				local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
				local npc = sNpcSystem:CreateMoveNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, 0)
				if npc then
					sLuaTimerSystem:AddTimerEx(npc, TianJiangBaoXiangConfig.DestroyTime*1000,1,"TianJiangBaoXiang.DestroyNPC", "")
					npc:SetInt("TianJiangBaoXiang_MapID", map_id)
					sVarSystem:SetInt("TianJiangBaoXiang_"..map_id.."_BoxNum", sVarSystem:GetInt("TianJiangBaoXiang_"..map_id.."_BoxNum") + 1)
					npc:SetInt("TianJiangBaoXiang_ID", id)
				end
			end
		elseif v['Move'] == 0 then
			for i=1, v['Num'] do
				local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
				local dir = sLuaApp:RandInteger(0, 7)
				local npc = sNpcSystem:CreateNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, dir, 0)
				if npc then
					sLuaTimerSystem:AddTimerEx(npc, TianJiangBaoXiangConfig.DestroyTime*1000,1,"TianJiangBaoXiang.DestroyNPC", "")
					npc:SetInt("TianJiangBaoXiang_MapID", map_id)
					sVarSystem:SetInt("TianJiangBaoXiang_"..map_id.."_BoxNum", sVarSystem:GetInt("TianJiangBaoXiang_"..map_id.."_BoxNum") + 1)
					npc:SetInt("TianJiangBaoXiang_ID", id)
				end
			end
		end
	end
end

function TianJiangBaoXiang.DestroyNPC(npc, timer, p)
	local map_id = npc:GetInt("TianJiangBaoXiang_MapID")
	sVarSystem:SetInt("TianJiangBaoXiang_"..map_id.."_BoxNum", sVarSystem:GetInt("TianJiangBaoXiang_"..map_id.."_BoxNum") - 1)
	sNpcSystem:DestroyNpc(npc)
end
--开箱子
function TianJiangBaoXiang.OpenBox(npc, player)
	local id = npc:GetInt("TianJiangBaoXiang_ID")
	local level_min = ActivityConfig.GetById(id).LevelMin
	if not level_min then return end
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "开启天降宝箱需要"..level_min.."级")
		return false
	end
	local join_max = TianJiangBaoXiangConfig.join_max
	local join_num = player:GetDayInt("TianJiangBaoXiang_Join_Num") + 1
	if join_num > join_max then
		sLuaApp:NotifyTipsMsg(player, "今天已经开了够多的宝箱，无法再开了。")
		return false
	end
	if npc:GetInt("TianJiangBaoXiangisOpening") == 1 then
		sLuaApp:NotifyTipsMsg(player, "宝箱从来都是先到先得，少侠，这个宝箱已经有主了！")
		return false
	end
	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormTianJiangBaoXiang", "StopOpenBox", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..TianJiangBaoXiangConfig.ProgressBarTime.."#"..TianJiangBaoXiangConfig.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, TianJiangBaoXiangConfig.ProgressBarTime,1,"TianJiangBaoXiang.GiveReward", join_num..","..npc:GetGUID())
	if t_guid then
		npc:SetInt("TianJiangBaoXiangisOpening", 1)
		player:SetInt("TianJiangBaoXiangOpeningNPC", npc:GetGUID())
		player:SetInt("TianJiangBaoXiangOpenBoxTimer", t_guid)
	end
end
--进度条打断
function TianJiangBaoXiang.StopOpenBox(player)
	local timer_guid = player:GetInt("TianJiangBaoXiangOpenBoxTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."TianJiangBaoXiang.StopOpenBox HasTimer错误")
	end
	player:SetInt("TianJiangBaoXiangOpenBoxTimer", 0)
	
	local npc_guid = player:GetInt("TianJiangBaoXiangOpeningNPC")
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		npc:SetInt("TianJiangBaoXiangisOpening", 0)
	end
end

--发奖励
function TianJiangBaoXiang.GiveReward(player, timer, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local join_num = tmp_tb[1]
	local npc_guid = tmp_tb[2]
	
	player:SetDayInt("TianJiangBaoXiang_Join_Num", join_num)
	local reward = {}
	reward = TianJiangBaoXiangConfig.Reward
	if next(reward) then
		-- +exp
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = TianJiangBaoXiang.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "system", "天降宝箱活动", "宝箱掉落")
		end
		-- +money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = TianJiangBaoXiang.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, "system", "天降宝箱活动", "宝箱掉落")
		end
		-- +固定物品
		local item_list = reward['Item']
		if item_list then
			Lua_tools.AddItem(player, item_list, "system", "天降宝箱活动", "宝箱掉落")
		end
		-- +随机物品
		local item_rand_time = reward['RandTime'] or 1
		local item_rand_list = reward['ItemRand']
		if item_rand_time and item_rand_list then
			local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, "天降宝箱活动", item_rand_time)
			if res_item_list[1] ~= "Nil" then
				--羡煞旁人 --改用全局的了
				--TianJiangBaoXiang.BroadcastMsg(player,res_item_list)
				Lua_tools.AddItem(player, res_item_list, "system", "天降宝箱活动", "宝箱掉落")
			end
		end
	end
	
	if VipIngotTrace then
		VipIngotTrace.GetReward(player, "天降宝箱")
	end
	
	local active = player:GetDayInt("TianJiangBaoXiang_Active_Num")
	if active < TianJiangBaoXiangConfig.active_max then
		local active_sum = active + TianJiangBaoXiangConfig.active_add_num
		if active_sum > TianJiangBaoXiangConfig.active_max then
			player:SetDayInt("TianJiangBaoXiang_Active_Num", TianJiangBaoXiangConfig.active_max)
			ActivitySystem.AddActiveVal(player, TianJiangBaoXiangConfig.active_max - active)
		else
			player:SetDayInt("TianJiangBaoXiang_Active_Num", active_sum)
			ActivitySystem.AddActiveVal(player, TianJiangBaoXiangConfig.active_add_num)
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
	end
	
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		local map_id = npc:GetInt("TianJiangBaoXiang_MapID")
		sVarSystem:SetInt("TianJiangBaoXiang_"..map_id.."_BoxNum", sVarSystem:GetInt("TianJiangBaoXiang_"..map_id.."_BoxNum") - 1)
		sNpcSystem:DestroyNpc(npc)
	end
	player:SetInt("TianJiangBaoXiangOpenBoxTimer", 0)
	player:SetInt("TianJiangBaoXiangOpeningNPC", 0)
end

--奖励配置表转数字
function TianJiangBaoXiang.RewardConfigToNmber(player, add_num)
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

-- --获得Broadcast物品广播
-- function TianJiangBaoXiang.BroadcastMsg(player,res_item_list)
	-- local item_msg = ""
	-- --避免相同物品不在msg中重复
	-- local broadcast_list = {}
	-- for _,v in ipairs(res_item_list) do
		-- if type(v) == "string" then
			-- for _,b in ipairs(TianJiangBaoXiangConfig.Reward['Broadcast']) do
				-- if b == v then
					-- broadcast_list[b] = true
				-- end
			-- end
		-- end
	-- end
	-- if next(broadcast_list) then
		-- for k,_ in pairs(broadcast_list) do
			-- local item_name = ItemConfig.GetByKeyName(k).Name
			-- item_msg = item_msg .. item_name .."，"
		-- end
		-- item_msg = string.sub(item_msg, 1, -4)
		-- sLuaApp:NotifyTopMsgToAll( 1, "<color=#FFFFFFFF>"..player:GetName().."在天降宝箱中找到了<color=#FFD700FF>"..item_msg.."</color>，真是羡煞旁人！</color>")
	-- end
-- end