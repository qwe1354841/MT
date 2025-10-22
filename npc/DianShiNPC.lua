--殿试NPC
DianShiNPC = {}


-- 我要参加殿试
function DianShiNPC.option1(npc, player, content)
	-- sLuaApp:LuaDbg("当前考官GUID=="..npc:GetGUID())
	
	-- 活动开启状态
	if not sLuaApp:IsActivityRunning(sVarSystem:GetInt("ACTIVITY_DianShi_Id")) then
		return DianShiNPC.weekErr
	end

	local team = player:GetTeam()
    if team then
        return "科举是单人活动，无法组队参加"
    end

	-- 小于指定等级
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(DianShiNPC.activityData.LevelMin) then
        return DianShiNPC.ltMinLevel
	end

	-- 是否拥有资格  TODO 测试方便暂时注掉 
	--local rankList = sRanklistSystem:GetRanklist(RankingListSystem.Config['会试排行榜'] or 50, 1, Act_HuiShi.preRankingNum)
	local isHaveQualification = false
	local currentPlayerGUID = player:GetGUID()
	
	local Ranks = sRanklistSystem:GetRank(RankingListSystem.Config['会试排行榜'] or 50,currentPlayerGUID)
	if Ranks[1] then
		if Ranks[1] < Act_HuiShi.preRankingNum or 20 then
			isHaveQualification = true
		end
	end

	--for k, v in pairs(rankList) do
	--	local playerGUID = v[1]
	--	if currentPlayerGUID == playerGUID then
	--		isHaveQualification = true
	--		break
	--	end
	--end
	
	if not isHaveQualification then
		return '只有在会试中表现优异的人才，才能参加会试。'
	end


	if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
		return DianShiNPC.answerOver
	end

	-- player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
	-- FormKeJu.HuiShiOpen(player)

	Act_DianShi.OpenForm(player)

	return ""
end


-- 了解殿试详细信息
function DianShiNPC.option2(npc, player, content)
	-- local DianShiNPC.activityData = ActivityConfig.GetById(sVarSystem:GetInt("ACTIVITY_HuiDianShi_Id"))
	
	return DianShiNPC.DianShiProfile
end
-- 了解科举活动
function DianShiNPC.option3(npc, player, content)
	return HuiShiZhuNPC.KeJuProfile
end

-- 继续答题
function DianShiNPC.option6(npc, player, content)
	Act_DianShi.OpenForm(player)
	return ""
end

-- 加道具
function DianShiNPC.option7(npc, player, content)
	player:SetDayInt('DianShiSystemAnsWerNum', player:GetDayInt('DianShiSystemAnsWerNum') + 10)
	player:SetDayInt('DianShiSystemTipNum', player:GetDayInt('DianShiSystemTipNum') + 10)
	player:SetDayInt('DianShiSystemChangeQuestionsNum', player:GetDayInt('DianShiSystemChangeQuestionsNum') + 10)
	return ""
end


function DianShiNPC.main(npc, player)
	local answerOverMsg = '你的殿试已经结束了，下次再来吧'

	-- 是否已答过题
	-- 没有的话显示三个选项
	-- 有显示一个选项

	if player:GetDayInt("DianShiAllAnswersCount") == 0 then
		player:AddNpcOption(npc, 0, "我要参加殿试", "option1", "")
		-- player:AddNpcOption(npc, 0, "加道具(测试)", "option7", "")
		player:AddNpcOption(npc, 0, "了解殿试详细信息", "option2", "")
		player:AddNpcOption(npc, 0, "了解科举活动", "option3", "")
		return "秀才不出门，便知天下事。你要考试吗？"
	else
		-- 判断是否答满
		if player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
			return answerOverMsg
		end
		-- 是否答错指定题数
		if player:GetDayInt("DianShiAnswerErrNum") >= Act_DianShi.maxAnswerErrNum then
			return "你的殿试已经结束了，下次再来吧"
		end

		player:AddNpcOption(npc, 0, "继续答题", "option6", "")
		-- player:AddNpcOption(npc, 0, "加道具(测试)", "option7", "")
		return '继续答题吗？'
	end

	return "秀才不出门，便知天下事。你要考试吗？"
end

function DianShiNPC.Initialization()
	if not Act_DianShi then
		require("activity/Act_DianShi")
	end
	if not Act_HuiShi then
		require("activity/Act_HuiShi")
	end
	DianShiNPC.activityData = ActivityConfig.GetById(33)  -- 殿试

	DianShiNPC.weekMsgMap = {'一','二','三','四','五','六','日'}
	DianShiNPC.weekErr = '殿试时间为周' .. DianShiNPC.weekMsgMap[tonumber(DianShiNPC.activityData.Time)] .. DianShiNPC.activityData.TimeStart .. '至' .. DianShiNPC.activityData.TimeEnd
	DianShiNPC.ltMinLevel = "达到"..DianShiNPC.activityData.LevelMin.."级才能参加"
	DianShiNPC.answerOver = '今日殿试已答完'.. Act_DianShi.maxAnswerNum ..'道题'
	DianShiNPC.notInTime = '答题时间在' .. DianShiNPC.activityData.TimeStart .. '至' .. DianShiNPC.activityData.TimeEnd

	DianShiNPC.DianShiProfile = '会试获得前'.. Act_DianShi.preRankingNum ..'名即可获取殿试资格。\n'
	DianShiNPC.DianShiProfile = DianShiNPC.DianShiProfile .. '殿试时间为周' .. DianShiNPC.weekMsgMap[tonumber(DianShiNPC.activityData.Time)] .. DianShiNPC.activityData.TimeStart .. '至' .. DianShiNPC.activityData.TimeEnd
end
DianShiNPC.Initialization()