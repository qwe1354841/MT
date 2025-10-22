--季票任务执行
SeasonPassQuestFunc = {}

--通用函数, 在对应任务完成一次时更新总完成数
function SeasonPassQuestFunc.UpdateQuestProgress(player, Quest_Id)
	--sLuaApp:LuaErr("SeasonPassQuestFunc.UpdateQuestProgress")
	Quest_Id = tonumber(Quest_Id)
	if not player or not Quest_Id then
		sLuaApp:LuaErr("没有player或Quest_Id")
		return ""
	end
	local QuestInfo = SeasonPass.QuestIdList[tostring(Quest_Id)]
	if not QuestInfo then
		sLuaApp:LuaErr("没有QuestInfo")
		return false
	end
	local CurCount = 0
	if QuestInfo.Type == "DailyQuest" then
		CurCount = player:GetDayInt("SeasonPassQuest_"..Quest_Id) + 1
		player:SetDayInt("SeasonPassQuest_"..Quest_Id, CurCount)
	elseif QuestInfo.Type == "WeeklyQuest" then
		CurCount = player:GetWeekInt("SeasonPassQuest_"..Quest_Id) + 1
		player:SetWeekInt("SeasonPassQuest_"..Quest_Id, CurCount)
	elseif QuestInfo.Type == "OnceQuest" then
		CurCount = player:GetInt("SeasonPassQuest_"..Quest_Id) + 1
		player:SetInt("SeasonPassQuest_"..Quest_Id, CurCount)
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--获取每日在线时长
function SeasonPassQuestFunc.GetTodayOnlineSec(player)
	if not player then
		return ""
	end
	local sec = Lua_tools.GetTodayOnlineSec(player)
	player:SetDayInt("SeasonPassQuest_1", sec)
	return sec
end

--每日乡试, 会试, 殿试
function SeasonPassQuestFunc.Exam(player)
	require("activity/Act_XiangShi")
	require("activity/Act_HuiShi")
	require("activity/Act_DianShi")
	local FinishCount = 0
	if player:GetDayInt("XiangShiAllAnswersCount") >= Act_XiangShi.maxAnswerNum then
		FinishCount = FinishCount + 1
	elseif player:GetDayInt("HuiShiAllAnswersCount") >= Act_HuiShi.maxAnswerNum then
		FinishCount = FinishCount + 1
	elseif player:GetDayInt("DianShiAllAnswersCount") >= Act_DianShi.maxAnswerNum then
		FinishCount = FinishCount + 1
	end
	player:SetDayInt("SeasonPassQuest_3", FinishCount)
	if FinishCount >= 1 then
		SeasonPass.SeasonPassRedPointRefresh(player)
	end
end

--每日西游奇缘
function SeasonPassQuestFunc.XiYouQiYuan(player)
	require("activity/Act_XiYouQiYuan")
	local FinishCount = player:GetDayInt("XiYouQiYuan_DayCount")
	player:SetDayInt("SeasonPassQuest_2", FinishCount)
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--活力值消耗
function SeasonPassQuestFunc.VitalityCost(player, Num)
	Num = tonumber(Num)
	if not player or not Num then
		return
	end
	local DayCost = player:GetDayInt("SeasonPassQuest_6") + Num
	local WeekCost = player:GetWeekInt("SeasonPassQuest_52") + Num
	player:SetDayInt("SeasonPassQuest_6", DayCost)
	player:SetWeekInt("SeasonPassQuest_52", WeekCost)
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--从每日任务中获取银元宝
function SeasonPassQuestFunc.GetTodayIngot(player, num)
	if not player or not num then
		return
	end
	if SeasonPass.QuestIdList and SeasonPass.QuestIdList["4"] then
		local QuestInfo = SeasonPass.QuestIdList["4"]
		local QuestType = QuestInfo.Type
		local CurCount = 0
		if QuestType == "DailyQuest" then
			CurCount = player:GetDayInt("SeasonPassQuest_4")
			player:SetDayInt("SeasonPassQuest_4", CurCount + num)
		elseif QuestType == "WeeklyQuest" then
			CurCount = player:GetWeekInt("SeasonPassQuest_4")
			player:SetWeekInt("SeasonPassQuest_4", CurCount + num)
		elseif QuestType == "OnceQuest" then
			CurCount = player:GetInt("SeasonPassQuest_4")
			player:SetInt("SeasonPassQuest_4", CurCount + num)
		end
		if CurCount + num >= QuestInfo.Count then
			SeasonPass.SeasonPassRedPointRefresh(player)
		end
	end
end

--获取金元宝
function SeasonPassQuestFunc.on_add_ingot(player, num, sender, reason, detail)
	if not player or not num then
		return
	end
	if SeasonPass.QuestIdList and SeasonPass.QuestIdList["21"] then
		local QuestInfo = SeasonPass.QuestIdList["21"]
		local QuestType = QuestInfo.Type
		local CurCount = 0
		if QuestType == "DailyQuest" then
			CurCount = player:GetDayInt("SeasonPassQuest_21")
			player:SetDayInt("SeasonPassQuest_21", CurCount + num)
		elseif QuestType == "WeeklyQuest" then
			CurCount = player:GetWeekInt("SeasonPassQuest_21")
			player:SetWeekInt("SeasonPassQuest_21", CurCount + num)
		elseif QuestType == "OnceQuest" then
			CurCount = player:GetInt("SeasonPassQuest_21")
			player:SetInt("SeasonPassQuest_21", CurCount + num)
		end
		if CurCount + num >= QuestInfo.Count then
			SeasonPass.SeasonPassRedPointRefresh(player)
		end
	end
end

--降妖任务
--function SeasonPassQuestFunc.Act_XiaoGui(player)
--	require("activity/Act_XiaoGui")
--	local FinishCount = tonumber(sQuestSystem:GetRingDay(player,10)) or 0
--	player:SetDayInt("SeasonPassQuest_7", FinishCount)
--end

--祈福次数
function SeasonPassQuestFunc.PrayCount(player, Quest_Id, Count)
	if not (player and Quest_Id and tonumber(Quest_Id) and Count and tonumber(Count)) then
		return
	end
	if SeasonPass.QuestIdList and SeasonPass.QuestIdList[tostring(Quest_Id)] then
		local QuestInfo = SeasonPass.QuestIdList[tostring(Quest_Id)]
		local QuestType = QuestInfo.Type
		local CurCount = 0
		if QuestType == "DailyQuest" then
			CurCount = player:GetDayInt("SeasonPassQuest_"..Quest_Id)
			player:SetDayInt("SeasonPassQuest_"..Quest_Id, CurCount + Count)
		elseif QuestType == "WeeklyQuest" then
			CurCount = player:GetWeekInt("SeasonPassQuest_"..Quest_Id)
			player:SetWeekInt("SeasonPassQuest_"..Quest_Id, CurCount + Count)
		elseif QuestType == "OnceQuest" then
			CurCount = player:GetInt("SeasonPassQuest_"..Quest_Id)
			player:SetInt("SeasonPassQuest_"..Quest_Id, CurCount + Count)
		end
		if CurCount + Count >= QuestInfo.Count then
			SeasonPass.SeasonPassRedPointRefresh(player)
		end
	end
end

--无尽试炼
function SeasonPassQuestFunc.ShiLian(player)
	local QuestInfo = SeasonPass.QuestIdList and SeasonPass.QuestIdList["51"]
	if not QuestInfo then
		sLuaApp:LuaErr("没有QuestInfo, 配置文件有误")
		return false
	end
	local CurCount = 0
	if QuestInfo.Type == "DailyQuest" then
		CurCount = player:GetDayInt("SeasonPassQuest_51") + 1
		player:SetDayInt("SeasonPassQuest_51", CurCount)
	elseif QuestInfo.Type == "WeeklyQuest" then
		CurCount = player:GetWeekInt("SeasonPassQuest_51") + 1
		player:SetWeekInt("SeasonPassQuest_51", CurCount)
	elseif QuestInfo.Type == "OnceQuest" then
		CurCount = player:GetInt("SeasonPassQuest_51") + 1
		player:SetInt("SeasonPassQuest_51", CurCount)
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--每周副本秘境
function SeasonPassQuestFunc.Dungeon(player, DungeonType)
	DungeonType = tostring(DungeonType)
	if not player or not DungeonType then
		return
	end
	if DungeonType == "Rift" then
		local WeekCount = player:GetWeekInt("SeasonPassQuest_54") + 1
		player:SetWeekInt("SeasonPassQuest_54", WeekCount)
	elseif DungeonType == "Raid" then
		local WeekCount = player:GetWeekInt("SeasonPassQuest_53") + 1
		player:SetWeekInt("SeasonPassQuest_53", WeekCount)
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--每周获取活跃值
function SeasonPassQuestFunc.AddActiveVal(player, val)
	val = tonumber(val)
	if not player or not val then
		return
	end
	local ActiveVal = player:GetWeekInt('SeasonPassQuest_56') + val
	player:SetWeekInt("SeasonPassQuest_56", ActiveVal)
	SeasonPass.SeasonPassRedPointRefresh(player)
end

--消耗Money
function SeasonPassQuestFunc.SpendMoney(player, MoneyType, Num)
	MoneyType = tonumber(MoneyType)
	Num = tonumber(Num)
	if not player or not MoneyType or not Num then
		return false
	end
	local str = ""
	if MoneyType == 1 then
		str = "105"
	elseif MoneyType == 2 then
		str = "106"
	elseif MoneyType == 5 then
		str = "103"
	end
	local QuestInfo = SeasonPass.QuestIdList and SeasonPass.QuestIdList[str]
	if not QuestInfo then
		sLuaApp:LuaErr("没有QuestInfo, 配置文件有误")
		return false
	end
	local CurCount = 0
	if QuestInfo.Type == "DailyQuest" then
		CurCount = player:GetDayInt("SeasonPassQuest_"..str) + Num
		player:SetDayInt("SeasonPassQuest_"..str, CurCount)
	elseif QuestInfo.Type == "WeeklyQuest" then
		CurCount = player:GetWeekInt("SeasonPassQuest_"..str) + Num
		player:SetWeekInt("SeasonPassQuest_"..str, CurCount)
	elseif QuestInfo.Type == "OnceQuest" then
		CurCount = player:GetInt("SeasonPassQuest_"..str) + Num
		player:SetInt("SeasonPassQuest_"..str, CurCount)
	end
	SeasonPass.SeasonPassRedPointRefresh(player)
	return true
end
