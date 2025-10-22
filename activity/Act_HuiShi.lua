--会试

Act_HuiShi = {}

-- Act_HuiShi.join_max = 1  -- 最大参加次数 暂时写死了 最多只能参加一次
Act_HuiShi.active_max = 0  -- 参加完活动给的活跃

Act_HuiShi.rank_type = 50

--[[
    [1] = "金元宝",
	[2] = "银元宝",
	[4] = "金币",
	[5] = "银币",
--]]
Act_HuiShi.jumpMoney = {  -- 直接跳转所需花费的钱
    moneyType = 1,
    moneyNum = 100
}

Act_HuiShi.systemAnswerSendProp = true  -- 系统回答是否有几率给道具

Act_HuiShi.RewardCoinType1 = 295  -- 经验图标
Act_HuiShi.RewardCoinType2 = 300  -- 银币图标

Act_HuiShi.addSomeGifts = {
    win = {
        RewardCoin1 = "160*Level",
        RewardCoin2 = "160*Level",
    },
    lose = {
        RewardCoin1 = "80*Level",
        RewardCoin2 = "80*Level"
    }
}
Act_HuiShi.sendPropProbability = 20 -- 答对后给道具的概率，10就是10%
Act_HuiShi.currentNPCAnswered = '道具使用失败，请前往下一个考官'

Act_HuiShi.everyAnswerTime = 30 -- 每次答题时间，单位秒

Act_HuiShi.maxAnswerNum = 30  -- 共多少题
Act_HuiShi.preRankingNum = 20  -- 前多少名获得殿试资格
Act_HuiShi.desc = '科举会试玩法说明：\\n'
Act_HuiShi.desc = Act_HuiShi.desc .. '1、通过乡试获得会试资格。\\n'
Act_HuiShi.desc = Act_HuiShi.desc .. '2、会试一共'.. Act_HuiShi.maxAnswerNum ..'道题，答完才能生成排名，排名前'.. Act_HuiShi.preRankingNum ..'即可获得殿试资格。\\n'
Act_HuiShi.desc = Act_HuiShi.desc .. '3、每次回答，无论对错都会获得奖励。答对有'..Act_HuiShi.sendPropProbability..'%的概率获得以下任意一个道具。'

Act_HuiShi.end_mail_item={}

Act_HuiShi.ShowItem = "61024,61025"

Act_HuiShi.endMailReward = {  -- 获取殿试资格的礼包
	reward_other = {Gold = 0, Item = { }}
}



-- 活动开始前回调
function Act_HuiShi.OnDeclare(id, seconds)
end

-- 活动开始回调
function Act_HuiShi.OnStart(id, is_normal)
    --sLuaApp:LuaDbg("Act_HuiShi.OnStart ActStart id======"..id .. tostring(is_normal))
    sVarSystem:SetInt("ACTIVITY_HuiShi_Id", id)
    Act_HuiShi.CreateNpc()

    if RankingListSystem then
		if RankingListSystem.Config then
			Act_HuiShi.rank_type = RankingListSystem.Config['会试排行榜'] or 50
		end
	end

    sRanklistSystem:ClearRanklist( Act_HuiShi.rank_type)--清空排行榜
	if Data then
		Data["HuiShiAnswered"] = {}
	end
end

-- 活动结束回调
function Act_HuiShi.OnStop(id)
    Act_HuiShi.Initialization()
    -- sLuaApp:LuaDbg("ActOver id======"..id)
    
 
    local rankList = sRanklistSystem:GetRanklist(RankingListSystem.Config['会试排行榜'] or 50, 1, Act_HuiShi.preRankingNum)
	if #rankList > 0 then
		local weekFirstShortTime = tonumber(rankList[1][4])
		local weekFirstRightNum = math.floor(rankList[1][2]  / 100000)
		--sLuaApp:LuaDbg("weekFirstRightNum"..weekFirstRightNum)
		local worldFirstRightNum = sDBVarSystem:GetInt('HuiShiRankingFirstShortTime')
		local worldFirstShortTime = sDBVarSystem:GetInt('HuiShiRankingFirstRightAnswerNum')

		if worldFirstShortTime == 0 then
			sDBVarSystem:SetInt('HuiShiRankingFirstShortTime', weekFirstShortTime, 6)
			sDBVarSystem:SetInt('HuiShiRankingFirstRightAnswerNum', weekFirstRightNum, 6)
		else
			-- 比较正确答题数
			if weekFirstRightNum >= worldFirstRightNum and weekFirstShortTime < worldFirstShortTime then
				sDBVarSystem:SetInt('HuiShiRankingFirstShortTime', weekFirstShortTime, 6)
				sDBVarSystem:SetInt('HuiShiRankingFirstRightAnswerNum', weekFirstRightNum, 6)
			end

		end

		for k, v in pairs(rankList) do
			local info = v[4]
			local str = '你的会试排名是第'.. k ..'名，恭喜你获得了殿试资格，请于今日19点前找长安城房玄龄'
			sMailSystem:SendMail( 0, "会试主考官", rankList[k][1], 1, "会试结果", str,{}, Act_HuiShi.end_mail_item.reward_other)
		end
	end
    -- 活动结束销毁npc
    for k, v in pairs(Data.Act_HuiShi['NPCGUIDList']) do
        local npc = sNpcSystem:GetNpcByGUID(v)
        sNpcSystem:DestroyNpc(npc)
    end
	
	if Data and Data["HuiShiAnswered"] then
		Data["HuiShiAnswered"] = {}
	end
end

-- 玩家点击参与活动回调
function Act_HuiShi.OnJoin(id, player)
    -- sLuaApp:LuaDbg("ActJoin id======"..id)

	-- 活动是否开启
	if not sLuaApp:IsActivityRunning(id) then
		sLuaApp:NotifyTipsMsg(player, "活动未开启，无法参加")
        return
    end

    local team = player:GetTeam()
    if team then
        sLuaApp:NotifyTipsMsg(player, "科举是单人活动，无法组队参加")
        return
    end

	local activityData = ActivityConfig.GetById(id)
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(activityData.LevelMin) then
        sLuaApp:NotifyTipsMsg(player, "达到"..activityData.LevelMin.."级才能参加")
        return
    end

    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        sLuaApp:NotifyTipsMsg(player, "今日已参加过会试活动")
        return 
    end

    local str = [[
        GUI.CloseWnd("ActivityPanelUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
	--引导玩家到活动npc
    -- Lua_tools.MoveToNpc(player, 10218)
    Lua_tools.Jump(player, sMapSystem:GetMapById(210), 280, 197, 5)
end

-- 玩家客户端查询数据回调
function Act_HuiShi.OnQuery(id, player)
	-- local join_num = player:GetDayInt("HuiShi_join_num"..id)
    -- local active_num = player:GetDayInt("HuiShi_active_num"..id)
    local join_num = 0
    local active_num = 0
    local max_join = 1
    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        join_num = 1
        active_num = Act_HuiShi.active_max
    end

	-- local str = join_num..":"..Act_HuiShi.join_max..":"..active_num..":"..Act_HuiShi.active_max..":61024,20122,31006:2:2,5"
	local str = join_num..":"..max_join..":"..player:GetDayInt("HuiShiActiveVal")..":"..Act_HuiShi.active_max..":"..Act_HuiShi.ShowItem..":2:"..(ActivitySystem.Act_GetClassify("Act_HuiShi") or '2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

function Act_HuiShi.CreateNpc()
    -- 定义刷新出NPC的地图
    local mapAndNpc = {
        {
            npcId = 10218,     -- 会试主考官
            mapId = 210,       -- 长安城
            positionX = 280,
            positionY = 197,
			orientation = 5
        },
        {
            npcId = 10221,     -- 会试主考官2
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 159,
                    positionY = 121,
                    orientation = 3
                },
                {
                    positionX = 165,
                    positionY = 61,
                    orientation = 3
                },
                {
                    positionX = 229,
                    positionY = 30,
                    orientation = 3
                },
            }
            
        },
        {
            npcId = 10222,     -- 会试主考官3
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 235,
                    positionY = 136,
                    orientation = 5
                },
                {
                    positionX = 342,
                    positionY = 194,
                    orientation = 5
                },
                {
                    positionX = 441,
                    positionY = 244,
                    orientation = 5
                },
            }
        },
        {
            npcId = 10223,     -- 会试主考官4
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 150,
                    positionY = 251,
                    orientation = 3
                },
                {
                    positionX = 178,
                    positionY = 236,
                    orientation = 3
                },
                {
                    positionX = 258,
                    positionY = 193,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10224,     -- 会试主考官5
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 412,
                    positionY = 180,
                    orientation = 3
                },
                {
                    positionX = 457,
                    positionY = 153,
                    orientation = 3
                },
                {
                    positionX = 493,
                    positionY = 135,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10225,     -- 会试主考官6
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 202,
                    positionY = 119,
                    orientation = 5
                },
                {
                    positionX = 485,
                    positionY = 263,
                    orientation = 5
                },
                {
                    positionX = 515,
                    positionY = 284,
                    orientation = 5
                },
            }
        },
        {
            npcId = 10226,     -- 会试主考官7
            mapId = 209,       -- 江南野外
            pos = {
                {
                    positionX = 103,
                    positionY = 154,
                    orientation = 4
                },
                {
                    positionX = 143,
                    positionY = 163,
                    orientation = 5
                },
                {
                    positionX = 64,
                    positionY = 192,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10227,     -- 会试主考官8
            mapId = 209,       -- 江南野外
            pos = {
                {
                    positionX = 156,
                    positionY = 82,
                    orientation = 3
                },
                {
                    positionX = 173,
                    positionY = 105,
                    orientation = 5
                },
                {
                    positionX = 125,
                    positionY = 96,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10228,     -- 会试主考官9
            mapId = 209,       -- 江南野外
            pos = {
                {
                    positionX = 123,
                    positionY = 50,
                    orientation = 5
                },
                {
                    positionX = 110,
                    positionY = 63,
                    orientation = 7
                },
                {
                    positionX = 85,
                    positionY = 74,
                    orientation = 7
                },
            }
        },
        {
            npcId = 10229,     -- 会试主考官10
            mapId = 204,       -- 慈恩寺
            pos = {
                {
                    positionX = 84,
                    positionY = 21,
                    orientation = 4
                },
                {
                    positionX = 115,
                    positionY = 21,
                    orientation = 7
                },
                {
                    positionX = 169,
                    positionY = 146,
                    orientation = 5
                },
            }
        },
        {
            npcId = 10230,     -- 会试主考官11
            mapId = 204,       -- 慈恩寺
            pos = {
                {
                    positionX = 57,
                    positionY = 78,
                    orientation = 5
                },
                {
                    positionX = 16,
                    positionY = 68,
                    orientation = 3
                },
                {
                    positionX = 34,
                    positionY = 91,
                    orientation = 8
                },
            }
        },
        {
            npcId = 10231,     -- 会试主考官12
            mapId = 204,       -- 慈恩寺
            pos = {
                {
                    positionX = 101,
                    positionY = 100,
                    orientation = 4
                },
                {
                    positionX = 120,
                    positionY = 113,
                    orientation = 7
                },
                {
                    positionX = 76,
                    positionY = 105,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10232,     -- 会试主考官13
            mapId = 204,       -- 慈恩寺
            pos = {
                {
                    positionX = 181,
                    positionY = 62,
                    orientation = 4
                },
                {
                    positionX = 150,
                    positionY = 71,
                    orientation = 4
                },
                {
                    positionX = 198,
                    positionY = 75,
                    orientation = 5
                },
            }
        },
        {
            npcId = 10233,     -- 会试主考官14
            mapId = 203,       -- 傲来村野
            pos = {
                {
                    positionX = 53,
                    positionY = 137,
                    orientation = 4
                },
                {
                    positionX = 186,
                    positionY = 23,
                    orientation = 5
                },
                {
                    positionX = 98,
                    positionY = 55,
                    orientation = 3
                },
            }
        },
        {
            npcId = 10234,     -- 会试主考官15
            mapId = 203,       -- 傲来村野
            pos = {
                {
                    positionX = 95,
                    positionY = 35,
                    orientation = 4
                },
                {
                    positionX = 43,
                    positionY = 42,
                    orientation = 3
                },
                {
                    positionX = 110,
                    positionY = 48,
                    orientation = 6
                },
            }
        },
        {
            npcId = 10235,     -- 会试主考官16
            mapId = 203,       -- 傲来村野
            pos = {
                {
                    positionX = 174,
                    positionY = 57,
                    orientation = 4
                },
                {
                    positionX = 196,
                    positionY = 65,
                    orientation = 5
                },
                {
                    positionX = 187,
                    positionY = 59,
                    orientation = 4
                },
            }
        },
        {
            npcId = 10236,     -- 会试主考官17
            mapId = 203,       -- 傲来村野
            pos = {
                {
                    positionX = 123,
                    positionY = 81,
                    orientation = 5
                },
                {
                    positionX = 110,
                    positionY = 94,
                    orientation = 2
                },
                {
                    positionX = 152,
                    positionY = 92,
                    orientation = 5
                },
            }
        },
        {
            npcId = 10237,     -- 会试主考官18
            mapId = 203,       -- 傲来村野
            pos = {
                {
                    positionX = 33,
                    positionY = 99,
                    orientation = 4
                },
                {
                    positionX = 136,
                    positionY = 14,
                    orientation = 4
                },
                {
                    positionX = 171,
                    positionY = 122,
                    orientation = 4
                },
            }
        },
    
        {
            npcId = 10238,     -- 会试主考官19
            mapId = 209,       -- 江南野外
            pos = {
                {
                    positionX = 109,
                    positionY = 167,
                    orientation = 4
                },
                {
                    positionX = 130,
                    positionY = 182,
                    orientation = 4
                },
                {
                    positionX = 90,
                    positionY = 48,
                    orientation = 4
                },
            }
        },
        {
            npcId = 10239,     -- 会试主考官20
            mapId = 210,       -- 长安城
            pos = {
                {
                    positionX = 360,
                    positionY = 69,
                    orientation = 3
                },
                {
                    positionX = 349,
                    positionY = 27,
                    orientation = 3
                },
                {
                    positionX = 168,
                    positionY = 115,
                    orientation = 3
                },
            }
        },
    
    
    }

    if Data then
		Data.Act_HuiShi = {}
        Data.Act_HuiShi['NPCGUIDList'] = {}
        Data.Act_HuiShi['RankingList'] = {}
        
	else
		sLuaApp:LuaErr("缺少Data文件")
		return
    end
    
    --主考官单独创建
    --local mainNPC =  {
    --    npcId = 10218,     -- 会试主考官
    --    mapId = 210,       -- 长安城
    --    positionX = 252,
    --    positionY = 87,
    --}
	--
    --local npc
    --npc = sNpcSystem:CreateNpc(mainNPC.npcId, sMapSystem:GetMapById(mainNPC.mapId), mainNPC.positionX, mainNPC.positionY, 1, 2, 0)
    ---- Act_HuiShi.mainNPCGUID = npc:GetGUID()
    --sVarSystem:SetInt("ACTIVITY_HUISHI_MAINNPC_GUId", npc:GetGUID())
	--sVarSystem:SetInt("ACTIVITY_HUISHI_MAINNPC_GUId", sNpcSystem:CreateNpc(10218, sMapSystem:GetMapById(210), 252, 87, 1, 2, 0):GetGUID())
    
	for k, v in pairs(mapAndNpc) do
		local table_npc
		if v.pos then
			local genRes = sLuaApp:RandInteger(1, #v.pos)
			-- sLuaApp:LuaDbg('genRes===='..genRes)
			-- sLuaApp:LuaDbg('positionX===='..v.pos[genRes].positionX)
			-- sLuaApp:LuaDbg('positionY===='..v.pos[genRes].positionY)
			-- sLuaApp:LuaDbg('orientation===='..v.pos[genRes].orientation)
			table_npc = v.pos[genRes]		
		else
			table_npc = v
		end		
		local npc = sNpcSystem:CreateNpc(v.npcId, sMapSystem:GetMapById(v.mapId), table_npc.positionX, table_npc.positionY, 0, table_npc.orientation, 0)
		if not npc then
			sLuaApp:LuaErr("创建NPC失败！ npcId = " .. v.npcId .. " mapId = " .. v.mapId .. " X = " .. table_npc.positionX .. " Y = " .. table_npc.positionY)
		else
			table.insert(Data.Act_HuiShi['NPCGUIDList'], npc:GetGUID())
		end	
    end

    -- sLuaApp:LuaDbg("NPC创建完毕=========")

end



--获得随机题目 --题库范围不能小于答题总量
function Act_HuiShi.GetQuestion(player, rand_times)
	local genRes = sLuaApp:RandInteger(1, 1125)
	local question = QuestionImperialConfig.GetById(genRes)
	if not question then
		if not rand_times then 
			rand_times = 1
		else
			rand_times = rand_times + 1
		end		
		if rand_times >= 5 then
			local genRes = sLuaApp:RandInteger(1, 100)
			if not Act_HuiShi.CheckRepeat(player, genRes) then
				return Act_HuiShi.GetQuestion(player)
			end
			local question = QuestionImperialConfig.GetById(genRes)
			player:SetDayInt("HuiShiCurrentQuestionID", genRes)
			player:SetDayInt("QuestionIndex", genRes)
			return question
		end
		return Act_HuiShi.GetQuestion(player, rand_times)
	else
		if not Act_HuiShi.CheckRepeat(player, genRes) then
			return Act_HuiShi.GetQuestion(player)
		end
		player:SetDayInt("HuiShiCurrentQuestionID", genRes)
		player:SetDayInt("QuestionIndex", genRes)
		return question
	end
end

--检查题目是否重复
function Act_HuiShi.CheckRepeat(player, genRes)
	local player_guid = tostring(player:GetGUID())
	if Data and Data["HuiShiAnswered"] then
		if Data["HuiShiAnswered"][player_guid] then
			for _,v in ipairs(Data["HuiShiAnswered"][player_guid]) do 
				if genRes == v then
					return false
				end
			end
		end
	end
	return true
end

function Act_HuiShi.OpenForm(player)

    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_HuiShi_Id"))
    local time = sLuaApp:GetTimes()
	-- sLuaApp:LuaDbg('sLuaApp:GetTimes()==='..time)
    local year, month, day
    year = sLuaApp:Year(time)
    month = sLuaApp:Month(time)
    day = sLuaApp:MonthDay(time)
    ymd = year .. '-' .. month .. '-' .. day
	-- ymd = os.date("%Y-%m-%d",time)  -- 年月日字符串
	local hms = activityData.TimeEnd  -- 时分秒字符串
	-- sLuaApp:LuaDbg("时间字符串==="..ymd..' '..hms)    -- 测试
    local endTime = sLuaApp:Str2DateTime(ymd..' '..hms)


    local actEndTime = endTime - time

    
    -- 设置答题前题目数
    player:SetDayInt("HuiShiAnswerBeforeNum", player:GetDayInt("HuiShiAllAnswersCount"))

    if player:GetDayInt("HuiShiAllAnswersCount") == 0 then
        -- 存答题时间戳
        player:SetDayInt("HuiShiAnswerStartTime", sLuaApp:GetTimes())
    end



    -- if player:GetDayInt("HuiShiCurrentQuestionID") == 0 then
        -- -- 随机生成1-1125
        -- genRes = sLuaApp:RandInteger(1, 1125)

        -- -- 倒计时定时器
        -- -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_HuiShi.everyAnswerTime * 1000 ,1,"Act_HuiShi.Every_Answer_Countdown", "")
        -- -- 活动结束定时器
        -- local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_HuiShi.Act_End", "")

        -- if not sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
            -- -- 答题时间统计
            -- local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_HuiShi.Time_Count", "")
            -- player:SetDayInt('HuiShiTime3', timer3)
        -- end

        -- -- player:SetDayInt('HuiShiTime1', timer1)
        -- player:SetDayInt('HuiShiTime2', timer2)
        
    -- else
        -- genRes = player:GetDayInt("HuiShiCurrentQuestionID")

        -- -- 倒计时定时器
        -- -- local timer1 = sLuaTimerSystem:AddTimerEx(player, (Act_HuiShi.everyAnswerTime - player:GetDayInt("HuiShiTimeCount"))  * 1000,1,"Act_HuiShi.Every_Answer_Countdown", "")
        -- -- 活动结束定时器
        -- local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_HuiShi.Act_End", "")
        -- if not sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
            -- -- 答题时间统计
            -- local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_HuiShi.Time_Count", "")
            -- player:SetDayInt('HuiShiTime3', timer3)
        -- end

        -- -- 搞完这个搞传的时间
        -- -- player:SetDayInt('HuiShiTime1', timer1)
        -- player:SetDayInt('HuiShiTime2', timer2)
        

    -- end
	--local genRes
    local question
    local optionArr = {}
    local rightAnswerIndex
	-------------修
	if player:GetDayInt("HuiShiCurrentQuestionID") == 0 then
		question = Act_HuiShi.GetQuestion(player)
		player:SetDayInt("HuiShiTimeCount", time + Act_HuiShi.everyAnswerTime)
		
		local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_HuiShi.Act_End", "")
		player:SetDayInt('HuiShiTime2', timer2)
		
		local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_HuiShi.everyAnswerTime * 1000 , 1,"Act_HuiShi.Every_Answer_Countdown", "")
		player:SetDayInt('HuiShiTime3', countdown_timer)
	else
		question = QuestionImperialConfig.GetById(player:GetDayInt("HuiShiCurrentQuestionID"))
	end
	-------------修

    -- question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

    --player:SetDayInt("HuiShiCurrentQuestionID", genRes)
    table.insert(optionArr,question.True)
    table.insert(optionArr,question.False1)
    table.insert(optionArr,question.False2)
    table.insert(optionArr,question.False3)

    -- 把选项打乱
    for i = 1, #optionArr do
        local currentRandom = sLuaApp:RandInteger(1, #optionArr)
        local current = optionArr[i]
        optionArr[i] = optionArr[currentRandom]
        optionArr[currentRandom] = current
    end

    -- 正确答案的下标
    for k, v in pairs(optionArr) do
        if question.True == v then
            rightAnswerIndex = k
            break
        end
    end

	player:SetDayInt('HuiShiTotal',player:GetDayInt("HuiShiAllAnswersCount"))
	-- sLuaApp:LuaDbg("正确答案的索引为："..rightAnswerIndex)    -- 测试
    player:SetDayInt("HuiShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("HuiShiCurrentRightAnswer"))    -- 测试
	-- 生成时间戳
	

    player:SetDayString('HuiShiCurrentQuestionStr', question.Ask)

    local str = [[
        GUI.OpenWnd("ExamUI")
        if ExamUI then
            ExamUI.EndTime = ]] .. player:GetDayInt("HuiShiTimeCount") ..[[
            ExamUI.Desc = "]] .. Act_HuiShi.desc .. '"' .. [[
            ExamUI.RewardCoinType1 = ]] .. Act_HuiShi.RewardCoinType1 .. [[
            ExamUI.RewardCoinType2 = ]] .. Act_HuiShi.RewardCoinType2 .. [[
            ExamUI.Type = 2

            ExamUI.InitPanel()
            ExamUI.HaveQualifications = false
            ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("HuiShiAllAnswersCount") + 1 .. [[

            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

            ExamUI.EndFlag = false

            ExamUI.RefreshPanel()


        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

	
    player:SetDayInt("HuiShipreviousRightAnswerIndex",player:GetDayInt("HuiShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)
    player:SetDayInt("HuiShi_HandClose",0)

    return ""
end

-- 接收答案
function Act_HuiShi.ReceiveAnswer(player, content)
    if player:GetDayInt("HuiShiAllAnswersCount") > Act_HuiShi.maxAnswerNum then
        return ""
    end

	if Data and Data["HuiShiAnswered"] then
		local player_guid = tostring(player:GetGUID())
		if not  Data["HuiShiAnswered"][player_guid] then
			Data["HuiShiAnswered"][player_guid] = {}
		end
		table.insert(Data["HuiShiAnswered"][player_guid], player:GetDayInt("HuiShiCurrentQuestionID"))
	end
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
    end
    
    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    player:SetDayInt('HuiShiTimeCount', 0)
	
    local CurrentKaoGuanGUIDStr = player:GetDayString("HuiShiCurrentKaoGuanGUID")

    if player:GetDayInt("HuiShiAnswerBeforeNum") ~= player:GetDayInt("HuiShiAllAnswersCount") then
        sLuaApp:NotifyTipsMsg(player, '当前题目已答，请前往下一个考官')
        return ""
    end

    if player:GetDayInt("HuiShipreviousRightAnswerIndex") == tonumber(content) then
        player:SetDayInt("HuiShiRightAnswersCount", player:GetDayInt("HuiShiRightAnswersCount") + 1) -- 答对题数
		
		local winExp = Act_HuiShi.ExpCalucation(player, true)
		local winGold = Act_HuiShi.GoldCalucation(player, true)
		
        player:AddExp(winExp,'system','会试','回答正确')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(winExp, "system", "会试", "回答正确")
		end
        Lua_tools.AddMoney(player, 5, winGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..winGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + winExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + winGold)

        -- 几率给道具
        local systemGifts = {'HuiShiSystemAnsWerNum', 'HuiShiSystemTipNum', 'HuiShiSystemChangeQuestionsNum'}
        local genRes = Act_HuiShi.GenRandomNum()
        if genRes ~= 0 then
            player:SetInt(systemGifts[genRes], player:GetInt(systemGifts[genRes]) + 1)
            if genRes == 1 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次系统作答机会")
            elseif genRes == 2 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次系统提示机会")
            elseif genRes == 3 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次切换试题机会")
            end
        end
        -- 存排名
        -- Act_HuiShi.SaveRanking(player)

    else
		local loseExp = Act_HuiShi.ExpCalucation(player, false)
		local loseGold = Act_HuiShi.GoldCalucation(player, false)
		
        player:AddExp(loseExp,'system','会试','回答正确')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(loseExp, "system", "会试", "回答正确")
		end
        Lua_tools.AddMoney(player, 5, loseGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..loseGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + loseExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + loseGold)
    end



    player:SetDayInt("HuiShiAllAnswersCount", player:GetDayInt("HuiShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    
    -- 答题超过限制
    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        -- sLuaApp:LuaDbg("答题超过限制========")
        activityData = ActivityConfig.GetById(32) 
        sLuaApp:NotifyTipsMsg(player, "会试结束了，您一共答对了"..player:GetDayInt("HuiShiRightAnswersCount").."题，今晚"..activityData.TimeEnd.."点将发布会试结果，会试前"..Act_HuiShi.preRankingNum.."名的考生将获得殿试资格")
        player:SetWeekInt("XiangShiToHuiShi",0)
    
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("HuiShipreviousRightAnswerIndex") .. [[
                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        Act_HuiShi.SaveNextKaoGuanGUID(player)
        -- 更新排名
        Act_HuiShi.SaveRankingTwo(player)

        sLuaTimerSystem:AddTimerEx(player, 1200 ,1,"Act_HuiShi.YanChiClose", ""..player:GetInt("HuiShi_LastNPC"))

        return ""
    end


    local str = [[
        if ExamUI then
            
            ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

            ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("HuiShipreviousRightAnswerIndex") .. [[
            
            ExamUI.EndFlag = true
            ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

            ExamUI.RefreshPanel()
			
			Timer.New(ExamUI.OnClose,0.5,1)
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    -- 显示答案
    sLuaApp:NotifyTipsMsg(player, "请前往下一个考官")
    -- 往玩家身上存下一个考官NPC
    player:SetDayInt("HuiShiIsFirstKaoGuan",1) -- 第一个考官状态
    -- 往玩家身上存下一个考官的GUID


    -- if player:GetDayString("HuiShiAnsweredKaoGuanGUID") == '' then
    --     player:SetDayString("HuiShiAnsweredKaoGuanGUID",player:GetDayString("HuiShiCurrentKaoGuanGUID")..',')
    -- else
    --     player:SetDayString("HuiShiAnsweredKaoGuanGUID",player:GetDayString("HuiShiAnsweredKaoGuanGUID")..player:GetDayString("HuiShiCurrentKaoGuanGUID")..',')
    -- end
	sLuaTimerSystem:AddTimerEx(player, 1200 ,1,"Act_HuiShi.YanChiClose", ""..player:GetInt("HuiShi_LastNPC"))

    Act_HuiShi.SaveNextKaoGuanGUID(player)
	
    -- sLuaApp:LuaDbg("已答过题的NPC"..player:GetDayString("HuiShiAnsweredKaoGuanGUID"))
    
    --


    return ""
end

-- 换一道题
function Act_HuiShi.ChangeQuestion(player)
    if player:GetDayInt("HuiShiAllAnswersCount") > Act_HuiShi.maxAnswerNum then
        return ""
    end
    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_HuiShi_Id"))
    -- 判断道具数量
    if player:GetInt('HuiShiSystemChangeQuestionsNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    if player:GetDayInt("HuiShiAnswerBeforeNum") ~= player:GetDayInt("HuiShiAllAnswersCount") then
        sLuaApp:NotifyTipsMsg(player, Act_HuiShi.currentNPCAnswered)
        return ""
    end

    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
    end
   -- player:SetDayInt('HuiShiTimeCount', 0)
    local now_time = sLuaApp:GetTimes()
	player:SetDayInt("HuiShiTimeCount", now_time + Act_HuiShi.everyAnswerTime)
	player:SetDayInt('HuiShiTotal',player:GetDayInt("HuiShiAllAnswersCount"))

    -- 生成时间戳
	local time = sLuaApp:GetTimes()
	-- sLuaApp:LuaDbg('sLuaApp:GetTimes()==='..time)
    local year, month, day
    year = sLuaApp:Year(time)
    month = sLuaApp:Month(time)
    day = sLuaApp:MonthDay(time)
    ymd = year .. '-' .. month .. '-' .. day
	-- ymd = os.date("%Y-%m-%d",time)  -- 年月日字符串
	local hms = activityData.TimeEnd  -- 时分秒字符串
	-- sLuaApp:LuaDbg("时间字符串==="..ymd..' '..hms)    -- 测试
	local endTime = sLuaApp:Str2DateTime(ymd..' '..hms)

    local actEndTime = endTime - time
    -- 答完题销毁  用户点击关闭按钮销毁
    -- 倒计时定时器
    -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_HuiShi.everyAnswerTime * 1000 ,1,"Act_HuiShi.Every_Answer_Countdown", "")
    -- 活动结束定时器
    local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_HuiShi.Act_End", "")
    -- 答题时间统计
   -- local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_HuiShi.Time_Count", "")

    -- player:SetDayInt('HuiShiTime1', timer1)
    player:SetDayInt('HuiShiTime2', timer2)
	
	local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_HuiShi.everyAnswerTime * 1000 , 1,"Act_HuiShi.Every_Answer_Countdown", "")
	player:SetDayInt('HuiShiTime3', countdown_timer)
    --player:SetDayInt('HuiShiTime3', timer3)

    player:SetInt('HuiShiSystemChangeQuestionsNum', player:GetInt('HuiShiSystemChangeQuestionsNum') - 1)

    -- local genRes
    -- local question
    local optionArr = {}
    local rightAnswerIndex
	
	local question = Act_HuiShi.GetQuestion(player)
    -- -- 随机生成1-1125
    -- genRes = sLuaApp:RandInteger(1, 1125)
    -- question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

   -- player:SetDayInt("HuiShiCurrentQuestionID", genRes)
	table.insert(optionArr,question.True)
	table.insert(optionArr,question.False1)
	table.insert(optionArr,question.False2)
	table.insert(optionArr,question.False3)

	-- 把玩家当前正在答题的正确答案存玩家身上
	-- player:SetDayInt('')

	-- 把选项打乱
	for i = 1, #optionArr do
		local currentRandom = sLuaApp:RandInteger(1, #optionArr)
		local current = optionArr[i]
		optionArr[i] = optionArr[currentRandom]
		optionArr[currentRandom] = current
	end


	-- 正确答案的下标
	local rightAnswerIndex
	for k, v in pairs(optionArr) do
		if question.True == v then
			rightAnswerIndex = k
			break
		end
	end
	-- sLuaApp:LuaDbg("正确答案的索引为："..rightAnswerIndex)    -- 测试
    player:SetDayInt("HuiShiCurrentRightAnswer",rightAnswerIndex)
    player:SetDayString('HuiShiCurrentQuestionStr', question.Ask)

    local str = [[
		if ExamUI then
            
            ExamUI.EndTime = ]] .. player:GetDayInt("HuiShiTimeCount") ..[[
            ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("HuiShiAllAnswersCount") + 1 .. [[
            
            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

            ExamUI.EndFlag = false

            ExamUI.RefreshPanel()


		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    
	--sLuaTimerSystem:AddTimerEx(player, 1200 ,1,"Act_HuiShi.YanChiClose", ""..player:GetInt("HuiShi_LastNPC"))
    player:SetDayInt("HuiShipreviousRightAnswerIndex",player:GetDayInt("HuiShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)

    return ""



end

-- 找出正确的题 返回正确答案的索引
function Act_HuiShi.FindRightAnswer(player)
    -- sLuaApp:LuaDbg("来到了Act_HuiShi.FindRightAnswer====")
    -- 判断道具数量
    if player:GetInt('HuiShiSystemAnsWerNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    if player:GetDayInt("HuiShiAnswerBeforeNum") ~= player:GetDayInt("HuiShiAllAnswersCount") then
        sLuaApp:NotifyTipsMsg(player, Act_HuiShi.currentNPCAnswered)
        return ""
    end

    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    --player:SetDayInt('HuiShiTimeCount', 0)
	local now_time = sLuaApp:GetTimes()
	player:SetDayInt("HuiShiTimeCount", now_time + Act_HuiShi.everyAnswerTime)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
    end


    player:SetDayInt("HuiShiRightAnswersCount", player:GetDayInt("HuiShiRightAnswersCount") + 1) -- 答对题数
    player:SetDayInt("HuiShiAllAnswersCount", player:GetDayInt("HuiShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end

    -- 答题超过限制
    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        -- sLuaApp:LuaDbg("答题超过限制========")
        activityData = ActivityConfig.GetById(32) 
        sLuaApp:NotifyTipsMsg(player, "会试结束了，您一共答对了"..player:GetDayInt("HuiShiRightAnswersCount").."题，今晚"..activityData.TimeEnd.."点将发布会试结果，会试前"..Act_HuiShi.preRankingNum.."名的考生将获得殿试资格")
        player:SetWeekInt("XiangShiToHuiShi",0)
    
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("HuiShipreviousRightAnswerIndex") .. [[
                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        Act_HuiShi.SaveNextKaoGuanGUID(player)
        -- 更新排名
        Act_HuiShi.SaveRankingTwo(player)

        sLuaTimerSystem:AddTimerEx(player, 2 * 1000 ,1,"Act_HuiShi.YanChiClose", ""..player:GetInt("HuiShi_LastNPC"))

        return ""
    end
	
	local winExp = Act_HuiShi.ExpCalucation(player, true)
	local winGold = Act_HuiShi.GoldCalucation(player, true)
    
    player:AddExp(winExp,'system','会试','回答正确')
	local pets = Lua_tools.GetFightPets(player)
	for k,v in ipairs(pets) do
		v:AddExp(winExp, "system", "会试", "回答正确")
	end
    Lua_tools.AddMoney(player, 5, winGold, "system", "", "")
	sLuaApp:NotifyTipsMsg(player,"您获得了银币"..winGold)
    player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + winExp)
    player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + winGold)

    if Act_HuiShi.systemAnswerSendProp then
        -- 几率给道具
        local systemGifts = {'HuiShiSystemAnsWerNum', 'HuiShiSystemTipNum', 'HuiShiSystemChangeQuestionsNum'}
        local genRes = Act_HuiShi.GenRandomNum()
        if genRes ~= 0 then
            player:SetInt(systemGifts[genRes], player:GetInt(systemGifts[genRes]) + 1)
            if genRes == 1 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次系统作答机会")
            elseif genRes == 2 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次系统提示机会")
            elseif genRes == 3 then
                sLuaApp:NotifyTipsMsg(player, "恭喜你增加一次切换试题机会")
            end
        end
    end


    player:SetInt('HuiShiSystemAnsWerNum', player:GetInt('HuiShiSystemAnsWerNum') - 1)

    sLuaApp:NotifyTipsMsg(player, "请前往下一个考官")

    player:SetDayInt("HuiShiIsFirstKaoGuan",1)
    local str = [[
        if ExamUI then
            
            ExamUI.RightNum = ]] .. player:GetDayInt("HuiShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("HuiShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

            ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("HuiShipreviousRightAnswerIndex") .. [[
            
            ExamUI.EndFlag = true
            ExamUI.Func1Num = ]] .. player:GetInt('HuiShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('HuiShiSystemChangeQuestionsNum') .. [[

            ExamUI.RefreshPanel()

        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    Act_HuiShi.SaveNextKaoGuanGUID(player)
    -- 满足条件存排名
    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        Act_HuiShi.SaveRankingTwo(player)
    end
	
	sLuaTimerSystem:AddTimerEx(player, 1200 ,1,"Act_HuiShi.YanChiClose", ""..player:GetInt("HuiShi_LastNPC"))

    return ""

end

-- 去掉一个错误答案 返回一个错误答案的索引
function Act_HuiShi.DeleteErrorAnswer(player)
    -- 判断道具数量
    if player:GetInt('HuiShiSystemTipNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    if player:GetDayInt("HuiShiAnswerBeforeNum") ~= player:GetDayInt("HuiShiAllAnswersCount") then
        sLuaApp:NotifyTipsMsg(player, Act_HuiShi.currentNPCAnswered)
        return ""
    end

    -- 判断当前这道题已经用了几次去掉答案道具
    local useTime = player:GetDayInt('QuestionUseTime'..player:GetDayInt('QuestionIndex'))
    player:SetDayInt('QuestionUseTime'..player:GetDayInt('QuestionIndex'), useTime + 1)
    
    -- sLuaApp:LuaDbg("当前题目使用了"..useTime.."次去掉错误答案道具")

    if useTime > 2 then
        sLuaApp:NotifyTipsMsg(player, "单个题目最多使用3次")
        -- sLuaApp:LuaDbg("单个题目最多使用3次")
        return ''
    end

    player:SetInt('HuiShiSystemTipNum', player:GetInt('HuiShiSystemTipNum') - 1)
    

    -- 已经显示过的错误答案字符串
    local errAnsStr = player:GetDayString('QuestioneErrAnswerIndex'..player:GetDayInt('QuestionIndex'))
    -- sLuaApp:LuaDbg("errAnsStr======" .. errAnsStr)
    local errAnswerIndex
    local genRes
    local errAnsStrRes = ''
    if errAnsStr == '' then 
        -- 初始化答案表 把正确答案移除掉
        local answerList = {1,2,3,4}
        for k, v in pairs(answerList) do
            if v == player:GetDayInt("HuiShipreviousRightAnswerIndex") then
                table.remove(answerList,k)
            end
        end
        genRes = sLuaApp:RandInteger(1, #answerList)
        errAnswerIndex = answerList[genRes]

        for k, v in pairs(answerList) do
            if v == errAnswerIndex then
                table.remove(answerList,k)
            end
        end

        for k, v in pairs(answerList) do
            errAnsStrRes = errAnsStrRes .. v .. ','
        end

        player:SetDayString('QuestioneErrAnswerIndex'..player:GetDayInt('QuestionIndex'), errAnsStrRes)
        
    else
        local answerList = sLuaApp:StrSplit(errAnsStr, ',') 
        genRes = sLuaApp:RandInteger(1, #answerList)
        errAnswerIndex = answerList[genRes]

        for k, v in pairs(answerList) do
            if v == errAnswerIndex then
                table.remove(answerList,k)
            end
        end

        for k, v in pairs(answerList) do
            errAnsStrRes = errAnsStrRes .. v .. ','
        end

        player:SetDayString('QuestioneErrAnswerIndex'..player:GetDayInt('QuestionIndex'), errAnsStrRes)

    end
    

    

    local str = [[
		if ExamUI then
            
            ExamUI.Func2Num = ]] .. player:GetInt('HuiShiSystemTipNum') .. [[

            ExamUI.RemovedAnswer = ]] .. errAnswerIndex .. [[

            ExamUI.RemoveOneAnswer()

		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)


    if useTime >= 2 then
        -- TODO 显示正确答案
        -- sLuaApp:LuaDbg("TODO显示正确答案======")
        player:SetInt('HuiShiSystemAnsWerNum', player:GetInt('HuiShiSystemAnsWerNum') + 1)
        Act_HuiShi.FindRightAnswer(player)
        return ''
    end



    return ""
end

-- 客户端调用关闭窗口 
function Act_HuiShi.HuiShiCloseWin(player, timer_id, npc_id)
    -- 加总答题数
    -- sLuaApp:NotifyTipsMsg(player,"答题时间已到")
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    return ""

end




-- 生成随机数 用于概率给道具
function Act_HuiShi.GenRandomNum()
    local genRes1 = sLuaApp:RandInteger(1, 100)
    if not (genRes1 >= 1 and genRes1 <= Act_HuiShi.sendPropProbability) then
        return 0
    end

    local genRes2 = sLuaApp:RandInteger(1, 3)
    return genRes2
end

-- 判断一个值是否已存在
function Act_HuiShi.IsExisted(tab, val)
    for k, v in pairs(tab) do
        if v == val then
            return true
        end
    end

    return false
end

-- 往玩家身上存存下一个考官,并清除掉当前正在答题的题目id
function Act_HuiShi.SaveNextKaoGuanGUID(player)

    local genRes = sLuaApp:RandInteger(1, #Data.Act_HuiShi['NPCGUIDList'])
    local nextKaoGuanGUID = Data.Act_HuiShi['NPCGUIDList'][genRes]
    -- sLuaApp:NotifyTipsMsg(player, "nextKaoGuanGUID"..nextKaoGuanGUID)
    player:SetDayInt("HuiShiNextKaoGuanGUID", nextKaoGuanGUID)
    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    player:SetDayString('QuestioneErrAnswerIndex'..player:GetDayInt('QuestionIndex'),'')
	player:SetDayInt("HuiShiNextKaoGuanID", sNpcSystem:GetNpcByGUID(nextKaoGuanGUID):GetId())
end

-- 存排名  已弃用
function Act_HuiShi.SaveRanking(player)

    table.insert(Data.Act_HuiShi['RankingList'], player:GetGUID())
    player:SetDayInt('HuiShiLastAnswerTime', sLuaApp:GetTimes())

end

-- 已答所有题目，更新排行榜
function Act_HuiShi.SaveRankingTwo(player)
	player:SetDayInt("HuiShiTimeCount", 0)
    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    -- 存正确答题题目数
    -- 用时多长时间

    local rankMark = 50
	if RankingListSystem then
		if RankingListSystem.Config then
			rankMark = RankingListSystem.Config['会试排行榜'] or 50
		end
	end

    local nowTime = sLuaApp:GetTimes()

    local useTime = nowTime - player:GetDayInt("HuiShiAnswerStartTime")

    local value = player:GetDayInt("HuiShiRightAnswersCount") * 1000000 + (1000000 - useTime)
    -- '共'.. Act_HuiShi.maxAnswerNum ..'道题，答对了'.. player:GetDayInt("HuiShiRightAnswersCount") ..'道题，用时'..useTime..'秒'
    local rightAnswerNum = player:GetDayInt("HuiShiRightAnswersCount")

    sRanklistSystem:UpdateRanklist( rankMark, player:GetGUID(), value, player:GetName(), tostring(useTime))
    local rankList = sRanklistSystem:GetRanklist(50, 1, 1)
    local worldFirstShortTime = sDBVarSystem:GetInt('HuiShiRankingFirstShortTime')
    local worldFirstRightNum = sDBVarSystem:GetInt('HuiShiRankingFirstRightAnswerNum')

    local playerRightNum = player:GetDayInt("HuiShiRightAnswersCount")
	
	local useTimeTxt = Lua_tools.Time2Txt(useTime)
	local worldTimeTxt = Lua_tools.Time2Txt(worldFirstShortTime)
	local rankTimeTxt = Lua_tools.Time2Txt(tonumber(rankList[1][4]))
	local rankRightNum = math.floor(tonumber(rankList[1][2])/1000000)
    
	--sLuaApp:LuaDbg('玩家：' .. player:GetName() .. '的会试完成时间为' .. useTime .. '秒')
    if worldFirstRightNum == 0 then
        -- 通知破记录
        local str = '世界答题最快时间记录是' .. rankTimeTxt .. '\n'
        str = str ..'本周答题最快时间是记录' .. rankTimeTxt .. '\n'
        str = str .. '您本周会试答题时间是' .. useTimeTxt .. '\n'
        str = str .. '恭喜你突破了世界记录'
        sMailSystem:SendMail( 0, "会试主考官", player:GetGUID(), 1, "会试结果", str,{}, {})
        sDBVarSystem:SetInt('HuiShiRankingFirstShortTime', useTime, 6)
        sDBVarSystem:SetInt('HuiShiRankingFirstRightAnswerNum', rightAnswerNum, 6)
        
    else
		local pojilu = 0
        if playerRightNum > worldFirstRightNum then
			pojilu = 1
		elseif playerRightNum == worldFirstRightNum and useTime < worldFirstShortTime then 
            pojilu = 1
        end
		if pojilu == 1 then
			local str = '世界答题最快时间记录是' .. worldTimeTxt .. '，共答对'..worldFirstRightNum..'题。\n'
            str = str ..'本周答题最快时间是记录' .. rankTimeTxt .. '，共答对'..rankRightNum..'题。\n'
            str = str .. '您本周会试答题时间是' .. useTimeTxt .. '，共答对'..playerRightNum..'题。\n'
            str = str .. '恭喜你突破了世界记录'
            sMailSystem:SendMail( 0, "会试主考官", player:GetGUID(), 1, "会试结果", str,{}, {})
            sDBVarSystem:SetInt('HuiShiRankingFirstShortTime', useTime, 6)
            sDBVarSystem:SetInt('HuiShiRankingFirstRightAnswerNum', rightAnswerNum, 6)
		end
    end 

    return ""
end


function Act_HuiShi.Every_Answer_Countdown(player, tinmer, p)
    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    player:SetDayInt("HuiShiAllAnswersCount", player:GetDayInt("HuiShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    -- 倒计时已到
    Act_HuiShi.SaveNextKaoGuanGUID(player)

    sLuaApp:NotifyTipsMsg(player,"答题时间已到")
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        Act_HuiShi.SaveRankingTwo(player)
    end

    return ""
end

function Act_HuiShi.Act_End(player, tinmer, p)
    player:SetDayInt("HuiShiCurrentQuestionID", 0)
    player:SetDayInt("HuiShiAllAnswersCount", player:GetDayInt("HuiShiAllAnswersCount") + 1) -- 总答题
    player:SetDayInt("HuiShiIsFirstKaoGuan", 1)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
    end
    -- 活动时间已到
    Act_HuiShi.SaveNextKaoGuanGUID(player)

    sLuaApp:NotifyTipsMsg(player,"活动时间已到")
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
        Act_HuiShi.SaveRankingTwo(player)
    end

    return ""
end

function Act_HuiShi.HuiShiClickClose(player, content)
    -- sLuaApp:LuaDbg("总答题数=="..player:GetDayInt('HuiShiAllAnswersCount'))
    -- sLuaApp:LuaDbg("接受的值为=="..content)

    -- 未答题
    -- if player:GetDayInt('HuiShiTotal') == player:GetDayInt('HuiShiAllAnswersCount') then
    --     -- 保存剩余答题时间
    --     sLuaApp:NotifyTipsMsg(player,"已放弃本次答题")
    --     player:SetDayInt("HuiShiAllAnswersCount", player:GetDayInt("HuiShiAllAnswersCount") + 1) -- 总答题
    -- end
    -- player:SetDayInt("HuiShiCurrentQuestionID", 0)
    -- player:SetDayInt("HuiShiIsFirstKaoGuan", 1)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
        sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
    end
	player:SetDayInt("HuiShi_HandClose",1)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
    -- end
    -- Act_HuiShi.SaveNextKaoGuanGUID(player)

    -- if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
    --     Act_HuiShi.SaveRankingTwo(player)
    -- end
    return ""
end

-- function Act_HuiShi.Time_Count(player, tinmer, p)

    -- if player:GetDayInt("HuiShiTimeCount") >= Act_HuiShi.everyAnswerTime then
        -- sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
        -- player:SetDayInt('HuiShiTimeCount', 0)

        -- Act_HuiShi.Every_Answer_Countdown(player)

        -- -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime1')) then
        -- --     sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime1'))
        -- -- end
        -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime2')) then
            -- sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime2'))
        -- end
        -- if sLuaTimerSystem:HasTimer(player:GetDayInt('HuiShiTime3')) then
            -- sLuaTimerSystem:DisableTimer(player:GetDayInt('HuiShiTime3'))
        -- end

        -- return ''
    -- end
    -- player:SetDayInt('HuiShiTimeCount',player:GetDayInt("HuiShiTimeCount") + 1)

    -- -- sLuaApp:LuaDbg('时间过了'..player:GetDayInt("HuiShiTimeCount")..'秒')

-- end

function Act_HuiShi.Initialization()
	--初始化 发邮件需要的item表 keyname==>id
	if Act_HuiShi.endMailReward then
		for k,v in pairs(Act_HuiShi.endMailReward) do
			Act_HuiShi.end_mail_item[k]={}
			for a,b in ipairs(v['Item']) do
				if type(b) == "string" then
					local itemData = ItemConfig.GetByKeyName(b)
					table.insert(Act_HuiShi.end_mail_item[k], itemData.Id)
					local num = v['Item'][a+1]
					local bind = v['Item'][a+2]
					if type(num) == "number" and type(bind) == "number" then
						table.insert(Act_HuiShi.end_mail_item[k], num)
						table.insert(Act_HuiShi.end_mail_item[k], bind)
					end
				end
			
			end
		end
	else
		sLuaApp:LuaErr("缺少Act_HuiShi.endMailReward")
    end
    
    sLuaApp:LuaDbg(Lua_tools.serialize(Act_HuiShi.end_mail_item))
end

-- 延迟关闭界面
function Act_HuiShi.YanChiClose(player, tinmer, npc_id)
    if player:GetDayInt("HuiShi_HandClose") == 0 then
		local str = [[
			if ExamUI then
				GUI.DestroyWnd("ExamUI")
			end
		]]
		
		sLuaApp:ShowForm(player,"脚本表单", str)
	
	
		if npc_id then
			npc_id = tonumber(npc_id)
			if npc_id then
				--sLuaApp:LuaDbg("打开聊天")
				local mapID = player:GetMap():GetId()
				sLuaApp:ShowForm(player, "脚本表单", "CL.StartMove("..sMapSystem:GetPosX(player)..", CL.ChangeLogicPosZ("..sMapSystem:GetPosY(player)..","..mapID.."), "..mapID..")  CL.SetMoveEndAction(MoveEndAction.SelectNpc,'"..npc_id.."')")
			end
		end
	end
end

function Act_HuiShi.ExpCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_HuiShi.addSomeGifts.win.RewardCoin1
	else
		Exps = Act_HuiShi.addSomeGifts.lose.RewardCoin1
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return assert(load(str..' return ' .. Exps))()
	end
	return Exps
end

function Act_HuiShi.GoldCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_HuiShi.addSomeGifts.win.RewardCoin2
	else
		Exps = Act_HuiShi.addSomeGifts.lose.RewardCoin2
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return math.ceil(assert(load(str..' return ' .. Exps))())
	end
	return Exps
end