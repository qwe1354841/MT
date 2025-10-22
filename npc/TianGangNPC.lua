TianGangNPC = {}

function TianGangNPC.option1(npc, player, content)
	if Act_TianGang then
		if not Act_TianGang.StartFight(player, npc) then
			local msg_fight = "有个不知死活的小子正在挑战大爷，等我解决了他，再来收拾你！"
			return msg_fight
		end
	else
		-- sLuaApp:LuaDbg("TianGangNPC")
	end
    return ""
end

function TianGangNPC.main(npc, player)

    if not Act_TianGang then
        sLuaApp:LuaDbg("缺少Act_TianGang")
    end

    if not Act_TianGangConfig then
        sLuaApp:LuaDbg("缺少Act_TianGangConfig")
    end
    
    -- 活动是否开启
    local atcID = sVarSystem:GetInt("Act_TianGang_Id")
    if not sLuaApp:IsActivityRunning(atcID) then
        sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return ""
    end    

    local level_min = tonumber(ActivityConfig.GetById(atcID).LevelMin)
    local join_min_num = Act_TianGangConfig.JoinMinNum
    local Join_Max = Act_TianGangConfig.Join_Max
    local isOnlyJudgeLeaderLevel = Act_TianGangConfig.isOnlyJudgeLeaderLevel
    local isOnlyJudgeLeaderStar = Act_TianGangConfig.isOnlyJudgeLeaderStar
    local nowTime = sLuaApp:GetTimes()
    local team = player:GetTeam()
    local npcName = npc:GetName()

    local memberlist = {}
    if team then
        memberlist = team:GetTeamMembers(false)
    else
        memberlist[1] = player
    end

    local year, month, day
    year = sLuaApp:Year(nowTime)
    month = sLuaApp:Month(nowTime)
    day = sLuaApp:MonthDay(nowTime)
    ymd = year .. '-' .. month .. '-' .. day

    local timeStr = year .. '-' .. month .. '-' .. day
    local todayLastTime = sLuaApp:Str2DateTime(timeStr..' '..'23:59:59')

    -- sLuaApp:LuaDbg("memberlist长度=========================================="..#memberlist)
    -- 初始化星
    for k, v in pairs(memberlist) do
        -- sLuaApp:LuaDbg("遍历==============")
        if v:GetInt("Act_TianGangStarLevel") <= 0 then
            v:SetInt("Act_TianGangStarLevel", 1)
        else
            
            local afterAFewDaysSubStar = Act_TianGangConfig.afterAFewDaysSubStar
            if afterAFewDaysSubStar > 0 then
                
                local lastFightTime = v:GetInt("Act_TianGangLastFightTime")
                if lastFightTime ~= 0 then
                    local subTime = nowTime - lastFightTime
                    local subStarTime = math.modf(subTime / (afterAFewDaysSubStar * 86164))
                    local playerStarLevel = v:GetInt("Act_TianGangStarLevel") 
                    local join_num = v:GetDayInt("Act_TianGang_Join_Num"..atcID)

                    -- sLuaApp:LuaDbg("lastFightTime======"..lastFightTime)
                    -- sLuaApp:LuaDbg("subTime======"..subTime)
                    -- sLuaApp:LuaDbg("subStarTime======"..subStarTime)
                    -- sLuaApp:LuaDbg("playerStarLevel======"..playerStarLevel)
                    -- sLuaApp:LuaDbg("join_num======"..join_num)

                    if subStarTime > 0 then
                        v:SetInt("Act_TianGangLastFightTime", todayLastTime)
                        v:SetInt("Act_TianGangStarLevel", playerStarLevel - (subStarTime * Act_TianGangConfig.subStarLevel))
                        local afterSubStarLevel = v:GetInt("Act_TianGangStarLevel")
                        if afterSubStarLevel <= 0 then
                            v:SetInt("Act_TianGangStarLevel", 1)
                        end
                        -- sLuaApp:LuaDbg("减星后StarLevel======"..v:GetInt("Act_TianGangStarLevel") )
                    end
                end
                    
            end
        end
    end


    local npcStarLevel = npc:GetInt("Act_TianGangStarLevel")

    local temp1 = ""
    if isOnlyJudgeLeaderLevel == 1 then
        temp1 = "队长"
    elseif isOnlyJudgeLeaderLevel == 2 then
        temp1 = "全员"
    end

    local temp2 = ""
    if isOnlyJudgeLeaderStar == 1 then
        temp2 = "队长"
    elseif isOnlyJudgeLeaderStar == 2 then
        temp2 = "全员"
    end
    local join_num = player:GetDayInt("Act_TianGang_Join_Num"..atcID)
    local lastStr = ""
    if join_num >= Join_Max then
        lastStr = "\n(今日此活动已参加上限，无法获得奖励)"
    end
    if Join_Max == 0 then
        lastStr = ""
    end

    local yesMsg = npcName.."听说过么，连我你都敢惹？"..lastStr

    local nextMap = ''
    for k, v in  pairs(Act_TianGangConfig.Refresh) do
        nextMap = k
        for key, value in pairs(v) do
            if value.StarLevel == (npcStarLevel - 1) then
                goto TianGangNPCContinue1
            end
        end
    end

    ::TianGangNPCContinue1::

    local joinNumOrLevelErrMsg = "走开走开！只有至少"..join_min_num.."人组队并且".. temp1 .."等级达到"..level_min.."级的队伍才有资格挑战我！！！"
    local leaderLevelNotEnougnMsg = "走开走开！至少"..level_min.."级才有资格挑战我！！！"

    local errMsg1 = "走开走开！只有".. temp2 .."挑战完"..(npcStarLevel - 1).."星才有资格挑战我！！".."他们在"..nextMap

    local errMsg3 = "走开走开！至少等级达到"..level_min.."级才有资格挑战我！！！"
    local errMsg4 = "走开走开！挑战完"..(npcStarLevel - 1).."星任务才有资格挑战我！！".."他们在"..nextMap


    -- 读配置判断是否满足条件
    if join_min_num > 1 then

        if Lua_tools.GetTeamMember(player,false) < join_min_num then
            return joinNumOrLevelErrMsg
        end

        if Lua_tools.GetTeamLowestlevel(player) < level_min then
            return joinNumOrLevelErrMsg
        end

        -- 配置组队大于1
        -- 判断是否取所有人星
        if isOnlyJudgeLeaderStar == 1 then  -- 只比较队长星
            local playerOfLeader = Lua_tools.GetTeamLeader(player)
            local starLevel = playerOfLeader:GetInt("Act_TianGangStarLevel")
            if starLevel < npcStarLevel then
                return errMsg1
            end
        else  -- 判断全员星
            local players = team:GetTeamMembers(false)
            for k, v in pairs(players) do
                local starLevel = v:GetInt("Act_TianGangStarLevel")
                if starLevel < npcStarLevel then
                    return errMsg1
                end
            end

        end

    else

        if Lua_tools.GetTeamLowestlevel(player) < level_min then
            return errMsg3
        end

        local playerOfLeader = Lua_tools.GetTeamLeader(player)
        local starLevel = playerOfLeader:GetInt("Act_TianGangStarLevel")
        if starLevel < npcStarLevel then
            return errMsg4
        end

    end

    

    -- 满足条件
    local starLevel = player:GetInt("Act_TianGangStarLevel")
    if starLevel > npcStarLevel then
        local nextMap = ''
        for k, v in  pairs(Act_TianGangConfig.Refresh) do
            nextMap = k
            for key, value in pairs(v) do
                if value.StarLevel == (npcStarLevel + 1) then
                    goto TianGangNPCContinue
                end
            end
        end

        ::TianGangNPCContinue::
        player:AddNpcOption(npc, 4, "少废话，看招！", "option1", "")
        return "老跟我们"..npcStarLevel.."星的打有什么意思，有种去跟"..(npcStarLevel + 1).."星的去打！他们在"..nextMap..lastStr
    end

    player:AddNpcOption(npc, 4, "少废话,看招！", "option1", "")
    return yesMsg


end