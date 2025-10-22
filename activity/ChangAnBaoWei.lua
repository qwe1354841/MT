--长安保卫战
ChangAnBaoWei = {}

ChangAnBaoWei.FightTag = 10044

-- 活动开始前回调
function ChangAnBaoWei.OnDeclare(id, seconds)
end

-- 活动开始回调
function ChangAnBaoWei.OnStart(id, is_normal)
	if not is_normal then
		return
	end
	sVarSystem:SetInt("ACTIVITY_ChangAnBaoWei_ID", id)
	--活动开始 round_1
	ChangAnBaoWei.RefreshMonster("Round_1")
	--设置积分目标是第一个
	sVarSystem:SetInt("ChangAnBaoWeiNeedIntegralKey", 1)
	--记录参与的玩家
	if Data then
		Data.ChangAnBaoWei = {}
		Data.ChangAnBaoWei["JoinPlayer"] = {}
	else
		sLuaApp:LuaErr("缺少Data")
	end
end

-- 活动结束回调
function ChangAnBaoWei.OnStop(id)
	Data.ChangAnBaoWei = {}
	sVarSystem:SetInt("ACTIVITY_ChangAnBaoWei_ID", 0)
	sVarSystem:SetInt("ChangAnBaoWeiNeedIntegralKey", 0)
	sVarSystem:SetInt("ChangAnBaoWeiNPCNum", 0)
	sVarSystem:SetInt("ChangAnBaoWei_NextRoundTimer", 0)
	sVarSystem:SetInt("ChangAnBaoWeiIntegralSum", 0)
	sVarSystem:SetString("ChangAnBaoWeiRoundName", "")
end

-- 玩家点击参与活动回调
function ChangAnBaoWei.OnJoin(id, player)
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动尚未开始！")
		return
	end
	if sVarSystem:GetInt("ChangAnBaoWeiNPCNum") == 0 then
		sLuaApp:NotifyTipsMsg(player, "少侠来晚啦，来犯长安的妖兽已被各路大侠悉数歼灭！")
		return
	end
	local level_min = tonumber(ActivityConfig.GetById(id).LevelMin)
	if player:GetAttr(ROLE_ATTR_LEVEL) < level_min then
		sLuaApp:NotifyTipsMsg(player, "少侠等级不足"..level_min.."级。与妖兽交手怕是撑不过一合!")
		return
	end
	local round = sVarSystem:GetString("ChangAnBaoWeiRoundName")
	local site_tb = ChangAnBaoWeiConfig.RoundConfig[round]["Map"]
	local map_id = MapConfig.GetByKeyName(site_tb[1]).Id
	local map = sMapSystem:GetMapById(map_id)
	if Lua_tools.Jump(player, map, site_tb[2], site_tb[3], 20) then
		local str = [[
			GUI.CloseWnd("ActivityPanelUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
	end
end

-- 玩家客户端查询数据回调
function ChangAnBaoWei.OnQuery(id, player)
	local active = player:GetDayInt("ChangAnBaoWeiActiveNum")
	local show_item = ChangAnBaoWeiConfig.ShowItem or "61024,61025,20910"
	local str = "0:0:"..active..":"..ChangAnBaoWeiConfig.ActiveMax..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("ChangAnBaoWei") or "1,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end



--刷怪
function ChangAnBaoWei.RefreshMonster(round)
	if not ChangAnBaoWeiConfig or not ChangAnBaoWeiConfig.RoundConfig then return end
	local round_config = ChangAnBaoWeiConfig.RoundConfig[round]
	if not round_config then
		sLuaApp:LuaErr("ChangAnBaoWeiConfig.RoundConfig 不存在"..round)
		return
	end
	sVarSystem:SetInt("ChangAnBaoWei_NextRoundTimer", 0)
	sVarSystem:SetString("ChangAnBaoWeiRoundName", round)
	----------刷怪----------
	local site_tb = round_config["Map"]
	local map_id = MapConfig.GetByKeyName(site_tb[1]).Id
	local map = sMapSystem:GetMapById(map_id)
	local continue_time = round_config["Continue"] * 60000 or 1200000 --20分钟
	local npc_num = 0
	for k,v in pairs(round_config["MonConfg"]) do
		local npc_data = NpcConfig.GetByKeyName(k)
		if not npc_data then
			sLuaApp:LuaErr("ChangAnBaoWei.RefreshMonster 不存在"..k)
			return
		end
		local npc_id = npc_data.Id
		if v["Move"] == 1 then
			for i = 1, v["Num"] do
				local npc = sNpcSystem:CreateMoveNpc(npc_id, map, site_tb[2], site_tb[3], site_tb[4], 0)
				if npc then
					npc:SetInt("ChangAnBaoWeiIntegral", v["Integral"])
					npc:SetInt("ChangAnBaoWeiMonID", v["MonID"])
					sLuaTimerSystem:AddTimerEx(npc, continue_time,1,"ChangAnBaoWei.DestroyNPC", "")
					npc_num = npc_num + 1
				end
			end
		elseif v["Move"] == 0 then
			for i = 1, v["Num"] do
				local npc = sNpcSystem:CreateNpc(npc_id, map, site_tb[2], site_tb[3], site_tb[4], 4, 0)
				if npc then
					npc:SetInt("ChangAnBaoWeiIntegral", v["Integral"])
					npc:SetInt("ChangAnBaoWeiMonID", v["MonID"])
					sLuaTimerSystem:AddTimerEx(npc, continue_time,1,"ChangAnBaoWei.DestroyNPC", "")
					npc_num = npc_num + 1
				end
			end
		end
	end
	sVarSystem:SetInt("ChangAnBaoWeiNPCNum", npc_num)
	---------设置下一波------------
	local t_timer = sLuaTimerSystem:AddTimer(continue_time, 1, "ChangAnBaoWei.RefreshNextMonster", round)
	sVarSystem:SetInt("ChangAnBaoWei_NextRoundTimer", t_timer)
	---------发送全体信息----------
	local i,msg_cd = 1,1 --msg_cd等待时间
	while round_config["StartMsg_"..i] do
		sLuaTimerSystem:AddTimer(msg_cd, 1, "ChangAnBaoWei.MsgToAll", round_config["StartMsg_"..i])
		msg_cd = msg_cd + 5000
		i = i + 1
	end
end

--刷下一波 顺便发结束信息
function ChangAnBaoWei.RefreshNextMonster(t_guid, round)
	local next_round = 0 
	for v in string.gmatch(round, "%d+") do
		next_round = "Round_"..(tonumber(v) + 1)
	end
	local round_config = ChangAnBaoWeiConfig.RoundConfig[round]
	---------发送全体信息----------
	local i,msg_cd = 1,1 --msg_cd等待时间
	while round_config["EndMsg_"..i] do
		sLuaTimerSystem:AddTimer(msg_cd, 1, "ChangAnBaoWei.MsgToAll", round_config["EndMsg_"..i])
		msg_cd = msg_cd + 5000
		i = i + 1
	end
	
	if ChangAnBaoWeiConfig.RoundConfig[next_round] then
		ChangAnBaoWei.RefreshMonster(next_round)
	end
end


--刷宝箱
function ChangAnBaoWei.RefreshBox(round)
	local site_tb = ChangAnBaoWeiConfig.RoundConfig[round]["Map"]
	local map_id = MapConfig.GetByKeyName(site_tb[1]).Id
	local map = sMapSystem:GetMapById(map_id)
	local continue_time = ChangAnBaoWeiConfig.BoxRefresh["Continue"] * 60000 or 300000 --5分钟
	
	local npc_data = NpcConfig.GetByKeyName(ChangAnBaoWeiConfig.BoxRefresh["BoxKeyName"])
	if not npc_data then
		sLuaApp:LuaErr("ChangAnBaoWei.RefreshBox 不存在"..ChangAnBaoWeiConfig.BoxRefresh["BoxKeyName"])
		return
	end
	local npc_id = npc_data.Id
	for i = 1, ChangAnBaoWeiConfig.BoxRefresh["Num"] do
		local npc = sNpcSystem:CreateNpc(npc_id, map, site_tb[2], site_tb[3], site_tb[4], 4, 0)
		if npc then
			npc:SetInt("NPCType", 1)
			sLuaTimerSystem:AddTimerEx(npc, continue_time,1,"ChangAnBaoWei.DestroyNPC", "")
		end
	end
	sLuaApp:NotifyTopMsgToAll(1, ChangAnBaoWeiConfig.BoxRefresh["Msg"])
end

--开箱子
function ChangAnBaoWei.OpenBox(npc, player)
	if Data.ChangAnBaoWei["JoinPlayer"] then
		local player_guid = tostring(player:GetGUID())
		if not Data.ChangAnBaoWei["JoinPlayer"][player_guid] then
			sLuaApp:NotifyTipsMsg(player, "战利品只给予保卫长安的勇士，无功不受禄，懂吗？")
			return false
		end
		if Data.ChangAnBaoWei["JoinPlayer"][player_guid] >= ChangAnBaoWeiConfig.BoxRefresh["OpenMaxNum"] then
			sLuaApp:NotifyTipsMsg(player, "少侠已经获得了够多的战利品了。")
			return false
		end
	end

	if npc:GetInt("ChangAnBaoWeiisOpening") == 1 then
		sLuaApp:NotifyTipsMsg(player, "战利品从来都是先到先得，少侠，这个战利品已经有主了！")
		return false
	end
	
	local str = [[
		local func = function()
			CL.SendNotify(NOTIFY.SubmitForm, "FormChangAnBaoWei", "StopOpenBox", "")
		end
		GUI.OpenWnd("LoadingTipUI", "]]..ChangAnBaoWeiConfig.ProgressBarTime.."#"..ChangAnBaoWeiConfig.ProgressBarTip..[[")
		LoadingTipUI.SetInterruptFunc(func)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, ChangAnBaoWeiConfig.ProgressBarTime,1,"ChangAnBaoWei.BoxGiveReward", ""..npc:GetGUID())
	if t_guid then
		npc:SetInt("ChangAnBaoWeiisOpening", 1)
		player:SetInt("ChangAnBaoWeiOpeningNPC", npc:GetGUID())
		player:SetInt("ChangAnBaoWeiOpenBoxTimer", t_guid)
	end
end


--进度条打断
function ChangAnBaoWei.StopOpenBox(player)
	local timer_guid = player:GetInt("ChangAnBaoWeiOpenBoxTimer")
	if sLuaTimerSystem:HasTimer(timer_guid) then
		sLuaTimerSystem:DisableTimer(timer_guid)
	else
		sLuaApp:LuaErr(player:GetName().."ChangAnBaoWei.StopOpenBox HasTimer错误")
	end
	player:SetInt("ChangAnBaoWeiOpenBoxTimer", 0)
	
	local npc_guid = player:GetInt("ChangAnBaoWeiOpeningNPC")
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if npc then
		npc:SetInt("ChangAnBaoWeiisOpening", 0)
	end
end

function ChangAnBaoWei.MsgToAll(t_guid, str)
	sLuaApp:NotifyTopMsgToAll(1, str)
	--sLuaApp:LuaErr(str)
end

function ChangAnBaoWei.DestroyNPC(npc, timer, p)
	if npc then
		sNpcSystem:DestroyNpc(npc)
	end
end


--进入战斗
function ChangAnBaoWei.StartFight(player, npc)
	if npc:GetInt("ChangAnBaoWeiNPCisFight") > 0 then
		return false
	else
		--local npc_name = npc:GetKeyName()
		local mon_id = npc:GetInt("ChangAnBaoWeiMonID")
		if sFightSystem:StartTagPVE(player, mon_id, ChangAnBaoWei.FightTag, "ChangAnBaoWei", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("ChangAnBaoWeiNPCisFight", 1)--1 npc在战斗中 0 不在
			npc:SetPatrol(false) --不动
			local team = player:GetTeam()
			local memberlist = {}
			if team and not player:IsTempLeave() then
				memberlist = team:GetTeamMembers(false)
			else
				memberlist[1] = player
			end
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "ChangAnBaoWei", "OnResult")
				v:SetInt("ChangAnBaoWeiFightNPCGUID", npc:GetGUID())
				v:SetString("ChangAnBaoWeiFightNPCName", npc:GetKeyName())
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("ChangAnBaoWeiNPCisFight", npc:GetInt("ChangAnBaoWeiNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("ChangAnBaoWei.StartFight开始pve失败")
		end
		return true
	end
end

--战斗完回调  -玩家掉线需要获得npc 标记为 不在战斗中
function ChangAnBaoWei.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= ChangAnBaoWei.FightTag then
		sLuaApp:LuaErr("ChangAnBaoWei.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("ChangAnBaoWeiNPCisFight", 0)
		npc:SetPatrol(true)
	end
end

--人物完成战斗回调
function ChangAnBaoWei.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "ChangAnBaoWei", "OnResult")
	--战斗中外面的npc到点自杀了也要发奖励
	local npc_keyname = player:GetString("ChangAnBaoWeiFightNPCName")
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("ChangAnBaoWeiFightNPCGUID"))
	if npc and npc:GetInt("ChangAnBaoWeiNPCisFight") > 0 then
		npc:SetInt("ChangAnBaoWeiNPCisFight", npc:GetInt("ChangAnBaoWeiNPCisFight")-1)
	end
	if victory == 2 then
		-- 记录参与的玩家 和 开宝箱数量
		if Data.ChangAnBaoWei["JoinPlayer"] then
			local player_guid = tostring(player:GetGUID())
			if not Data.ChangAnBaoWei["JoinPlayer"][player_guid] then
				player:SetDayInt("ChangAnBaoWeiActiveNum", 0)
				Data.ChangAnBaoWei["JoinPlayer"][player_guid] = 0
			end
		end
		-- +活跃值
		local active = player:GetDayInt("ChangAnBaoWeiActiveNum")
		if active < ChangAnBaoWeiConfig.ActiveMax then
			local active_sum = active + ChangAnBaoWeiConfig.ActiveAddNum
			if active_sum > ChangAnBaoWeiConfig.ActiveMax then
				player:SetDayInt("ChangAnBaoWeiActiveNum", ChangAnBaoWeiConfig.ActiveMax)
				ActivitySystem.AddActiveVal(player, ChangAnBaoWeiConfig.ActiveMax - active)
			else
				player:SetDayInt("ChangAnBaoWeiActiveNum", active_sum)
				ActivitySystem.AddActiveVal(player, ChangAnBaoWeiConfig.ActiveAddNum)
			end
		end
		
		--判断是否存在npc 保证一场战斗触发一次  否则memberlist[1] 需要额外挂触发器
		if npc then 
			local round = sVarSystem:GetString("ChangAnBaoWeiRoundName")
			-- +积分 检查要不要刷宝箱
			if not ChangAnBaoWeiConfig.BoxRefresh then
				sLuaApp:LuaErr("不存在ChangAnBaoWeiConfig.BoxRefresh")
				return
			end
			local integral = npc:GetInt("ChangAnBaoWeiIntegral") + sVarSystem:GetInt("ChangAnBaoWeiIntegralSum")
			local need_integral_key = sVarSystem:GetInt("ChangAnBaoWeiNeedIntegralKey")
			local need_integral = ChangAnBaoWeiConfig.BoxRefresh["NeedIntegral"][need_integral_key]
			if need_integral then
				if integral >= need_integral then
					ChangAnBaoWei.RefreshBox(round)
					sVarSystem:SetInt("ChangAnBaoWeiNeedIntegralKey", need_integral_key + 1)
				end
			end
			sVarSystem:SetInt("ChangAnBaoWeiIntegralSum", integral)
			--sLuaApp:LuaErr("ChangAnBaoWeiIntegralSum  "..integral)
			
			--检查是否快进到下一阶段 顺便该阶段结束msg 销毁定时器 --只有打赢了 且npc存在时 销毁npc时判断
			local npc_num = sVarSystem:GetInt("ChangAnBaoWeiNPCNum") - 1
			sVarSystem:SetInt("ChangAnBaoWeiNPCNum", npc_num)
			--sLuaApp:LuaErr("npc_num"..npc_num)
			if ChangAnBaoWeiConfig.TipsNum and next(ChangAnBaoWeiConfig.TipsNum) then
				for _,v in ipairs(ChangAnBaoWeiConfig.TipsNum) do
					if npc_num == v["Num"] then
						sLuaApp:NotifyTopMsgToAll(1, v["Msg"])
					end
				end			
			end
			if npc_num <= 0 then
				---------快进到下一波 去掉定时器---------
				local t_timer = sVarSystem:GetInt("ChangAnBaoWei_NextRoundTimer")
				sLuaTimerSystem:DisableTimer(t_timer)
				sVarSystem:SetInt("ChangAnBaoWei_NextRoundTimer", 0)
				ChangAnBaoWei.RefreshNextMonster(1, round)
			end			
			
			sNpcSystem:DestroyNpc(npc)
		end
		
		if VipIngotTrace then
			VipIngotTrace.GetReward(player, "长安保卫战")
		end
		ChangAnBaoWei.GiveReward(player, npc_keyname, "system", "长安保卫战活动", "打败怪物")
	end
	player:SetInt("ChangAnBaoWeiFightNPCGUID", 0)
	player:SetString("ChangAnBaoWeiFightNPCName", "")
end


--宝箱/战利品 给奖励
function ChangAnBaoWei.BoxGiveReward(player, t_timer, npc_guid)
	local player_guid = tostring(player:GetGUID())
	Data.ChangAnBaoWei["JoinPlayer"][player_guid] = Data.ChangAnBaoWei["JoinPlayer"][player_guid] + 1
	
	local npc = sNpcSystem:GetNpcByGUID(tonumber(npc_guid))
	if not npc then return end
	ChangAnBaoWei.GiveReward(player, npc:GetKeyName(), "system", "保卫战战利品", "打开战利品")
	sNpcSystem:DestroyNpc(npc)
end
--给奖励
function ChangAnBaoWei.GiveReward(player, npc_keyname, sender, reason, detail)
	if not ChangAnBaoWeiConfig.Reward then return end
	local reward = ChangAnBaoWeiConfig.Reward[npc_keyname]
	if not reward then
		sLuaApp:LuaErr("ChangAnBaoWeiConfig.Reward配置缺少"..npc_keyname)
	end
	
	if next(reward) then
		-- +exp
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = ChangAnBaoWei.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, sender, reason, detail)
		end
		-- +pet exp
		local add_pet_exp = reward['PetExp']
		if add_pet_exp and add_pet_exp ~= 0 then
			local res_pet_exp = ChangAnBaoWei.RewardConfigToNmber(player, add_pet_exp)
			local pets = Lua_tools.GetFightPets(player)
			for _,pet in ipairs(pets) do
				pet:AddExp(res_pet_exp, sender, reason, detail)
			end
		end
		-- +money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = ChangAnBaoWei.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, sender, reason, detail)
		end
		-- +固定物品
		local item_list = reward['Item']
		if item_list then
			Lua_tools.AddItem(player, item_list, sender, reason, detail)
		end
		-- +随机物品
		--for k,v in ipairs(reward['RandItemList']) do
		local item_rand_time = reward['RandTime'] or 1
		local item_rand_list = reward['ItemRand']
		if item_rand_time and item_rand_list then
			local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, reason..npc_keyname, item_rand_time)
			if res_item_list[1] ~= "Nil" then
				Lua_tools.AddItem(player, res_item_list, sender, reason, detail)
			end
		end
		--end
		
	end
end

--奖励配置表转数字
function ChangAnBaoWei.RewardConfigToNmber(player, add_num)
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
