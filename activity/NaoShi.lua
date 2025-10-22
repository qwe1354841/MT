--刷怪活动（闹事的妖怪/十二星官）
NaoShi = {}

--地图边框不刷怪区域大小
NaoShi.NoMonsterBorder = 10 
--活动奖励表
NaoShi.Reward = {}
--活动名称
NaoShi.Active_Name = {}
--战斗标识
NaoShi.FightTag = 10010
-- 活动开始前回调
function NaoShi.OnDeclare(id, seconds)
end



-- 活动开始回调
function NaoShi.OnStart(id, is_normal)
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，活动"..id.."开始!")
	local refresh_time = Data.NaoShi[tostring(id)]["RefreshTime"]
	
	if Data.NaoShi[tostring(id)]["Active_OnStartMsg"] and Data.NaoShi[tostring(id)]["Active_OnStartMsg"] ~= "" then
		local msg = Data.NaoShi[tostring(id)]["Active_OnStartMsg"]
		sLuaApp:NotifyTopMsgToAll( 1, msg)
	  end
	--初始化刷新时刻表
	NaoShi.InitTimeList(id)
	
	NaoShi.SetCreateNPC(0,refresh_time[1][2]..","..id)--活动开始刷一波
	NaoShi.ScheduleNPC(id)
end

-- 活动结束回调
function NaoShi.OnStop(id)
	--sLuaApp:NotifyTopMsgToAll( 1, "测试，活动"..id.."结束!")
end

-- 玩家点击参与活动回调
function NaoShi.OnJoin(id, player)
	--跳到有怪的地图
	sLuaApp:LuaDbg("参与活动参与活动参与活动参与活动参与活动参与活动")
	
	if sLuaApp:IsActivityRunning(id) then
		if player:GetTeam() and not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才能决定参加降妖！")
			return
		end
		local check_tb = NaoShi.CheckFight(player, id)
		if check_tb and next(check_tb) then
			if check_tb[1] == 0 and check_tb[2] == 1 then
				sLuaApp:NotifyTipsMsg(player, "只有等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			elseif check_tb[1] == 0 and check_tb[2] > 1 then
				sLuaApp:NotifyTipsMsg(player, "只有至少"..check_tb[2].."人组队并且全员等级达到"..check_tb[3].."级才有资格参与活动！")
				return
			end
		else
			sLuaApp:LuaDbg("NaoShi.CheckFight返回错误")
			return
		end
		
		local refresh_list = Data.NaoShi[tostring(id)]["Refresh"]
		if next(refresh_list) then
			local tmp_num = 0
			local goto_map_id = 0
			local map_id
			for k,_ in pairs(refresh_list) do
				map_id = MapConfig.GetByKeyName(k).Id
				local map_npc_num = sVarSystem:GetInt("NaoShi_"..id.."_"..map_id.."_NPCNum")
				if map_npc_num > tmp_num then
					tmp_num = map_npc_num
					goto_map_id = map_id
				end
			end
			if goto_map_id ~=0 then
				local map = sMapSystem:GetMapById(map_id)
				--中心点坐标
				local x = math.floor(map:GetWidth()/2)
				local y = math.floor(map:GetHeight()/2)
				local range = math.max(x,y) - NaoShi.NoMonsterBorder
				if Lua_tools.Jump(player, map, x, y, range) then
					local str = [[
						GUI.CloseWnd("ActivityPanelUI")
					]]
					sLuaApp:ShowForm(player, "脚本表单", str)
				else
					sLuaApp:NotifyTipsMsg(player, "地图跳转失败")
				end
			else
				sLuaApp:NotifyTipsMsg(player, "来晚啦，所有怪物都已被各路大侠消灭。")
				return
			end
		end
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
		return
	end
	return
end

--初始化刷新时刻表
function NaoShi.InitTimeList(id)
	NaoShi.RefreshTimelist = {}
	assert(load("NaoShi.RefreshTimelist["..id.."] = {} return "))()
	local refresh_time = Data.NaoShi[tostring(id)]["RefreshTime"]
	local activityData = ActivityConfig.GetById(id)
	local hour = tonumber(string.sub(activityData.TimeEnd,1,2))--21
	local now_hour = sLuaApp:Hour(0)
	local index = 1
	for i = now_hour,hour,1 do
		for _,v in ipairs(refresh_time) do
			NaoShi.RefreshTimelist[id][index] = {}
			local fresh_time = i..":"..v[1]
			table.insert(NaoShi.RefreshTimelist[id][index],fresh_time)
			table.insert(NaoShi.RefreshTimelist[id][index],v[2])
			index = index+1
		end
	end
end
--设置所有刷新npc计划任务
function NaoShi.ScheduleNPC(id)
	for k,v in pairs(NaoShi.RefreshTimelist[id]) do
		sScheduleSystem:CreateSchedule(0, v[1], "NaoShi","SetCreateNPC", v[2]..","..id)
	end
end

--设置刷新NPC 
function NaoShi.SetCreateNPC(timer, params)
	local tmp_tb = sLuaApp:StrSplit(params, ",")
	local destroy_time = tonumber(tmp_tb[1])
	local id = tonumber(tmp_tb[2])
	
	if sLuaApp:IsActivityRunning(id) then
		destroy_time = tonumber(destroy_time)
		local refresh_list = Data.NaoShi[tostring(id)]["Refresh"]
		if next(refresh_list) then
			
			--刷怪广播
			if Data.NaoShi[tostring(id)]["Active_MsgOnNpcRefresh"] and Data.NaoShi[tostring(id)]["Active_MsgOnNpcRefresh"] ~= "" then
				local msg = Data.NaoShi[tostring(id)]["Active_MsgOnNpcRefresh"]
				sLuaApp:NotifyTopMsgToAll( 1, msg)
			end

			for k,v in pairs(refresh_list) do
				local map_id = MapConfig.GetByKeyName(k).Id
				local map = sMapSystem:GetMapById(map_id)
				--中心点坐标
				local x = math.floor(map:GetWidth()/2)
				local y = math.floor(map:GetHeight()/2)
				local range = math.min(x,y) - NaoShi.NoMonsterBorder --刷怪范围
				
				for a,b in pairs(v) do
					local npc_data = NpcConfig.GetByKeyName(b['NPCName'])
					if not npc_data then
						sLuaApp:LuaErr("不存在npc keyname"..b['NPCName'])
						return
					end
					local npc_id = npc_data.Id
					local npc_num = b['Num']
					local map_npc_num = sVarSystem:GetInt("NaoShi_"..id.."_"..map_id.."_NPCNum") + npc_num
					sVarSystem:SetInt("NaoShi_"..id.."_"..map_id.."_NPCNum", map_npc_num)

					for i=1, npc_num do
						local point_tb = sMapSystem:GetRandomPoint(map, x, y,range)
						local npc = sNpcSystem:CreateMoveNpc(npc_id, map, point_tb["x"], point_tb["y"], 0, 5)--5是方向
						if npc then
							npc:SetInt("NaoShiFightMonID", b['MonID'])
							npc:SetInt("NaoShiActID", id)
							npc:SetInt("NaoShiMapID", map_id)
							sLuaTimerSystem:AddTimerEx(npc, destroy_time*1000,1,"NaoShi.DestroyNPC", "")
						end
					end
				end
			end
		end
	end
end

--检查能否进入战斗 npc对话和活动跳转用
function NaoShi.CheckFight(player, id)
	
	sLuaApp:LuaDbg("对话对话对话对话对话对话对话对话对话对话对话对话对话对话对话对话")
	
	
	local activity_data = ActivityConfig.GetById(id)
	if not activity_data then
		sLuaApp:LuaErr("NaoShi.CheckFight  ActivityConfig 不存在 "..id)
		return false
	end
	local level_min = tonumber(activity_data.LevelMin)
	local join_min_num = Data.NaoShi[tostring(id)]["JoinMinNum"]
	
	local return_msg_tb ={}
	local can_fight =0
	
	if Lua_tools.GetTeamMember(player,false) >= join_min_num then
		if Lua_tools.GetTeamLowestlevel(player) >= level_min then
			can_fight = 1
		end
	end
	if player:IsTempLeave() then
		can_fight = 0
	end
	table.insert(return_msg_tb, can_fight)
	table.insert(return_msg_tb, join_min_num)
	table.insert(return_msg_tb, level_min)
	--{[1]={1符合条件/0不符合},[2] = join_min_num,[3] = LevelMin}
	return return_msg_tb
end

--进入战斗
function NaoShi.StartFight(player, npc)
	if npc:GetInt("NaoShiNPCisFight") > 0 then
		return false
	else
		--npc==>monster
		local npc_id = npc:GetId()
		local mon_id = npc:GetInt("NaoShiFightMonID") or 20005

		
		if sFightSystem:StartTagPVE(player, mon_id, NaoShi.FightTag, "NaoShi", "FightCallBack", ""..npc:GetGUID()) then
			--npc:SetInt("NaoShiNPCisFight", 1)--1 npc在战斗中 0 不在
			local team = player:GetTeam()
			local memberlist = {}
			if team and not player:IsTempLeave() then
				memberlist = team:GetTeamMembers(false)
			else
				memberlist[1] = player
			end
			for _,v in ipairs(memberlist) do
				sTriggerSystem:AddTrigger(v, TRIGGER_ON_FIGHT_RESULT, "NaoShi", "OnResult")
				
				v:SetInt("NaoShiFightNPCGUID", npc:GetGUID())
				v:SetString("NaoShiFightNPCName", npc:GetKeyName())
				v:SetInt("NaoShiFightNPCActID", npc:GetInt("NaoShiActID"))
			end
			if player:IsTeamLeader() then
				for _,v in ipairs(memberlist) do
					if v:GetType() ~= GUID_ROBOT then
						npc:SetInt("NaoShiNPCisFight", npc:GetInt("NaoShiNPCisFight")+1)
					end
				end
			end
		else
			sLuaApp:LuaErr("NaoShi.StartFight开始pve失败")
		end
		return true
	end
end
--战斗完回调
function NaoShi.FightCallBack(typ, tag, custom)
	if custom == "" or tag ~= NaoShi.FightTag then
		sLuaApp:LuaErr("NaoShi.FightCallBack回调错误")
		return
	end
	local npc = sNpcSystem:GetNpcByGUID(tonumber(custom))
	if npc then
		npc:SetInt("NaoShiNPCisFight", 0)
	end
end


--人物完成战斗回调
function NaoShi.OnResult(player, typ, victory, custom)
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "NaoShi", "OnResult")
	
	local npc = sNpcSystem:GetNpcByGUID(player:GetInt("NaoShiFightNPCGUID"))
	local id = player:GetInt("NaoShiFightNPCActID")
	sLuaApp:LuaErr(player:GetName().."victory"..tostring(victory))

	if npc and npc:GetInt("NaoShiNPCisFight") > 0 then
		npc:SetInt("NaoShiNPCisFight", npc:GetInt("NaoShiNPCisFight")-1)
	end
	if victory == 2 then
		--记下活跃度 参与次数
		local active_add = Data.NaoShi[tostring(id)]["Active_Add"]
		local active_max = Data.NaoShi[tostring(id)]["Active_Max"]
		if active_max ~= 0 then
			local active = player:GetDayInt("NaoShi_Active_Num"..id)
			if active < active_max then
				local active_sum = active + active_add
				if active_sum > active_max then
					player:SetDayInt("NaoShi_Active_Num"..id, active_max)
					ActivitySystem.AddActiveVal(player, active_max - active)
				else
					player:SetDayInt("NaoShi_Active_Num"..id, active_sum)
					ActivitySystem.AddActiveVal(player, active_add)
				end
			else
				sLuaApp:NotifyTipsMsg(player, "活跃值已达本次活动获得上限")
			end
		end
		
		--参与次数没到上限才发奖励
		
		local join_max = Data.NaoShi[tostring(id)]["Join_Max"]
		local join_num = player:GetDayInt("NaoShi_Join_Num"..id) +1
		if join_max ~= 0 then 
			local VipEnhanced_Times = Data.NaoShi[tostring(id)]["VipEnhanced_Times"]
			if VipEnhanced_Times and VipEnhanced_Times ~= "" then
				join_max  = VipLogic.GetVipEnhanced(player,VipEnhanced_Times, "times", join_max)
			end
			if join_num <= join_max then
				player:SetDayInt("NaoShi_Join_Num"..id, join_num)
				--发奖励
				NaoShi.GiveReward(player, player:GetString("NaoShiFightNPCName"), id)
			else
				sLuaApp:NotifyTipsMsg(player, "参与次数已达上限，无法获得奖励")
			end
			
			if npc then
				local map_id = npc:GetInt("NaoShiMapID")
				local map_npc_num = sVarSystem:GetInt("NaoShi_"..id.."_"..map_id.."_NPCNum")-1
				sVarSystem:SetInt("NaoShi_"..id.."_"..map_id.."_NPCNum", map_npc_num)
				sNpcSystem:DestroyNpc(npc)
			end
		else
			NaoShi.GiveReward(player, player:GetString("NaoShiFightNPCName"), id)
			if npc then
				local map_id = npc:GetInt("NaoShiMapID")
				local map_npc_num = sVarSystem:GetInt("NaoShi_"..id.."_"..map_id.."_NPCNum")-1
				sVarSystem:SetInt("NaoShi_"..id.."_"..map_id.."_NPCNum", map_npc_num)
				sNpcSystem:DestroyNpc(npc)
			end
		end
		
		--超过次数限制 也发活动元宝 --周师傅说的
		local activity_data = ActivityConfig.GetById(id)
		if activity_data and VipIngotTrace then
			VipIngotTrace.GetReward(player, activity_data.Name)
		end
		if activity_data and Assist then
			Assist.ActivityGetPoint(player, activity_data.Name)
		end
		
		--密藏目标
		if SeasonPassQuestFunc then
			if id == 85 then	--闹事
				SeasonPassQuestFunc.UpdateQuestProgress(player, 112)
			elseif id == 10 then	--十二星官
				SeasonPassQuestFunc.UpdateQuestProgress(player, 111)
			end
		end

	end
	player:SetInt("NaoShiFightNPCGUID", 0)
	player:SetString("NaoShiFightNPCName", "")
	player:SetInt("NaoShiFightNPCActID", 0)
end

--发奖励
function NaoShi.GiveReward(player, npc_keyname, id)
	if not NaoShi.Reward[id] then
		NaoShi.Reward[id] = Data.NaoShi[tostring(id)]["Reward"]
	end
	local reward = {}
	--根据玩家等级判断奖励层级
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	local Reincarnation =  player:GetAttr(ROLE_ATTR_REINCARNATION)
	local Hierarchy = ""
	local BreakMark = 0
	for k in pairs(NaoShi.Reward[id]) do
		if BreakMark ~= 1 then
			local parameter = sLuaApp:StrSplit(k, "_");
			local Par = tonumber(parameter[1])
			if Par then
				if tonumber(Reincarnation) == Par then
					local Par = parameter[2]
					local Par = sLuaApp:StrSplit(Par, "-")
					local Par1 = tonumber(Par[1])
					local Par2 = tonumber(Par[2])
					if tonumber(level) >= Par1 and tonumber(level) <= Par2 then
						reward = NaoShi.Reward[id][k]
						BreakMark = 1
					end
				end
			else
				Hierarchy = k
			end
		end
	end
	if BreakMark ==0 and Hierarchy ~= "" then
		reward = NaoShi.Reward[id][Hierarchy]
	end
	
	
	-- if level >=1 and level <=9 then
		-- level = "0-1"
	-- elseif level >=10 and level <=39 then
		-- level = "10-39"
	-- elseif level >=40 and level <=59 then
		-- level = "40-59"
	-- elseif level >=60 and level <=79 then
		-- level = "60-79"
	-- elseif level >=80 and level <=99 then
		-- level = "80-99"
	-- elseif level >=100 and level <=119 then
		-- level = "100-119"
	-- elseif level ==120 then
		-- level = "120-120"
	-- end
	
	-- Hierarchy = tostring(Reincarnation).."_"..level
	-- if NaoShi.Reward[id][Hierarchy] == nil then
		-- Hierarchy = "else"
	-- end
	-------------------------------------------------------------
	-- reward = NaoShi.Reward[id][Hierarchy]
	
	if next(reward) then
		if not NaoShi.Active_Name[id] then
			NaoShi.Active_Name[id] = Data.NaoShi[tostring(id)]["Active_Name"]
		end
		
		-- if NaoShi.Active_Name[id] == "闹事的妖怪" then
			-- +exp
			-- local add_exp = reward['Exp']
			-- if add_exp and add_exp ~= 0 then
				-- local res_exp = NaoShi.RewardConfigToNmber(player, add_exp)
				-- if VipLogic then
					-- res_exp = VipLogic.GetVipEnhanced(player,"闹事的妖怪经验提升","value",res_exp)
				-- end
				-- player:AddExp(res_exp, "system", "闹事活动", "怪物掉落")
			-- +宠物exp
				-- local petlist = Lua_tools.GetFightPets(player) 
				-- for k , v in pairs(petlist) do
					-- v:AddExp(res_exp, "system", "闹事活动","怪物掉落")
				-- end
			-- end
			-- +money
			-- local add_money_type = reward['MoneyType']
			-- local add_money_val = reward['MoneyVal']
			-- if add_money_type and add_money_val and add_money_val ~= 0 then
				-- local res_money = NaoShi.RewardConfigToNmber(player, add_money_val)
				-- if VipLogic then
					-- res_money = VipLogic.GetVipEnhanced(player,"闹事的妖怪银币提升","value",res_money)
				-- end
				-- Lua_tools.AddMoney(player, add_money_type, res_money, "system", "活动"..id, npc_keyname.."怪物掉落")
			-- end
		-- elseif NaoShi.Active_Name[id] == "十二星官" then
			-- +exp
			-- local add_exp = reward['Exp']
			-- if add_exp and add_exp ~= 0 then
				-- local res_exp = NaoShi.RewardConfigToNmber(player, add_exp)
				-- if VipLogic then
					-- res_exp = VipLogic.GetVipEnhanced(player,"闹事的妖怪经验提升","value",res_exp)
				-- end
				-- player:AddExp(res_exp, "system", "十二星官", "怪物掉落")
			-- +宠物exp
				-- local petlist = Lua_tools.GetFightPets(player) 
				-- for k , v in pairs(petlist) do
					-- v:AddExp(res_exp, "system", "十二星官","怪物掉落")
				-- end
			-- end
			-- +money
			-- local add_money_type = reward['MoneyType']
			-- local add_money_val = reward['MoneyVal']
			-- if add_money_type and add_money_val and add_money_val ~= 0 then
				-- local res_money = NaoShi.RewardConfigToNmber(player, add_money_val)
				-- if VipLogic then
					-- res_money = VipLogic.GetVipEnhanced(player,"闹事的妖怪银币提升","value",res_money)
				-- end
				-- Lua_tools.AddMoney(player, add_money_type, res_money, "system", "活动"..id, npc_keyname.."怪物掉落")
			-- end			
		-- end

			-- +exp
		local add_exp = reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = NaoShi.RewardConfigToNmber(player, add_exp)
			if VipLogic then
				local VipEnhanced_Exp = Data.NaoShi[tostring(id)]["VipEnhanced_Exp"]
				if VipEnhanced_Exp and VipEnhanced_Exp ~= "" then
					res_exp = VipLogic.GetVipEnhanced(player,VipEnhanced_Exp,"value",res_exp)
				end
			end
			player:AddExp(res_exp, "system", NaoShi.Active_Name[id], "怪物掉落")
		-- +宠物exp
			local petlist = Lua_tools.GetFightPets(player) 
			for k , v in pairs(petlist) do
				v:AddExp(res_exp, "system", NaoShi.Active_Name[id],"怪物掉落")
			end
		end
			-- +money
		local add_money_type = reward['MoneyType']
		local add_money_val = reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = NaoShi.RewardConfigToNmber(player, add_money_val)
			if VipLogic then
				local VipEnhanced_Money = Data.NaoShi[tostring(id)]["VipEnhanced_Money"]
				if VipEnhanced_Money and VipEnhanced_Money ~= "" then
					res_money = VipLogic.GetVipEnhanced(player,VipEnhanced_Money,"value",res_money)
				end
			end
			Lua_tools.AddMoney(player, add_money_type, res_money, "system", "活动"..id, npc_keyname.."怪物掉落")
		end
		
		-- 获得积分
		if reward['Integral'] and reward['IntegralVal'] then
			local add_Integral_type = reward['Integral']["MoneyType"]
			local add_Integral_name = reward['Integral']["MoneyName"]
			local add_Integral_val = reward['IntegralVal']
			if add_Integral_type and add_Integral_name and add_Integral_val ~= 0 then		
				local oldInt = player:GetInt(add_Integral_type)
				local addInt = tonumber(add_Integral_val)
				player:SetInt(add_Integral_type, oldInt + addInt)			
				sLuaApp:NotifyTipsMsg(player, "获得"..add_Integral_val.."点"..add_Integral_name)
			end
		end
		
		local temptb = {}
		-- +固定物品
		local item_list = reward['Item']
		if item_list then
			item_list,temptb = NaoShi.RewardDropLimitDetermine(player,id,item_list)
			Lua_tools.AddItem(player, item_list, "system", "活动"..id, npc_keyname.."怪物掉落")
		end
		-- +随机物品
		local item_rand_time = reward['RandTime'] or 1

		local item_rand_list = reward['ItemRand']
		if item_rand_time and item_rand_list then
			local res_item_list = Lua_tools.PlayerStartRandom(item_rand_list, "活动"..id..npc_keyname..Hierarchy, item_rand_time)
			res_item_list,temptb = NaoShi.RewardDropLimitDetermine(player,id,res_item_list)
			if res_item_list[1] ~= "nil" then
				Lua_tools.AddItem(player, res_item_list, "system", "活动"..id, npc_keyname.."怪物掉落")
			end
		end
	end
end

--奖励配置表转数字
function NaoShi.RewardConfigToNmber(player, add_num)
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


function NaoShi.RewardDropLimitDetermine(player,id,rewardlist)
	local limit_tb = Data.NaoShi[tostring(id)]["RewardDropLimit"]
	local tb_1 = {} --处理后的列表
	local tb_2 = {} --被除掉的列表
	if limit_tb and next(limit_tb) then
		if rewardlist and next(rewardlist) then
			for k,v in pairs(rewardlist) do
				if type(v) == "string" then
					if limit_tb[v] and type(limit_tb[v]) == "number" then
						local num = player:GetDayInt("Act_"..id.."_RewardDropLimit_"..v)
						local num_limit = limit_tb[v]
						local num_add = rewardlist[k+1]
						if num >= num_limit then
							table.insert(tb_2,v)
						else
							if num + num_add > num_limit then
								local num_add_can = num_limit - num
								player:SetDayInt("Act_"..id.."_RewardDropLimit_"..v,num+num_add_can)
								table.insert(tb_1,v)
								table.insert(tb_1,num_add_can)
								table.insert(tb_1,rewardlist[k+2])									
							else
								player:SetDayInt("Act_"..id.."_RewardDropLimit_"..v,num+num_add)
								table.insert(tb_1,v)
								table.insert(tb_1,num_add)
								table.insert(tb_1,rewardlist[k+2])								
							end
						end
					else
						table.insert(tb_1,v)
						table.insert(tb_1,rewardlist[k+1])
						table.insert(tb_1,rewardlist[k+2])
					end			
				end
			end
		else
			sLuaApp:LuaDbg("table rewardlist不存在或为空")
		end
	else
		tb_1 = rewardlist
	end
	
	return tb_1,tb_2
end

--npc自杀
function NaoShi.DestroyNPC(npc, timer, p)
	local id = npc:GetInt("NaoShiActID")
	local map_id = npc:GetInt("NaoShiMapID")
	local map_npc_num = sVarSystem:GetInt("NaoShi_"..id.."_"..map_id.."_NPCNum")-1
	sVarSystem:SetInt("NaoShi_"..id.."_"..map_id.."_NPCNum", map_npc_num)
	sNpcSystem:DestroyNpc(npc)
end