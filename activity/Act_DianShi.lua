--殿试

Act_DianShi = {}

-- Act_DianShi.join_max = 1  -- 最大参加次数 暂时写死了 最多只能参加一次
Act_DianShi.active_max = 0  -- 参加完活动给的活跃


Act_DianShi.systemAnswerSendProp = true  -- 系统回答是否有几率给道具

Act_DianShi.RewardCoinType1 = 295  -- 经验图标
Act_DianShi.RewardCoinType2 = 300  -- 银币图标

Act_DianShi.addSomeGifts = {
    win = {
        RewardCoin1 = "200*Level",	
        RewardCoin2 = "200*Level"	
    },
    lose = {
        RewardCoin1 = "100*Level",	
        RewardCoin2 = "100*Level"	
    }
}
Act_DianShi.maxAnswerErrNum = 3  -- 最大答错数
Act_DianShi.sendPropProbability = 10 -- 答对后给道具的概率，10就是10%
Act_DianShi.everyAnswerTime = 20 -- 每次答题时间，单位秒
Act_DianShi.maxAnswerNum = 10  -- 最大题目数

-- Act_DianShi.currentNPCAnswered = '道具使用失败'
Act_DianShi.overMaxAnswerNumMsg = '已答错'.. Act_DianShi.maxAnswerErrNum..'道题，殿试考试失败'
Act_DianShi.answerErrOverNumAndGoOnMsg = '已答错'..Act_DianShi.maxAnswerErrNum..'道题，使用道具失败'
Act_DianShi.answerOverMaxTimeMsg = '超过'..Act_DianShi.everyAnswerTime..'秒未作答，已自动进入下一题'


--活动结束后邮件发的奖励表单
Act_DianShi.end_mail_item={}

Act_DianShi.preRankingNum = 10  -- 前几名给奖励
Act_DianShi.endMailReward = {
	reward_1 = {Gold = 0, Item = {"高级藏宝图",1,1 ,"10万银币",5,1, "金榜状元", 1, 1 }},
	reward_2 = {Gold = 0, Item = {"藏宝图",1,1 ,"藏宝图",1,1,"藏宝图",1,1,"10万银币",3,1, "金榜榜眼", 1, 1 }},
	reward_3 = {Gold = 0, Item = {"藏宝图",1,1,"藏宝图",1,1,"10万银币",2,1, "金榜探花", 1, 1 }},
	reward_other = {Gold = 0, Item = {"藏宝图",1,1,"10万银币",1,1, "金榜进士", 1, 1 }}
}

Act_DianShi.ShowItem = "61024,61025,20974,20977,60001"


-- Act_DianShi.HuiShiToDianShiMinRightAnswerNum = 20

Act_DianShi.desc = '科举会试玩法说明：\\n'
Act_DianShi.desc = Act_DianShi.desc .. '会试获得前'.. 20 ..'名即可获取殿试资格。\\n'
Act_DianShi.desc = Act_DianShi.desc .. '2、殿试一共'.. Act_DianShi.maxAnswerNum ..'道题，答完才能生成排名，最多答错'.. Act_DianShi.maxAnswerErrNum ..'道题，排名前'.. Act_DianShi.preRankingNum ..'即可获得殿试资格。\\n'
Act_DianShi.desc = Act_DianShi.desc .. '3、每次回答，无论对错都会获得奖励。答对有'..Act_DianShi.sendPropProbability..'%的概率获得以下任意一个道具。\\n'


-- 活动开始前回调
function Act_DianShi.OnDeclare(id, seconds)
end

Act_DianShi.rank_type = 51
-- 活动开始回调
function Act_DianShi.OnStart(id, is_normal)
    -- sLuaApp:LuaDbg("Act_DianShi.OnStart ActStart id======"..id)
    sVarSystem:SetInt("ACTIVITY_DianShi_Id", id)
    if RankingListSystem then
        if RankingListSystem.Config then
            Act_DianShi.rank_type = RankingListSystem.Config['殿试排行榜'] or 51
        end
    end

    sRanklistSystem:ClearRanklist( Act_DianShi.rank_type)--清空排行榜
	--sLuaApp:LuaDbg("殿试开始！")
    -- Act_DianShi.Initialization()
	if Data then
		Data["DianShiAnswered"] = {}
	end
end

-- 活动结束回调
function Act_DianShi.OnStop(id)
    Act_DianShi.Initialization()

    -- sLuaApp:LuaDbg("Act_DianShiActOver id======"..id)
    if RankingListSystem then
        if RankingListSystem.Config then
            Act_DianShi.rank_type = RankingListSystem.Config['殿试排行榜'] or 51
        end
    end
    
    local rankList = sRanklistSystem:GetRanklist(Act_DianShi.rank_type, 1, Act_DianShi.preRankingNum)

    if #rankList > 0 then
      
		--local weekFirstShortTime = tonumber(rankList[1][4])
		--local weekFirstRightNum = math.floor(rankList[1][2]  / 100000)
		---- sLuaApp:LuaDbg("weekFirstRightNum"..weekFirstRightNum)
		--local worldFirstRightNum = sDBVarSystem:GetInt('DianShiRankingFirstShortTime')
		--local worldFirstShortTime = sDBVarSystem:GetInt('DianShiRankingFirstRightAnswerNum')
		--
		--if worldFirstShortTime == 0 then
		--	sDBVarSystem:SetInt('DianShiRankingFirstShortTime', weekFirstShortTime, 6)
		--	sDBVarSystem:SetInt('DianShiRankingFirstRightAnswerNum', weekFirstRightNum, 6)
		--else
		--	-- 比较正确答题数
		--	if weekFirstRightNum >= worldFirstRightNum and weekFirstShortTime < worldFirstShortTime then
		--		sDBVarSystem:SetInt('DianShiRankingFirstShortTime', weekFirstShortTime, 6)
		--		sDBVarSystem:SetInt('DianShiRankingFirstRightAnswerNum', weekFirstRightNum, 6)
		--	end
		--
		--end

		local titleMap = {'状元', '榜眼', '探花'}
		for k, v in ipairs(rankList) do
			if k <= 3 then
				local str = '你的殿试排名是第'.. k ..'名，少侠才高八斗，成为本次科举“'..titleMap[k]..'”快领取奖励吧'
				sMailSystem:SendMail( 0, "殿试主考官", v[1], 1, "殿试结果", str,{}, Act_DianShi.end_mail_item['reward_'..k])
			else
				local str = '你的殿试排名是第'.. k ..'名，少侠才高八斗，快领取奖励吧'
				sMailSystem:SendMail( 0, "殿试主考官", v[1], 1, "殿试结果", str,{}, Act_DianShi.end_mail_item['reward_other'])
			end	
		end
	end
	if Data and Data["DianShiAnswered"] then
		Data["DianShiAnswered"] = {}
	end
	sLuaApp:LuaDbg("殿试结束！")
	ExhibitionRoleNPC.CreateRoleNPC(ExhibitionRoleNPC.ImperialNpcConfig)
end

-- 玩家点击参与活动回调
function Act_DianShi.OnJoin(id, player)
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

    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        sLuaApp:NotifyTipsMsg(player, "今日已参加过殿试活动")
        return 
    end

    local answerErrNum = player:GetDayInt("DianShiAnswerErrNum")
    if answerErrNum >= Act_DianShi.maxAnswerErrNum then
        sLuaApp:NotifyTipsMsg(player, '已答错'.. Act_DianShi.maxAnswerErrNum..'道题，不能再次参加殿试')
        return
    end

    local str = [[
        GUI.CloseWnd("ActivityPanelUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)
	--引导玩家到活动npc
    Lua_tools.MoveToNpc(player, 10297)
end

-- 玩家客户端查询数据回调
function Act_DianShi.OnQuery(id, player)
	-- local join_num = player:GetDayInt("HuiShi_join_num"..id)
    -- local active_num = player:GetDayInt("HuiShi_active_num"..id)
    local join_num = 0
    local active_num = 0
    local max_join = 1
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        join_num = 1
        active_num = Act_DianShi.active_max
    end

	-- local str = join_num..":"..Act_DianShi.join_max..":"..active_num..":"..Act_DianShi.active_max..":61024,20122,31006:2:2,5"
	local str = join_num..":"..max_join..":"..player:GetDayInt("DianShiActiveVal")..":"..Act_DianShi.active_max..":"..Act_DianShi.ShowItem..":2:"..(ActivitySystem.Act_GetClassify("Act_DianShi") or '2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end



--获得随机题目 --题库范围不能小于答题总量
function Act_DianShi.GetQuestion(player, rand_times)
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
			if not Act_DianShi.CheckRepeat(player, genRes) then
				return Act_DianShi.GetQuestion(player)
			end
			local question = QuestionImperialConfig.GetById(genRes)
			player:SetDayInt("DianShiCurrentQuestionID", genRes)
			player:SetDayInt("QuestionIndex", genRes)
			return question
		end
		return Act_DianShi.GetQuestion(player, rand_times)
	else
		if not Act_DianShi.CheckRepeat(player, genRes) then
			return Act_DianShi.GetQuestion(player)
		end
		player:SetDayInt("DianShiCurrentQuestionID", genRes)
		player:SetDayInt("QuestionIndex", genRes)
		return question
	end
end

--检查题目是否重复
function Act_DianShi.CheckRepeat(player, genRes)
	local player_guid = tostring(player:GetGUID())
	if Data and Data["DianShiAnswered"] then
		if Data["DianShiAnswered"][player_guid] then
			for _,v in ipairs(Data["DianShiAnswered"][player_guid]) do 
				if genRes == v then
					sLuaApp:LuaErr("Act_DianShi.CheckRepeat return false")
					return false
				end
			end
		end
	end
	return true
end


function Act_DianShi.OpenForm(player)

    player:SetDayInt('DianShiLeave', 0)

    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_DianShi_Id"))
    -- 生成时间戳
	local time = sLuaApp:GetTimes()
    local year, month, day
    year = sLuaApp:Year(time)
    month = sLuaApp:Month(time)
    day = sLuaApp:MonthDay(time)
    ymd = year .. '-' .. month .. '-' .. day
	local hms = activityData.TimeEnd
    local endTime = sLuaApp:Str2DateTime(ymd..' '..hms)

    local actEndTime = endTime - time

    -- 设置答题前题目数
    player:SetDayInt("DianShiAnswerBeforeNum", player:GetDayInt("DianShiAllAnswersCount"))

    --local genRes
    local question
    local optionArr = {}
    local rightAnswerIndex

    if player:GetDayInt('DianShiAllAnswersCount') == 0 then
        player:SetDayInt("DianShiAnswerStartTime", sLuaApp:GetTimes())
    end

    -- if player:GetDayInt("DianShiCurrentQuestionID") == 0 then
        -- -- 随机生成1-1125
        -- genRes = sLuaApp:RandInteger(1, 1125)
    
        -- -- 倒计时定时器
        -- -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 ,1,"Act_DianShi.Every_Answer_Countdown", "")
        -- -- 活动结束定时器
        -- local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")
    
        -- if not sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
            -- -- 答题时间统计
            -- local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_DianShi.Time_Count", "")
            -- player:SetDayInt('DianShiTime3', timer3)
        -- end
    
        -- -- player:SetDayInt('DianShiTime1', timer1)
        -- player:SetDayInt('DianShiTime2', timer2)
        
    -- else
        -- genRes = player:GetDayInt("DianShiCurrentQuestionID")
    
        -- -- 倒计时定时器
        -- -- local timer1 = sLuaTimerSystem:AddTimerEx(player, (Act_DianShi.everyAnswerTime - player:GetDayInt("DianShiTimeCount"))  * 1000,1,"Act_DianShi.Every_Answer_Countdown", "")
        -- -- 活动结束定时器
        -- local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")
        -- if not sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
            -- -- 答题时间统计
            -- local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_DianShi.Time_Count", "")
            -- player:SetDayInt('DianShiTime3', timer3)
        -- end
    
        -- -- 搞完这个搞传的时间
        -- -- player:SetDayInt('DianShiTime1', timer1)
        -- player:SetDayInt('DianShiTime2', timer2)
        
    
    -- end

	-------------修
	if player:GetDayInt("DianShiCurrentQuestionID") == 0 then
		question = Act_DianShi.GetQuestion(player)
		
		local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 , 1,"Act_DianShi.Every_Answer_Countdown", "")
		player:SetDayInt('DianShiTime3', countdown_timer)		
		
		player:SetDayInt("DianShiTimeCount", time + Act_DianShi.everyAnswerTime)
		
		local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")
		player:SetDayInt('DianShiTime2', timer2)
	else
		question = QuestionImperialConfig.GetById(player:GetDayInt("DianShiCurrentQuestionID"))
	end
	-------------修


    -- question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

    -- -- sLuaApp:LuaDbg("id==="..genRes)

    -- player:SetDayInt("DianShiCurrentQuestionID", genRes)
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

	player:SetDayInt('DianShiTotal',player:GetDayInt("DianShiAllAnswersCount"))
	-- sLuaApp:LuaDbg("正确答案的索引为："..rightAnswerIndex)    -- 测试
    player:SetDayInt("DianShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("DianShiCurrentRightAnswer"))    -- 测试

    player:SetDayString('DianShiCurrentQuestionStr', question.Ask)

    local str = [[
        GUI.OpenWnd("ExamUI")
        if ExamUI then
            ExamUI.EndTime = ]] .. player:GetDayInt("DianShiTimeCount") ..[[
            ExamUI.Desc = "]] .. Act_DianShi.desc .. '"' .. [[
            ExamUI.RewardCoinType1 = ]] .. Act_DianShi.RewardCoinType1 .. [[
            ExamUI.RewardCoinType2 = ]] .. Act_DianShi.RewardCoinType2 .. [[
            ExamUI.Type = 3

            ExamUI.InitPanel()
            ExamUI.HaveQualifications = false
            ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("DianShiAllAnswersCount") + 1 .. [[

            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

            ExamUI.EndFlag = false

            ExamUI.RefreshPanel()


        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

	
    player:SetDayInt("DianShipreviousRightAnswerIndex",player:GetDayInt("DianShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)
    

    return ""
end

-- 接收答案
function Act_DianShi.ReceiveAnswer(player, content)
    if player:GetDayInt("DianShiAllAnswersCount") > Act_DianShi.maxAnswerNum then
        return ""
    end
	if Data and Data["DianShiAnswered"] then
		local player_guid = tostring(player:GetGUID())
		if not  Data["DianShiAnswered"][player_guid] then
			Data["DianShiAnswered"][player_guid] = {}
		end
		table.insert(Data["DianShiAnswered"][player_guid], player:GetDayInt("DianShiCurrentQuestionID"))
	end
    --player:SetDayInt('DianShiTimeCount', 0)
	local now_time = sLuaApp:GetTimes()
	player:SetDayInt("DianShiTimeCount", now_time + Act_DianShi.everyAnswerTime)
    -- sLuaApp:LuaDbg("接受的答案"..content)

    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
    --     -- sLuaApp:LuaDbg("接收答案销毁定时器1")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("接收答案销毁定时器2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
        -- sLuaApp:LuaDbg("接收答案销毁定时器3")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
    end

    player:SetDayInt('IsAnswered', 1)

    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.AnswerOver(player)
        return ''
    end
    

    -- if player:GetDayInt("DianShiAnswerBeforeNum") ~= player:GetDayInt("DianShiAllAnswersCount") then
    --     sLuaApp:NotifyTipsMsg(player, Act_DianShi.currentNPCAnswered)
    --     return ""
    -- end
    player:SetDayInt("DianShiAllAnswersCount", player:GetDayInt("DianShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    if player:GetDayInt("DianShipreviousRightAnswerIndex") == tonumber(content) then
        player:SetDayInt("DianShiRightAnswersCount", player:GetDayInt("DianShiRightAnswersCount") + 1) -- 答对题数
		
		local winExp = Act_DianShi.ExpCalucation(player, true)
		local winGold = Act_DianShi.GoldCalucation(player, true)
	
        player:AddExp(winExp,'system','殿试','回答正确')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(winExp, "system", "殿试", "回答正确")
		end
        Lua_tools.AddMoney(player, 5, winGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..winGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + winExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + winGold)

        -- 几率给道具
        local systemGifts = {'DianShiSystemAnsWerNum', 'DianShiSystemTipNum', 'DianShiSystemChangeQuestionsNum'}
        local genRes = Act_DianShi.GenRandomNum()
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
        -- Act_DianShi.SaveRanking(player)

    else
		local loseExp = Act_HuiShi.ExpCalucation(player, false)
		local loseGold = Act_HuiShi.GoldCalucation(player, false)
		
        player:AddExp(loseExp,'system','殿试','回答错误')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(loseExp, "system", "殿试", "回答错误")
		end
        Lua_tools.AddMoney(player, 5, loseGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..loseGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + loseExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + loseGold)

        player:SetDayInt("DianShiAnswerErrNum", player:GetDayInt("DianShiAnswerErrNum") + 1)
        local answerErrNum = player:GetDayInt("DianShiAnswerErrNum")
        if answerErrNum >= Act_DianShi.maxAnswerErrNum then
            -- sLuaApp:LuaDbg("答错题目数超过限制")
            -- sLuaApp:NotifyTipsMsg(player, Act_DianShi.overMaxAnswerNumMsg)
            activityData = ActivityConfig.GetById(33) 
            sLuaApp:NotifyTipsMsg(player, "殿试结束了，您一共答对了"..player:GetDayInt("DianShiRightAnswersCount").."题，今晚"..activityData.TimeEnd.."点将发布殿试结果，请耐心等待")
            local str = [[
                if ExamUI then
                    
                    ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                    ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                    ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                    ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                    ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
                    
                    ExamUI.EndFlag = true
                    ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                    ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                    ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

                    ExamUI.RefreshPanel()

                end
            ]]
            sLuaApp:ShowForm(player,"脚本表单", str)
			Act_DianShi.SaveRankingTwo(player)

            sLuaTimerSystem:AddTimerEx(player, 2 * 1000 ,1,"Act_DianShi.YanChiClose", "")

            return ""
        end

        

    end



    
    
    -- 答题超过限制
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        -- sLuaApp:LuaDbg("答题超过限制========")
        -- sLuaApp:NotifyTipsMsg(player, "今日殿试已答完"..Act_DianShi.maxAnswerNum.."道题")
        activityData = ActivityConfig.GetById(33) 
        sLuaApp:NotifyTipsMsg(player, "殿试结束了，您一共答对了"..player:GetDayInt("DianShiRightAnswersCount").."题，今晚"..activityData.TimeEnd.."点将发布殿试结果，请耐心等待")
    
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        Act_DianShi.SaveRankingTwo(player)

        sLuaTimerSystem:AddTimerEx(player, 2 * 1000 ,1,"Act_DianShi.YanChiClose", "")

        return ""
    end

    -- sLuaApp:LuaDbg("上题答案"..player:GetDayInt("DianShipreviousRightAnswerIndex"))

    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_DianShi_Id"))
    local optionArr = {}
	
	local question = Act_DianShi.GetQuestion(player)
    -- local genRes = sLuaApp:RandInteger(1, 1125)
    -- local question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

    -- -- sLuaApp:LuaDbg("id==="..genRes)

    -- player:SetDayInt("DianShiCurrentQuestionID", genRes)
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

	player:SetDayInt('DianShiTotal',player:GetDayInt("DianShiAllAnswersCount"))
	-- sLuaApp:LuaDbg("正确答案的索引为："..rightAnswerIndex)    -- 测试
    player:SetDayInt("DianShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("DianShiCurrentRightAnswer"))    -- 测试
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
    -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 ,1,"Act_DianShi.Every_Answer_Countdown", "")
    -- 活动结束定时器
    local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")

    --local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_DianShi.Time_Count", "")
    
    -- player:SetDayInt('DianShiTime1', timer1)
    player:SetDayInt('DianShiTime2', timer2)
    --player:SetDayInt('DianShiTime3', timer3)
	local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 , 1,"Act_DianShi.Every_Answer_Countdown", "")
	player:SetDayInt('DianShiTime3', countdown_timer)

    player:SetDayString('DianShiCurrentQuestionStr', question.Ask)

    local str = [[
        if ExamUI then
            
            ExamUI.EndTime = ]] .. (time + Act_DianShi.everyAnswerTime) ..[[
            ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("DianShiAllAnswersCount") + 1 .. [[

            ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.EndFlag = false
            ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

            ExamUI.RefreshPanel()

        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    player:SetDayInt("DianShipreviousRightAnswerIndex",player:GetDayInt("DianShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)


    player:SetDayInt("DianShiIsFirstKaoGuan",1) -- 第一个考官状态

    return ""
end

-- 换一道题
function Act_DianShi.ChangeQuestion(player)
    if player:GetDayInt("DianShiAllAnswersCount") > Act_DianShi.maxAnswerNum then
        return ""
    end
    -- sLuaApp:LuaDbg('来到了====Act_DianShi.ChangeQuestion')
    
    -- local activityData = ActivityConfig.GetById(33)
    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_DianShi_Id"))
    -- 判断道具数量
    if player:GetInt('DianShiSystemChangeQuestionsNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    local answerErrNum = player:GetDayInt("DianShiAnswerErrNum") 
    if answerErrNum >= Act_DianShi.maxAnswerErrNum then
        sLuaApp:NotifyTipsMsg(player, Act_DianShi.answerErrOverNumAndGoOnMsg)
        return ''
    end

    -- sLuaApp:LuaDbg("换一道题==玩家总答题数"..player:GetDayInt("DianShiAllAnswersCount")..'   限定题目数'..Act_DianShi.maxAnswerNum)
    

    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.AnswerOver(player)
        return ''
    end

    --player:SetDayInt('DianShiTimeCount', 0)
    local now_time = sLuaApp:GetTimes()
	player:SetDayInt("DianShiTimeCount", now_time + Act_DianShi.everyAnswerTime)

    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
    --     -- sLuaApp:LuaDbg("Act_DianShi.ChangeQuestion销毁定时器1")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("Act_DianShi.ChangeQuestion销毁定时器2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
        -- sLuaApp:LuaDbg("Act_DianShi.ChangeQuestion销毁定时器3")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
    end

    player:SetDayInt('DianShiTotal',player:GetDayInt("DianShiAllAnswersCount"))

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
    -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 ,1,"Act_DianShi.Every_Answer_Countdown", "")
    -- 活动结束定时器
    local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")
    --local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_DianShi.Time_Count", "")

    -- player:SetDayInt('DianShiTime1', timer1)
    player:SetDayInt('DianShiTime2', timer2)
    --player:SetDayInt('DianShiTime3', timer3)

	local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 , 1,"Act_DianShi.Every_Answer_Countdown", "")
	player:SetDayInt('DianShiTime3', countdown_timer)

    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
    --     sLuaApp:LuaDbg('定时器3创建成功')
    -- else
    --     sLuaApp:LuaDbg('定时器3创建失败')
    -- end


    player:SetInt('DianShiSystemChangeQuestionsNum', player:GetInt('DianShiSystemChangeQuestionsNum') - 1)

   
    local optionArr = {}
    local rightAnswerIndex
	local question = Act_DianShi.GetQuestion(player)
    -- -- 随机生成1-1125
    -- genRes = sLuaApp:RandInteger(1, 1125)
    -- question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

    -- player:SetDayInt("DianShiCurrentQuestionID", genRes)
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
    player:SetDayInt("DianShiCurrentRightAnswer",rightAnswerIndex)
    player:SetDayString('DianShiCurrentQuestionStr', question.Ask)

    local str = [[
		if ExamUI then
            
            ExamUI.EndTime = ]] .. (time + Act_DianShi.everyAnswerTime) ..[[
            ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("DianShiAllAnswersCount") + 1 .. [[
            
            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
            ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
            ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

            ExamUI.EndFlag = false

            ExamUI.RefreshPanel()


		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    
    player:SetDayInt("DianShipreviousRightAnswerIndex",player:GetDayInt("DianShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)

    return ""



end

-- 找出正确的题 返回正确答案的索引
function Act_DianShi.FindRightAnswer(player)
    -- sLuaApp:LuaDbg("来到了Act_DianShi.FindRightAnswer====")
    -- 判断道具数量
    if player:GetInt('DianShiSystemAnsWerNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    local answerErrNum = player:GetDayInt("DianShiAnswerErrNum") 
    if answerErrNum >= Act_DianShi.maxAnswerErrNum then
        sLuaApp:NotifyTipsMsg(player, Act_DianShi.answerErrOverNumAndGoOnMsg)
        return ''
    end

    -- sLuaApp:LuaDbg("找出正确的题==玩家总答题数"..player:GetDayInt("DianShiAllAnswersCount")..'   限定题目数'..Act_DianShi.maxAnswerNum)
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.AnswerOver(player)
        return ''
    end

    local now_time = sLuaApp:GetTimes()
	player:SetDayInt("DianShiTimeCount", now_time + Act_DianShi.everyAnswerTime)

    player:SetDayInt('IsAnswered', 1)

    -- if player:GetDayInt("DianShiAnswerBeforeNum") ~= player:GetDayInt("DianShiAllAnswersCount") then
    --     sLuaApp:NotifyTipsMsg(player, Act_DianShi.currentNPCAnswered)
    --     return ""
    -- end

    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
    --     -- sLuaApp:LuaDbg("Act_DianShi.FindRightAnswer销毁定时器1")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("Act_DianShi.FindRightAnswer销毁定时器2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
        -- sLuaApp:LuaDbg("Act_DianShi.FindRightAnswer销毁定时器3")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
    end


    player:SetDayInt("DianShiRightAnswersCount", player:GetDayInt("DianShiRightAnswersCount") + 1) -- 答对题数
    player:SetDayInt("DianShiAllAnswersCount", player:GetDayInt("DianShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    
	local winExp = Act_DianShi.ExpCalucation(player, true)
	local winGold = Act_DianShi.GoldCalucation(player, true)
		
    player:AddExp(winExp,'system','殿试','回答正确')
	local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(winExp, "system", "殿试", "回答正确")
		end
    Lua_tools.AddMoney(player, 5, winGold, "system", "", "")
	sLuaApp:NotifyTipsMsg(player,"您获得了银币"..winGold)
    player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + winExp)
    player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + winGold)

    if Act_DianShi.systemAnswerSendProp then
        -- 几率给道具
        local systemGifts = {'DianShiSystemAnsWerNum', 'DianShiSystemTipNum', 'DianShiSystemChangeQuestionsNum'}
        local genRes = Act_DianShi.GenRandomNum()
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


    player:SetInt('DianShiSystemAnsWerNum', player:GetInt('DianShiSystemAnsWerNum') - 1)

    player:SetDayInt("DianShiIsFirstKaoGuan",1)
    
    -- 满足条件存排名
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        -- sLuaApp:LuaDbg("答满题更新排名")
        -- 存排名
        Act_DianShi.SaveRankingTwo(player)
        -- sLuaApp:NotifyTipsMsg(player, "今日已答完"..Act_DianShi.maxAnswerNum.."道题")
        activityData = ActivityConfig.GetById(33) 
        sLuaApp:NotifyTipsMsg(player, "殿试结束了，您一共答对了"..player:GetDayInt("DianShiRightAnswersCount").."题，今晚"..activityData.TimeEnd.."点将发布殿试结果，请耐心等待")
    
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        sLuaTimerSystem:AddTimerEx(player, 2 * 1000 ,1,"Act_DianShi.YanChiClose", "")

        return ""
    end

    -- 生成新题
    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_DianShi_Id"))
    local optionArr = {}
    -- local genRes = sLuaApp:RandInteger(1, 1125)
    -- local question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end
	local question = Act_DianShi.GetQuestion(player)

    -- sLuaApp:LuaDbg("id==="..genRes)

    --player:SetDayInt("DianShiCurrentQuestionID", genRes)
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

	player:SetDayInt('DianShiTotal',player:GetDayInt("DianShiAllAnswersCount"))
	-- sLuaApp:LuaDbg("正确答案的索引为："..rightAnswerIndex)    -- 测试
    player:SetDayInt("DianShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("DianShiCurrentRightAnswer"))    -- 测试
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
    -- local timer1 = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 ,1,"Act_DianShi.Every_Answer_Countdown", "")
    -- 活动结束定时器
    local timer2 = sLuaTimerSystem:AddTimerEx(player, actEndTime * 1000 ,1,"Act_DianShi.Act_End", "")
    --local timer3 = sLuaTimerSystem:AddTimerEx(player, 1 * 1000 , -1,"Act_DianShi.Time_Count", "")
    
    -- player:SetDayInt('DianShiTime1', timer1)
    player:SetDayInt('DianShiTime2', timer2)
    --player:SetDayInt('DianShiTime3', timer3)
	local countdown_timer = sLuaTimerSystem:AddTimerEx(player, Act_DianShi.everyAnswerTime * 1000 , 1,"Act_DianShi.Every_Answer_Countdown", "")
	player:SetDayInt('DianShiTime3', countdown_timer)

    player:SetDayString('DianShiCurrentQuestionStr', question.Ask)

    local str = [[
		if ExamUI then
            
            ExamUI.EndTime = ]] .. (time + Act_DianShi.everyAnswerTime) ..[[
                ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
                ExamUI.QuestionIndex = ]] .. player:GetDayInt("DianShiAllAnswersCount") + 1 .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
                ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
                ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
                ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
                ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
                ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[
    
                ExamUI.EndFlag = false
                ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

            ExamUI.RefreshPanel()


		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    player:SetDayInt("DianShipreviousRightAnswerIndex",player:GetDayInt("DianShiCurrentRightAnswer"))
    --player:SetDayInt("QuestionIndex", genRes)


    player:SetDayInt("DianShiIsFirstKaoGuan",1) -- 第一个考官状态


    return ""

end

-- 去掉一个错误答案 返回一个错误答案的索引
function Act_DianShi.DeleteErrorAnswer(player)
    -- 判断道具数量
    if player:GetInt('DianShiSystemTipNum') == 0 then
        sLuaApp:NotifyTipsMsg(player, "该道具数量不足")
        return ''
    end

    local answerErrNum = player:GetDayInt("DianShiAnswerErrNum") 
    if answerErrNum >= Act_DianShi.maxAnswerErrNum then
        sLuaApp:NotifyTipsMsg(player, Act_DianShi.answerErrOverNumAndGoOnMsg)
        return ''
    end

    -- sLuaApp:LuaDbg("去掉一个错误答案==玩家总答题数"..player:GetDayInt("DianShiAllAnswersCount")..'   限定题目数'..Act_DianShi.maxAnswerNum)
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.AnswerOver(player)
        return ''
    end

    -- if player:GetDayInt("DianShiAnswerBeforeNum") ~= player:GetDayInt("DianShiAllAnswersCount") then
    --     sLuaApp:NotifyTipsMsg(player, Act_DianShi.currentNPCAnswered)
    --     return ""
    -- end

    -- 判断当前这道题已经用了几次去掉答案道具
    local useTime = player:GetDayInt('QuestionUseTime'..player:GetDayInt('QuestionIndex'))
    player:SetDayInt('QuestionUseTime'..player:GetDayInt('QuestionIndex'), useTime + 1)
    
    -- sLuaApp:LuaDbg("当前题目使用了"..useTime.."次去掉错误答案道具")

    if useTime > 2 then
        sLuaApp:NotifyTipsMsg(player, "单个题目最多使用3次")
        -- sLuaApp:LuaDbg("单个题目最多使用3次")
        return ''
    end

    player:SetInt('DianShiSystemTipNum', player:GetInt('DianShiSystemTipNum') - 1)
    

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
            if v == player:GetDayInt("DianShipreviousRightAnswerIndex") then
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
            
            ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[

            ExamUI.RemovedAnswer = ]] .. errAnswerIndex .. [[

            ExamUI.RemoveOneAnswer()

		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)


    if useTime >= 2 then
        -- TODO 显示正确答案
        -- sLuaApp:LuaDbg("TODO显示正确答案======")
        player:SetInt('DianShiSystemAnsWerNum', player:GetInt('DianShiSystemAnsWerNum') + 1)
        Act_DianShi.FindRightAnswer(player)
        return ''
    end



    return ""
end

-- 客户端调用关闭窗口  
function Act_DianShi.DianShiCloseWin(player)
    -- sLuaApp:LuaDbg("客户端倒计时关闭")

    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("Act_DianShi.DianShiCloseWin==销毁定时器2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    
    -- sLuaApp:NotifyTipsMsg(player,"答题时间已到")
    -- local str = [[
    --     if ExamUI then
    --         GUI.DestroyWnd("ExamUI")
    --     end
    -- ]]
    -- sLuaApp:ShowForm(player,"脚本表单", str)

    return ""

end


-- 生成随机数 用于概率给道具
function Act_DianShi.GenRandomNum()
    local genRes1 = sLuaApp:RandInteger(1, 100)
    if not (genRes1 >= 1 and genRes1 <= Act_DianShi.sendPropProbability) then
        return 0
    end

    local genRes2 = sLuaApp:RandInteger(1, 3)
    return genRes2
end

-- 判断一个值是否已存在
function Act_DianShi.IsExisted(tab, val)
    for k, v in pairs(tab) do
        if v == val then
            return true
        end
    end

    return false
end


-- 存排名  已弃用
function Act_DianShi.SaveRanking(player)

    table.insert(Data.Act_DianShi['RankingList'], player:GetGUID())
    player:SetDayInt('DianShiLastAnswerTime', sLuaApp:GetTimes())

end

-- 已答所有题目，更新排行榜
function Act_DianShi.SaveRankingTwo(player)
    -- sLuaApp:LuaDbg('更新排名')
    if RankingListSystem then
        if RankingListSystem.Config then
            Act_DianShi.rank_type = RankingListSystem.Config['殿试排行榜'] or 51
        end
    end
    local rankMark = Act_DianShi.rank_type

    --local nowTime = sLuaApp:GetTimes()
	--
    local useTime = Lua_tools.Time2Txt(sLuaApp:GetTimes() - player:GetDayInt("DianShiAnswerStartTime"))

    --local value = player:GetDayInt("DianShiRightAnswersCount") * 100000 + (100000 - useTime)
    local rightAnswerNum = player:GetDayInt("DianShiRightAnswersCount")
	
	--sLuaApp:LuaDbg("更新排行榜 rankMark = " .. rankMark .. " player = " .. player:GetName())
    sRanklistSystem:UpdateRanklist( rankMark, player:GetGUID(), rightAnswerNum, player:GetName(), tostring(useTime))
    --local rankList = sRanklistSystem:GetRanklist(rankMark, 1, 1)
    --local worldFirstShortTime = sDBVarSystem:GetInt('DianShiRankingFirstShortTime')
    --local worldFirstRightNum = sDBVarSystem:GetInt('DianShiRankingFirstRightAnswerNum')
	--
    --local playerRightNum = player:GetDayInt("DianShiRightAnswersCount")
    --
    --if worldFirstRightNum == 0 then
    --    -- 通知破记录
    --    local str = '世界答题最快时间记录是' .. tonumber(rankList[1][4]) .. '秒\n'
    --    str = str ..'本周答题最快时间是记录' .. tonumber(rankList[1][4]) .. '秒\n'
    --    str = str .. '您本周殿试答题时间是' .. useTime .. '秒\n'
    --    str = str .. '恭喜你突破了世界记录'
    --    sMailSystem:SendMail( 0, "殿试主考官", player:GetGUID(), 1, "殿试结果", str,{}, {})
    --    sDBVarSystem:SetInt('DianShiRankingFirstShortTime', useTime, 6)
    --    sDBVarSystem:SetInt('DianShiRankingFirstRightAnswerNum', rightAnswerNum, 6)
    --    
    --else
    --    if playerRightNum >= worldFirstRightNum and  useTime < worldFirstShortTime then 
    --        -- 通知破纪录
    --        local str = '世界答题最快时间记录是' .. worldFirstShortTime .. '秒\n'
    --        str = str ..'本周答题最快时间是记录' .. tonumber(rankList[1][4]) .. '秒\n'
    --        str = str .. '您本周殿试答题时间是' .. useTime .. '秒\n'
    --        str = str .. '恭喜你突破了世界记录'
    --        sMailSystem:SendMail( 0, "殿试主考官", player:GetGUID(), 1, "殿试结果", str,{}, {})
    --        sDBVarSystem:SetInt('DianShiRankingFirstShortTime', useTime, 6)
    --        sDBVarSystem:SetInt('DianShiRankingFirstRightAnswerNum', rightAnswerNum, 6)
    --    end
    --end 

    return ""
end

function Act_DianShi.Every_Answer_Countdown(player, tinmer, p)
    -- sLuaApp:LuaDbg('来到了====Act_DianShi.Every_Answer_Countdown')
    player:SetDayInt('DianShiCurrentQuestionID', 0)
    player:SetDayInt("DianShiAllAnswersCount", player:GetDayInt("DianShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    player:SetDayInt("DianShiAnswerErrNum", player:GetDayInt("DianShiAnswerErrNum") + 1)

    local answerErrNum = player:GetDayInt("DianShiAnswerErrNum") 
    if answerErrNum >= Act_DianShi.maxAnswerErrNum then

        if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
            -- sLuaApp:LuaDbg("Act_DianShi.FindRightAnswer销毁定时器2")
            sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
        end
        if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
            -- sLuaApp:LuaDbg("Act_DianShi.FindRightAnswer销毁定时器3")
            sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
        end

        sLuaApp:NotifyTipsMsg(player, Act_DianShi.overMaxAnswerNumMsg)
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        return ''
    end

    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.AnswerOver(player)
        return ''
    end

    if player:GetDayInt('DianShiLeave') == 0 then
        sLuaApp:NotifyTipsMsg(player, Act_DianShi.answerOverMaxTimeMsg)
        -- 切换到下一题
        player:SetInt('DianShiSystemChangeQuestionsNum', player:GetInt('DianShiSystemChangeQuestionsNum') + 1)
        Act_DianShi.ChangeQuestion(player)
    end

    




    -- 倒计时已到
    -- Act_DianShi.SaveNextKaoGuanGUID(player)

    -- sLuaApp:NotifyTipsMsg(player,"答题时间已到")
    -- local str = [[
    --     if ExamUI then
    --         GUI.DestroyWnd("ExamUI")
    --     end
    -- ]]
    -- sLuaApp:ShowForm(player,"脚本表单", str)

    

    return ""
end

function Act_DianShi.Act_End(player, tinmer, p)
    player:SetDayInt("DianShiAllAnswersCount", player:GetDayInt("DianShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
    player:SetDayInt("DianShiIsFirstKaoGuan", 1)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
    --     -- sLuaApp:LuaDbg("Act_DianShi.Act_End销毁定时器1")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
    -- end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("Act_DianShi.Act_End销毁定时器2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
        -- sLuaApp:LuaDbg("Act_DianShi.Act_End销毁定时器3")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
    end
    -- 活动时间已到
    -- Act_DianShi.SaveNextKaoGuanGUID(player)

    sLuaApp:NotifyTipsMsg(player,"活动时间已到")
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        Act_DianShi.SaveRankingTwo(player)
    end

    return ""
end

function Act_DianShi.DianShiClickClose(player, content)
    -- sLuaApp:LuaDbg("总答题数=="..player:GetDayInt('DianShiAllAnswersCount'))
    -- sLuaApp:LuaDbg("接受的值为=="..content)

    -- sLuaApp:LuaDbg("客户端点击了关闭按钮")

    -- if player:GetDayInt('DianShiTotal') == player:GetDayInt('DianShiAllAnswersCount') then
    --     player:SetDayInt("DianShiAllAnswersCount", player:GetDayInt("DianShiAllAnswersCount") + 1) -- 总答题
    -- end
    -- player:SetDayInt("DianShiIsFirstKaoGuan", 1)
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
    --     -- sLuaApp:LuaDbg("Act_DianShi.DianShiClickClose销毁倒计时1")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
    -- end

    player:SetDayInt('DianShiLeave', 1)

    if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
        -- sLuaApp:LuaDbg("Act_DianShi.DianShiClickClose销毁倒计时2")
        sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
    end
    -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
    --     -- sLuaApp:LuaDbg("Act_DianShi.DianShiClickClose销毁倒计时2")
    --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
    -- end
    -- Act_DianShi.SaveNextKaoGuanGUID(player)

    -- if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
    --     Act_DianShi.SaveRankingTwo(player)
    -- end
    return ""
end


function Act_DianShi.AnswerOver(player)
    -- 答题超过限制
    if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
        -- sLuaApp:LuaDbg("答题超过限制========")
        sLuaApp:NotifyTipsMsg(player, "今日殿试已答完"..Act_DianShi.maxAnswerNum.."道题")
    
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("DianShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("DianShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[

                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("DianShipreviousRightAnswerIndex") .. [[
                
                ExamUI.EndFlag = true
                ExamUI.Func1Num = ]] .. player:GetInt('DianShiSystemAnsWerNum') .. [[
                ExamUI.Func2Num = ]] .. player:GetInt('DianShiSystemTipNum') .. [[
                ExamUI.Func3Num = ]] .. player:GetInt('DianShiSystemChangeQuestionsNum') .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)
		
		Act_DianShi.SaveRankingTwo(player)

        return ""
    end
end

function Act_DianShi.Initialization()
	--初始化 发邮件需要的item表 keyname==>id
	if Act_DianShi.endMailReward then
		for k,v in pairs(Act_DianShi.endMailReward) do
			Act_DianShi.end_mail_item[k]={}
			for a,b in ipairs(v['Item']) do
				if type(b) == "string" then
					local itemData = ItemConfig.GetByKeyName(b)
					table.insert(Act_DianShi.end_mail_item[k], itemData.Id)
					local num = v['Item'][a+1]
					local bind = v['Item'][a+2]
					if type(num) == "number" and type(bind) == "number" then
						table.insert(Act_DianShi.end_mail_item[k], num)
						table.insert(Act_DianShi.end_mail_item[k], bind)
					end
				end
			
			end
		end
	else
		sLuaApp:LuaErr("缺少Act_DianShi.endMailReward")
    end
    
    --sLuaApp:LuaDbg(Lua_tools.serialize(Act_DianShi.end_mail_item))
end

-- function Act_DianShi.Time_Count(player, tinmer, p)

    -- if player:GetDayInt("DianShiTimeCount") >= Act_DianShi.everyAnswerTime then

        -- player:SetDayInt('DianShiTimeCount', 0)

        -- -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime1')) then
        -- --     sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime1'))
        -- -- end
        -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime2')) then
            -- -- sLuaApp:LuaDbg("Act_DianShi.Time_Count==销毁定时器2")
            -- sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime2'))
        -- end
        -- if sLuaTimerSystem:HasTimer(player:GetDayInt('DianShiTime3')) then
            -- -- sLuaApp:LuaDbg("Act_DianShi.Time_Count==销毁定时器3")
            -- sLuaTimerSystem:DisableTimer(player:GetDayInt('DianShiTime3'))
        -- end

        -- Act_DianShi.Every_Answer_Countdown(player)

        -- return ''
    -- end
    -- player:SetDayInt('DianShiTimeCount',player:GetDayInt("DianShiTimeCount") + 1)

    -- -- sLuaApp:LuaDbg('时间过了'..player:GetDayInt("DianShiTimeCount")..'秒')

-- end

-- 延迟关闭界面
function Act_DianShi.YanChiClose(player, tinmer, p)
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)
end

function Act_DianShi.ExpCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_DianShi.addSomeGifts.win.RewardCoin1
	else
		Exps = Act_DianShi.addSomeGifts.lose.RewardCoin1
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return assert(load(str..' return ' .. Exps))()
	end
	return Exps
end

function Act_DianShi.GoldCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_DianShi.addSomeGifts.win.RewardCoin2
	else
		Exps = Act_DianShi.addSomeGifts.lose.RewardCoin2
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return math.ceil(assert(load(str..' return ' .. Exps))())
	end
	return Exps
end