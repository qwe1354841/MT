--乡试

Act_XiangShi = {}

-- Act_XiangShi.join_max = 1  -- 最大参加次数 暂时写死了 最多只能参加一次
Act_XiangShi.active_max = 0  -- 参加完活动给的活跃

Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum = 20
Act_XiangShi.maxAnswerNum = 30
Act_XiangShi.desc = '科举乡试玩法说明：\\n'
Act_XiangShi.desc = Act_XiangShi.desc .. '1、周一至周六，每天都可以参加1次乡试。\\n'
Act_XiangShi.desc = Act_XiangShi.desc .. '2、乡试一共'.. Act_XiangShi.maxAnswerNum ..'道题，只要任何一天答对'.. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum ..'道及以上，即可获得会试资格。\\n'
Act_XiangShi.desc = Act_XiangShi.desc .. '3、每次回答，无论对错都会获得奖励。'

Act_XiangShi.RewardCoinType1 = 295  -- 经验图标
Act_XiangShi.RewardCoinType2 = 300  -- 银币图标

Act_XiangShi.addSomeGifts = {
    win = {
        RewardCoin1 = "120*Level",			--经验值
        RewardCoin2 = "120*Level"			--银币值
    },
    lose = {
        RewardCoin1 = "60*Level",			--经验值
        RewardCoin2 = "60*Level"          	--银币值
    }
}

Act_XiangShi.ShowItem = "61024,61025"

-- 活动开始前回调
function Act_XiangShi.OnDeclare(id, seconds)
    ActOpenInformWnd.StartInform(id)
end

-- 活动开始回调
function Act_XiangShi.OnStart(id, is_normal)
    -- sLuaApp:LuaDbg("ActStart id======"..id)
	sVarSystem:SetInt("ACTIVITY_XiangShi_Id", id)
	if Data then
		Data["XiangShiAnswered"] = {}
	end
end

-- 活动结束回调
function Act_XiangShi.OnStop(id)
    -- sLuaApp:LuaDbg("ActOver id======"..id)
    sVarSystem:SetInt("ACTIVITY_XiangShi_Id", 0)
	if Data and Data["XiangShiAnswered"] then
		Data["XiangShiAnswered"] = {}
	end
end

-- 玩家点击参与活动回调
function Act_XiangShi.OnJoin(id, player)
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
    if player:GetDayInt("XiangShiAllAnswersCount") >= Act_XiangShi.maxAnswerNum then
        sLuaApp:NotifyTipsMsg(player, "今日已参加过乡试活动")
        return 
    end

    local str = [[
        GUI.CloseWnd("ActivityPanelUI")
    ]]
    sLuaApp:ShowForm(player, "脚本表单", str)

	--引导玩家到活动npc
    Lua_tools.MoveToNpc(player, 10217)
end

-- 玩家客户端查询数据回调
function Act_XiangShi.OnQuery(id, player)
	-- local join_num = player:GetDayInt("XiangShi_join_num"..id)
    -- local active_num = player:GetDayInt("XiangShi_active_num"..id)
    local join_num = player:GetDayInt("XiangShiJoinNum")
    local active_num = 0
    local max_join = 1
    --if player:GetDayInt("XiangShiAllAnswersCount") >= Act_XiangShi.maxAnswerNum then
    --    join_num = 1
    --    active_num = Act_XiangShi.active_max
    --end
	
	-- local str = join_num..":"..Act_XiangShi.join_max..":"..active_num..":"..Act_XiangShi.active_max..":61024,20122,31006:2:2,5"
	local str = join_num..":"..max_join..":"..player:GetDayInt("XiangShiActiveVal")..":"..Act_XiangShi.active_max..":"..Act_XiangShi.ShowItem..":2:"..(ActivitySystem.Act_GetClassify("Act_XiangShi") or '2,3,5')
	--分别对应的是 当前参加次数，次数上限，当前获得活跃值，活跃值上限，奖励List，活动状态，属于什么奖励类型的活动
	--活动状态（1，可参加  2，进行中   3，已参与）
	return str
end

--获得随机题目 --题库范围不能小于答题总量
function Act_XiangShi.GetQuestion(player, rand_times)
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
			if not Act_XiangShi.CheckRepeat(player, genRes) then
				return Act_XiangShi.GetQuestion(player)
			end
			local question = QuestionImperialConfig.GetById(genRes)
			player:SetDayInt("XiangShiCurrentQuestionID", genRes)
			return question
		end
		return Act_XiangShi.GetQuestion(player, rand_times)
	else
		if not Act_XiangShi.CheckRepeat(player, genRes) then
			return Act_XiangShi.GetQuestion(player)
		end
		player:SetDayInt("XiangShiCurrentQuestionID", genRes)
		return question
	end
end

--检查题目是否重复
function Act_XiangShi.CheckRepeat(player, genRes)
	local player_guid = tostring(player:GetGUID())
	if Data and Data["XiangShiAnswered"] then
		if Data["XiangShiAnswered"][player_guid] then
			for _,v in ipairs(Data["XiangShiAnswered"][player_guid]) do 
				if genRes == v then
					return false
				end
			end
		end
	end
	return true
end

function Act_XiangShi.OpenForm(player)
    -- sLuaApp:LuaDbg("来到了open form===")
    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_XiangShi_Id"))
	
	local question
	if player:GetDayInt("XiangShiCurrentQuestionID") == 0 then
        question = Act_XiangShi.GetQuestion(player)
	else
		question = QuestionImperialConfig.GetById(player:GetDayInt("XiangShiCurrentQuestionID"))
    end
    -- local genRes
    -- if player:GetDayInt("XiangShiCurrentQuestionID") == 0 then
        -- -- 随机生成1-1125
        -- genRes = sLuaApp:RandInteger(1, 1125)
    -- else
        -- genRes = player:GetDayInt("XiangShiCurrentQuestionID")
    -- end

	-- -- 随机生成1-1125
    -- local question = QuestionImperialConfig.GetById(genRes)
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end
    -- player:SetDayInt("XiangShiCurrentQuestionID", genRes)
	local optionArr = {}
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
    player:SetDayInt("XiangShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("XiangShiCurrentRightAnswer"))    -- 测试
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
	-- endTime = endTime - (60 * 60 * 8)  -- 解决时区问题
    -- sLuaApp:LuaDbg("结束时间戳==="..endTime)    -- 测试
    -- sLuaApp:LuaDbg(Act_XiangShi.desc)
    -- sLuaApp:LuaDbg('RewardCoin1=='..RewardCoin1)
    -- sLuaApp:LuaDbg('RewardCoin2=='..RewardCoin2)

    if player:GetWeekInt("XiangShiToHuiShi") ~= 1 then

        local str = [[
            GUI.OpenWnd("ExamUI")
            if ExamUI then
                ExamUI.EndTime = ]] .. endTime ..[[
                ExamUI.Desc = "]] .. Act_XiangShi.desc .. '"' .. [[
                ExamUI.RewardCoinType1 = ]] .. Act_XiangShi.RewardCoinType1 .. [[
                ExamUI.RewardCoinType2 = ]] .. Act_XiangShi.RewardCoinType2 .. [[
                ExamUI.Type = 1
                ExamUI.HaveQualifications = false
                ExamUI.EndFlag = false

                ExamUI.InitPanel()
                
                ExamUI.RightNum = ]] .. player:GetDayInt("XiangShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("XiangShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
                ExamUI.QuestionIndex = ]] .. player:GetDayInt("XiangShiAllAnswersCount") + 1 .. [[

                ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
                ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
                ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
                ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
                ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[
                
                ExamUI.Func1Num = ]] .. 0 .. [[
                ExamUI.Func2Num = ]] .. 0 .. [[
                ExamUI.Func3Num = ]] .. 0 .. [[

                ExamUI.RefreshPanel()


            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

    else
        local str = [[
            GUI.OpenWnd("ExamUI")
            if ExamUI then
                ExamUI.EndTime = ]] .. endTime ..[[
                ExamUI.Desc = "]] .. Act_XiangShi.desc .. '"' .. [[
                ExamUI.RewardCoinType1 = ]] .. Act_XiangShi.RewardCoinType1 .. [[
                ExamUI.RewardCoinType2 = ]] .. Act_XiangShi.RewardCoinType2 .. [[
                ExamUI.Type = 1

                ExamUI.HaveQualifications = true
                ExamUI.EndFlag = false
                ExamUI.InitPanel()
                
                ExamUI.RightNum = ]] .. player:GetDayInt("XiangShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("XiangShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
                ExamUI.QuestionIndex = ]] .. player:GetDayInt("XiangShiAllAnswersCount") + 1 .. [[

                ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
                ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
                ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
                ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
                ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

                ExamUI.Func1Num = ]] .. 0 .. [[
                ExamUI.Func2Num = ]] .. 0 .. [[
                ExamUI.Func3Num = ]] .. 0 .. [[

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)
    end

    player:SetDayInt("XiangShipreviousRightAnswerIndex",player:GetDayInt("XiangShiCurrentRightAnswer"))

    return ""
end


-- 接收答案
function Act_XiangShi.receiveAnswer(player, content)
    if player:GetDayInt("XiangShiAllAnswersCount") > Act_XiangShi.maxAnswerNum then
        return ""
    end
	if Data and Data["XiangShiAnswered"] then
		local player_guid = tostring(player:GetGUID())
		if not  Data["XiangShiAnswered"][player_guid] then
			Data["XiangShiAnswered"][player_guid] = {}
		end
		table.insert(Data["XiangShiAnswered"][player_guid], player:GetDayInt("XiangShiCurrentQuestionID"))
	end
	
	
    player:SetDayInt("XiangShiCurrentQuestionID", 0)
    -- sLuaApp:LuaDbg("接收的答案索引"..content.."   type=="..type(content))
    -- sLuaApp:LuaDbg("存储的正确答案索引"..player:GetDayInt("XiangShiCurrentRightAnswer"))
    if player:GetDayInt("XiangShipreviousRightAnswerIndex") == tonumber(content) then
		local winExp = Act_XiangShi.ExpCalucation(player, true)
		local winGold = Act_XiangShi.GoldCalucation(player, true)
		
        player:SetDayInt("XiangShiRightAnswersCount", player:GetDayInt("XiangShiRightAnswersCount") + 1) -- 答对题数

        player:AddExp(winExp,'system','乡试','回答正确')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(winExp, "system", "乡试", "回答正确")
		end
        Lua_tools.AddMoney(player, 5, winGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..winGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + winExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + winGold)
    else
		local loseExp = Act_XiangShi.ExpCalucation(player, false)
		local loseGold = Act_XiangShi.GoldCalucation(player, false)
	
        player:AddExp(loseExp,'system','乡试','回答错误')
		local pets = Lua_tools.GetFightPets(player)
		for k,v in ipairs(pets) do
			v:AddExp(loseExp, "system", "乡试", "回答错误")
		end
        Lua_tools.AddMoney(player, 5, loseGold, "system", "", "")
		sLuaApp:NotifyTipsMsg(player,"您获得了银币"..loseGold)

        player:SetDayInt("RewardCoin1", player:GetDayInt("RewardCoin1") + loseExp)
        player:SetDayInt("RewardCoin2", player:GetDayInt("RewardCoin2") + loseGold)
    end

    if player:GetWeekInt("XiangShiToHuiShi") ~= 1 then
        -- sLuaApp:LuaDbg("玩家今天答对题数"..player:GetDayInt("XiangShiRightAnswersCount").."  会试资格的答对题目数=="..Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum)
        if player:GetDayInt("XiangShiRightAnswersCount") >= Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum then
			if player:GetWeekInt("XiangShiToHuiShi") ~= 1 then
				player:SetWeekInt("XiangShiToHuiShi",1)
				sMailSystem:SendMail(0, "系统", player:GetGUID(), 1, "乡试奖励", "您已获得#COLORCOLOR_ORANGE#科举会试#COLOREND#资格，可在#COLORCOLOR_ORANGE#本周星期天12点至18点50#COLOREND#前去长安城（280，197）会试主考官处参加会试", {}, {20727,1,1})
			end
           
            player:SetInt("HuiShiSystemAnsWerNum", player:GetInt("HuiShiSystemAnsWerNum") + 1)
            player:SetInt("HuiShiSystemTipNum", player:GetInt("HuiShiSystemTipNum") + 1)
            player:SetInt("HuiShiSystemChangeQuestionsNum", player:GetInt("HuiShiSystemChangeQuestionsNum") + 1)
            local str = [[
                ExamUI.HaveQualifications = true
            ]]
            sLuaApp:ShowForm(player,"脚本表单", str)
            
        else
            local str = [[
                ExamUI.HaveQualifications = false
            ]]
            sLuaApp:ShowForm(player,"脚本表单", str)
        end

    else
        -- sLuaApp:LuaDbg("已有资格，快快显示")
        local str = [[
            ExamUI.HaveQualifications = true
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)
    end

    player:SetDayInt("XiangShiAllAnswersCount", player:GetDayInt("XiangShiAllAnswersCount") + 1) -- 总答题
	if SeasonPassQuestFunc then
		SeasonPassQuestFunc.Exam(player)
	end
	
	if Act_XiangShi.active_max > 0 then
		local todayAct = player:GetDayInt("XiangShiActiveVal")
		if todayAct < Act_XiangShi.active_max then
			if not Act_XiangShi.ActiveValAdd then
				Act_XiangShi.ActiveValAdd = math.ceil(Act_XiangShi.active_max/Act_XiangShi.maxAnswerNum)
			end
			local add = Act_XiangShi.ActiveValAdd
			if add + todayAct > Act_XiangShi.active_max then
				add = Act_XiangShi.active_max - todayAct
			end
			todayAct = todayAct + add
			player:SetDayInt("XiangShiActiveVal", todayAct)
			ActivitySystem.AddActiveVal(player, add)
		end
	end
    

    
    local activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_XiangShi_Id"))
    -- -- 随机生成1-1125
	-- local genRes = sLuaApp:RandInteger(1, 1125)
    -- local question = QuestionImperialConfig.GetById(genRes)
    -- -- sLuaApp:LuaDbg("questionde的类型"..type(question))
    -- if not question then
        -- -- sLuaApp:LuaDbg("id==="..genRes)
        -- genRes = sLuaApp:RandInteger(1, 100)
        -- question = QuestionImperialConfig.GetById(genRes)
    -- end

    -- player:SetDayInt("XiangShiCurrentQuestionID", genRes)
	local question = Act_XiangShi.GetQuestion(player)
	
	local optionArr = {}
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
    player:SetDayInt("XiangShiCurrentRightAnswer",rightAnswerIndex)
    -- sLuaApp:LuaDbg("从玩家身上读取答案："..player:GetDayInt("XiangShiCurrentRightAnswer"))    -- 测试
    

    -- 答题超过限制
    if player:GetDayInt("XiangShiAllAnswersCount") >= Act_XiangShi.maxAnswerNum then
		player:SetDayInt("XiangShiJoinNum", 1)
        sLuaApp:NotifyTipsMsg(player, "乡试结束了，您一共答对了".. player:GetDayInt("XiangShiRightAnswersCount").."题")
        local str = [[
            if ExamUI then
                
                ExamUI.RightNum = ]] .. player:GetDayInt("XiangShiRightAnswersCount") .. [[
                ExamUI.TotalNum = ]] .. player:GetDayInt("XiangShiAllAnswersCount") .. [[
                ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
                ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
                ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("XiangShipreviousRightAnswerIndex") .. [[
                ExamUI.EndFlag = true

                ExamUI.RefreshPanel()

            end
        ]]
        sLuaApp:ShowForm(player,"脚本表单", str)

        sLuaTimerSystem:AddTimerEx(player, 2 * 1000 ,1,"Act_XiangShi.YanChiClose", "")

        return ""
    end
    
    local str = [[
		if ExamUI then
            
            ExamUI.RightNum = ]] .. player:GetDayInt("XiangShiRightAnswersCount") .. [[
            ExamUI.TotalNum = ]] .. player:GetDayInt("XiangShiAllAnswersCount") .. [[
            ExamUI.RewardCoin1 = ]] .. player:GetDayInt("RewardCoin1") .. [[
            ExamUI.RewardCoin2 = ]] .. player:GetDayInt("RewardCoin2") .. [[
            ExamUI.QuestionIndex = ]] .. player:GetDayInt("XiangShiAllAnswersCount") + 1 .. [[
            ExamUI.RightAnswerIndex = ]] .. player:GetDayInt("XiangShipreviousRightAnswerIndex") .. [[
            ExamUI.Question = ]] .."[[".. question.Ask .. "]]".. [[
            ExamUI.Answer1 = ]] .. "[[".. optionArr[1] .. "]]" .. [[
            ExamUI.Answer2 = ]] .. "[[".. optionArr[2] .. "]]" .. [[
            ExamUI.Answer3 = ]] .. "[[".. optionArr[3] .. "]]" .. [[
            ExamUI.Answer4 = ]] .. "[[".. optionArr[4] .. "]]" .. [[

            ExamUI.EndFlag = false

            ExamUI.RefreshPanel()


		end
	]]
    sLuaApp:ShowForm(player,"脚本表单", str)
    
    player:SetDayInt("XiangShipreviousRightAnswerIndex",player:GetDayInt("XiangShiCurrentRightAnswer"))


    return ""
end


-- 客户端调用关闭窗口
function Act_XiangShi.closeXiangShiWin(player)
    sLuaApp:NotifyTipsMsg(player,"今天的乡试时间已到")
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)

    return ""

    
end

-- 延迟关闭界面
function Act_XiangShi.YanChiClose(player, tinmer, p)
    local str = [[
        if ExamUI then
            GUI.DestroyWnd("ExamUI")
        end
    ]]
    sLuaApp:ShowForm(player,"脚本表单", str)
end


function Act_XiangShi.ExpCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_XiangShi.addSomeGifts.win.RewardCoin1
	else
		Exps = Act_XiangShi.addSomeGifts.lose.RewardCoin1
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return assert(load(str..' return ' .. Exps))()
	end
	return Exps
end

function Act_XiangShi.GoldCalucation(player, isWin)
	local Exps
	if isWin == true then
		Exps = Act_XiangShi.addSomeGifts.win.RewardCoin2
	else
		Exps = Act_XiangShi.addSomeGifts.lose.RewardCoin2
	end
	if type(Exps) == "string" then
		local str = [[ local Level = ]] .. player:GetAttr(ROLE_ATTR_LEVEL) .. [[   local Rein = ]] .. player:GetAttr(ROLE_ATTR_REINCARNATION) .. [[ ]]
		return math.ceil(assert(load(str..' return ' .. Exps))())
	end
	return Exps
end