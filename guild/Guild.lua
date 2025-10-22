--帮派脚本
Guild = {}
GuildTitles = {309, 307, 307, 305, 305, 305, 305, 302, 301}

function GetGuildTitle(player)
	if not sGuildSystem:HasGuild(player) then
		return 0
	end

	local job = sGuildSystem:GetGuildJob(player)
	local idx = job + 1
	return GuildTitles[idx]
end

function LeaveGuildMap(player)
	if player == nil then
		return
	end

	local map = player:GetMap()
	local map_id = map:GetId()
	if map_id ~= 233 then
		return
	end

	local map_dst = sMapSystem:GetMapById(210)
	if player:GetTeam() == nil or sTeamSystem:IsTempLeave(player) then
		sMapSystem:Jump(player, map_dst, 325, 201, 8)
	elseif player:IsTeamLeader() then
		sTeamSystem:EnterMap(player:GetTeam(), map_dst, 325, 201, 8)
	else
		local ret = sTeamSystem:SetTempLeave(player, true)
		if ret == 0 then
			sMapSystem:Jump(player, map_dst, 325, 201, 8)
		end
	end
end

function Guild.on_login(player)
	local cur_title = player:GetInt("GUILD_JOB_TITLE")
	local job_title = GetGuildTitle(player)
	if cur_title ~= job_title then
		if cur_title ~= 0 then
			sTitleSystem:DelTitle(player, cur_title)
			player:SetInt("GUILD_JOB_TITLE", 0)
		end

		if job_title ~= 0 then
			sTitleSystem:AddTitle(player, job_title)
			player:SetInt("GUILD_JOB_TITLE", job_title)
		end
	end

	-- 没有帮派的玩家不能呆在帮派地图
	if not sGuildSystem:HasGuild(player) then
		LeaveGuildMap(player)
	end
end

function Guild.on_join_guild(player)
	if sQuestSystem:GetQuestState(player,8) == 3 then
		sQuestSystem:ForceReady(player,8)
	end

	local job_title = GetGuildTitle(player)
	if job_title ~= 0 then
		sTitleSystem:AddTitle(player, job_title)
		player:SetInt("GUILD_JOB_TITLE", job_title)
	end
	
	local week_val = player:GetWeekInt("GuildDonateWeekValue")
	if week_val >= GuildConfig.DonateConfig['WeekMax'] then
		return 
	end
	if player:GetDayInt("OnLogin_FactionRedPoint") ~= 0 then
		return
	end
	local form_str = [[
		if GlobalProcessing then
			GlobalProcessing.FactionRedPoint()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", form_str)
	player:SetDayInt("OnLogin_FactionRedPoint",1)
end


function Guild.on_leave_guild(player)
	local cur_title = player:GetInt("GUILD_JOB_TITLE")
	if cur_title ~= 0 then
		sTitleSystem:DelTitle(player, cur_title)
		player:SetInt("GUILD_JOB_TITLE", 0)
	end

	-- 退出帮派，需要传出帮派地图
	LeaveGuildMap(player)
end

function Guild.on_guild_job_changed(player)
	local cur_title = player:GetInt("GUILD_JOB_TITLE")
	local job_title = GetGuildTitle(player)
	if cur_title ~= job_title then
		if cur_title ~= 0 then
			sTitleSystem:DelTitle(player, cur_title)
			player:SetInt("GUILD_JOB_TITLE", 0)
		end

		if job_title ~= 0 then
			sTitleSystem:AddTitle(player, job_title)
			player:SetInt("GUILD_JOB_TITLE", job_title)
		end
	end
end

function Guild.ImpeachLeader(t,p)
	local guild = sGuildSystem:GetGuildByGUID(tonumber(p))
	if not guild then
		return
	end
	if guild:GetInt("ImpeachState") ~= 1 then
		return
	end
	if sLuaApp:GetTimes() < guild:GetInt("ImpeachEndTime") then
		sLuaApp:LuaErr("Guild.ImpeachLeader 截至时间错误 ".. sLuaApp:GetTimes().. "  "..guild:GetInt("ImpeachEndTime"))
		return
	end
	
	local player_guid = 0
	if guild:GetMembersWithJob(GUILD_JOB_DEPUTY)[1] then
		player_guid = guild:GetMembersWithJob(GUILD_JOB_DEPUTY)[1]
		local old = guild:GetLeaderGUID()
		local code = sGuildSystem:UpdateMemberJob(guild, player_guid, GUILD_JOB_LEADER)
		--sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, GUILD_JOB_LEADER.."", player_guid.."", code)
		code = sGuildSystem:UpdateMemberJob(guild, old, GUILD_JOB_NORMAL)
		--sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, GUILD_JOB_NORMAL.."", ""..old, code)
	end
	
	if player_guid == 0 then
		local tb = {}
		if guild:GetMembersWithJob(GUILD_JOB_RIGHT_DEACON)[1] then
			table.insert(tb,guild:GetMembersWithJob(GUILD_JOB_RIGHT_DEACON)[1])
		end
		if guild:GetMembersWithJob(GUILD_JOB_LEFT_DEACON)[1] then
			table.insert(tb,guild:GetMembersWithJob(GUILD_JOB_LEFT_DEACON)[1])
		end
		if guild:GetMembersWithJob(GUILD_JOB_TIGER_LEADER)[1] then
			table.insert(tb,guild:GetMembersWithJob(GUILD_JOB_TIGER_LEADER)[1])
		end
		if guild:GetMembersWithJob(GUILD_JOB_DRAGON_LEADER)[1] then
			table.insert(tb,guild:GetMembersWithJob(GUILD_JOB_DRAGON_LEADER)[1])
		end
		if #tb >0 then
			for i= 1 , #tb do
				if sGuildSystem:GetMemberTotalContrbByGuid(tb[i]) > sGuildSystem:GetMemberTotalContrbByGuid(player_guid) then
					player_guid = tb[i]
				else
					if sGuildSystem:GetMemberTotalContrbByGuid(tb[i]) == sGuildSystem:GetMemberTotalContrbByGuid(player_guid) then
						if sGuildSystem:GetMemberJoinTimeByGuid(player_guid) == 0 then
							player_guid = tb[i]
						else
							if sGuildSystem:GetMemberJoinTimeByGuid(tb[i]) < sGuildSystem:GetMemberJoinTimeByGuid(player_guid) then
								player_guid = tb[i]
							end
						end
					end
				end
			end
		end
		local old = guild:GetLeaderGUID()
		local code = sGuildSystem:UpdateMemberJob(guild, player_guid, GUILD_JOB_LEADER)
		--sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, GUILD_JOB_LEADER.."", player_guid.."", code)
		
		code = sGuildSystem:UpdateMemberJob(guild, old, GUILD_JOB_NORMAL)
		--sGuildSystem:NotifyOperationResult(player, GUILD_OPERATE_APPOINT_JOB, GUILD_JOB_NORMAL.."", old.."", code)
	end
	
	if player_guid ~= 0 then
		local member_guid_list = sGuildSystem:GetGuildMembers(guild) 
		for k,v in pairs(member_guid_list) do
			sMailSystem:SendMail(0, "帮派", v, 2, "帮派弹劾通知", "由于帮主在弹劾期间没有上线，弹劾成功"..sContactSystem:GetContactName(player_guid).."成为了本帮帮主", {}, {})
		end
	end
	
	guild:SetInt("ImpeachState",0)
	guild:SetString("ImpeachInitiator","")
	guild:SetInt("ImpeachEndTime",0)
	guild:SetInt("ImpeachTimer",0)
end

function Guild.On_Sys_Start()
	for k,v in pairs(sGuildSystem:GetAllGuilds()) do
		if v:GetInt("ImpeachState") == 1 then
			local now_time = sLuaApp:GetTimes()
			local end_time = v:GetInt("ImpeachEndTime")	
			if now_time >= end_time then
				Guild.ImpeachLeader(0,v:GetGUID())
			else
				v:SetInt("ImpeachTimer",sLuaTimerSystem:AddTimerEx(sSystem, (end_time - now_time)*1000 , 1, "Guild.ImpeachLeader", ""..v:GetGUID()))
			end
		end
	end
end

function Guild.player_on_login(player)
	local guild = player:GetGuild()
	if guild then
		if guild:GetInt("ImpeachState") == 1 then
			if tonumber(player:GetGUID()) == tonumber(guild:GetLeaderGUID())then
				if sLuaTimerSystem:HasTimer(guild:GetInt("ImpeachTimer")) then
					sLuaTimerSystem:DisableTimer(guild:GetInt("ImpeachTimer"))
				end
				guild:SetInt("ImpeachState",0)
				guild:SetString("ImpeachInitiator","")
				guild:SetInt("ImpeachEndTime",0)
				guild:SetInt("ImpeachTimer",0)
			end
		end
	end
end

function Guild.on_pre_jump_map(player, to_map)
	if not player or not to_map then
        return
    end
    if to_map:GetKeyName() == "帮派地图" then
        local guild = player:GetGuild()
        if not guild then
            sLuaApp:NotifyTipsMsg(player, "无帮派人员无法进入帮派地图")
            return false
        end

        if player:GetTeam() then
            local members = player:GetTeam():GetTeamMembers(true)
            for i, v in ipairs(members) do
                if v:GetGuild() ~= guild then
                    sLuaApp:NotifyTipsMsg(player, "队伍中有非本帮派成员，无法进入帮派地图")
                    return false
                end
            end
        else
            local guild_map = guild:GetMap()
            if guild_map ~= to_map then
				if player:GetInt("GuildConspire_Status") == 1 and to_map:GetInt("GuildGUID") == player:GetInt("GuildConspire_AimGuildGUID") then
					return true
				end
                sLuaApp:NotifyTipsMsg(player, "无法进入非本帮派的帮派地图")
                return false
            end
        end
    end
    return true
end