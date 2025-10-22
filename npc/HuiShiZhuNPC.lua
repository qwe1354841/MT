--会试主NPC
HuiShiZhuNPC = {}



-- 我要参加会试
function HuiShiZhuNPC.option1(npc, player, content)
	-- sLuaApp:LuaDbg("当前考官GUID=="..npc:GetGUID())

	-- 活动开启状态
	if not sLuaApp:IsActivityRunning(32) then
		return HuiShiZhuNPC.weekErr
	end

	local team = player:GetTeam()
    if team then
        return "科举是单人活动，无法组队参加"
    end

	-- 小于指定等级
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(HuiShiZhuNPC.activityData1.LevelMin) then
        return HuiShiZhuNPC.ltMinLevel
	end

	-- 判断有没有资格
	if player:GetWeekInt("XiangShiToHuiShi") ~= 1 then
		return HuiShiZhuNPC.notQualified
	end

	if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
		return HuiShiZhuNPC.answerOver
	end

	-- player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
	-- FormKeJu.HuiShiOpen(player)

	-- 条件满足
	-- 判断是否是跟第一个NPC对话
	player:SetInt("HuiShi_LastNPC", npc:GetId())
	if player:GetDayInt("HuiShiAllAnswersCount") == 0 then
		player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
		Act_HuiShi.OpenForm(player)
	else
		if npc:GetId() == player:GetDayInt("HuiShiNextKaoGuanID") then
			player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
			Act_HuiShi.OpenForm(player)
		else
			-- 你的下一个考官在
			local nextKaoGuanNPCGUID = player:GetDayInt("HuiShiNextKaoGuanGUID")
			local nextKaoGuanNPC = sNpcSystem:GetNpcByGUID(nextKaoGuanNPCGUID)
			if not nextKaoGuanNPC then
				local NPCID = player:GetDayInt("HuiShiNextKaoGuanID")
				nextKaoGuanNPC = sNpcSystem:GetNpcsById(NPCID)[1]
			end
			local map = nextKaoGuanNPC:GetMap()
			local mapName = map:GetName()
			local posX = sMapSystem:GetPosX(nextKaoGuanNPC)
			local posY = sMapSystem:GetPosY(nextKaoGuanNPC)
			return '你的下一个考官在'..mapName..'('..posX..','..posY..')'
		end
	end

	return ""
end


-- 了解会试详细信息
function HuiShiZhuNPC.option2(npc, player, content)
	return HuiShiZhuNPC.HuiShiProfile
end
-- 了解科举活动
function HuiShiZhuNPC.option3(npc, player, content)
	return HuiShiZhuNPC.KeJuProfile
end
-- 检查是否拥有会试资格
function HuiShiZhuNPC.option4(npc, player, content)
	if player:GetInt("XiangShiToHuiShi") == 1 then
		return "拥有了会试资格"
	end
	return "没有会试资格"
end

-- 给会试资格并给道具
function HuiShiZhuNPC.option5(npc, player, content)
	sLuaApp:NotifyTipsMsg(player, "获得会试资格")
	player:SetWeekInt("XiangShiToHuiShi",1)
	player:SetInt("HuiShiSystemAnsWerNum", player:GetInt("HuiShiSystemAnsWerNum") + 1)
	player:SetInt("HuiShiSystemTipNum", player:GetInt("HuiShiSystemTipNum") + 1)
	player:SetInt("HuiShiSystemChangeQuestionsNum", player:GetInt("HuiShiSystemChangeQuestionsNum") + 1)
	return ""
end

-- 花钱直接传送
function HuiShiZhuNPC.option6(npc, player, content)
	local nextKaoGuanNPCGUID = player:GetDayInt("HuiShiNextKaoGuanGUID")
	local nextKaoGuanNPC = sNpcSystem:GetNpcByGUID(nextKaoGuanNPCGUID)
	if not nextKaoGuanNPC then
		local NPCID = player:GetDayInt("HuiShiNextKaoGuanID")
		nextKaoGuanNPC = sNpcSystem:GetNpcsById(NPCID)[1]
	end
	local map = nextKaoGuanNPC:GetMap()
	local posX = sMapSystem:GetPosX(nextKaoGuanNPC)
	local posY = sMapSystem:GetPosY(nextKaoGuanNPC)
	-- 扣钱
	if not Lua_tools.SubMoney(player, Act_HuiShi.jumpMoney.moneyType, Act_HuiShi.jumpMoney.moneyNum, "", "答题传送", "") then
		return "余额不足".. Act_HuiShi.jumpMoney.moneyNum .. Lua_tools.MoneyNames[Act_HuiShi.jumpMoney.moneyType]   
	end
	
	sMapSystem:Jump(player, map,posX,posY,3)
	sLuaApp:NotifyTipsMsg(player, "传送成功")
	return ""
end




function HuiShiZhuNPC.main(npc, player)

	if player:GetDayInt("HuiShiAllAnswersCount") == 0 then
		player:AddNpcOption(npc, 0, "我要参加会试", "option1", "")
		-- player:AddNpcOption(npc, 0, "直接获得会试资格(测试)", "option5", "")
		-- player:AddNpcOption(npc, 0, "检查会试资格(测试)", "option4", "")
		player:AddNpcOption(npc, 0, "了解会试详细信息", "option2", "")
		player:AddNpcOption(npc, 0, "了解科举活动", "option3", "")
		return "秀才不出门，便知天下事。你要考试吗？"
	else

		if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
			return HuiShiZhuNPC.answerOver
		end

		if npc:GetId() == player:GetDayInt("HuiShiNextKaoGuanID") then
			player:AddNpcOption(npc, 0, "继续答题", "option1", "")
			-- player:AddNpcOption(npc, 0, "直接获得会试资格(测试)", "option5", "")
			-- player:AddNpcOption(npc, 0, "检查会试资格(测试)", "option4", "")
			-- player:AddNpcOption(npc, 0, "了解会试详细信息", "option2", "")
			-- player:AddNpcOption(npc, 0, "了解科举活动", "option3", "")
			return "继续答题吗？"
		else
			-- 你的下一个考官在
			player:AddNpcOption(npc, 0, "传送到下一个考官需(" .. Act_HuiShi.jumpMoney.moneyNum .. Lua_tools.MoneyNames[Act_HuiShi.jumpMoney.moneyType] ..")", "option6", "")
			local nextKaoGuanNPCGUID = player:GetDayInt("HuiShiNextKaoGuanGUID")
			local nextKaoGuanNPC = sNpcSystem:GetNpcByGUID(nextKaoGuanNPCGUID)
			if not nextKaoGuanNPC then
				local NPCID = player:GetDayInt("HuiShiNextKaoGuanID")
				nextKaoGuanNPC = sNpcSystem:GetNpcsById(NPCID)[1]
			end
			local map = nextKaoGuanNPC:GetMap()
			local mapName = map:GetName()
			local posX = sMapSystem:GetPosX(nextKaoGuanNPC)
			local posY = sMapSystem:GetPosY(nextKaoGuanNPC)
			return '你的下一个考官在'..mapName..'('..posX..','..posY..')'
		end
	end


	return "秀才不出门，便知天下事。你要考试吗？"
end

function HuiShiZhuNPC.Initialization()
	if not Act_XiangShi then
		require("activity/Act_XiangShi")
	end
		if not Act_HuiShi then
		require("activity/Act_HuiShi")
	end
	HuiShiZhuNPC.activityData1 = ActivityConfig.GetById(32)  -- 会试
	HuiShiZhuNPC.activityData2 = ActivityConfig.GetById(33)  -- 殿试

	HuiShiZhuNPC.weekMsgMap = {'一','二','三','四','五','六','日'}
	HuiShiZhuNPC.KeJuProfile = "科举是单人活动，包含：乡试，会试，殿试三部分。\n"
	HuiShiZhuNPC.KeJuProfile = HuiShiZhuNPC.KeJuProfile .. "乡试每周一至周六开启，每天可以参加一次，乡试共计" .. Act_XiangShi.maxAnswerNum .. "道题，答对" .. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum .. "道及以上可获得乡试礼包以及参加本周会试的资格。\n"
	HuiShiZhuNPC.KeJuProfile = HuiShiZhuNPC.KeJuProfile .. "会试每周".. HuiShiZhuNPC.weekMsgMap[tonumber(HuiShiZhuNPC.activityData1.Time)] .. HuiShiZhuNPC.activityData1.TimeStart .."点开始到" .. HuiShiZhuNPC.activityData1.TimeEnd .."结束。参加会试可获得会试礼包，前".. Act_HuiShi.preRankingNum .."名可获得参加殿试的资格。\n"
	HuiShiZhuNPC.KeJuProfile = HuiShiZhuNPC.KeJuProfile .. "殿试每周" .. HuiShiZhuNPC.weekMsgMap[tonumber(HuiShiZhuNPC.activityData2.Time)] .. HuiShiZhuNPC.activityData2.TimeStart .."点开始到" .. HuiShiZhuNPC.activityData2.TimeEnd .. "点结束。参加殿试可获得殿试礼包，前三名可获得特殊奖励与称号。"

	HuiShiZhuNPC.HuiShiProfile = "乡试只要任何一天的" .. Act_XiangShi.maxAnswerNum .. "道题答对" .. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum .. "道及以上，即可参加本周的会试。\n"
	HuiShiZhuNPC.HuiShiProfile = HuiShiZhuNPC.HuiShiProfile .. "会试每周".. HuiShiZhuNPC.weekMsgMap[tonumber(HuiShiZhuNPC.activityData1.Time)] .. HuiShiZhuNPC.activityData1.TimeStart .."点开始到" .. HuiShiZhuNPC.activityData1.TimeEnd .."结束。参加会试可获得会试礼包，前".. Act_HuiShi.preRankingNum .."名可获得参加殿试的资格。"

	HuiShiZhuNPC.weekErr = "会试每周".. HuiShiZhuNPC.weekMsgMap[tonumber(HuiShiZhuNPC.activityData1.Time)] .. HuiShiZhuNPC.activityData1.TimeStart .."点开始到" .. HuiShiZhuNPC.activityData1.TimeEnd .."结束。"
	HuiShiZhuNPC.notQualified = '你还没有会试资格，别来捣乱！'
	HuiShiZhuNPC.ltMinLevel = "达到"..HuiShiZhuNPC.activityData1.LevelMin.."级才能参加"
	HuiShiZhuNPC.answerOver = '今日会试已答完'.. Act_HuiShi.maxAnswerNum ..'道题'
end
HuiShiZhuNPC.Initialization()