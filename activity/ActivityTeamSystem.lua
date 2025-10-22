--活动队伍变化回调
ActivityTeamSystem = {}

--设置队长前
function ActivityTeamSystem.on_pre_set_team_leader(player, team)
	local old_leader = team:GetTeamLeader()
	local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	--天下会武
	if old_leader:GetInt("isMatching"..txhw_id) == 1 or old_leader:GetInt("isAutoMatching"..txhw_id) == 1 then
		return TianXiaHuiWu.on_pre_set_team_leader(player, team)
	end
	
	--水陆大会
	if player:GetInt("ACTIVITY_ShuiLuDaHui_IsReady") == 1 then
		ShuiLuDaHui.OnTeamChange(player, old_leader)
	end
	
	--订婚
	if player:GetInt("Marry_AgreeMarry") == 1 then
		player:SetInt("Marry_AgreeMarry", 0)
	end
	
	--辅助
	if Assist then
		Assist.OnLeaderChange(old_leader)
	end
	return true
end

--加入队伍
function ActivityTeamSystem.on_join_team(player)
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	--天下会武
	local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if player:GetInt("isMatching"..txhw_id) == 1 or player:GetInt("isAutoMatching"..txhw_id) == 1 then
		TianXiaHuiWu.on_join_team(player)
	end
	
	--水陆大会
	if player:GetInt("ACTIVITY_ShuiLuDaHui_IsReady") == 1 then
		ShuiLuDaHui.OnTeamChange(leader, player)
	end
	
	--组队任务判断
	if sQuestSystem:GetQuestState(player,81) == 3 then
		if not sQuestSystem:ForceReady(player,81) then
			sLuaApp:LuaDbg("ForceReady 81 is err")
		end
	end
	
	--天下第一
	if player:GetInt("TianXiaDiYi_isAutoMatching") == 1 or player:GetInt("TianXiaDiYi_isMatching") == 1 then
		TianXiaDiYi.on_join_team(player)
	end
	
	--订婚
	if player:GetInt("Marry_AgreeMarry") == 1 then
		player:SetInt("Marry_AgreeMarry", 0)
	end
	
	--匹配系统
	if PersonsActMatch then
		PersonsActMatch.on_join_team(player)
	end
end

--离开队伍
function ActivityTeamSystem.on_leave_team(player)
	local team = player:GetTeam()
	
	if team then
		local leader = team:GetTeamLeader()
		local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
		if leader:GetInt("isMatching"..txhw_id) == 1 or leader:GetInt("isAutoMatching"..txhw_id) == 1 then
			TianXiaHuiWu.on_leave_team(player)
		end
	end
		
	--水陆大会
	if player:GetInt("ACTIVITY_ShuiLuDaHui_IsReady") == 1 then
		ShuiLuDaHui.OnTeamChange(leader, player)
	end
	
	if player:GetType() == GUID_ROBOT then
		if TeamHost then
			TeamHost.on_leave_team(player)
		end
	end
	
	--订婚
	if player:GetInt("Marry_AgreeMarry") == 1 then
		player:SetInt("Marry_AgreeMarry", 0)
	end
	
	--匹配系统
	if PersonsActMatch then
		PersonsActMatch.on_leave_team(player)
	end
end

--暂离队伍 -templeave bool 暂离 or 回归
function ActivityTeamSystem.on_temp_leave(player, templeave)
	local team = player:GetTeam()
	local leader = team:GetTeamLeader()
	local txhw_id = sVarSystem:GetInt("ACTIVITY_TianXiaHuiWu_ID")
	if leader:GetInt("isMatching"..txhw_id) == 1 or leader:GetInt("isAutoMatching"..txhw_id) == 1 then
		TianXiaHuiWu.on_temp_leave(player, templeave)
	end
	
	--水陆大会
	if player:GetInt("ACTIVITY_ShuiLuDaHui_IsReady") == 1 then
		ShuiLuDaHui.OnTeamChange(leader, player)
	end
	
	--订婚
	if player:GetInt("Marry_AgreeMarry") == 1 then
		player:SetInt("Marry_AgreeMarry", 0)
	end
end