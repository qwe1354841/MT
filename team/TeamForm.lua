--组队功能
require "./team/TeamHelper"
FormTeam = {}

-- 创建队伍
function FormTeam.CreateTeam(player, target, permission, min_require_level, max_require_level)
    if player == nil or target == nil or permission == nil or min_require_level == nil or max_require_level == nil then
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许创建队伍")
		return ""
	end

    if not IsAllowedCreateTeam(player) then
        sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许创建队伍")
        return ""
    end
	
	--爬塔活动判断
	if IntegralTower then
		if not IntegralTower.CheckCanTeam(player) then
			sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许创建队伍")
			return ""
		end
	end
    --帮派密谋活动判断
    if GuildConspire then
        if GuildConspire.CheckInTask(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许创建队伍")
            return ""
        end
    end

    local team = sTeamSystem:CreateTeam(player, target, permission, min_require_level, max_require_level)
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "创建队伍失败")
        return ""
    end

    return ""
end

-- 离开队伍
function FormTeam.LeaveTeam(player)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "没有队伍")
        return ""
    end

	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
    
	-- 玩家是队长
    local code = 0
    if sTeamSystem:IsTeamLeader(team, player) then
        local TeamMembers = team:GetTeamMembers(true)
        -- 离开队伍
        code = sTeamSystem:DelTeamLeader(team, player, 2)
        --队伍界面阵法数据刷新
        for k, v in pairs(TeamMembers) do
            if v:GetType() ~= GUID_ROBOT then
                SeatSystem.MembersSetSeatNameLevel(v)
            end
        end
    else
        -- 离开队伍
        code = sTeamSystem:DelTeamMember(team, player, 2)
    end
    if code ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "退出队伍失败")
        return ""
    end

    return ""
end

-- 暂离队伍
function FormTeam.LeaveTeamTemporarily(player)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "没有队伍")
        return ""
    end
	
	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end

    --武道大会
    if Act_WuDaoHui then
        if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
            if player:GetMapKeyName() == "对战地图" then
                sLuaApp:NotifyTipsMsgEx(player, "武道大会中无法暂离队伍！")
                return ""
            end
        end
    end

    local ret = sTeamSystem:SetTempLeave(player, true)
    if ret ~= 0 then
        return ""
    end
    return ""
end

-- 踢出成员
function FormTeam.KickMember(player, member_guid)
    if player == nil or member_guid ==  nil then
        return ""
    end

    if player:GetGUID() == member_guid then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, player) then
        return ""
    end
	
	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
    local code = sTeamSystem:DelTeamMemberByGUID(team, member_guid, 1)
    if code ~= 0 then
        return ""
    end

    return ""
end

-- 改变队长
function FormTeam.ChangeLeader(player, member_guid)
    if player == nil or member_guid == nil then
		return ""
    end

    if player:GetGUID() == member_guid then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, player) then
        return ""
    end

    local member = sPlayerSystem:GetPlayerByGUID(member_guid)
    if member == nil then
		return ""
    end
	
	local GUIDType = sLuaApp:GUIDType(member_guid)
	if GUIDType ~= 3 then							--3为玩家
		sLuaApp:NotifyTipsMsgEx(player, "对方拒绝成为队长")
		return ""
	end

    if not sTeamSystem:IsTeamMember(team, member) then
        return ""
    end

	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
	local code = sTeamSystem:SetTeamLeader(member)
	if code ~= 0 then
		return ""
	end

    --队伍界面阵法数据刷新
    if SeatSystem then
        SeatSystem.on_set_team_leader(player,team)
    end

    return ""
end

-- 邀请加入
function FormTeam.InviteJoin(player, target_guid)
    if player == nil or target_guid == nil then
        return ""
    end
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if not FormTeam.UnlockLevelTB then
		FormTeam.GetUnlockLevelData()
	end
	--sLuaApp:LuaErr(Lua_tools.serialize(FormTeam.UnlockLevelTB))
	if tonumber(level) < tonumber(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]) then
		sLuaApp:NotifyTipsMsgEx(player, tostring(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]).."级开启队伍功能")
        return ""
	end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end
	
    local team = player:GetTeam()
    if team ~= nil then
        -- if not sTeamSystem:IsTeamLeader(team, player) then
        --     sLuaApp:NotifyTipsMsgEx(player, "不是队长，无法邀请")
        --     return ""
        -- end
    else
        if not IsAllowedCreateTeam(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许创建队伍")
            return ""
        end
    end

	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
    local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if target == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法邀请组队")
        return ""
    end
	
	local target_level = target:GetAttr(ROLE_ATTR_LEVEL)
	if tonumber(target_level) < tonumber(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]) then
		sLuaApp:NotifyTipsMsgEx(player, "对方未开启队伍功能")
        return ""
	end
	
	local NowMapKeyName = target:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "目标所在地图不允许组队")
		return ""
	end

    if not IsAllowedJoinTeam(target) then
        sLuaApp:NotifyTipsMsgEx(player, "不能邀请对方入队")
        return ""
    end

    if target:GetTeam() ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方有队伍，无法邀请组队")
        return ""
    end

    if target:GetInt("TEAM_AutoRefuseApply") ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "对方拒绝了您的组队邀请")
        return ""
    end

    --武道大会
    if Act_WuDaoHui then
        if Act_WuDaoHui.InvitePlayerJudge(player,target) == false then
            return ""
        end
    end

	--爬塔活动判断
	if IntegralTower then
		if not IntegralTower.InvitePlayerJudge(player,target) then
			sLuaApp:NotifyTipsMsgEx(player, "不能邀请对方入队")
			return ""
		end
		if not IntegralTower.CheckCanTeam(player) or not IntegralTower.CheckCanTeam(target) then
			sLuaApp:NotifyTipsMsgEx(player, "不能邀请对方入队")
			return ""
		end
	end
    --帮派密谋活动判断
    if GuildConspire then
        if GuildConspire.CheckInTask(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态不能邀请对方入队")
            return ""
        end
    end
	
	if GuildBattle then
		if GuildBattle.Judge(player, target) == false then
			return ""
		end
	end

    local name = player:GetKeyName()
	sInviteSystem:SendInvite(player, target, INVITE_TEAM_INVITE_JOIN, 60, name .. "邀请你一起组队", "FormTeam.OnReplyInvite")
	sLuaApp:NotifyTipsMsgEx(player, "邀请信息已发送")
    return ""
end

-- 回复邀请
function FormTeam.OnReplyInvite(player, inviter, agreed)
    if player == nil or inviter == nil or agreed == nil then
        return ""
    end

    if agreed ~= 1 then
        sLuaApp:NotifyTipsMsgEx(inviter, player:GetName() .. "拒绝了你的组队邀请")
        return ""
    end

    if player:GetTeam() ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有队伍，无法接受邀请")
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end

    local team = inviter:GetTeam()
    if team == nil then
        local target = 1
        local permission = 1
        local min_require_level = 30
        local max_require_level = 120
        team = sTeamSystem:CreateTeamEx(inviter, player, target, permission, min_require_level, max_require_level)
        if team == nil then
            sLuaApp:NotifyTipsMsgEx(player, "创建队伍失败")
            return ""
        end
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, inviter) then
        sLuaApp:NotifyTipsMsgEx(player, "对方没有权限，无法接受邀请")
        return ""
    end

    if team:GetTeamMemberCount() >= 5 then
        sLuaApp:NotifyTipsMsgEx(player, "队伍超出人数上限")
        return ""
    end

    local code = sTeamSystem:AddTeamMember(team, player)
    if code ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "对方没有权限，无法接受邀请")
    else
        sLuaApp:NotifyTipsMsgEx(inviter, player:GetName() .. "加入了队伍")
    end

    return ""
end

-- 申请加入
function FormTeam.ApplyJoin(player, leader_guid)
    if player == nil or leader_guid == nil then
        return ""
    end
	local level = player:GetAttr(ROLE_ATTR_LEVEL)
	if not FormTeam.UnlockLevelTB then
		FormTeam.GetUnlockLevelData()
	end
	--sLuaApp:LuaErr(Lua_tools.serialize(TB))
	if tonumber(level) < tonumber(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]) then
		sLuaApp:NotifyTipsMsgEx(player, tostring(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]).."级开启队伍功能")
        return ""
	end

    if player:GetTeam() ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有队伍了")
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end
	
	if not IsAllowedJoinTeam(player) then
        sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许组队")
        return ""
    end

    local leader = sPlayerSystem:GetPlayerByGUID(leader_guid)
    if leader == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法加入")
        return ""
    end
	
	local leader_level = leader:GetAttr(ROLE_ATTR_LEVEL)
	if tonumber(leader_level) < tonumber(FormTeam.UnlockLevelTB["组队"]["UnlockLevel"]) then
		sLuaApp:NotifyTipsMsgEx(player, "对方未开启队伍功能")
        return ""
	end
	
	local NowMapKeyName = leader:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "对方所在地图不允许组队")
		return ""
	end

    local team = leader:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方没有组队，无法加入")
        return ""
    end
	
	if team:GetTeamMemberCount() >= 5 then
        sLuaApp:NotifyTipsMsgEx(player, "队伍已满")
        return ""
    end
	
    if not sTeamSystem:IsTeamLeader(team, leader) then
        sLuaApp:NotifyTipsMsgEx(player, "对方不是队长，无法加入")
        return ""
    end

    --武道大会
    if Act_WuDaoHui then
        if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
            if leader:GetMapKeyName() == "对战地图" then
                if player:GetMapKeyName() ~= "对战地图" then
                    sLuaApp:NotifyTipsMsgEx(player, "对方所在地图不允许加入")
                    return ""
                else
                    if Act_WuDaoHui then
                        if Act_WuDaoHui.JoinTeamJudge(player,leader) == false then
                            return ""
                        end
                    end
                end
            end
        end
    end
	
	--爬塔活动判断
	if IntegralTower then
		if not IntegralTower.InvitePlayerJudge(player,leader) then
			sLuaApp:NotifyTipsMsgEx(player, "无法申请入队")
			return ""
		end
		if not IntegralTower.CheckCanTeam(player) or not IntegralTower.CheckCanTeam(leader) then
			sLuaApp:NotifyTipsMsgEx(player, "无法申请入队")
			return ""
		end
	end
    --帮派密谋活动判断
    if GuildConspire then
        if GuildConspire.CheckInTask(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态无法申请入队")
            return ""
        end
    end

    team:AddApplicant(player:GetGUID())
    local name = player:GetKeyName()
    sInviteSystem:SendInvite(player, leader, INVITE_TEAM_APPLY_JOIN, 60, name .. "申请加入队伍", "FormTeam.OnReplyApplyJoin")
	--sLuaApp:NotifyTipsMsgEx(player, "邀请信息已发送")
    return ""
end

-- 回复申请
function FormTeam.OnReplyApplyJoin(player, inviter, agreed)
    if player == nil or inviter == nil or agreed == nil then
        return ""
    end

    if agreed ~= 1 then
        sLuaApp:NotifyTipsMsgEx(inviter, "对方拒绝了您的组队申请")
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(inviter, "对方所在地图不允许组队")
		return ""
	end

    if inviter:GetTeam() ~= nil then
        sLuaApp:NotifyTipsMsgEx(inviter, "您已经有队伍了")
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(inviter, "对方没有组队，无法入队")
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, player) then
        sLuaApp:NotifyTipsMsgEx(inviter, "对方不是队长，无法入队")
        return ""
    end

    if team:GetTeamMemberCount() >= 5 then
        sLuaApp:NotifyTipsMsgEx(inviter, "队伍超出人数上限")
        return ""
    end

    local code = sTeamSystem:AddTeamMember(team, inviter)
    if code ~= 0 then
        sLuaApp:NotifyTipsMsgEx(inviter, "加入队伍失败")
        return ""
    end

    return ""
end

-- 申请队长
function FormTeam.ApplyLeader(player)
    if player == nil then
        return ""
    end
	
	local time = player:GetInt("ApplyLeaderTime")
	local nowtime = sLuaApp:GetTimes()
	if time + 10 > nowtime then
		sLuaApp:NotifyTipsMsgEx(player, "您申请过于频繁，请稍后再试")
		return ""
	end
	player:SetInt("ApplyLeaderTime", nowtime)

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有队伍，无法成为队长")
        return ""
    end

    if not sTeamSystem:IsTeamMember(team, player) then
        if player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsgEx(player, "你已经是队长了")
			return ""
		end
		sLuaApp:NotifyTipsMsgEx(player, "您不是队伍成员，无法成为队长")
        return ""
    end

    local leader = team:GetTeamLeader()
    if leader == nil then
        sLuaApp:NotifyTipsMsgEx(player, "队长不在线，无法成为队长")
        return ""
    end
	
	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
    local name = player:GetKeyName()
	sLuaApp:NotifyTipsMsgEx(player, "申请队长请求已发送")
    sInviteSystem:SendInvite(player, leader, INVITE_TEAM_APPLY_LEADER, 60, name .. "申请成为队长", "FormTeam.OnReplyApplyLeader")
	
	if TeamHelper.FunctionSwitchConfig["AutoApply"] == "on" then
		local autoApply_tguid = sLuaTimerSystem:AddTimerEx(leader, 60*1000, 1, "FormTeam.AutoApply", player:GetGUID())
		leader:SetInt("AutoApplyTimerGUID", autoApply_tguid)
	end
    return ""
end

--自动同意队长申请请求队长申请
function FormTeam.AutoApply(leader,timer,param)
	--sLuaApp:LuaDbg("自动回复请求")
	if leader == nil or param == nil then 
		return ""
	end
	local player = sPlayerSystem:GetPlayerByGUID(param)
	if player then
		FormTeam.OnReplyApplyLeader(leader, player, 1)
	end
end

-- 回复申请
function FormTeam.OnReplyApplyLeader(player, inviter, agreed)
	if player == nil or inviter == nil or agreed == nil then
        return ""
    end
	
	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
    if agreed ~= 1 then
        sLuaApp:NotifyTipsMsgEx(inviter, "队长拒绝")
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, player) then
        return ""
    end

    if not sTeamSystem:IsTeamMember(team, inviter) then
        return ""
    end
	
	local autoApply_tguid = player:GetInt("AutoApplyTimerGUID")
	if sLuaTimerSystem:HasTimer(autoApply_tguid) then
		--sLuaApp:LuaDbg("删除定时器")
		sLuaTimerSystem:DisableTimer(autoApply_tguid)
		player:SetInt("AutoApplyTimerGUID", 0)
	end

    local code = sTeamSystem:SetTeamLeader(inviter)
    if code ~= 0 then
        return ""
    end

    --队伍界面阵法数据刷新
    if SeatSystem then
        SeatSystem.on_set_team_leader(player,team)
    end
    
    return ""
end

-- 申请
function FormTeam.OnReplyCallMember(player, inviter, agreed)
    if player == nil or inviter == nil or agreed == nil then
        return ""
    end

    if agreed ~= 1 then
        sLuaApp:NotifyTipsMsgEx(inviter, "对方拒绝召回")
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end

    local team = player:GetTeam()
    if team == nil then
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, inviter) then
        return ""
    end

    if not sTeamSystem:IsTeamMember(team, player) then
        return ""
    end

    if not sTeamSystem:IsTempLeave(player) then
        return ""
    end

    local ret = sTeamSystem:SetTempLeave(player, false)
    if ret ~= 0 then
        sLuaApp:NotifyTipsMsgEx(player, "队伍正在战斗中，请稍后再试")
        return ""
    end

    -- todo: 通知申请人
    return ""
end

-- 召唤队员
function FormTeam.CallMember(player, member_guid)
    if player == nil or member_guid == nil then
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您还没有队伍")
        return ""
    end

    if not sTeamSystem:IsTeamLeader(team, player) then
        sLuaApp:NotifyTipsMsgEx(player, "您不是队长，无法召唤")
        return ""
    end

    local member = sPlayerSystem:GetPlayerByGUID(member_guid)
    if member == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法召唤")
        return ""
    end

    if not sTeamSystem:IsTeamMember(team, member) then
        sLuaApp:NotifyTipsMsgEx(player, "对方在不队伍中，无法召唤")
        return ""
    end
	
	local NowMapKeyName = member:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end

    if not sTeamSystem:IsTempLeave(member) then
        sLuaApp:NotifyTipsMsgEx(player, "对方已在队伍中，无法召唤")
        return ""
    end

	if Data.DungeonMap then
		local player_map_keyname = player:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if player_map_keyname == v then
				local TOF = false
				local DungeonFirstMapGUID = player:GetInt("DungeonFirstMapGUID")
				if Data[tostring(DungeonFirstMapGUID)] then
					for m,n in pairs(Data[tostring(DungeonFirstMapGUID)]) do
						if n == member_guid then
							TOF = true
						end
					end	
				end
				if not TOF then
					sLuaApp:NotifyTipsMsg(player, "您在副本中，无法召唤")
					return ""
				end
			end
		end
	end
	
    local name = player:GetKeyName()
	sLuaApp:NotifyTipsMsg(player, "召回信息已发出")
    sInviteSystem:SendInvite(player, member, INVITE_TEAM_CALL_MEMBER, 60, name .. "招你归队", "FormTeam.OnReplyCallMember")
    return ""
end

-- 召唤队员
function FormTeam.RejoinTeam(player)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您还没有队伍")
        return ""
    end

    if not sTeamSystem:IsTeamMember(team, player) then
        sLuaApp:NotifyTipsMsgEx(player, "您在不队伍中，无法归队")
        return ""
    end

    if not sTeamSystem:IsTempLeave(player) then
        sLuaApp:NotifyTipsMsgEx(player, "您已在队伍中，无法归队")
        return ""
    end

	if Data.DungeonMap then
		local leader = team:GetTeamLeader() 
		local leader_map_keyname = leader:GetMap():GetKeyName()
		for _,v in ipairs(Data.DungeonMap) do
			if leader_map_keyname == v then
				local TOF = false
				local DungeonFirstMapGUID = leader:GetInt("DungeonFirstMapGUID")
				if Data[tostring(DungeonFirstMapGUID)] then
					local playerGuid = player:GetGUID()
					for m,n in pairs(Data[tostring(DungeonFirstMapGUID)]) do
						if n == playerGuid then
							TOF = true
						end
					end	
				end
				if not TOF then
					sLuaApp:NotifyTipsMsg(player, "队伍在副本中，无法归队")
					return ""
				end
			end
		end
	end
	
	if Assist then
		Assist.CheckEnd(player)
	end

    local code = sTeamSystem:SetTempLeave(player, false)
    if code ~= 0 then
        sLuaApp:NotifyError(player, code)
        return ""
    end
	
    return ""
end

-- 查询组队平台
function FormTeam.QueryAll(player)
    if player == nil then
        return ""
    end

    sTeamSystem:NotifyTeamPlatform(player)
    return ""
end

-- 查询队伍申请列表
function FormTeam.QueryApplicants(player)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您还没有队伍")
        return ""
    end
    sTeamSystem:NotifyTeamApplicants(player)
    return ""
end

-- 操作类型
TEAM_APPLY_JOIN_BY_LINK     =   1   --  通过招募链接申请入队
TEAM_APPLY_AGREE            =   2   --  同意申请
TEAM_APPLY_CANCEL           =   3   --  取消申请
TEAM_OPEN_AUTO_MATCH        =   4   --  开启自动招募
TEAM_CLOSE_AUTO_MATCH       =   5   --  关闭自动招募
TEAM_ADD_AUTO_MATCH         =   6   --  玩家开启自动匹配
TEAM_DEL_AUTO_MATCH         =   7   --  玩家关闭自动匹配

-- 通过招募链接申请加入
function FormTeam.ApplyJoinByLink(player, team_guid)
    if player == nil then
        return ""
    end
	
	if player:GetTeam() then
		sLuaApp:NotifyTipsMsgEx(player, "您已经有队伍了")
        return ""
	end
	
    if not IsAllowedJoinTeam(player) then
        sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许组队")
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end

    local team = sTeamSystem:GetTeamByGUID(team_guid)
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "队伍已解散")
        return ""
    end

    if team:GetTeamMemberCount() >= 5 then
        sLuaApp:NotifyTipsMsgEx(player, "队伍已满")
        return ""
    end

    local target = team:GetTeamLeader()
    --武道大会
    if Act_WuDaoHui then
        if sLuaApp:IsActivityRunning(WuDaoHuiNPC.ActID) then
            if target:GetMapKeyName() == "对战地图" then
                if player:GetMapKeyName() ~= "对战地图" then
                    sLuaApp:NotifyTipsMsgEx(player, "对方所在地图不允许加入")
                    return ""
                else
                    if Act_WuDaoHui then
                        if Act_WuDaoHui.JoinTeamJudge(player,target) == false then
                            return ""
                        end
                    end
                end
            end
        end
    end
	
	--爬塔活动判断
	if IntegralTower then
		if IntegralTower.CheckCanTeam(player) then
			if not IntegralTower.CheckCanTeam(target) then
				sLuaApp:NotifyTipsMsgEx(player, "对方地图不允许加入")
				return ""
			end
		else
			sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许加入")
			return ""
		end
	end
    --帮派密谋活动判断
    if GuildConspire then
        if GuildConspire.CheckInTask(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态不允许加入")
            return ""
        end
    end

    local code = sTeamSystem:ApplyJoin(player, team_guid)
	sTeamSystem:NotifyOperationResult(player, TEAM_APPLY_JOIN_BY_LINK, code)

	if target then
		local NowMapKeyName = target:GetMap():GetKeyName()
		if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
			sLuaApp:NotifyTipsMsgEx(player, "对方所在地图不允许组队")
			return ""
		end
	end

	local name = player:GetName()
	if not player:GetTeam() then
		if target and name then
			sInviteSystem:SendInvite(player, target, INVITE_TEAM_INVITE_JOIN, 30, name .. "申请加入队伍", "FormTeam.OnReplyApplyJoin")
			--sLuaApp:NotifyTipsMsgEx(target, name.."申请加入队伍")
		end
	end
    return ""
end

-- 同意入队申请
function FormTeam.AgreeApply(player, target_guid, agree)
    if player == nil then
        return ""
    end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end
	
    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有队伍，无法操作")
        return ""
    end

    if not player:IsTeamLeader() then
        sLuaApp:NotifyTipsMsgEx(player, "您不是队长，无法操作")
        return ""
    end

    if agree ~= 0 then
        if team:GetTeamMemberCount() >= 5 then
            sLuaApp:NotifyTipsMsgEx(player, "您的队伍已满, 无法操作")
            return ""
        end
    end
	local target = sPlayerSystem:GetPlayerByGUID(target_guid)
    if target == nil then
        sLuaApp:NotifyTipsMsgEx(player, "对方不在线，无法同意入队")
        return ""
    end
	
	local NowMapKeyName = target:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "对方所在地图不允许组队")
		return ""
	end

    local code = sTeamSystem:AgreeApply(player, target_guid, agree)
    sTeamSystem:NotifyOperationResult(player, TEAM_APPLY_AGREE, code)
    return ""
end

-- 取消申请
function FormTeam.CancelApply(player, team_guid)
    if player == nil then
        return ""
    end

    local code = sTeamSystem:CancelApply(player, target_guid)
    sTeamSystem:NotifyOperationResult(player, TEAM_APPLY_CANCEL, code)
    return ""
end

-- 开启队伍自动匹配
function FormTeam.OpenAutoMatch(player, target_id, min_require_level, max_require_level, auto_match, min_require_reinc, max_require_reinc)
    if player == nil then
        return ""
    end

    if not player:IsTeamLeader() then
        sLuaApp:NotifyTipsMsgEx(player, "您不是队长，无法操作")
        return ""
    end

    local code = sTeamSystem:OpenAutoMatch(player, target_id, min_require_level, max_require_level, auto_match, min_require_reinc, max_require_reinc)
    sTeamSystem:NotifyOperationResult(player, TEAM_OPEN_AUTO_MATCH, code)
    return  ""
end

-- 关闭队伍自动匹配
function FormTeam.CloseAutoMatch(player)
    if player == nil then
        return ""
    end

    if not player:IsTeamLeader() then
        sLuaApp:NotifyTipsMsgEx(player, "您不是队长，无法操作")
        return ""
    end

    local code = sTeamSystem:CloseAutoMatch(player)
    sTeamSystem:NotifyOperationResult(player, TEAM_CLOSE_AUTO_MATCH, code)
    return ""
end

-- 开启玩家自动匹配
function FormTeam.AddAutoMatch(player, target)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team ~= nil then
        sLuaApp:NotifyTipsMsgEx(player, "您已经有队伍，无法操作")
        return ""
    end

    local code = sTeamSystem:AddAutoMatch(player, target)
    sTeamSystem:NotifyOperationResult(player, TEAM_ADD_AUTO_MATCH, code)
    return ""
end

-- 关闭玩家自动匹配
function FormTeam.DelAutoMatch(player)
    if player == nil then
        return ""
    end

    local code = sTeamSystem:DelAutoMatch(player)
    sTeamSystem:NotifyOperationResult(player, TEAM_DEL_AUTO_MATCH, code)
    return ""
end

--拒绝设置自动拒绝组队申请
function FormTeam.SetAutoRefuseApply(player, set)
    if player == nil then
        return ""
    end

    if set ~= 0 then
        player:SetInt("TEAM_AutoRefuseApply", 1)
    else
        player:SetInt("TEAM_AutoRefuseApply", 0)
    end
    return ""
end

--交换成员位置
function FormTeam.SwapMember(player, member_guid1, member_guid2)
    if player == nil then
        return ""
    end

    local team = player:GetTeam()
    if team == nil then
        sLuaApp:NotifyTipsMsgEx(player, "您没有队伍，无法操作")
        return ""
    end

    if not player:IsTeamLeader() then
        sLuaApp:NotifyTipsMsgEx(player, "您不是队长，无法操作")
        return ""
    end

    sTeamSystem:SwapTeamMember(player, member_guid1, member_guid2)
    return ""
end

--请求机器人
function FormTeam.ApplyHostTeamer(player)
	if Marry then
		if not Marry.BanTeam(player) then
			return ""
		end
	end
	
	local NowMapKeyName = player:GetMap():GetKeyName()
	if TeamHelper.ForbidMap and TeamHelper.ForbidMap[NowMapKeyName] and TeamHelper.ForbidMap[NowMapKeyName] == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "当前地图不允许组队")
		return ""
	end
	
	local MapKeyName = player:GetMap():GetKeyName()
	--sLuaApp:NotifyTipsMsgEx(player, "MapKeyName = "..tostring(MapKeyName))
	if TeamHostConfig then
		if TeamHostConfig.SheildMaps then
			for k,v in ipairs(TeamHostConfig.SheildMaps) do
				if v == tostring(MapKeyName) then
					sLuaApp:NotifyTipsMsgEx(player, "当前地图不可招募")
					return ""
				end
			end
		end
	end
	
	--爬塔活动判断
	if IntegralTower then
		if not IntegralTower.CheckCanTeam(player) then
			sLuaApp:NotifyTipsMsgEx(player, "当前地图不可招募")
			return ""
		end
	end
    --帮派密谋活动判断
    if GuildConspire then
        if GuildConspire.CheckInTask(player) then
            sLuaApp:NotifyTipsMsgEx(player, "当前状态不可招募")
            return ""
        end
    end
	if TeamHost then
		TeamHost.ApplyTeamer(player)
	end
	return ""
end

--用于切换右侧追踪栏到组队页(目前只在进队的时候切换一次，之后队员变动都不会响应)
function FormTeam.OnSwitchTrackTeam(player)
	local team = player:GetTeam()
	if team then
		local Str = [[
			if TrackUI then
				local Wnd = GUI.Get("TrackUI/TrackNode/TrackWnd")
				if not Wnd then
					TrackUI.OnSwitchTrackPanel(2)
				end
			end
		]]
		sLuaApp:ShowForm(player, "脚本表单", Str)
	end
end

function FormTeam.GetUnlockLevelData()
	if not FormTeam.UnlockLevelTB then
		FormTeam.UnlockLevelTB = {}
	end
	if SwitchOnAward then
		FormTeam.UnlockLevelTB = SwitchOnAward.BeStrongInitData()
	end
end

FormTeam.GetUnlockLevelData()

--其它队伍是否可以见（同屏玩家数量）
function FormTeam.SetOtherTeamCanSee(player,set)
    if player == nil then
        return ""
    end

    set = tonumber(set)
    if set == nil then
        return ''
    end


    if set ~= 0 then
        player:SetInt("TEAM_OtherTeamCanSee", 1)
        player:OtherTeamCanSee(false)
    else
        player:SetInt("TEAM_OtherTeamCanSee", 0)
        player:OtherTeamCanSee(true)
    end

    --sLuaApp:NotifyTipsMsg(player,"传入参数:  "..set)
    --sLuaApp:NotifyTipsMsg(player,"当前存入的值:  "..player:GetInt('TEAM_OtherTeamCanSee'))

    sCustomVarSystem:SetBroadcastScope(0,"TEAM_OtherTeamCanSee",1)

    return ""
end

--设置他人队伍的可见状态
function FormTeam.GetTeamCanSeeOnLogin(player)
    if player == nil then
        return ""
    end

    if player:GetInt('TEAM_OtherTeamCanSee') ~= 0 then
        --player:SetInt("TEAM_OtherTeamCanSee", 1)
        player:OtherTeamCanSee(false)
    else
        player:SetInt("TEAM_OtherTeamCanSee", 0)
        player:OtherTeamCanSee(true)
    end

    sCustomVarSystem:SetBroadcastScope(0,"TEAM_OtherTeamCanSee",1)

end