--会试NPC
HuiShiNPC = {}



-- 我要参加会试
function HuiShiNPC.option1(npc, player, content)
	-- sLuaApp:LuaDbg("当前考官GUID=="..npc:GetGUID())
	-- 活动开启状态
	if not sLuaApp:IsActivityRunning(sVarSystem:GetInt("ACTIVITY_HuiShi_Id")) then
		return HuiShiZhuNPC.weekErr
	end

	local team = player:GetTeam()
    if team then
        return "科举是单人活动，无法组队参加"
    end

	-- 小于指定等级
	if player:GetAttr(ROLE_ATTR_LEVEL) < tonumber(HuiShiNPC.activityData1.LevelMin) then
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
	
	if player:GetDayInt("HuiShiAllAnswersCount") == 0 then
		player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
		Act_HuiShi.OpenForm(player)
	else
		--sLuaApp:LuaDbg(npc:GetId() .."    " .. player:GetDayInt("HuiShiNextKaoGuanID"))
		if npc:GetId() == player:GetDayInt("HuiShiNextKaoGuanID") then
			player:SetDayString("HuiShiCurrentKaoGuanGUID",tostring(npc:GetGUID()))
			Act_HuiShi.OpenForm(player)
			player:SetInt("HuiShi_LastNPC", npc:GetId())
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
function HuiShiNPC.option2(npc, player, content)
	return HuiShiZhuNPC.HuiShiProfile
end
-- 检查是否拥有会试资格
function HuiShiNPC.option4(npc, player, content)
	if player:GetInt("XiangShiToHuiShi") == 1 then
		return "拥有了会试资格"
	end
	return "你还没有会试资格，别来捣乱！"
end

-- 给会试资格并给道具
function HuiShiNPC.option5(npc, player, content)
	sLuaApp:NotifyTipsMsg(player, "获得会试资格")
	player:SetWeekInt("XiangShiToHuiShi",1)
	player:SetInt("HuiShiSystemAnsWerNum", player:GetInt("HuiShiSystemAnsWerNum") + 30)
	player:SetInt("HuiShiSystemTipNum", player:GetInt("HuiShiSystemTipNum") + 30)
	player:SetInt("HuiShiSystemChangeQuestionsNum", player:GetInt("HuiShiSystemChangeQuestionsNum") + 30)
	return ""
end

-- 花钱直接传送
function HuiShiNPC.option6(npc, player, content)
	local nextKaoGuanNPCGUID = player:GetDayInt("HuiShiNextKaoGuanGUID")
	local nextKaoGuanNPC = sNpcSystem:GetNpcByGUID(nextKaoGuanNPCGUID)
	if not nextKaoGuanNPC then
		local NPCID = player:GetDayInt("HuiShiNextKaoGuanID")
		nextKaoGuanNPC = sNpcSystem:GetNpcsById(NPCID)[1]
	end
	if not nextKaoGuanNPC then
		return "传送异常"
	end
	local map = nextKaoGuanNPC:GetMap()
	local posX = sMapSystem:GetPosX(nextKaoGuanNPC)
	local posY = sMapSystem:GetPosY(nextKaoGuanNPC)
	-- 扣钱
	if not Lua_tools.SubMoney(player, Act_HuiShi.jumpMoney.moneyType, Act_HuiShi.jumpMoney.moneyNum, "", "答题传送", "") then
		return "你身上没有".. Act_HuiShi.jumpMoney.moneyNum .. Lua_tools.MoneyNames[Act_HuiShi.jumpMoney.moneyType]   
	end
	
	sMapSystem:Jump(player, map,posX,posY,3)
	sLuaApp:NotifyTipsMsg(player, "传送成功")
	return ""
end




function HuiShiNPC.main(npc, player)

	local answerOver = '今日会试已答完'.. Act_HuiShi.maxAnswerNum ..'道题'

	if player:GetDayInt("HuiShiAllAnswersCount") == 0 then
		-- 暂时写死
		local mapName = '长安城'
		local posX = '383'
		local posY = '229'
		return '请先前往主考官,他在'..mapName..'('..posX..','..posY..')'
	else

		if player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
			return answerOver
		end

		if npc:GetId() == player:GetDayInt("HuiShiNextKaoGuanID") then
			player:AddNpcOption(npc, 0, "继续答题", "option1", "")
			-- player:AddNpcOption(npc, 0, "直接获得会试资格(测试)", "option5", "")
			-- player:AddNpcOption(npc, 0, "检查会试资格(测试)", "option4", "")
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

function HuiShiNPC.Initialization()
	if not Act_XiangShi then
		require("activity/Act_XiangShi")
	end
	if not Act_HuiShi then
		require("activity/Act_HuiShi")
	end
	HuiShiNPC.activityData1 = ActivityConfig.GetById(32)  -- 会试
	HuiShiNPC.activityData2 = ActivityConfig.GetById(33)  -- 殿试

	HuiShiNPC.weekMsgMap = {'一','二','三','四','五','六','日'}
	HuiShiNPC.KeJuProfile = "科举是单人活动，包含：乡试，会试，殿试三部分。\n"
	HuiShiNPC.KeJuProfile = HuiShiNPC.KeJuProfile .. "乡试每周一至周六开启，每天可以参加一次，乡试共计" .. Act_XiangShi.maxAnswerNum .. "道题，答对" .. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum .. "道及以上可获得乡试礼包以及参加本周会试的资格。\n"
	HuiShiNPC.KeJuProfile = HuiShiNPC.KeJuProfile .. "会试每周".. HuiShiNPC.weekMsgMap[tonumber(HuiShiNPC.activityData1.Time)] .. HuiShiNPC.activityData1.TimeStart .."点开始到" .. HuiShiNPC.activityData1.TimeEnd .."结束。参加会试可获得会试礼包，前".. Act_HuiShi.preRankingNum .."名可获得参加殿试的资格。\n"
	HuiShiNPC.KeJuProfile = HuiShiNPC.KeJuProfile .. "殿试每周" .. HuiShiNPC.weekMsgMap[tonumber(HuiShiNPC.activityData2.Time)] .. HuiShiNPC.activityData2.TimeStart .."点开始到" .. HuiShiNPC.activityData2.TimeEnd .. "点结束。参加殿试可获得殿试礼包，前三名可获得特殊奖励与称号。"

	HuiShiNPC.HuiShiProfile = "乡试只要任何一天的" .. Act_XiangShi.maxAnswerNum .. "道题答对" .. Act_XiangShi.XiangShiToHuiShiMinRightAnswerNum .. "道及以上，即可参加本周的会试。\n"
	HuiShiNPC.HuiShiProfile = HuiShiNPC.HuiShiProfile .. "会试每周".. HuiShiNPC.weekMsgMap[tonumber(HuiShiNPC.activityData1.Time)] .. HuiShiNPC.activityData1.TimeStart .."点开始到" .. HuiShiNPC.activityData1.TimeEnd .."结束。参加会试可获得会试礼包，前".. Act_HuiShi.preRankingNum .."名可获得参加殿试的资格。"

	HuiShiNPC.weekErr = "会试每周".. HuiShiNPC.weekMsgMap[tonumber(HuiShiNPC.activityData1.Time)] .. HuiShiNPC.activityData1.TimeStart .."点开始到" .. HuiShiNPC.activityData1.TimeEnd .."结束。"
	HuiShiNPC.notQualified = '你还没有会试资格，别来捣乱！'
	HuiShiNPC.ltMinLevel = "达到"..HuiShiNPC.activityData1.LevelMin.."级才能参加"
	HuiShiNPC.answerOver = '今日已答完'.. Act_HuiShi.maxAnswerNum ..'道题'
end
HuiShiNPC.Initialization()