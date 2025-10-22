--天下第一活动
TianXiaDiYi = {}

-- 活动开始前回调
function TianXiaDiYi.OnDeclare(id, seconds)
end

--活动开始 清空前一日排行榜
function TianXiaDiYi.OnStart(id, is_normal)
	sVarSystem:SetInt("ACTIVITY_TianXiaDiYi_ID", id)
	--记录所有参加活动的玩家
	if Data then
		Data.TianXiaDiYi = {}
		Data.TianXiaDiYi['JoinPlayerList'] = {}
	else
		sLuaApp:LuaErr("缺少Data")
		return
	end
	
	sLuaApp:NotifyTopMsgToAll( 1, "天下第一活动开始!")
	
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.Person_PVP_STATE = 1
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)
	
	sRanklistSystem:ClearRanklist( RankingListSystem.Config['天下第一积分榜'] or 32)--清空排行榜
end

-- 活动结束回调
function TianXiaDiYi.OnStop(id)
    --活动结束  邮件发送礼包 
	sVarSystem:SetInt("ACTIVITY_TianXiaDiYi_ID", 0)
	sLuaApp:LuaErr("TianXiaDiYi.OnStop  活动ID:"..id.."  当前记录ID:"..sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID"))
	sLuaApp:NotifyTopMsgToAll( 1, "天下第一活动结束!")
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.Person_PVP_STATE = 0
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)

	-- 邮件发送礼包
	sLuaApp:LuaErr("发送前三邮件")
	local join_player_list = Data.TianXiaDiYi['JoinPlayerList']
	
	local nb_player_list = sRanklistSystem:GetRanklist( RankingListSystem.Config['天下第一积分榜'] or 32, 1, 3)
	for k,v in ipairs(nb_player_list) do
		join_player_list[tostring(v[1])] = nil--前三名不发参与奖励
		if k == 1 then
			sMailSystem:SendMail( 0, "天下第一", v[1], 1, "天下第一冠军", "本次天下第一您的积分为"..v[2].."分，恭喜您获得了冠军！祝少侠神功盖世，再创新高！", TianXiaDiYi.EndMailItem["Reward_1"]['Money'], TianXiaDiYi.EndMailItem['Reward_1']['Item'])
		elseif k == 2 then
			sMailSystem:SendMail( 0, "天下第一", v[1], 1, "天下第一亚军", "本次天下第一您的积分为"..v[2].."分，恭喜您获得了亚军！祝少侠不负众望，再创新高！", TianXiaDiYi.EndMailItem["Reward_2"]['Money'], TianXiaDiYi.EndMailItem["Reward_2"]['Item'])
		elseif k == 3 then
			sMailSystem:SendMail( 0, "天下第一", v[1], 1, "天下第一季军", "本次天下第一您的积分为"..v[2].."分，恭喜您获得了季军！祝少侠神功盖世，再创新高！", TianXiaDiYi.EndMailItem["Reward_3"]['Money'], TianXiaDiYi.EndMailItem["Reward_3"]['Item'])
		end
	end
	sLuaApp:LuaErr("发送后面人的邮件")
	if next(join_player_list) then
		for k, v in pairs(join_player_list) do
			sMailSystem:SendMail( 0, "天下第一", tonumber(k), 1, "天下第一结束", "感谢您参与本次天下第一，本次天下第一您的积分为"..tostring(v).."分！", TianXiaDiYi.EndMailItem["Reward_Other"]['Money'], TianXiaDiYi.EndMailItem['Reward_Other']['Item']) 
		end
	end
	
	 -- 清空匹配池
	sLuaApp:LuaErr("清空匹配池")
	local matching_player_guid = sVarSystem:GetInt("PVPActivityMatching_"..id)
	if matching_player_guid ~= 0 then
		local matching_player = sPlayerSystem:GetPlayerByGUID(matching_player_guid)
		if matching_player then
			sLuaApp:LuaDbg("仍有在匹配的玩家")
			matching_player:SetInt("TianXiaDiYi_isAutoMatching", 0)
			matching_player:SetInt("TianXiaDiYi_isMatching", 0)
			TianXiaDiYi.GetTeamInfo(matching_player)
		end
		sVarSystem:SetInt("PVPActivityMatching_"..id,0)
	end
	sLuaApp:LuaErr("天下第一活动结束 最后一行")
end

-- 玩家点击参与活动回调
function TianXiaDiYi.OnJoin(id, player)
	--点参与直接打开活动界面 判断是否在副本中
	if Data.DungeonMap then
		local map_keyname = player:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if map_keyname == v then
				sLuaApp:NotifyTipsMsg(player, "当前正在副本活动中，无法参与天下第一活动")
				return false
			end
		end
	end
	
	if sLuaApp:IsActivityRunning(id) then
		local str=[[
			GUI.OpenWnd("PersonalFightUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")	
	end
	--引导玩家到活动npc
end

-- 玩家客户端查询数据回调
function TianXiaDiYi.OnQuery(id, player)
	local join_num = player:GetDayInt("TianXiaDiYi_JoinNum")
	local active_num = player:GetDayInt("TianXiaDiYi_ActiveNum")
	local show_item = TianXiaDiYiConfig.ShowItem or "61024,61025,36013,20122"
	local str = join_num..":"..TianXiaDiYiConfig.JoinMax..":"..active_num..":"..TianXiaDiYiConfig.ActiveMax..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("TianXiaDiYi") or "2,3,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--上线升级同步右上角图标
function TianXiaDiYi.SyncSignState(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if id == 0 then return end
	local is_open = 1
	local activityData = ActivityConfig.GetById(id)
	if player:GetAttr(ROLE_ATTR_LEVEL) >= tonumber(activityData.LevelMin) then
		if sLuaApp:IsActivityRunning(id) then
			is_open = 1
		else
			is_open = 0
		end
		if Data.DungeonMap then
			local map_keyname = player:GetMap():GetKeyName()
			for _,v in ipairs(Data.DungeonMap) do
				if map_keyname == v then
					is_open = 0
					break
				end
			end
		end
		local str = [[
			if MainDynamicUI then
				MainDynamicUI.Person_PVP_STATE = ]]..is_open..[[
				MainDynamicUI.World_PVP_BtnRefresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

--客户端界面打开 
function TianXiaDiYi.GetData(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	--匹配按钮
	local automatic_matching = player:GetInt("TianXiaDiYi_isAutoMatching")
	local is_matching = player:GetInt("TianXiaDiYi_isMatching")

	if automatic_matching == 1 then
		is_matching = 1
	end

	--礼包部分
	local rewardlist = {}
	local i = 1
	while TianXiaDiYiConfig.Reward['Reward_'..i] do		
		rewardlist[i]={}
		rewardlist[i]['typ'] = TianXiaDiYiConfig.Reward['Reward_'..i]['Type']
		rewardlist[i]['num'] = TianXiaDiYiConfig.Reward['Reward_'..i]['Num']
		rewardlist[i]['img'] = "1900015300"
		rewardlist[i]['isget'] = player:GetDayInt("TianXiaDiYi_reward_record_Reward_"..i)
		i = i + 1
	end
	 
	local player_show_string = TianXiaDiYi.TeamInfo(player) --玩家与其队伍信息 table
	local player_integral = sRanklistSystem:GetRanklist( RankingListSystem.Config['天下第一积分榜'] or 32, 1, 50) --排行榜前50
	--sLuaApp:LuaDbg("player_integral"..Lua_tools.serialize(player_integral))
	local conti_history = player:GetDayInt("TianXiaDiYi_Wins_Conti_History")
	local wins = player:GetDayInt("TianXiaDiYi_Wins_Record")
	local fights = player:GetDayInt("TianXiaDiYi_Fight_Record")
	local str = ""
	if Lua_tools then
		if sLuaApp:IsActivityRunning(id) then
			str = str..[[
				if PersonalFightUI then
					PersonalFightUI.PVPActivity_IsOpening = "ON"
					PersonalFightUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
					PersonalFightUI.RefreshMatchState(]]..is_matching ..[[)
					PersonalFightUI.AwardInfo = ]]..Lua_tools.serialize(rewardlist)..[[
					PersonalFightUI.RefreshRankList(]]..Lua_tools.serialize(player_integral)..[[)
					PersonalFightUI.RefreshFightData(]]..wins..[[,]]..conti_history..[[,]]..fights..[[)
					PersonalFightUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
					PersonalFightUI.Refresh(]]..id..[[)
				end	
				]]
		else--如果活动没开
			str = str..[[
				if PersonalFightUI then
					PersonalFightUI.PVPActivity_IsOpening = "OFF"
					PersonalFightUI.RefreshTimetext(0)
					PersonalFightUI.RefreshAutoMatchState(0)
					PersonalFightUI.RefreshMatchState(0)
					PersonalFightUI.AwardInfo = ]]..Lua_tools.serialize(rewardlist)..[[
					PersonalFightUI.RefreshRankList(]]..Lua_tools.serialize(player_integral)..[[)
					PersonalFightUI.RefreshFightData(]]..wins..[[,]]..conti_history..[[,]]..fights..[[)
					PersonalFightUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
					PersonalFightUI.Refresh(]]..id..[[)
				end
				]]
		end
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end


--判断是否发送奖励 判断胜场礼包和战斗场数礼包是否已经发过
function TianXiaDiYi.GetReward(player, para)	
	local reward_record = player:GetDayInt("TianXiaDiYi_reward_record_"..para)--0 未领取 1 已领取
	if reward_record == 1 then
		sLuaApp:LuaErr(player:GetName().."已经领取过该礼包")
	else
		player:SetDayInt("TianXiaDiYi_reward_record_"..para, 1)
		if TianXiaDiYiConfig.Reward[para] then
			TianXiaDiYi.RewardGive(player, para)
			TianXiaDiYi.GetData(player)
		end
	end
end	

--发奖励 
function TianXiaDiYi.RewardGive(player, para)
	local tb_reward = TianXiaDiYiConfig.Reward[para]
	if tb_reward and next(tb_reward) then
		-- +exp
		local add_exp = tb_reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = TianXiaDiYi.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "system", "天下第一活动", "礼包"..para)
		end
		-- +money
		local add_money_type = tb_reward['MoneyType']
		local add_money_val = tb_reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = TianXiaDiYi.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, "system", "天下第一活动", "礼包"..para)
		end
		-- +帮贡
		local add_contribution = tb_reward['Contribution']
		if add_contribution and add_contribution ~= 0 then
			local res_contribution = TianXiaDiYi.RewardConfigToNmber(player, add_contribution)
			player:AddGuildContribute(res_contribution, "system", "天下第一活动", "礼包"..para)
			sLuaApp:NotifyTipsMsg(player, "获得了"..res_contribution.."点帮贡！")
		end
		-- +帮派资金
		local add_guild_gold = tb_reward['GuildGold']
		if add_guild_gold and add_guild_gold ~= 0 then
			local res_guild_gold = TianXiaDiYi.RewardConfigToNmber(player, add_guild_gold)
			player:AddGuildFund(res_guild_gold, "system", "天下第一活动", "礼包"..para)
		end
		-- +固定物品
		local item_list = tb_reward['Item']
		if item_list then
			Lua_tools.AddItem(player, item_list, "system", "天下第一活动", "礼包"..para)
		end
	end
end

--奖励配置表转数字
function TianXiaDiYi.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local wins = ]]..player:GetDayInt("TianXiaDiYi_Wins_Conti")..[[
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


--返回玩家和队友的信息 倒计时用	GetTeamInfo用
function TianXiaDiYi.TeamInfo(player)
	local name = VipIngotTrace.GetPlayerName(player)
	local player_show_string = {}
	--倒计时动画需要的
	player_show_string[1] = {}
	table.insert(player_show_string[1], player:GetId())
	table.insert(player_show_string[1], name)
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_JOB1 or 3))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_LEVEL))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_RACE))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_VIP))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_FIGHT_VALUE))
	--加入参战侍从
	local guard_tb = player:GetGuardContainer():GetGuards()
	local infonum = 1
	if guard_tb and next(guard_tb) then
		for k,v in ipairs(guard_tb) do 
			if v:IsLineup() then
				player_show_string[infonum+1] = {}
				table.insert(player_show_string[infonum+1], v:GetId())
				table.insert(player_show_string[infonum+1], v:GetName())
				table.insert(player_show_string[infonum+1], v:GetAttr(ROLE_ATTR_ROLE))
				table.insert(player_show_string[infonum+1], v:GetAttr(ROLE_ATTR_LEVEL))
				table.insert(player_show_string[infonum+1], v:GetAttr(ROLE_ATTR_RACE))
				table.insert(player_show_string[infonum+1], v:GetAttr(ROLE_ATTR_VIP))
				table.insert(player_show_string[infonum+1], v:GetAttr(ROLE_ATTR_FIGHT_VALUE))
				infonum = infonum + 1
			end
			
		end
	end
	return player_show_string
end

--发送队伍信息 是否在匹配 自动匹配 
function TianXiaDiYi.GetTeamInfo(player)
	local player_show_string = TianXiaDiYi.TeamInfo(player)
	local automatic_matching = player:GetInt("TianXiaDiYi_isAutoMatching")
	local isMatching = player:GetInt("TianXiaDiYi_isMatching")
	
	if automatic_matching == 1 then
		isMatching = 1
	end
	if Lua_tools then
		local str = [[
			if PersonalFightUI then
				PersonalFightUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
				PersonalFightUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
				PersonalFightUI.RefreshMatchState(]]..isMatching ..[[)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

--传给客户端匹配状态  队长点开始结束匹配按钮时 刷新全队匹配按钮
function TianXiaDiYi.GetMatchStatus(player)
	local automatic_matching = player:GetInt("TianXiaDiYi_isAutoMatching")
	local isMatching = player:GetInt("TianXiaDiYi_isMatching")
	if automatic_matching == 1 then
		isMatching = 1
	end
	
	local str = [[
		if PersonalFightUI then
			PersonalFightUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
			PersonalFightUI.RefreshMatchState(]]..isMatching..[[)
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--准备战斗 从匹配系统进
function TianXiaDiYi.ReadyFight(first_player, second_player)--单人或队长
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")	
	if id == 0 then
		return
	end
	local first_fight_state = first_player:IsFightState()
	local second_fight_state = second_player:IsFightState()
	if first_fight_state then
		first_player:SetInt("TianXiaDiYi_Match_Timer", 0)
		first_player:SetInt("TianXiaDiYi_auto_match_timer", 0)
		first_player:SetInt("TianXiaDiYi_isMatching", 0)
		first_player:SetInt("TianXiaDiYi_isAutoMatching", 0)
		sLuaApp:NotifyTipsMsg(first_player, "正在战斗中，无法进入天下第一战斗")
	end
	if second_fight_state then
		second_player:SetInt("TianXiaDiYi_Match_Timer", 0)
		second_player:SetInt("TianXiaDiYi_auto_match_timer", 0)
		second_player:SetInt("TianXiaDiYi_isMatching", 0)
		second_player:SetInt("TianXiaDiYi_isAutoMatching", 0)
		sLuaApp:NotifyTipsMsg(second_player, "正在战斗中，无法进入天下第一战斗")
	end
	if first_fight_state and not second_fight_state then
		PVPActivityMatch.StartMatch(second_player, 0, id)
	end
	if not first_fight_state and second_fight_state then
		PVPActivityMatch.StartMatch(first_player, 0, id)
	end
	
	if not first_fight_state and not second_fight_state then
		first_player:SetInt("TianXiaDiYi_Match_Timer", 0)
		first_player:SetInt("TianXiaDiYi_auto_match_timer", 0)
		second_player:SetInt("TianXiaDiYi_Match_Timer", 0)
		second_player:SetInt("TianXiaDiYi_auto_match_timer", 0)
		
		sLuaApp:LuaDbg("进入ReadyFight")
		first_player:SetInt("TianXiaDiYi_isMatching", 0)--不在匹配状态
		first_player:SetInt("TianXiaDiYi_PVPFightReady", 1)--在准备战斗状态

		second_player:SetInt("TianXiaDiYi_isMatching", 0)
		second_player:SetInt( "TianXiaDiYi_PVPFightReady", 1)

		TianXiaDiYi.GetMatchStatus(first_player)
		TianXiaDiYi.GetMatchStatus(second_player)
		
		if first_player:GetInt("Act_Chikings_Hp_Max") ~= 0 or second_player:GetInt("Act_Chikings_Hp_Max") ~= 0 then
			sLuaApp:NotifyTipsMsg(first_player, "当前无法进入天下会武战斗")
			sLuaApp:NotifyTipsMsg(second_player, "当前无法进入天下会武战斗")
			
			if first_player:GetType() == GUID_PLAYER then
				second_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
			else
				sRobotSystem:DestroyRobot(first_player)
			end
			
			if second_player:GetType() == GUID_PLAYER then
				second_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
			else
				sRobotSystem:DestroyRobot(second_player)
			end
			return
		end
		
		TianXiaDiYi.ShowCountdown(first_player,second_player)--给双方放倒计时
		sLuaTimerSystem:AddTimer(TianXiaDiYiConfig.CountdownTime*1000,1, "TianXiaDiYi.StartFight", ""..first_player:GetGUID() ..","..second_player:GetGUID())--倒计时结束后开打
	end
end

-- 通知前端播放过场动画 321那个 
function TianXiaDiYi.ShowCountdown(first_player,second_player)
	local first_team_info = TianXiaDiYi.TeamInfo(first_player)
	local second_team_info = TianXiaDiYi.TeamInfo(second_player)
	
	local str = ""
	if Lua_tools then
		str=str..[[
			GUI.OpenWnd("FactionFightBtnUI")
			if FactionFightBtnUI then
				FactionFightBtnUI.RefreshPlayersInfo(]]..TianXiaDiYiConfig.CountdownTime..[[,]]..Lua_tools.serialize(first_team_info)..[[,]]..Lua_tools.serialize(second_team_info)..[[)
			end	
		]]
	end
	sLuaApp:ShowForm(first_player, "脚本表单", str)
	sLuaApp:ShowForm(second_player, "脚本表单", str)
end

--开始战斗
function TianXiaDiYi.StartFight(timer_guid, params)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	local spl= sLuaApp:StrSplit(params,",")

	spl[1] = tonumber(spl[1])
	spl[2] = tonumber(spl[2])
	local first_player = sPlayerSystem:GetPlayerByGUID(spl[1])
	local second_player = sPlayerSystem:GetPlayerByGUID(spl[2])
	
	if id == 0 then
		if first_player then
			sLuaApp:NotifyTipsMsg(first_player, "活动已结束")
			first_player:SetInt("TianXiaDiYi_PVPFightReady", 0)
		end
		if second_player then
			sLuaApp:NotifyTipsMsg(first_player, "活动已结束")
			second_player:SetInt("TianXiaDiYi_PVPFightReady", 0)
		end
		return
	end
	
	
	if not first_player or not second_player then
		if first_player then
			if first_player:GetType() == GUID_PLAYER then
				first_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
				sLuaApp:NotifyTipsMsg(first_player, "您的对手不战而降，逃之夭夭了")
			else
				sRobotSystem:DestroyRobot(first_player)
			end
			return 
		elseif second_player then
			if second_player:GetType() == GUID_PLAYER then
				second_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
				sLuaApp:NotifyTipsMsg(second_player, "您的对手不战而降，逃之夭夭了")
			else
				sRobotSystem:DestroyRobot(second_player)
			end
			return 
		end
		return
	end
	
	first_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
	second_player:SetInt( "TianXiaDiYi_PVPFightReady", 0)
	
	--记下对手 战斗完回调用
	first_player:SetDayInt("TianXiaDiYi_opponent", spl[2])
	second_player:SetDayInt("TianXiaDiYi_opponent", spl[1])

	
	sFightSystem:StartTagPVP(first_player, second_player, TianXiaDiYiConfig.FightTag, "", "", "")
	sLuaApp:LuaDbg("天下第一战斗开启")
	
	-- 算rank分用
	first_player:SetDayInt( "TianXiaDiYiOpponentScore", second_player:GetDayInt("TianXiaDiYiScore"))
	second_player:SetDayInt( "TianXiaDiYiOpponentScore", first_player:GetDayInt("TianXiaDiYiScore"))
end

--战斗完成 设置活动回调参数 记录胜负场 编写战报 顺便把奖励发了
function TianXiaDiYi.FightCallBack(player,is_win)
	sLuaApp:LuaDbg("天下第一战斗回调"..player:GetName())
	if player:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(player)
		return 
	end
	local opponent = sPlayerSystem:GetPlayerByGUID( player:GetDayInt("TianXiaDiYi_opponent"))
	if not opponent then
		sLuaApp:LuaErr("TianXiaDiYi.FightCallBack opponent 不存在")
		return
	end

	if is_win == 2 then
		local report_str = "你战胜了"..VipIngotTrace.GetPlayerName(opponent)
		TianXiaDiYi.SendReport(player,report_str)
	
		local wins = player:GetDayInt("TianXiaDiYi_Wins_Record") + 1 --当日胜场
		local fights = player:GetDayInt("TianXiaDiYi_Fight_Record") + 1 --战斗场数
		local wins_conti = player:GetDayInt("TianXiaDiYi_Wins_Conti") + 1 --目前连胜场
		local wins_history = player:GetDayInt("TianXiaDiYi_Wins_Conti_History")--最高连胜场
		player:SetDayInt("TianXiaDiYi_Wins_Record", wins)
		player:SetDayInt("TianXiaDiYi_Fight_Record", fights)
		player:SetDayInt("TianXiaDiYi_Wins_Conti", wins_conti)
		player:SetDayInt("TianXiaDiYi_Lose_Conti", 0)--目前连败场
		if wins_conti > wins_history then
			player:SetDayInt("TianXiaDiYi_Wins_Conti_History", wins_conti)
		end
		if wins_conti > wins_history or wins_conti >= 3 then --超过记录或三连胜
			TianXiaDiYi.SendReport(player,"你获得了"..wins_conti.."连胜！")
		end
		--单场奖励
		TianXiaDiYi.RewardGive(player, "winner_reward")
		--战斗场数奖励和胜场数奖励
		if TianXiaDiYiConfig then
			for a,b in pairs(TianXiaDiYiConfig.Reward) do
				if b.Type and b.Type == "fight" and b.Num == fights then
					TianXiaDiYi.GetReward(player, a)
				end
				if b.Type and b.Type == "win" and b.Num == wins then
					TianXiaDiYi.GetReward(player, a)
				end
			end
		end
		--排行榜记录胜场数
		TianXiaDiYi.UpdateRank(player, true)
	-- end
	else
	-- if false == is_win then
		local report_str = VipIngotTrace.GetPlayerName(opponent).."战胜了你"
		TianXiaDiYi.SendReport(player,report_str)
	
		local fights = player:GetDayInt("TianXiaDiYi_Fight_Record") + 1
		local lose_conti = player:GetDayInt("TianXiaDiYi_Lose_Conti") + 1
		player:SetDayInt("TianXiaDiYi_Fight_Record", fights)
		player:SetDayInt("TianXiaDiYi_Lose_Conti", lose_conti)
		player:SetDayInt("TianXiaDiYi_Wins_Conti", 0)
		--单场奖励
		TianXiaDiYi.RewardGive(player, "loser_reward")	
		--战斗场数奖励
		if TianXiaDiYiConfig then
			for a,b in pairs(TianXiaDiYiConfig.Reward) do
				if b.Type and b.Type == "fight" and b.Num == fights then
					TianXiaDiYi.GetReward(player, a)
					break
				end
			end
		end
		--排行榜记录
		TianXiaDiYi.UpdateRank(player, false) 
	end
	if Data.TianXiaDiYi['JoinPlayerList'] then		
		local join_num = player:GetDayInt("TianXiaDiYi_JoinNum") +1 --参与次数
		player:SetDayInt("TianXiaDiYi_JoinNum", join_num)
		
		local active = player:GetDayInt("TianXiaDiYi_ActiveNum")--活跃值
		if active < TianXiaDiYiConfig.ActiveMax then
			local active_sum = active + TianXiaDiYiConfig.ActiveAddNum
			if active_sum > TianXiaDiYiConfig.ActiveMax then
				player:SetDayInt("TianXiaDiYi_ActiveNum", TianXiaDiYiConfig.ActiveMax)
				ActivitySystem.AddActiveVal(player, TianXiaDiYiConfig.ActiveMax - active)
			else
				player:SetDayInt("TianXiaDiYi_ActiveNum", active_sum)
				ActivitySystem.AddActiveVal(player, TianXiaDiYiConfig.ActiveAddNum)
			end
		end
		
		--存guid在key上 string
		Data.TianXiaDiYi['JoinPlayerList'][tostring(player:GetGUID())] = player:GetDayInt("TianXiaDiYiScore")
	else 
		sLuaApp:LuaErr("JoinPlayerList不存在")
	end
	--判断进入自动匹配
	TianXiaDiYi.JudgeStartAutoMacth(player)	
end

--战斗完发送战报
function TianXiaDiYi.SendReport(player,report_str)
	if player:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(player)
		return 
	end

	local str = [[
		if PersonalFightUI then
			PersonalFightUI.AddReport("]]..report_str..[[")
			GUI.OpenWnd("PersonalFightUI")
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--战斗完updata排行榜
function TianXiaDiYi.UpdateRank(player, iswin)
	if player:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(player)
		return 
	end
	local begin_ratingA = player:GetDayInt("TianXiaDiYiScore")
	local begin_ratingB = player:GetDayInt("TianXiaDiYiOpponentScore")
	if begin_ratingA == 0 then
		begin_ratingA = TianXiaDiYiConfig.DefaultRating
	end
	if begin_ratingB == 0 then
		begin_ratingB = TianXiaDiYiConfig.DefaultRating
	end
	
	local score_adjust = iswin and 1 or 0
	local computeK = 36
	if begin_ratingA >= 1400 + TianXiaDiYiConfig.DefaultRating then
		computeK = 16
	elseif begin_ratingA >= 700 + TianXiaDiYiConfig.DefaultRating then
		computeK = 24
	end
	local add_score = math.floor(computeK * (score_adjust - 1/(1 + 10 ^ ((begin_ratingB - begin_ratingA) / 600))))
	local end_score = begin_ratingA + add_score
	player:SetDayInt("TianXiaDiYiScore", end_score)
	player:SetDayInt("TianXiaDiYiOpponentScore", 0)
	--sLuaApp:LuaErr("天下第一 玩家："..player:GetName().."战斗前积分："..begin_ratingA.." 积分变化值："..add_score.." 战斗后积分："..end_score)
	if add_score >= 0 then
		sLuaApp:NotifyTipsMsg(player, "获得"..add_score.."分，当前积分： ".. end_score)
	else
		sLuaApp:NotifyTipsMsg(player, "失去"..math.abs(add_score).."分，当前积分： ".. end_score)
	end
	sRanklistSystem:UpdateRanklist( RankingListSystem.Config['天下第一积分榜'] or 32, player:GetGUID(), end_score, player:GetName(), ""..player:GetAttr(ROLE_ATTR_FIGHT_VALUE))	
end

--判断是否进入自动匹配
function TianXiaDiYi.JudgeStartAutoMacth(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if sLuaApp:IsActivityRunning (id) then 
		if not TianXiaDiYi.CheckMatch(player) then 
			player:SetInt("TianXiaDiYi_isAutoMatching", 0)
			TianXiaDiYi.GetMatchStatus(player)
			return 
		end
		
		if player:GetInt("TianXiaDiYi_isAutoMatching") == 1 then
			sLuaApp:LuaDbg("JudgeStartAutoMacth")
			player:SetInt("TianXiaDiYi_isMatching", 1)--可以不要
			TianXiaDiYi.StartMatch(player)
			--TianXiaDiYi.GetMatchStatus(player)
		end
	else
		player:SetInt("TianXiaDiYi_isAutoMatching", 0)
		TianXiaDiYi.GetMatchStatus(player)
	end
end

--发送tips
function TianXiaDiYi.GetTips(player)
	local str = [[
		if PersonalFightUI then
			PersonalFightUI.RefreshHelpTip("]]..TianXiaDiYiConfig.Tips..[[")
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end


--传礼包内容 客户端显示用
function TianXiaDiYi.GetRewardInfo(player, reward_index)
	if TianXiaDiYiConfig.Reward["Reward_"..reward_index] then
		local wins = player:GetDayInt("TianXiaDiYi_Wins_Conti")
		local str = [[
			if PersonalFightUI then
				PersonalFightUI.AddAwardDeatil(]]..reward_index..','..wins..','..'[['..Lua_tools.serialize(TianXiaDiYiConfig.Reward["Reward_"..reward_index])..']]'..[[)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:LuaErr("TianXiaDiYi.GetRewardInfo：没这个表")
	end
end

--判断能否点击匹配按钮  
function TianXiaDiYi.CheckMatch(player)
	if Data.DungeonMap then
		local map_keyname = player:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if map_keyname == v then
				sLuaApp:NotifyTipsMsg(player, "当前正在副本中，无法进行匹配")
				return false
			end
		end
	end
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	sLuaApp:LuaDbg("id:"..id)
	if id == 0 then
		sLuaApp:NotifyTipsMsg(player, "活动已结束，无法进行该操作")
		return
	end
	local activityData = ActivityConfig.GetById(id)
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(activityData.LevelMin) then
		sLuaApp:NotifyTipsMsg(player, "等级不足".. activityData.LevelMin .."级，无法参与天下第一，请变强一些再来吧！")
		return false
	end
	if TianXiaDiYiConfig.JoinMax > 0  then
		if player:GetDayInt("TianXiaDiYi_JoinNum") >= TianXiaDiYiConfig.JoinMax then
			sLuaApp:NotifyTipsMsg(player, "参与活动次数达到上限，无法继续参与天下第一！")
			return false
		end
	end
	
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动已结束！")
		return false
	end

	if player:GetTeam() then
		sLuaApp:NotifyTipsMsg(player, "天下第一只能有一个人，无法组队参加！")
		return false
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，开始匹配失败")
		return false
	end
	if player:GetInt("Act_Chikings_Hp_Max") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "正在参与其他活动,无法进行天下第一匹配")
		return false
	end
	
	return true
end

function TianXiaDiYi.CheckEndMatch(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if player:GetInt("TianXiaDiYi_PVPFightReady") == 1 then
		sLuaApp:NotifyTipsMsg(player, "取消匹配失败，已经为你找到对手，即将进入战斗")
		return false
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，取消匹配失败")
		return false
	end
	return true
end

--创建基于玩家等级的随机机器人
function TianXiaDiYi.RobotCreatAndStartMatch(player,timer,act_id)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if not sLuaApp:IsActivityRunning(id) then
		return
	end
	if player:IsFightState() then
		sLuaApp:LuaErr("玩家正在战斗阶段，无需创建机器人")
		return 
	end
	local host = ""
	if TianXiaDiYiCreatRobot then
		host = TianXiaDiYiCreatRobot.CreatRobot(player)
	end
	if host ~= "" then
		PVPActivityMatch.StartMatch(host,timer,act_id)
	end
end

--设置定时器进入匹配池
function TianXiaDiYi.StartMatch(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	if not sLuaApp:IsActivityRunning(id) then
		return ""
	end
	local macth_time = sLuaApp:RandInteger(TianXiaDiYiConfig.MatchTime[1], TianXiaDiYiConfig.MatchTime[2]) * 1000
	local t_guid = sLuaTimerSystem:AddTimerEx(player, macth_time,1,"PVPActivityMatch.StartMatch", ""..id)
	--sLuaApp:LuaDbg("t_guid:"..t_guid)
	player:SetInt("TianXiaDiYi_Match_Timer", t_guid)
	
	local robot_time = macth_time + 20000
	local robot_guid = sLuaTimerSystem:AddTimerEx(player, robot_time,1,"TianXiaDiYi.RobotCreatAndStartMatch", ""..id)
	player:SetInt("TianXiaDiYi_Robote_Match_Timer", robot_guid)
			
	if sLuaTimerSystem:HasTimer(t_guid) then
		TianXiaDiYi.GetMatchStatus(player)
		return true
	else
		player:SetInt("TianXiaDiYi_isMatching", 0)
		player:SetInt("TianXiaDiYi_isAutoMatching", 0)
		TianXiaDiYi.GetMatchStatus(player)
		return false
	end
	return false
end

--移除定时器或移出匹配池
function TianXiaDiYi.EndMatch(player)	
	if player:GetType() ~= GUID_PLAYER then
		return 
	end
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	local t_guid = player:GetInt("TianXiaDiYi_Match_Timer")
	local robot_guid = player:GetInt("TianXiaDiYi_Robote_Match_Timer")
	if sLuaTimerSystem:HasTimer(robot_guid) then
		--sLuaApp:LuaDbg("移除创建机器人计时器")
		sLuaTimerSystem:DisableTimer(robot_guid)
	end
	
	if sLuaTimerSystem:HasTimer(t_guid) then--没有进入匹配池
		sLuaTimerSystem:DisableTimer(t_guid)
		player:SetInt("TianXiaDiYi_Match_Timer", 0)
		TianXiaDiYi.GetMatchStatus(player)
		return true
	else
		--已进入匹配池
		if PVPActivityMatch.EndMatch(player,id) then--结束匹配
			TianXiaDiYi.GetMatchStatus(player)
			return true
		else
			TianXiaDiYi.GetMatchStatus(player)
			return false
		end
	end
	return false
end

--加入队伍 取消匹配
function TianXiaDiYi.on_join_team(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaDiYi_ID")
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	player:SetInt("TianXiaDiYi_isMatching",0)
	player:SetInt("TianXiaDiYi_isAutoMatching",0)
	if TianXiaDiYi.EndMatch(player) then
		sLuaApp:NotifyTipsMsg(player, "队伍状态变化，已取消天下第一活动匹配")
	end
	return true
end

function TianXiaDiYi.Initialization()
	--初始化 发邮件需要的item表 keyname==>id
	if not TianXiaDiYiConfig then
		require("activity/TianXiaDiYiConfig")
	end
	if not Lua_tools then
		require("system/Lua_tools")	
	end
	TianXiaDiYi.EndMailItem={}
	if TianXiaDiYiConfig.EndMailReward then
		for k,v in pairs(TianXiaDiYiConfig.EndMailReward) do
			TianXiaDiYi.EndMailItem[k] = {}
			TianXiaDiYi.EndMailItem[k]['Item'] = {}
			if v['Item'] then
				for a,b in ipairs(v['Item']) do
					if type(b) == "string" then
						local itemData = ItemConfig.GetByKeyName(b)
						table.insert(TianXiaDiYi.EndMailItem[k]['Item'], itemData.Id)
						local Num = v['Item'][a+1]
						local bind = v['Item'][a+2]
						if type(Num) == "number" and type(bind) == "number" then
							table.insert(TianXiaDiYi.EndMailItem[k]['Item'], Num)
							table.insert(TianXiaDiYi.EndMailItem[k]['Item'], bind)
						end
					end
				end
			end
			TianXiaDiYi.EndMailItem[k]['Money'] = {}
			if Lua_tools then
				if v['MoneyType'] and v['MoneyVal'] and v['MoneyVal'] > 0 then
					table.insert(TianXiaDiYi.EndMailItem[k]['Money'], Lua_tools.MoneyAttrs[v['MoneyType']])
					table.insert(TianXiaDiYi.EndMailItem[k]['Money'], v['MoneyVal'])
				end
			else
				sLuaApp:LuaErr("缺少Lua_tools")
			end
		end
	else
		sLuaApp:LuaErr("缺少TianXiaDiYiConfig.EndMailReward")
	end
end
TianXiaDiYi.Initialization()