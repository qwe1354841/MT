--帮派竞技活动脚本
Act_BangZhan = {}
Act_BangZhan.FightTag = 92212
Act_BangZhan.DefaultPlayerRating = 200	--玩家初始分数
Act_BangZhan.DefaultGuildRating = 2000	--帮派初始分数
Act_BangZhan.AddGuildRating = 200		--胜利后帮派增加分数
Act_BangZhan.AddPlayerRating = 100		--胜利后玩家增加分数
Act_BangZhan.CutGuildRating = 20		--失败后帮派减少分数
Act_BangZhan.CutPlayerRating = 10		--失败后玩家减少分数
Act_BangZhan.Level = 40					--限制等级
Act_BangZhan.ID = 67					--活动id
Act_BangZhan.ShowItem = "61024,61025"
Act_BangZhan.Reward = {
	['First'] = {
		Exp = "return 10000",
		Bind_Gold = "return 50000+level*1000",
		Contribution = "return 1000",
		GuildFund = "return 1000",
		['ItemList'] = {"强化打造石1",1,1},
	},
	['Fifth'] = {
		Exp = "return 10000",
		Bind_Gold = "return 50000+level*1000",
		Contribution = "return 1000",
		GuildFund = "return 1000",
		['ItemList'] = {"强化打造石1",1,1},
	},
	['Player'] = {
		[1] = {
			Exp = "return 10000",
			Bind_Gold = "return 50000+level*1000",
			['ItemList'] = {4001,1,1},
		},
		[2] = {
			Exp = "return 10000",
			Bind_Gold = "return 30000+level*600",
			['ItemList'] = {4001,1,1},
		},
		[3] = {
			Exp = "return 0",
			Bind_Gold = "return 20000+level*400",
			['ItemList'] = {4001,1,1},
		},
	},
	['Guild'] = {
		[1] = {
			Exp = "return 100000",
			Bind_Gold = "return 50000+guild_level*1000",
			['ItemList'] = {4001,1,1},
		},
		[2] = {
			Exp = "return 100000",
			Bind_Gold = "return 30000+guild_level*600",
			['ItemList'] = {4001,1,1},
		},
		[3] = {
			Exp = "return 10000",
			Bind_Gold = "return 20000+guild_level*400",
			['ItemList'] = {4001,1,1},
		},
	},
}
-- 活动开始前回调
function Act_BangZhan.OnDeclare(id, seconds)
    
end
-- 活动开始回调
function Act_BangZhan.OnStart(id, is_normal)
	--设置排行榜最大长度
	sRanklistSystem:SetRanklistMaxSize(RankingListSystem.Config['帮战帮派排行榜'],2000)
	sRanklistSystem:SetRanklistMaxSize(RankingListSystem.Config['帮战个人排行榜'],2000)
	if sDBVarSystem:GetInt("Act_BangZhan_Time") ~= sLuaApp:DaySinceEpoch(0) then
		--清理榜单
		sRanklistSystem:ClearRanklist(RankingListSystem.Config['帮战帮派排行榜'])
		sRanklistSystem:ClearRanklist(RankingListSystem.Config['帮战个人排行榜'])
		sDBVarSystem:SetInt("Act_BangZhan_Time",sLuaApp:DaySinceEpoch(0),0)
	end
	--清理匹配池子
	sVarSystem:SetInt("Act_BangZhan_Pool",0)
	--全服广播
	local str = "帮派竞技开始了！"
	sLuaApp:NotifyTopMsgToAll(1, str)
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.GuildFight_PVP_STATE = 1
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)
end
-- 活动结束回调
function Act_BangZhan.OnStop(id)
	local str = "帮派竞技结束了！"
	sLuaApp:NotifyTopMsgToAll(1, str)
    Act_BangZhan.SendRewardEmail('Player')
	Act_BangZhan.SendRewardEmail('Guild')
	local str = [[
		if MainDynamicUI then
			MainDynamicUI.GuildFight_PVP_STATE = 0
			MainDynamicUI.World_PVP_BtnRefresh()
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", str)
end
-- 玩家点击参与活动回调
function Act_BangZhan.OnJoin(id, player)
	if not player:GetGuild() then
		sLuaApp:NotifyTipsMsg(player, "你还没有帮派。")
		return
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
		sLuaApp:NotifyTipsMsg(player, "等级不够")
		return
	end
	local team = player:GetTeam()
	if team then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才可以操作。")
			return
		end
		for k,v in pairs(team:GetTeamMembers(true)) do
			if sTeamSystem:IsTempLeave(v) then
				sLuaApp:NotifyTipsMsg(player, "队伍中有暂离成员。")
				return
			end
			if not v:GetGuild() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
			if player:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
		end
	end
	local FormStr = [[
		GUI.DestroyWnd('ActivityPanelUI')
		CL.StartMove(20068)
	]]
		
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
-- 玩家客户端查询数据回调
function Act_BangZhan.OnQuery(id, player)
	local str = [[0:0:0:0:]]..Act_BangZhan.ShowItem..[[:1:]]..ActivitySystem.Act_GetClassify("Act_BangZhan") or "2,3,5"
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end
function Act_BangZhan.Search(player)
	local team = player:GetTeam()
	if not player:GetGuild() then
		sLuaApp:NotifyTipsMsg(player, "你还没有帮派。")
		return
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
		sLuaApp:NotifyTipsMsg(player, "等级不够")
		return
	end
	if team then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才可以操作。")
			return
		end
		for k,v in pairs(team:GetTeamMembers(true)) do
			if v:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
				sLuaApp:NotifyTipsMsg(player, "队伍中有玩家等级不够")
				return
			end
			if sTeamSystem:IsTempLeave(v) then
				sLuaApp:NotifyTipsMsg(player, "队伍中有暂离成员。")
				return
			end
			if not v:GetGuild() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
			if player:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
		end
	end
	if player:GetTempInt("Act_BangZhan_Search_State") == 2 then
		sLuaApp:NotifyTipsMsg(player, "你已经在连续匹配中")
		return
	end
	if player:GetTempInt("Act_BangZhan_Timer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player:GetTempInt('Act_BangZhan_Timer')) then
			sLuaTimerSystem:DisableTimer(player:GetTempInt('Act_BangZhan_Timer'))
		end
		player:SetTempInt("Act_BangZhan_Timer",0)
	end
	if player:GetTempInt("Act_BangZhan_Search_State") == 1 then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		sLuaApp:NotifyTipsMsg(player, "取消匹配")
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
	if timer then
		sLuaApp:NotifyTipsMsg(player, "开始匹配")
		player:SetTempInt("Act_BangZhan_Search_State",1)
		player:SetTempInt("Act_BangZhan_Timer",timer)
		Act_BangZhan.Refresh_Search_State(player)
	end
end

--刷新客户端发送匹配状态
function Act_BangZhan.Refresh_Search_State(player)
	local FormStr = [[
		if FactionFightUI then
			FactionFightUI.search_state = ]]..player:GetTempInt("Act_BangZhan_Search_State")..[[
			FactionFightUI.RefreshSearchStr()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end

function Act_BangZhan.Search_EX(player, tinmer, p)
	if not sLuaApp:IsActivityRunning(Act_BangZhan.ID) then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		player:SetTempInt("Act_BangZhan_Timer",0)
		local other_player = sPlayerSystem:GetPlayerByGUID(sVarSystem:GetInt("Act_BangZhan_Pool"))
		if other_player then
			other_player:SetTempInt("Act_BangZhan_Search_State",0)
		end
		sVarSystem:SetInt("Act_BangZhan_Pool",0)
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	if player:GetTempInt("Act_BangZhan_Timer") ~= tonumber(tinmer) then
		return
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		player:SetTempInt("Act_BangZhan_Timer",0)
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	if not player:GetGuild() then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		player:SetTempInt("Act_BangZhan_Timer",0)
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	if player:IsFightState() then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		player:SetTempInt("Act_BangZhan_Timer",0)
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	local team = player:GetTeam()
	if team then
		if not player:IsTeamLeader() then
			player:SetTempInt("Act_BangZhan_Search_State",0)
			player:SetTempInt("Act_BangZhan_Timer",0)
			Act_BangZhan.Refresh_Search_State(player)
			return
		end
		for k,v in pairs(team:GetTeamMembers(true)) do
			if v:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
				sLuaApp:NotifyTipsMsg(player, "队伍中有玩家等级不够")
				player:SetTempInt("Act_BangZhan_Search_State",0)
				player:SetTempInt("Act_BangZhan_Timer",0)
				Act_BangZhan.Refresh_Search_State(player)
				return
			end
			if sTeamSystem:IsTempLeave(v) then
				sLuaApp:NotifyTipsMsg(player, "队伍中有暂离成员。")
				player:SetTempInt("Act_BangZhan_Search_State",0)
				player:SetTempInt("Act_BangZhan_Timer",0)
				Act_BangZhan.Refresh_Search_State(player)
				return
			end
			if not v:GetGuild() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				player:SetTempInt("Act_BangZhan_Search_State",0)
				player:SetTempInt("Act_BangZhan_Timer",0)
				Act_BangZhan.Refresh_Search_State(player)
				return
			end
			if player:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				player:SetTempInt("Act_BangZhan_Search_State",0)
				player:SetTempInt("Act_BangZhan_Timer",0)
				Act_BangZhan.Refresh_Search_State(player)
				return
			end
		end
	end
	local player_pool = sVarSystem:GetInt("Act_BangZhan_Pool")
	if player_pool == 0 then
		sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
		return
	end
	local player_1 = sPlayerSystem:GetPlayerByGUID(sVarSystem:GetInt("Act_BangZhan_Pool"))
	if not player_1 then
		sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
		return
	end
	if not player_1:GetGuild() then
		sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
		return
	end
	if player_1:GetGuild():GetGUID() == player:GetGuild():GetGUID() then
		sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
		return
	end
	if player_1:IsFightState() then
		sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
		return
	end
	team = player_1:GetTeam()
	if team then
		if not player_1:IsTeamLeader() then
			sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
			local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
			if timer then
				player:SetTempInt("Act_BangZhan_Timer",timer)
			end
			return
		end
		for k,v in pairs(team:GetTeamMembers(true)) do
			if v:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
				sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
				local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
				if timer then
					player:SetTempInt("Act_BangZhan_Timer",timer)
				end
				return
			end
			if sTeamSystem:IsTempLeave(v) then
				sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
				local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
				if timer then
					player:SetTempInt("Act_BangZhan_Timer",timer)
				end
				return
			end
			if not v:GetGuild() then
				sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
				local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
				if timer then
					player:SetTempInt("Act_BangZhan_Timer",timer)
				end
				return
			end
			if player_1:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
				sVarSystem:SetInt("Act_BangZhan_Pool",player:GetGUID())
				local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
				if timer then
					player:SetTempInt("Act_BangZhan_Timer",timer)
				end
				return
			end
		end
	end

	Act_BangZhan.ShowCountdown(player,player_1)--给双方放倒计时
	if player:GetTempInt("Act_BangZhan_Timer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player:GetTempInt('Act_BangZhan_Timer')) then
			sLuaTimerSystem:DisableTimer(player:GetTempInt('Act_BangZhan_Timer'))
		end
	end
	if player_1:GetTempInt("Act_BangZhan_Timer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player_1:GetTempInt('Act_BangZhan_Timer')) then
			sLuaTimerSystem:DisableTimer(player_1:GetTempInt('Act_BangZhan_Timer'))
		end
	end
	player:SetTempInt("Act_BangZhan_Timer",0)
	player_1:SetTempInt("Act_BangZhan_Timer",0)
	player:SetDayString("Act_BangZhan_Name",player_1:GetName())
	player_1:SetDayString("Act_BangZhan_Name",player:GetName())
	sVarSystem:SetInt("Act_BangZhan_Pool",0)
	sLuaTimerSystem:AddTimer(3*1000,1, "Act_BangZhan.StartFight", ""..player:GetGUID() ..","..player_1:GetGUID())
end
function Act_BangZhan.StartFight(timer_guid, params)
	local spl= sLuaApp:StrSplit(params,",")
	spl[1] = tonumber(spl[1])
	spl[2] = tonumber(spl[2])
	local player = sPlayerSystem:GetPlayerByGUID(spl[1])
	local player_1 = sPlayerSystem:GetPlayerByGUID(spl[2])
	sFightSystem:StartTagPVP(player,player_1, Act_BangZhan.FightTag, "", "", "")
end
function Act_BangZhan.ShowCountdown(first_player,second_player)
	local first_team_info = Act_BangZhan.TeamInfo(first_player)
	local second_team_info = Act_BangZhan.TeamInfo(second_player)
	
	local str = ""
	if Lua_tools then
		str=str..[[
			if FactionFightUI then
				GUI.CloseWnd("FactionFightUI")
			end
			GUI.OpenWnd("FactionFightBtnUI")
			if FactionFightBtnUI then
				FactionFightBtnUI.RefreshPlayersInfo(]].. 3 ..[[,]]..Lua_tools.serialize(first_team_info)..[[,]]..Lua_tools.serialize(second_team_info)..[[)
			end	
		]]
	end
	if first_player:GetTeam() then
		for k,v in pairs(first_player:GetTeam():GetTeamMembers(false)) do
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
	else
		sLuaApp:ShowForm(first_player, "脚本表单", str)
	end
	if second_player:GetTeam() then
		for k,v in pairs(second_player:GetTeam():GetTeamMembers(false)) do
			sLuaApp:ShowForm(v, "脚本表单", str)
		end
	else
		sLuaApp:ShowForm(second_player, "脚本表单", str)
	end
end
function Act_BangZhan.TeamInfo(player)
	local player_show_string = {}
	--倒计时动画需要的
	player_show_string[1] = {}
	table.insert(player_show_string[1], player:GetId())
	table.insert(player_show_string[1], player:GetName())
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_ROLE))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_LEVEL))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_RACE))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_VIP))
	table.insert(player_show_string[1], player:GetAttr(ROLE_ATTR_FIGHT_VALUE))
	return player_show_string
end
function Act_BangZhan.Search_Always(player)
	local team = player:GetTeam()
	if not player:GetGuild() then
		sLuaApp:NotifyTipsMsg(player, "你还没有帮派。")
		return
	end
	if player:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
		sLuaApp:NotifyTipsMsg(player, "等级不够")
		return
	end
	if team then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "只有队长才可以操作。")
			return
		end
		for k,v in pairs(team:GetTeamMembers(true)) do
			if v:GetAttr(ROLE_ATTR_LEVEL) < Act_BangZhan.Level then
				sLuaApp:NotifyTipsMsg(player, "队伍中有玩家等级不够")
				return
			end
			if sTeamSystem:IsTempLeave(v) then
				sLuaApp:NotifyTipsMsg(player, "队伍中有暂离成员。")
				return
			end
			if not v:GetGuild() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
			if player:GetGuild():GetGUID() ~= v:GetGuild():GetGUID() then
				sLuaApp:NotifyTipsMsg(player, "队伍中有不是本帮派的成员。")
				return
			end
		end
	end
	if player:GetTempInt("Act_BangZhan_Timer") ~= 0 then
		if sLuaTimerSystem:HasTimer(player:GetTempInt('Act_BangZhan_Timer')) then
			sLuaTimerSystem:DisableTimer(player:GetTempInt('Act_BangZhan_Timer'))
			player:SetTempInt("Act_BangZhan_Timer",0)
		end
	end
	if player:GetTempInt("Act_BangZhan_Search_State") == 2 then
		sLuaApp:NotifyTipsMsg(player, "取消连续匹配")
		player:SetTempInt("Act_BangZhan_Search_State",0)
		Act_BangZhan.Refresh_Search_State(player)
		return
	end
	local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
	if timer then
		sLuaApp:NotifyTipsMsg(player, "开始连续匹配")
		player:SetTempInt("Act_BangZhan_Search_State",2)
		player:SetTempInt("Act_BangZhan_Timer",timer)
		Act_BangZhan.Refresh_Search_State(player)
	end
end
function Act_BangZhan.FightCallBack(player, is_win)
	local val = 0
	local a = 0
	local b = 0
	local team = player:GetTeam()
	if team then
		if not player:IsTeamLeader() and not player:IsTempLeave() then
			return
		end
	end
	local Name = player:GetDayString("Act_BangZhan_Name")
	if is_win == 2 then
	--这里是赢得
		--更新帮派榜单
		local tb = sRanklistSystem:GetRank(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID())
		if #tb > 0 then
			val = tonumber(tb[2]) + Act_BangZhan.AddGuildRating
			local tb_1 = sLuaApp:StrSplit(tb[4],"/")
			a = tonumber(tb_1[1]) + 1
			b = tonumber(tb_1[2]) + 1
			sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID(),val,""..player:GetGuild():GetName(),""..a.."/"..b)
		else
			val = Act_BangZhan.DefaultGuildRating + Act_BangZhan.AddGuildRating
			sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID(),val,""..player:GetGuild():GetName(),"1/1")
		end
		--更新玩家榜单
		local MemberList = {}
		if not team or player:IsTempLeave() then
			table.insert(MemberList,player)
		else
			MemberList = team:GetTeamMembers(false)
		end
		for i = 1,#MemberList do
			local tb = sRanklistSystem:GetRank(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID())
			if #tb > 0 then
				val = tonumber(tb[2]) + Act_BangZhan.AddPlayerRating
				local tb_1 = sLuaApp:StrSplit(tb[4],"/")
				a = tonumber(tb_1[1]) + 1
				b = tonumber(tb_1[2]) + 1
				sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID(),val,""..MemberList[i]:GetName(),""..a.."/"..b)
			else
				val = Act_BangZhan.DefaultPlayerRating + Act_BangZhan.AddPlayerRating
				sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID(),val,""..MemberList[i]:GetName(),"1/1")
			end
			MemberList[i]:SetDayInt("Act_BangZhan_Win_Count",MemberList[i]:GetDayInt("Act_BangZhan_Win_Count") + 1)
			if MemberList[i]:GetDayInt("Act_BangZhan_Win_1_Reward") == 0 then
				if MemberList[i]:GetDayInt("Act_BangZhan_Win_Count") > 0 then
					Act_BangZhan.GiveReward(MemberList[i],"First")
					MemberList[i]:SetDayInt("Act_BangZhan_Win_1_Reward",1)
				end
			end
			if MemberList[i]:GetDayInt("Act_BangZhan_Win_5_Reward") == 0 then
				if MemberList[i]:GetDayInt("Act_BangZhan_Win_Count") >= 5 then
					Act_BangZhan.GiveReward(MemberList[i],"Fifth")
					MemberList[i]:SetDayInt("Act_BangZhan_Win_5_Reward",1)
				end
			end
			MemberList[i]:SetDayString("Act_BangZhan_Fight_Str",MemberList[i]:GetDayString("Act_BangZhan_Fight_Str").."1,"..MemberList[i]:GetDayInt("Act_BangZhan_Win_Count")..","..Name..";")
		end
	else
	--这里是输的
		--更新帮派榜单
		local tb = sRanklistSystem:GetRank(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID())
		if #tb > 0 then
			val = tonumber(tb[2]) - Act_BangZhan.CutGuildRating
			local tb_1 = sLuaApp:StrSplit(tb[4],"/")
			a = tonumber(tb_1[1])
			b = tonumber(tb_1[2]) + 1
			sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID(),val,""..player:GetGuild():GetName(),""..a.."/"..b)
		else
			val = Act_BangZhan.DefaultGuildRating - Act_BangZhan.CutGuildRating
			sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID(),val,""..player:GetGuild():GetName(),"0/1")
		end
		--更新玩家榜单
		local MemberList = {}
		if not team then
			table.insert(MemberList,player)
		else
			MemberList = team:GetTeamMembers(false)
		end
		for i = 1,#MemberList do
			local tb = sRanklistSystem:GetRank(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID())
			if #tb > 0 then
				val = tonumber(tb[2]) - Act_BangZhan.CutPlayerRating
				local tb_1 = sLuaApp:StrSplit(tb[4],"/")
				a = tonumber(tb_1[1])
				b = tonumber(tb_1[2]) + 1
				sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID(),val,""..MemberList[i]:GetName(),""..a.."/"..b)
			else
				val = Act_BangZhan.DefaultPlayerRating - Act_BangZhan.CutPlayerRating
				sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战个人排行榜'],MemberList[i]:GetGUID(),val,""..MemberList[i]:GetName(),"0/1")
			end
			MemberList[i]:SetDayInt("Act_BangZhan_Win_Count",0)
			MemberList[i]:SetDayString("Act_BangZhan_Fight_Str",MemberList[i]:GetDayString("Act_BangZhan_Fight_Str").."0,0,"..Name..";")
		end
	end
	
	if player:GetTempInt("Act_BangZhan_Search_State") == 1 then
		player:SetTempInt("Act_BangZhan_Search_State",0)
		--本来战斗结束要给客户端发消息,但是因为关闭了界面,会重新请求，所以不需要了
	end
	--@newinter sVarSystem:GetInt("Act_BangZhan_Pool")
	--@newinter player:GetTempInt("Act_BangZhan_Search_State")
	if player:GetTempInt("Act_BangZhan_Search_State") == 2 then
		local timer = sLuaTimerSystem:AddTimerEx(player, math.random(10,30) * 1000 ,1,"Act_BangZhan.Search_EX", "")
		if timer then
			player:SetTempInt("Act_BangZhan_Timer",timer)
		end
	end
end

function Act_BangZhan.GiveReward(player,str)
	if Act_BangZhan.Reward[''..str] then
		local guild = player:GetGuild()
		local GongShi = [[
			local level = ]]..player:GetAttr(ROLE_ATTR_LEVEL)..[[
			local guild_level = ]]..guild:GetLevel()..[[
		]]
		local Bind_Gold = assert(load(GongShi..Act_BangZhan.Reward[''..str]['Bind_Gold']))()
		local Exp = assert(load(GongShi..Act_BangZhan.Reward[''..str]['Exp']))()
		local Contribution= assert(load(GongShi..Act_BangZhan.Reward[''..str]['Contribution']))()
		local GuildFund = assert(load(GongShi..Act_BangZhan.Reward[''..str]['GuildFund']))()
		if Bind_Gold > 0 then
			player:AddBindGold(Bind_Gold, "system", "帮派竞技", ""..str)
			sLuaApp:NotifyTipsMsg(player, "您获得了"..Bind_Gold.."银币")
		end
		if Exp > 0 then
			player:AddExp(Exp, "system", "帮派竞技", ""..str)
		end
		if Contribution > 0 then
			player:AddGuildContribute(Contribution, "system", "帮派竞技", ""..str)
			sLuaApp:NotifyTipsMsg(player, "您获得了"..Contribution.."帮贡！")
		end
		if GuildFund > 0 then
			Lua_tools.AddGuildFund(player,GuildFund)
		end
		Lua_tools.AddItem(player, Act_BangZhan.Reward[''..str]['ItemList'], "Act_BangZhan", "GiveReward", ""..str)
	end
end
function Act_BangZhan.SendRewardEmail(str)
	if str == "Player" then
		local tb = sRanklistSystem:GetRanklist(RankingListSystem.Config['帮战个人排行榜'],1,3)
		for i = 1 ,#tb do
			if tb[i] then
				if Act_BangZhan.Reward[str][i] then
					local player_guid = tb[i][1]
					local GongShi = [[
						local level = ]]..sContactSystem:GetContactLevel(tonumber(player_guid))..[[
					]]
					local Bind_Gold = assert(load(GongShi..Act_BangZhan.Reward[''..str][i]['Bind_Gold']))()
					local Exp = assert(load(GongShi..Act_BangZhan.Reward[''..str][i]['Exp']))()
					local attrs = {}
					if Exp > 0 then
						table.insert(attrs,295)
						table.insert(attrs,Exp)
					end
					if Bind_Gold > 0 then
						table.insert(attrs,300)
						table.insert(attrs,Bind_Gold)
					end
					local items = Act_BangZhan.Reward[''..str][i]['ItemList']
					if sMailSystem:SendMail(0,"帮派竞技",tonumber(player_guid),1,"帮派竞技奖励","你在帮派竞技个人排名中获得第"..i.."名的好成绩，特此奖励。",attrs,items) ~= 0 then
						sLuaApp:LuaDbg("Act_BangZhan.SendRewardEmail str = "..str..",i = "..i)
					end
				end
			end
		end
	elseif str == "Guild" then
		local tb = sRanklistSystem:GetRanklist(RankingListSystem.Config['帮战帮派排行榜'],1,3)
		for i = 1 ,#tb do
			if tb[i] then
				local guild_guid = tb[i][1]
				local guild = sGuildSystem:GetGuildByGUID(guild_guid)
				local GongShi = [[
					local guild_level = ]]..guild:GetLevel()..[[
				]]
				local Bind_Gold = assert(load(GongShi..Act_BangZhan.Reward[''..str][i]['Bind_Gold']))()
				local Exp = assert(load(GongShi..Act_BangZhan.Reward[''..str][i]['Exp']))()
				local attrs = {}
				if Exp > 0 then
					table.insert(attrs,295)
					table.insert(attrs,Exp)
				end
				if Bind_Gold > 0 then
					table.insert(attrs,300)
					table.insert(attrs,Bind_Gold)
				end
				local items = Act_BangZhan.Reward[''..str][i]['ItemList']
				if sMailSystem:SendMail(0,"帮派竞技",tonumber(guild_guid),1,"帮派竞技奖励","你所在的帮派在帮派竞技帮派排名中获得第"..i.."名的好成绩，特此奖励。",attrs,items) ~= 0 then
					sLuaApp:LuaDbg("Act_BangZhan.SendRewardEmail str = "..str..",i = "..i)
				end
			end
		end
	end
end
function Act_BangZhan.test(player,num)
	sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战个人排行榜'],player:GetGUID(),num,""..player:GetName(),"1/1")
	sRanklistSystem:UpdateRanklist(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID(),num*10,""..player:GetGuild():GetName(),"1/1")
	player:SetDayString("Act_BangZhan_Fight_Str","1,1,AAAA;1,2,AAAA;1,3,AAAA;0,0,AAAA;")
end
function Act_BangZhan.get_server_data(player)
	local tb = {}
	if sLuaApp:IsActivityRunning(Act_BangZhan.ID) then
		tb['openState'] = 1
	else
		tb['openState'] = 0
	end
	tb['fight_str'] = player:GetDayString("Act_BangZhan_Fight_Str")
	tb['first_reward'] = Act_BangZhan.Reward['First']
	tb['fifth_reward'] = Act_BangZhan.Reward['Fifth']
	tb['is_first_reward'] = player:GetDayInt("Act_BangZhan_Win_1_Reward")
	tb['is_fifth_reward'] = player:GetDayInt("Act_BangZhan_Win_5_Reward")
	local tb_1 = sRanklistSystem:GetAllRanklist(RankingListSystem.Config['帮战帮派排行榜']) 
	for i = 1, #tb_1 do
		tb_1[i][1] = i
	end
	tb['guild_rank_list'] =  tb_1
	tb_1 = sRanklistSystem:GetAllRanklist(RankingListSystem.Config['帮战个人排行榜']) 
	for i = 1, #tb_1 do
		tb_1[i][1] = i
	end
	tb['player_rank_list'] =  tb_1
	tb['my_rank'] = sRanklistSystem:GetRank(RankingListSystem.Config['帮战个人排行榜'],player:GetGUID())
	tb['my_guild_rank'] = sRanklistSystem:GetRank(RankingListSystem.Config['帮战帮派排行榜'],player:GetGuild():GetGUID())
	local ActData = ActivityConfig.GetById(Act_BangZhan.ID)
	tb['end_time'] = sLuaApp:Str2DateTime(sLuaApp:StrSplit(sLuaApp:DateTime2Str(sLuaApp:GetTimes())," ")[1].." "..ActData.TimeEnd)
	tb['act_id'] = Act_BangZhan.ID
	local FormStr = [[
		if FactionFightUI then
			FactionFightUI.serverData = ]]..Lua_tools.serialize(tb)..[[
			FactionFightUI.search_state = ]]..player:GetTempInt("Act_BangZhan_Search_State")..[[
			FactionFightUI.Refresh()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", FormStr)
end
function Act_BangZhan.On_Login(player) 
	if sLuaApp:IsActivityRunning(Act_BangZhan.ID) then 
		local FormStr = [[
			if MainDynamicUI then
				MainDynamicUI.GuildFight_PVP_STATE = 1
				MainDynamicUI.World_PVP_BtnRefresh()
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", FormStr)
	end
end