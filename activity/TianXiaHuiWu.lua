--天下会武活动
TianXiaHuiWu={}

require("system/Lua_tools")
--id = 8			--活动id
TianXiaHuiWu.macth_time = {2,15}	--匹配时间
TianXiaHuiWu.countdown_time = 3	--倒计时时间
TianXiaHuiWu.join_max = 0		--参加次数上限
TianXiaHuiWu.active_add_num = 5	--单次获得活跃值+5
TianXiaHuiWu.active_max = 20	--获得活跃值上限 最大+20
TianXiaHuiWu.rank_type = 30  	--排行榜类型 天下会武30
TianXiaHuiWu.FightTag = 10008	--战斗标签

-- 活动开始前回调
function TianXiaHuiWu.OnDeclare(id, seconds)
end

--@newinter TianXiaHuiWu.OnExchangeBtnClick(player)
function TianXiaHuiWu.OnExchangeBtnClick(player)
	sLuaApp:LuaDbg("TianXiaHuiWu.OnExchangeBtnClick(player)")
	local str = [[
		GUI.OpenWnd("ShopStoreUI","5,-1")  
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end

--活动开始 清空前一日排行榜
function TianXiaHuiWu.OnStart(id, is_normal)
	sLuaApp:LuaDbg("活动开始")
	sVarSystem:SetInt("ACTIVITY_TianXiaHuiWu_ID", id)
	--记录所有参加活动的玩家
	if Data then
		Data.TianXiaHuiWu = {}
		Data.TianXiaHuiWu['JoinPlayerList'] = {}
		Data.TianXiaHuiWu['StartMatchPlayerList'] = {}
	else
		sLuaApp:LuaErr("缺少Data文件,无法存储玩家GUID")
		return
	end
	
	sLuaApp:NotifyTopMsgToAll( 1, "天下会武活动开始,请到长安城的女将军瑰蝶处报名参与!")
	
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.World_PVP_STATE = 1
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)
	
	sRanklistSystem:ClearRanklist( TianXiaHuiWu.rank_type)--清空排行榜
end

-- 活动结束回调
function TianXiaHuiWu.OnStop(id)
    --活动结束  邮件发送礼包 
	sVarSystem:SetInt("ACTIVITY_TianXiaHuiWu_ID", 0)
	sLuaApp:LuaErr("TianXiaHuiWu.OnStop  活动ID:"..id.."  当前记录ID:"..sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID"))
	sLuaApp:NotifyTopMsgToAll( 1, "天下会武活动结束!")
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.World_PVP_STATE = 0
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)

	-- 邮件发送礼包
	sLuaApp:LuaErr("发送前三邮件")
	local join_player_list = Data.TianXiaHuiWu['JoinPlayerList']
	
	local nb_player_list = sRanklistSystem:GetRanklist( TianXiaHuiWu.rank_type, 1, 3)
	for k,v in ipairs(nb_player_list) do
		join_player_list[tostring(v[1])] = nil--前三名不发参与奖励
		if k == 1 then
			sMailSystem:SendMail( 0, "天下会武", v[1], 1, "天下会武冠军", "本次天下会武您的积分为"..v[2].."分，恭喜您获得了冠军！祝少侠神功盖世，再创新高！", TianXiaHuiWu.end_mail_item["reward_1"]['Money'], TianXiaHuiWu.end_mail_item['reward_1']['Item'])
		elseif k == 2 then
			sMailSystem:SendMail( 0, "天下会武", v[1], 1, "天下会武亚军", "本次天下会武您的积分为"..v[2].."分，恭喜您获得了亚军！祝少侠不负众望，再创新高！", TianXiaHuiWu.end_mail_item["reward_2"]['Money'], TianXiaHuiWu.end_mail_item["reward_2"]['Item'])
		elseif k == 3 then
			sMailSystem:SendMail( 0, "天下会武", v[1], 1, "天下会武季军", "本次天下会武您的积分为"..v[2].."分，恭喜您获得了季军！祝少侠神功盖世，再创新高！", TianXiaHuiWu.end_mail_item["reward_3"]['Money'], TianXiaHuiWu.end_mail_item["reward_3"]['Item'])
		end
	end
	
	sLuaApp:LuaErr("发送后面人的邮件")
	if next(join_player_list) then
		for k,v in pairs(join_player_list) do
			sMailSystem:SendMail( 0, "天下会武", tonumber(k), 1, "天下会武结束", "感谢您参与本次天下会武，本次天下会武您的积分为"..tostring(v).."分！", TianXiaHuiWu.end_mail_item["reward_other"]['Money'], TianXiaHuiWu.end_mail_item['reward_other']['Item']) 
		end
	end
	
	--清除匹配状态
	local startmatch_player_list = Data.TianXiaHuiWu['StartMatchPlayerList']
	if next(startmatch_player_list) then
		for k,v in pairs(startmatch_player_list) do
			if v then
				local player = sPlayerSystem:GetPlayerByGUID(k)
				if player then
					player:SetInt("isAutoMatching"..id, 0)
					player:SetInt("isMatching"..id, 0)
				end
			end
		end
	end
	
	-- 清空匹配池
	sLuaApp:LuaErr("清空匹配池")
	local matching_player_guid = sVarSystem:GetInt("PVPActivityMatching_"..id)
	if matching_player_guid ~= 0 then
		local matching_player = sPlayerSystem:GetPlayerByGUID(matching_player_guid)
		if matching_player then
			sLuaApp:LuaDbg("仍有在匹配的玩家")
			matching_player:SetInt("isAutoMatching"..id, 0)
			matching_player:SetInt("isMatching"..id, 0)
			TianXiaHuiWu.GetTeamInfo(matching_player)
		end
		sVarSystem:SetInt("PVPActivityMatching_"..id,0)
	end
	sLuaApp:LuaErr("天下会武活动结束 最后一行")
end

-- 玩家点击参与活动回调
function TianXiaHuiWu.OnJoin(id, player)
	--点参与直接打开活动界面 判断是否在副本中
	if Data.DungeonMap then
		local map_keyname = player:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if map_keyname == v then
				sLuaApp:NotifyTipsMsg(player, "当前正在副本活动中，无法参与天下会武活动")
				return false
			end
		end
	end
	
	if sLuaApp:IsActivityRunning(id) then
		local str=[[
			GUI.OpenWnd("WorldNoWarUI")
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")	
	end
	--引导玩家到活动npc
end

-- 玩家客户端查询数据回调
function TianXiaHuiWu.OnQuery(id, player)
	local join_num = player:GetDayInt("join_num_"..id)
	local active_num = player:GetDayInt("active_num_"..id)
	local show_item = TianXiaHuiWuConfig.ShowItem or "61024,61025,36013,20122"
	local str = join_num..":"..TianXiaHuiWu.join_max..":"..active_num..":"..TianXiaHuiWu.active_max..":"..show_item..":2:"..(ActivitySystem.Act_GetClassify("TianXiaHuiWu") or "2,3,5")
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--上线升级同步右上角图标
function TianXiaHuiWu.SyncSignState(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
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
				MainDynamicUI.World_PVP_STATE = ]]..is_open..[[
				MainDynamicUI.World_PVP_BtnRefresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	end
end

--客户端界面打开 
function TianXiaHuiWu.GetData(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	--匹配按钮
	local automatic_matching = 0
	local isMatching = 0
	local team = player:GetTeam()
	if team and not player:IsTeamLeader() then 
		automatic_matching = team:GetTeamLeader():GetInt("isAutoMatching"..id)
		isMatching = team:GetTeamLeader():GetInt("isMatching"..id)
	else
		automatic_matching = player:GetInt("isAutoMatching"..id)
		isMatching = player:GetInt("isMatching"..id)
	end 
	if automatic_matching == 1 then
		isMatching = 1
	end

	--礼包部分
	local rewardlist = {}
	local i = 1
	while TianXiaHuiWuConfig.Reward['reward_'..i] do		
		rewardlist[i]={}
		rewardlist[i]['typ']=TianXiaHuiWuConfig.Reward['reward_'..i]['typ']
		rewardlist[i]['num']=TianXiaHuiWuConfig.Reward['reward_'..i]['num']
		rewardlist[i]['img']="1900015300"
		rewardlist[i]['isget'] = player:GetDayInt("World_PVP_reward_record_reward_"..i)
		i = i + 1
	end
	 
	local player_show_string = TianXiaHuiWu.TeamInfo(player) --玩家与其队伍信息 table
	local player_integral = sRanklistSystem:GetRanklist( TianXiaHuiWu.rank_type, 1, 50) --排行榜前50
	--sLuaApp:LuaDbg("player_integral"..Lua_tools.serialize(player_integral))
	local Conti_History = player:GetDayInt( "TianXiaHuiWu_Wins_Conti_History")
	local wins = player:GetDayInt( "TianXiaHuiWu_Wins_Record")
	local fights = player:GetDayInt( "TianXiaHuiWu_Fight_Record")
	local str=""
	if Lua_tools then
		if sLuaApp:IsActivityRunning(id) then
			str = str..[[
				if WorldNoWarUI then
					WorldNoWarUI.PVPActivity_IsOpening = "ON"
					WorldNoWarUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
					WorldNoWarUI.RefreshMatchState(]]..isMatching ..[[)
					WorldNoWarUI.AwardInfo = ]]..Lua_tools.serialize(rewardlist)..[[
					WorldNoWarUI.RefreshRankList(]]..Lua_tools.serialize(player_integral)..[[)
					WorldNoWarUI.RefreshFightData(]]..wins..[[,]]..Conti_History..[[,]]..fights..[[)
					WorldNoWarUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
					WorldNoWarUI.Refresh(]]..id..[[)
				end	
				]]
		else--如果活动没开
			str = str..[[
				if WorldNoWarUI then
					WorldNoWarUI.PVPActivity_IsOpening = "OFF"
					WorldNoWarUI.RefreshTimetext(0)
					WorldNoWarUI.RefreshAutoMatchState(0)
					WorldNoWarUI.RefreshMatchState(0)
					WorldNoWarUI.AwardInfo = ]]..Lua_tools.serialize(rewardlist)..[[
					WorldNoWarUI.RefreshRankList(]]..Lua_tools.serialize(player_integral)..[[)
					WorldNoWarUI.RefreshFightData(]]..wins..[[,]]..Conti_History..[[,]]..fights..[[)
					WorldNoWarUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
					WorldNoWarUI.Refresh(]]..id..[[)
				end
				]]
		end
	end
	sLuaApp:ShowForm(player, "脚本表单", str)
	return ""
end


--判断是否发送奖励 判断胜场礼包和战斗场数礼包是否已经发过
function TianXiaHuiWu.GetReward(player, para)	
	local reward_record = player:GetDayInt("World_PVP_reward_record_"..para)--0 未领取 1 已领取
	if reward_record == 1 then
		sLuaApp:LuaErr(player:GetName().."已经领取过该礼包")
	else
		player:SetDayInt("World_PVP_reward_record_"..para, 1)
		if TianXiaHuiWuConfig.Reward[para] then
			TianXiaHuiWu.RewardGive(player, para)
			TianXiaHuiWu.GetData(player)
		end
	end
end	

--发奖励 
function TianXiaHuiWu.RewardGive(player, para)
	local tb_reward = TianXiaHuiWuConfig.Reward[para]
	if tb_reward then
		-- +exp
		local add_exp = tb_reward['Exp']
		if add_exp and add_exp ~= 0 then
			local res_exp = TianXiaHuiWu.RewardConfigToNmber(player, add_exp)
			player:AddExp(res_exp, "system", "天下会武活动", "礼包"..para)
		end
		-- +money
		local add_money_type = tb_reward['MoneyType']
		local add_money_val = tb_reward['MoneyVal']
		if add_money_type and add_money_val and add_money_val ~= 0 then
			local res_money = TianXiaHuiWu.RewardConfigToNmber(player, add_money_val)
			Lua_tools.AddMoney(player, add_money_type, res_money, "system", "天下会武活动", "礼包"..para)
		end
		-- +帮贡
		local add_contribution = tb_reward['Contribution']
		if add_contribution and add_contribution ~= 0 then
			local res_contribution = TianXiaHuiWu.RewardConfigToNmber(player, add_contribution)
			player:AddGuildContribute(res_contribution, "system", "天下会武活动", "礼包"..para)
			sLuaApp:NotifyTipsMsg(player, "获得了"..add_contribution.."点帮贡！")
		end
		-- +帮派资金
		local add_guild_gold = tb_reward['GuildGold']
		if add_guild_gold and add_guild_gold ~= 0 then
			local res_guild_gold = TianXiaHuiWu.RewardConfigToNmber(player, add_guild_gold)
			player:AddGuildFund(res_guild_gold, "system", "天下会武活动", "礼包"..para)
		end
		-- +固定物品
		local item_list = tb_reward['Item']
		if item_list then
			Lua_tools.AddItem(player, item_list, "system", "天下会武活动", "礼包"..para)
		end
	end
end

--奖励配置表转数字
function TianXiaHuiWu.RewardConfigToNmber(player, add_num)
	local res_num = 0
	local str_factor = [[
		local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
		local wins = ]]..player:GetDayInt("TianXiaHuiWu_Wins_Conti")..[[
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
function TianXiaHuiWu.TeamInfo(player)
	local player_show_string = {}
	--倒计时动画需要的
	for k,v in pairs(TianXiaHuiWu.ReturnPlayerActivityTeam(player)) do
		player_show_string[k]={}
		table.insert( player_show_string[k], v:GetId())
		table.insert( player_show_string[k], VipIngotTrace.GetPlayerName(v))
		table.insert( player_show_string[k], v:GetAttr(ROLE_ATTR_JOB1 or 3))
		table.insert( player_show_string[k], v:GetAttr(ROLE_ATTR_LEVEL))
		table.insert( player_show_string[k], v:GetAttr(ROLE_ATTR_RACE))
		table.insert( player_show_string[k], v:GetAttr(ROLE_ATTR_VIP))
		table.insert( player_show_string[k], v:GetAttr(ROLE_ATTR_FIGHT_VALUE))
	end
	
	--加入参战侍从
	local count = #player_show_string
	local guard_tb = player:GetGuardContainer():GetGuards()
	local infonum = 1
	if guard_tb and next(guard_tb) then
		for k,v in ipairs(guard_tb) do 
			if v:IsLineup() then
				if infonum + count <= 5 then
					player_show_string[infonum+count] = {}
					table.insert(player_show_string[infonum+count], v:GetId())
					table.insert(player_show_string[infonum+count], v:GetName())
					table.insert(player_show_string[infonum+count], v:GetAttr(ROLE_ATTR_ROLE))
					table.insert(player_show_string[infonum+count], v:GetAttr(ROLE_ATTR_LEVEL))
					table.insert(player_show_string[infonum+count], v:GetAttr(ROLE_ATTR_RACE))
					table.insert(player_show_string[infonum+count], v:GetAttr(ROLE_ATTR_VIP))
					table.insert(player_show_string[infonum+count], v:GetAttr(ROLE_ATTR_FIGHT_VALUE))
					infonum = infonum + 1
				end
			end
		end
	end
	
	return player_show_string
end

--发送队伍信息 是否在匹配 自动匹配 
function TianXiaHuiWu.GetTeamInfo(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local player_show_string = TianXiaHuiWu.TeamInfo(player)
	local automatic_matching = player:GetInt("isAutoMatching"..id)
	local isMatching = player:GetInt("isMatching"..id)
	sLuaApp:LuaDbg("automatic_matching"..automatic_matching)
	sLuaApp:LuaDbg("isMatching"..isMatching)
	if automatic_matching == 1 then
		isMatching = 1
	end
	if Lua_tools then
		local str = [[
			if WorldNoWarUI then
				WorldNoWarUI.RefreshCurrentTeamInfo(]]..Lua_tools.serialize(player_show_string)..[[)
				WorldNoWarUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
				WorldNoWarUI.RefreshMatchState(]]..isMatching ..[[)
			end
		]]
		
		for k,v in ipairs(TianXiaHuiWu.ReturnPlayerActivityTeam(player)) do
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
	end
end

--传给客户端匹配状态  队长点开始结束匹配按钮时 刷新全队匹配按钮
function TianXiaHuiWu.GetMatchStatus(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local automatic_matching = player:GetInt("isAutoMatching"..id)
	local isMatching = player:GetInt("isMatching"..id)
	if automatic_matching == 1 then
		isMatching = 1
	end
	
	local str = [[
		if WorldNoWarUI then
			WorldNoWarUI.RefreshAutoMatchState(]]..automatic_matching ..[[)
			WorldNoWarUI.RefreshMatchState(]]..isMatching..[[)
		end
	]]
	
	for k,v in ipairs(TianXiaHuiWu.ReturnPlayerActivityTeam(player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
end

--准备战斗 从匹配系统进
function TianXiaHuiWu.ReadyFight( first_player, second_player)--单人或队长
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if id == 0 then
		return
	end
	local first_fight_state = first_player:IsFightState()
	local second_fight_state = second_player:IsFightState()
	if first_fight_state then
		first_player:SetInt("TianXiaHuiWu_match_timer", 0)
		first_player:SetInt("TianXiaHuiWu_auto_match_timer", 0)
		first_player:SetInt("isMatching"..id, 0)
		first_player:SetInt("isAutoMatching"..id, 0)
		sLuaApp:NotifyTipsMsg(first_player, "正在战斗中，无法进入天下会武战斗")
	end
	if second_fight_state then
		second_player:SetInt("TianXiaHuiWu_match_timer", 0)
		second_player:SetInt("TianXiaHuiWu_auto_match_timer", 0)
		second_player:SetInt("isMatching"..id, 0)
		second_player:SetInt("isAutoMatching"..id, 0)
		sLuaApp:NotifyTipsMsg(second_player, "正在战斗中，无法进入天下会武战斗")
	end
	if first_fight_state and not second_fight_state then
		PVPActivityMatch.StartMatch(second_player, 0, id)
	end
	if not first_fight_state and second_fight_state then
		PVPActivityMatch.StartMatch(first_player, 0, id)
	end
	
	if not first_fight_state and not second_fight_state then
		first_player:SetInt("TianXiaHuiWu_match_timer", 0)
		first_player:SetInt("TianXiaHuiWu_auto_match_timer", 0)
		second_player:SetInt("TianXiaHuiWu_match_timer", 0)
		second_player:SetInt("TianXiaHuiWu_auto_match_timer", 0)
		
		sLuaApp:LuaDbg("进入ReadyFight")
		first_player:SetInt("isMatching"..id, 0)--不在匹配状态
		first_player:SetInt("PVPFightReady"..id, 1)--在准备战斗状态

		second_player:SetInt("isMatching"..id, 0)
		second_player:SetInt( "PVPFightReady"..id, 1)

		TianXiaHuiWu.GetMatchStatus(first_player)
		TianXiaHuiWu.GetMatchStatus(second_player)
		
		if first_player:GetInt("Act_Chikings_Hp_Max") ~= 0 or second_player:GetInt("Act_Chikings_Hp_Max") ~= 0 then
			sLuaApp:NotifyTipsMsg(first_player, "当前无法进入天下会武战斗")
			sLuaApp:NotifyTipsMsg(second_player, "当前无法进入天下会武战斗")
			
			if first_player:GetType() == GUID_PLAYER then
				second_player:SetInt( "PVPFightReady"..id, 0)
			else
				sRobotSystem:DestroyRobot(first_player)
			end
			
			if second_player:GetType() == GUID_PLAYER then
				second_player:SetInt( "PVPFightReady"..id, 0)
			else
				sRobotSystem:DestroyRobot(second_player)
			end
			return
		end

		TianXiaHuiWu.ShowCountdown(first_player,second_player)--给双方放倒计时
		sLuaTimerSystem:AddTimer (TianXiaHuiWu.countdown_time*1000,1,"TianXiaHuiWu.StartFight", ""..first_player:GetGUID() ..","..second_player:GetGUID()..","..id)--倒计时结束后开打
	end
end

-- 通知前端播放过场动画 321那个 
function TianXiaHuiWu.ShowCountdown(first_player,second_player)
	local first_team_info = TianXiaHuiWu.TeamInfo(first_player)
	local second_team_info = TianXiaHuiWu.TeamInfo(second_player)
	
	local str=""
	if Lua_tools then
		str=str..[[
			GUI.OpenWnd("FactionFightBtnUI")
			if FactionFightBtnUI then
				FactionFightBtnUI.RefreshPlayersInfo(]]..TianXiaHuiWu.countdown_time..[[,]]..Lua_tools.serialize(first_team_info)..[[,]]..Lua_tools.serialize(second_team_info)..[[)
				FactionFightBtnUI.IsWorldPVPFight = 1
			end	
			]]
	end
	for k,v in ipairs(TianXiaHuiWu.ReturnPlayerActivityTeam(first_player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
	for k,v in ipairs(TianXiaHuiWu.ReturnPlayerActivityTeam(second_player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
end

--开始战斗
function TianXiaHuiWu.StartFight(timer_guid, params)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local spl= sLuaApp:StrSplit(params,",")

	spl[1] = tonumber(spl[1])
	spl[2] = tonumber(spl[2])
	spl[3] = tonumber(spl[3])
	local first_player = sPlayerSystem:GetPlayerByGUID(spl[1])
	local second_player = sPlayerSystem:GetPlayerByGUID(spl[2])
	
	if id == 0 then
		if first_player then
			sLuaApp:NotifyTipsMsg(first_player, "活动已结束")
			first_player:SetInt( "PVPFightReady"..spl[3],0)
		end
		if second_player then
			sLuaApp:NotifyTipsMsg(first_player, "活动已结束")
			second_player:SetInt( "PVPFightReady"..spl[3],0)
		end
		return
	end
	
	if not first_player or not second_player then
		if first_player then
			if first_player:GetType() == GUID_PLAYER then
				sLuaApp:NotifyTipsMsg(first_player, "您的对手不战而降，逃之夭夭了")
				first_player:SetInt( "PVPFightReady"..id,0)
			else
				sRobotSystem:DestroyRobot(second_player)
			end
			return 
		elseif second_player then
			if second_player:GetType() == GUID_PLAYER then
				sLuaApp:NotifyTipsMsg(second_player, "您的对手不战而降，逃之夭夭了")
				second_player:SetInt( "PVPFightReady"..id,0)
			else
				sRobotSystem:DestroyRobot(second_player)
			end
			return 
		end
		return
	end
	
	first_player:SetInt( "PVPFightReady"..id,0)
	second_player:SetInt( "PVPFightReady"..id,0)
	
	--记下对手 战斗完回调用
	first_player:SetDayInt("TianXiaHuiWu_opponent", spl[2])
	second_player:SetDayInt("TianXiaHuiWu_opponent", spl[1])

	
	sFightSystem:StartTagPVP(first_player, second_player, TianXiaHuiWu.FightTag, "", "", "")
	sLuaApp:LuaDbg("天下会武战斗开启")
	
	-- 算rank分用
	
	first_player:SetDayInt( "TianXiaHuiWuOpponentScore", TianXiaHuiWu.GetAvergeScore(second_player))
	second_player:SetDayInt( "TianXiaHuiWuOpponentScore", TianXiaHuiWu.GetAvergeScore(first_player))
end

--获取队伍平均分
function TianXiaHuiWu.GetAvergeScore(player)
	local memberlist = TianXiaHuiWu.ReturnPlayerActivityTeam(player)
	local allScore = 0
	for k,v in ipairs(memberlist) do
		local addnum = v:GetDayInt("TianXiaHuiWuScore")
		if addnum == 0 then
			addnum = TianXiaHuiWuConfig.DefaultRating
		end
		allScore = allScore + addnum
	end
	local avergeScore = math.ceil(allScore/#memberlist) 
	sLuaApp:LuaDbg("平均分："..avergeScore)
	return avergeScore
end

--战斗完成 设置活动回调参数 记录胜负场 编写战报 顺便把奖励发了
function TianXiaHuiWu.FightCallBack(player,is_win)
	if player:GetType() ~= GUID_PLAYER then
		--sRobotSystem:DestroyRobot(player)
		return 
	end
	if player:GetTeam() and not player:IsTeamLeader() then return end 
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	sLuaApp:LuaDbg("天下会武战斗回调"..player:GetName())
	
	local opponent = sPlayerSystem:GetPlayerByGUID( player:GetDayInt("TianXiaHuiWu_opponent"))
	local winnerList = {}
	local loserList = {}
	local drawList = {}
	--if true == is_win then-- 胜利
	if is_win == 2 then-- 胜利
		winnerList = TianXiaHuiWu.ReturnPlayerActivityTeam(player)
		loserList = TianXiaHuiWu.ReturnPlayerActivityTeam(opponent)
	--elseif false == is_win then--输了
	else
		loserList = TianXiaHuiWu.ReturnPlayerActivityTeam(player)	
		winnerList = TianXiaHuiWu.ReturnPlayerActivityTeam(opponent)
	end
	if winnerList[1]:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(winnerList[1])
	end
	if loserList[1]:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(loserList[1])
	end
	
	--if true == is_win then
	if is_win == 2 then
		if next(winnerList) then
			for k,v in ipairs(winnerList) do
				if v:GetType() == GUID_PLAYER then 
					local report_str="你"..(v:GetTeam() and "的队伍" or "").."战胜了"..VipIngotTrace.GetPlayerName(loserList[1])..(loserList[1]:GetTeam() and "的队伍" or "")
					TianXiaHuiWu.SendReport(v,report_str)
				
					local wins = v:GetDayInt( "TianXiaHuiWu_Wins_Record")+1 --当日胜场
					local fights = v:GetDayInt( "TianXiaHuiWu_Fight_Record")+1 --战斗场数
					local wins_conti = v:GetDayInt( "TianXiaHuiWu_Wins_Conti")+1 --目前连胜场
					local wins_history = v:GetDayInt( "TianXiaHuiWu_Wins_Conti_History")--最高连胜场
					v:SetDayInt( "TianXiaHuiWu_Wins_Record", wins)
					v:SetDayInt( "TianXiaHuiWu_Fight_Record", fights)
					v:SetDayInt( "TianXiaHuiWu_Wins_Conti", wins_conti)
					v:SetDayInt( "TianXiaHuiWu_Lose_Conti", 0)--目前连败场
					if wins_conti>wins_history then
						v:SetDayInt( "TianXiaHuiWu_Wins_Conti_History", wins_conti)
					end
					if wins_conti>wins_history or wins_conti>=3 then --超过记录或三连胜
						TianXiaHuiWu.SendReport(v,"你获得了"..wins_conti.."连胜！")
					end
					--单场奖励
					TianXiaHuiWu.RewardGive(v, "winner_reward")
					--战斗场数奖励和胜场数奖励
					if TianXiaHuiWuConfig then
						for a,b in pairs(TianXiaHuiWuConfig.Reward) do
							if b.typ and b.typ == "fight" and b.num == fights then
								TianXiaHuiWu.GetReward(v, a)
							end
							if b.typ and b.typ == "win" and b.num == wins then
								TianXiaHuiWu.GetReward(v, a)
							end
						end
					end
					--排行榜记录胜场数
					sLuaApp:LuaDbg("胜方队长分数记录："..winnerList[1]:GetDayInt("TianXiaHuiWuOpponentScore"))
					TianXiaHuiWu.UpdateRank(v, true, winnerList[1]:GetDayInt("TianXiaHuiWuOpponentScore"))
				end
			end
		end
	-- end
	else
	-- if false == is_win then
		if next(loserList) then
			for k,v in ipairs(loserList) do
				if v:GetType() == GUID_PLAYER then 
					local report_str=""..VipIngotTrace.GetPlayerName(winnerList[1])..(winnerList[1]:GetTeam() and "的队伍" or "").."战胜了你"..(v:GetTeam() and "的队伍" or "")
					TianXiaHuiWu.SendReport(v,report_str)
				
					local fights = v:GetDayInt( "TianXiaHuiWu_Fight_Record") + 1
					local lose_conti = v:GetDayInt( "TianXiaHuiWu_Lose_Conti") + 1
					v:SetDayInt( "TianXiaHuiWu_Fight_Record", fights)
					v:SetDayInt( "TianXiaHuiWu_Lose_Conti", lose_conti)
					v:SetDayInt( "TianXiaHuiWu_Wins_Conti", 0)
					--单场奖励
					TianXiaHuiWu.RewardGive(v, "loser_reward")	
					--战斗场数奖励
					if TianXiaHuiWuConfig then
						for a,b in pairs(TianXiaHuiWuConfig.Reward) do
							if b.typ and b.typ == "fight" and b.num == fights then
								TianXiaHuiWu.GetReward(v, a)
								break
							end
						end
					end
					--排行榜记录
					sLuaApp:LuaDbg("败方队长分数记录："..loserList[1]:GetDayInt("TianXiaHuiWuOpponentScore"))
					TianXiaHuiWu.UpdateRank(v, false, loserList[1]:GetDayInt("TianXiaHuiWuOpponentScore")) 
				end
			end
		end
	end
	
	local playerList = TianXiaHuiWu.ReturnPlayerActivityTeam(player)	
	if Data.TianXiaHuiWu['JoinPlayerList'] then		
		for _,v in ipairs(playerList) do
			local join_num = v:GetDayInt("join_num_"..id) +1 --参与次数
			v:SetDayInt("join_num_"..id, join_num)
			
			local active = v:GetDayInt("active_num_"..id)--活跃值
			if active < TianXiaHuiWu.active_max then
				local active_sum = active + TianXiaHuiWu.active_add_num
				if active_sum > TianXiaHuiWu.active_max then
					v:SetDayInt("active_num_"..id, TianXiaHuiWu.active_max)
					ActivitySystem.AddActiveVal(v, TianXiaHuiWu.active_max - active)
				else
					v:SetDayInt("active_num_"..id, active_sum)
					ActivitySystem.AddActiveVal(v, TianXiaHuiWu.active_add_num)
				end
			end
			
			--存guid在key上 string
			Data.TianXiaHuiWu['JoinPlayerList'][tostring(v:GetGUID())] = player:GetDayInt("TianXiaHuiWuScore")
			--sLuaApp:LuaDbg(Lua_tools.serialize(Data.TianXiaHuiWu['JoinPlayerList']))
		end
	else 
		sLuaApp:LuaErr("JoinPlayerList不存在")
	end
	--判断进入自动匹配
	TianXiaHuiWu.JudgeStartAutoMacth(player)	
end

--战斗完发送战报
function TianXiaHuiWu.SendReport(player,report_str)
	if player:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(player)
		return 
	end
	local str = [[
		if WorldNoWarUI then
			WorldNoWarUI.AddReport("]]..report_str..[[")
			GUI.OpenWnd("WorldNoWarUI")
		end
	]]
	--sLuaApp:LuaDbg(player:GetName()..report_str)
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--战斗完updata排行榜
function TianXiaHuiWu.UpdateRank(player, iswin, ratingB)
	if player:GetType() ~= GUID_PLAYER then
		sRobotSystem:DestroyRobot(player)
		return 
	end
	local begin_ratingA = player:GetDayInt("TianXiaHuiWuScore")
	sLuaApp:LuaDbg("对方积分："..ratingB)
	local begin_ratingB = ratingB
	if begin_ratingA == 0 then
		begin_ratingA = TianXiaHuiWuConfig.DefaultRating
	end
	if begin_ratingB == 0 then
		begin_ratingB = TianXiaHuiWuConfig.DefaultRating
	end
	
	local score_adjust = iswin and 1 or 0
	local computeK = 36
	if begin_ratingA >= 1400 + TianXiaHuiWuConfig.DefaultRating then
		computeK = 16
	elseif begin_ratingA >= 700 + TianXiaHuiWuConfig.DefaultRating then
		computeK = 24
	end
	local add_score = math.floor(computeK * (score_adjust - 1/(1 + 10 ^ ((begin_ratingB - begin_ratingA) / 600))))
	local end_score = begin_ratingA + add_score
	--sLuaApp:LuaErr("天下会武 玩家："..player:GetName().."战斗前积分："..begin_ratingA.." 积分变化值："..add_score.." 战斗后积分："..end_score)
	player:SetDayInt("TianXiaHuiWuScore", end_score)
	--player:SetDayInt("TianXiaHuiWuOpponentScore", 0)
	if add_score >= 0 then
		sLuaApp:NotifyTipsMsg(player, "获得"..add_score.."分，当前积分： ".. end_score)
	else
		sLuaApp:NotifyTipsMsg(player, "失去"..math.abs(add_score).."分，当前积分： ".. end_score)
	end
	sRanklistSystem:UpdateRanklist( TianXiaHuiWu.rank_type, player:GetGUID(), end_score, player:GetName(), ""..player:GetAttr(ROLE_ATTR_FIGHT_VALUE))
	
	-- local value = 0
	-- if iswin then 
		-- value = 1
	-- end
	-- local rank_tb=sRanklistSystem:GetRank( TianXiaHuiWu.rank_type, player:GetGUID())
	-- if next(rank_tb) then
		-- value = rank_tb[2] + value
	-- end
	-- sRanklistSystem:UpdateRanklist( TianXiaHuiWu.rank_type, player:GetGUID(), value, player:GetName(), ""..player:GetAttr(ROLE_ATTR_FIGHT_VALUE)) 
end

--判断是否进入自动匹配
function TianXiaHuiWu.JudgeStartAutoMacth(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if sLuaApp:IsActivityRunning (id) then 
		if not TianXiaHuiWu.CheckMatch(player) then 
			player:SetInt("isAutoMatching"..id, 0)
			TianXiaHuiWu.GetMatchStatus(player)
			return 
		end
		if not player:GetTeam() or player:IsTeamLeader() then
			if player:GetInt("isAutoMatching"..id)==1 then
				sLuaApp:LuaDbg("JudgeStartAutoMacth")
				player:SetInt("isMatching"..id, 1)--可以不要
				TianXiaHuiWu.StartMatch(player)
				--TianXiaHuiWu.GetMatchStatus(player)
			end
		end
	else
		player:SetInt("isAutoMatching"..id, 0)
		TianXiaHuiWu.GetMatchStatus(player)
	end
end

--发送tips
function TianXiaHuiWu.GetTips(player)
	local str = [[
		if WorldNoWarUI then
			WorldNoWarUI.RefreshHelpTip("]]..TianXiaHuiWuConfig.Tips..[[")
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end

--传礼包内容 客户端显示用
function TianXiaHuiWu.GetRewardInfo(player,reward_index)
	if TianXiaHuiWuConfig.Reward["reward_"..reward_index] then
		local wins = player:GetDayInt("TianXiaHuiWu_Wins_Conti")
		local str = [[
			if WorldNoWarUI then
				WorldNoWarUI.AddAwardDeatil(]]..reward_index..','..wins..','..'[['..Lua_tools.serialize(TianXiaHuiWuConfig.Reward["reward_"..reward_index])..']]'..[[)
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:LuaErr("GetRewardInfo：没这个表")
	end
end

--获取队伍中的有效玩家
function TianXiaHuiWu.ReturnPlayerActivityTeam(player)
	local memberlist = {}
	if player:GetTeam() then
		local team = player:GetTeam()
		memberlist = team:GetTeamMembers(false)
	else
		memberlist[1] = player
	end
	return memberlist
end

--判断能否点击匹配按钮  
function TianXiaHuiWu.CheckMatch(player)
	if Data.DungeonMap then
		local map_keyname = player:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if map_keyname == v then
				sLuaApp:NotifyTipsMsg(player, "当前正在副本中，无法进行匹配")
				return false
			end
		end
	end
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if id == 0 then
		sLuaApp:NotifyTipsMsg(player, "活动已结束，无法进行该操作")
		return
	end
	local activityData = ActivityConfig.GetById(id)
	for k,v in ipairs(TianXiaHuiWu.ReturnPlayerActivityTeam(player)) do
		if v:GetAttr(ROLE_ATTR_LEVEL) < tonumber(activityData.LevelMin) then
			sLuaApp:NotifyTipsMsg(player, "队伍成员等级不足".. activityData.LevelMin .."级，无法参与天下会武，请变强一些再来吧！")
			return false
		end
		if TianXiaHuiWu.join_max > 0 then
			if v:GetDayInt("join_num_"..id) >= TianXiaHuiWu.join_max then
				sLuaApp:NotifyTipsMsg(player, "队伍成员参与活动次数达到上限，无法继续参与天下会武！")
				return false
			end
		end
	end
	
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动已结束，无法进行该操作")
		return false
	end
		

	if player:GetTeam() then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "您不是队长，无法进行该操作")
			return false
		end
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，开始匹配失败")
		return false
	end
	if player:GetInt("Act_Chikings_Hp_Max") ~= 0 then
		sLuaApp:NotifyTipsMsg(player, "正在参与其他活动,无法进行天下会武匹配")
		return false
	end
	
	Data.TianXiaHuiWu['StartMatchPlayerList'][tostring(player:GetGUID())] = true
	sLuaApp:LuaDbg(Lua_tools.serialize(Data.TianXiaHuiWu['StartMatchPlayerList']))
	return true
end

function TianXiaHuiWu.CheckEndMatch(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if player:GetInt("PVPFightReady"..id) == 1 then
		sLuaApp:NotifyTipsMsg(player, "取消匹配失败，已经为你找到对手，即将进入战斗")
		return false
	end
	if player:GetTeam() then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "您不是队长，无法进行该操作")
			TianXiaHuiWu.GetMatchStatus(player)
			return false
		end
	end
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "正在战斗中，取消匹配失败")
		return false
	end
	
	Data.TianXiaHuiWu['StartMatchPlayerList'][tostring(player:GetGUID())] = false
	sLuaApp:LuaDbg(Lua_tools.serialize(Data.TianXiaHuiWu['StartMatchPlayerList']))
	return true
end

--创建基于玩家等级的随机机器人
function TianXiaHuiWu.RobotCreatAndStartMatch(player,timer,act_id)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if not sLuaApp:IsActivityRunning(id) then
		return
	end
	if player:IsFightState() then
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
function TianXiaHuiWu.StartMatch(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if not sLuaApp:IsActivityRunning(id) then
		return ""
	end
	local macth_time = sLuaApp:RandInteger(TianXiaHuiWu.macth_time[1],TianXiaHuiWu.macth_time[2])*1000
	local t_guid = sLuaTimerSystem:AddTimerEx(player, macth_time,1,"PVPActivityMatch.StartMatch", ""..id)
	--sLuaApp:LuaDbg("t_guid:"..t_guid)
	player:SetInt("TianXiaHuiWu_match_timer", t_guid)
	
	local robot_time = macth_time + 20000
	local robot_guid = sLuaTimerSystem:AddTimerEx(player, robot_time,1,"TianXiaHuiWu.RobotCreatAndStartMatch", ""..id)
	player:SetInt("TianXiaHuiWu_Robote_Match_Timer", robot_guid)

	if sLuaTimerSystem:HasTimer(t_guid) then
		TianXiaHuiWu.GetMatchStatus(player)
		return true
	else
		player:SetInt("isMatching"..id, 0)
		player:SetInt("isAutoMatching"..id, 0)
		TianXiaHuiWu.GetMatchStatus(player)
		return false
	end
	return false
end

--移除定时器或移出匹配池
function TianXiaHuiWu.EndMatch(player)	
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local t_guid = player:GetInt("TianXiaHuiWu_match_timer")
	local robot_guid = player:GetInt("TianXiaHuiWu_Robote_Match_Timer")
	if sLuaTimerSystem:HasTimer(robot_guid) then
		--sLuaApp:LuaDbg("移除创建机器人计时器")
		sLuaTimerSystem:DisableTimer(robot_guid)
		player:SetInt("TianXiaHuiWu_Robote_Match_Timer", 0)
	end
	if sLuaTimerSystem:HasTimer(t_guid) then--没有进入匹配池
		sLuaTimerSystem:DisableTimer(t_guid)
		player:SetInt("TianXiaHuiWu_match_timer", 0)
		TianXiaHuiWu.GetMatchStatus(player)
		
		return true
	else
		--已进入匹配池
		if PVPActivityMatch.EndMatch(player,id) then--结束匹配
			TianXiaHuiWu.GetMatchStatus(player)
			
			return true
		else
			--player:SetInt("isMatching"..id,1)
			TianXiaHuiWu.GetMatchStatus(player)
			return false
		end
	end
	return false
end

function TianXiaHuiWu.GetTeamInfoTimer(player, timer, params)--队伍发生变化 刷新
	TianXiaHuiWu.GetTeamInfo(player)
end

--设置队长前  取消匹配
function TianXiaHuiWu.on_pre_set_team_leader(player, team)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local old_leader = team:GetTeamLeader()
	old_leader:SetInt("isMatching"..id,0)
	old_leader:SetInt("isAutoMatching"..id,0)
	if TianXiaHuiWu.EndMatch(old_leader) then
		for k,v in pairs(TianXiaHuiWu.ReturnPlayerActivityTeam(old_leader)) do
			sLuaApp:NotifyTipsMsg(v, "队长更换，已取消匹配")
			sLuaTimerSystem:AddTimerEx(old_leader, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
		end
	end
	return true
end

--加入队伍 取消匹配
function TianXiaHuiWu.on_join_team(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	-- leader:SetInt("isMatching"..id,0)
	-- leader:SetInt("isAutoMatching"..id,0)
	player:SetInt("isMatching"..id,0)
	player:SetInt("isAutoMatching"..id,0)
	if TianXiaHuiWu.EndMatch(player) then
		for k,v in pairs(TianXiaHuiWu.ReturnPlayerActivityTeam(leader)) do
			sLuaApp:NotifyTipsMsg(v, "玩家加入队伍，已取消匹配")
			sLuaTimerSystem:AddTimerEx(leader, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
		end
	end
	return true
end

--离开队伍 取消匹配
function TianXiaHuiWu.on_leave_team(player)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	leader:SetInt("isMatching"..id,0)
	leader:SetInt("isAutoMatching"..id,0)
	if TianXiaHuiWu.EndMatch(leader) then
		for k,v in pairs(TianXiaHuiWu.ReturnPlayerActivityTeam(leader)) do
			sLuaApp:NotifyTipsMsg(v, "玩家离开队伍，已取消匹配")
			sLuaTimerSystem:AddTimerEx(player, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
			sLuaTimerSystem:AddTimerEx(leader, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
		end
	end
	return true
end

--暂离队伍 取消匹配
function TianXiaHuiWu.on_temp_leave(player, templeave)
	local id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	sLuaApp:LuaDbg("TianXiaHuiWu.on_temp_leave")
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	leader:SetInt("isMatching"..id,0)
	leader:SetInt("isAutoMatching"..id,0)
	if TianXiaHuiWu.EndMatch(leader) then
		for k,v in pairs(TianXiaHuiWu.ReturnPlayerActivityTeam(leader)) do
			sLuaApp:NotifyTipsMsg(v, "玩家暂离队伍，已取消匹配")		
		end
	end
	sLuaTimerSystem:AddTimerEx(player, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
	sLuaTimerSystem:AddTimerEx(leader, 300,1,"TianXiaHuiWu.GetTeamInfoTimer", "")
	return true
end

function TianXiaHuiWu.Initialization()
	--初始化 发邮件需要的item表 keyname==>id
	if not TianXiaHuiWuConfig then
		require("activity/TianXiaHuiWuConfig")
	end
	TianXiaHuiWu.end_mail_item={}
	if TianXiaHuiWuConfig.End_Mail_Reward then
		for k,v in pairs(TianXiaHuiWuConfig.End_Mail_Reward) do
			TianXiaHuiWu.end_mail_item[k] = {}
			TianXiaHuiWu.end_mail_item[k]['Item'] = {}
			if v['Item'] then
				for a,b in ipairs(v['Item']) do
					if type(b) == "string" then
						local itemData = ItemConfig.GetByKeyName(b)
						table.insert(TianXiaHuiWu.end_mail_item[k]['Item'], itemData.Id)
						local num = v['Item'][a+1]
						local bind = v['Item'][a+2]
						if type(num) == "number" and type(bind) == "number" then
							table.insert(TianXiaHuiWu.end_mail_item[k]['Item'], num)
							table.insert(TianXiaHuiWu.end_mail_item[k]['Item'], bind)
						end
					end
				end
			end
			TianXiaHuiWu.end_mail_item[k]['Money'] = {}
			if Lua_tools then
				if v['MoneyType'] and v['MoneyVal'] and v['MoneyVal'] > 0 then
					table.insert(TianXiaHuiWu.end_mail_item[k]['Money'], Lua_tools.MoneyAttrs[v['MoneyType']])
					table.insert(TianXiaHuiWu.end_mail_item[k]['Money'], v['MoneyVal'])
				end
			else
				sLuaApp:LuaErr("缺少Lua_tools")
			end
		end
	else
		sLuaApp:LuaErr("缺少TianXiaHuiWuConfig.End_Mail_Reward")
	end
end
TianXiaHuiWu.Initialization()