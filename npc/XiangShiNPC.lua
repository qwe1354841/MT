--乡试NPC
XiangShiNPC = {}



-- 我要参加乡试
function XiangShiNPC.option1(npc, player, content)
	
	-- 活动开启状态
	if sVarSystem:GetInt("ACTIVITY_XiangShi_Id") == 0 then
		return XiangShiNPC.timeErr
	end
	if not sLuaApp:IsActivityRunning(sVarSystem:GetInt("ACTIVITY_XiangShi_Id")) then
		return XiangShiNPC.timeErr
	end

	local team = player:GetTeam()
    if team then
        return "科举是单人活动，无法组队参加"
    end

	local time = sLuaApp:GetTimes()
	-- 小于指定等级
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(XiangShiNPC.activityData.LevelMin) then
        return XiangShiNPC.ltMinLevel
	end


	if player:GetDayInt("XiangShiAllAnswersCount") >= Act_XiangShi.maxAnswerNum then
		return XiangShiNPC.answerOver
	end

	Act_XiangShi.OpenForm(player)
	Achievement.Achievement_XiangShi(player)
	return ""
end


-- 了解乡试详细信息
function XiangShiNPC.option2(npc, player, content)
	return XiangShiNPC.XiangShiProfile
end
-- 了解科举活动
function XiangShiNPC.option3(npc, player, content)
	return HuiShiNPC.KeJuProfile
end

function XiangShiNPC.option5(npc, player, content)

	player:SetWeekInt("XiangShiToHuiShi", 1)
	if player:GetWeekInt("XiangShiToHuiShi") == 1 then
		return "拥有了会试资格"
	end
	return "没有会试资格"
end


function XiangShiNPC.main(npc, player)	

	player:AddNpcOption(npc, 0, "我要参加乡试", "option1", "")
	-- player:AddNpcOption(npc, 0, "直接获取会试资格(测试)", "option5", "")
	player:AddNpcOption(npc, 0, "了解乡试详细信息", "option2", "")
	player:AddNpcOption(npc, 0, "了解科举活动", "option3", "")
	
	return "秀才不出门，便知天下事。你要考试吗？"
end

function XiangShiNPC.Initialization()
	if not Act_XiangShi then
		require("activity/Act_XiangShi")
	end
	XiangShiNPC.activityData = ActivityConfig.GetById(27)
	XiangShiNPC.activityData1 = ActivityConfig.GetById(32)

	XiangShiNPC.weekMsgMap = {'一','二','三','四','五','六','日'}
	XiangShiNPC.XiangShiProfile = "乡试只要任何一天的" .. Act_XiangShi.maxAnswerNum .. "道题答对" .. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum .. "道及以上，即可参加本周的会试。\n"
	XiangShiNPC.XiangShiProfile = XiangShiNPC.XiangShiProfile .."会试每周".. XiangShiNPC.weekMsgMap[tonumber(XiangShiNPC.activityData1.Time)] .. XiangShiNPC.activityData1.TimeStart .."点开始到" .. XiangShiNPC.activityData1.TimeEnd .."结束。"
	XiangShiNPC.timeErr = "乡试时间为周一到周六" .. XiangShiNPC.activityData.TimeStart .. '至' .. XiangShiNPC.activityData.TimeEnd
	XiangShiNPC.answerOver = '今日已答完'.. Act_XiangShi.maxAnswerNum ..'道题'
	XiangShiNPC.ltMinLevel = "达到"..XiangShiNPC.activityData.LevelMin.."级才能参加"
end
XiangShiNPC.Initialization()