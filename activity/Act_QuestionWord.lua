--世界答题活动脚本
Act_QuestionWord = {}
Act_QuestionWord.starting = false
Act_QuestionWord.Times = nil
Act_QuestionWord.Config = {
	['answer_time'] = 60, 						--回答问题限时（秒）
	['wait_time_min'] = 60,						--提问最小间隔时间（分）
	['wait_time_max'] = 100,					--提问最大间隔时间（分）
	['awardnum'] = 10,							--发奖励的人数
	['max_count'] = 5,							--每人每天最大参与次数
	['lucky_count'] = 20,						--发奖励名单中幸运奖励人数
	['award'] = {
		['first'] = {"世界答题礼包1", 1, 0},	--首位答题奖励
		['lucky'] = {"世界答题礼包2", 1, 0},	--幸运奖励
		['normal'] = {"世界答题礼包3", 1, 0},	--其他普通奖励
	},
}
Act_QuestionWord.ShowItem = "26301,26302,26303"

-- 答案个数
local answer_count = 4
-- 世界答题活动ID
local activityId = 42
-- 世界频道
local channel_world = 8
-- 发言间隔
local speak_second = 20

Act_QuestionWord.rank_type = 60
-- 活动开始前回调
function Act_QuestionWord.OnDeclare(id, seconds)
    
end

-- 活动开始回调
function Act_QuestionWord.OnStart(id, is_normal)
	if RankingListSystem.Config then
		Act_QuestionWord.rank_type = RankingListSystem.Config['世界答题排行榜']
	else
		sLuaApp:LuaDbg("Act_QuestionWord.OnStart RankingListSystem.Config is nil ")
		return
	end
	local time = Act_QuestionWord.random_wait_time() * 60 * 1000
	Act_QuestionWord.Times = sLuaTimerSystem:AddTimerEx(sSystem, time, 1, "Act_QuestionWord.start", "")

	sVarSystem:SetInt("World_Question_Times",tonumber(Act_QuestionWord.Times))
	--sLuaApp:LuaDbg("Act_QuestionWord.Times.........."..Act_QuestionWord.Times)
	--sLuaTimerSystem:AddTimerEx(sSystem, 60 * 1000, 1, "Act_QuestionWord.start", tostring(id))
end

-- 活动结束回调
function Act_QuestionWord.OnStop(id)
	local Times = sVarSystem:GetInt("World_Question_Times")
	if Times then
		sLuaTimerSystem:DisableTimer(Times)
	end
end

-- 玩家点击参与活动回调
function Act_QuestionWord.OnJoin(id, player)
	sLuaApp:NotifyTipsMsg(player, "活动期间，请留心唐王不定时在世界频道的提问。")
end

-- 玩家客户端查询数据回调
function Act_QuestionWord.OnQuery(id, player)
	local count = sVarSystem:GetDayInt(tostring(player:GetGUID()).."_count")
	local str = ""..count..":"..Act_QuestionWord.Config['max_count']..":0:0:"..Act_QuestionWord.ShowItem..":1:"..ActivitySystem.Act_GetClassify("Act_QuestionWord")
	return str
end

function Act_QuestionWord.on_system_start()

end

function Act_QuestionWord.start(para, activity_id)
	local Times = sVarSystem:GetInt("World_Question_Times")

	if Times then
		if sLuaTimerSystem:HasTimer(Times) then
--[[			if not Act_QuestionWord.Times then
				Act_QuestionWord.Times = Times
			end]]
			--sLuaApp:LuaDbg("start1")
		else

			--sLuaApp:LuaDbg("false")
			return
		end
	else

		return
	end
	if Act_QuestionWord.starting then
		return
	else
		--sLuaApp:LuaDbg("start2")
	end
	activity_id = tonumber(activity_id) or activityId
	sRanklistSystem:ClearRanklist(Act_QuestionWord.rank_type)--清空排行榜
	local tb_id = sQuestionSystem:PickQuestions(0, 1, false)
	if  #tb_id < 1 then
		sLuaApp:LuaDbg("Act_QuestionWord.main #tb_id < 1 ")
		return
	end
	--sLuaApp:LuaDbg("Act_QuestionWord.main tb_id[1] = "..tb_id[1])
	local tb = QuestionWorldConfig.GetById(tb_id[1])
	if not tb then
		sLuaApp:LuaDbg("Act_QuestionWord.main tb is nil")
		return
	end
	--sLuaApp:LuaDbg("no return")
	sTriggerSystem:AddTrigger(sSystem, TRIGGER_ON_ANSWER_WORLD_QUESTION , "Act_QuestionWord", "on_answer_world_question")
	sQuestionSystem:StartQuestion(0, tb['Id']);
	sVarSystem:SetString("QuestionWord_Ask", tb['Ask'])
	local question = sVarSystem:GetString("QuestionWord_Ask")
	local answer = ""
	for i = 1, answer_count do
		answer = answer .. tb['Answer'..i]..","
	end
	sVarSystem:SetString("QuestionWord_Answer", answer)

	sLuaApp:SetChannelInterval(channel_world, speak_second)
	sLuaApp:SetChannelVp(channel_world, 0)

	local times = Act_QuestionWord.Config['answer_time']
	-- WorldQuestionUI.ShowBoxMsg("]]..times..[[")
	local activityData = ActivityConfig.GetById(activity_id)
	local min_level = tostring(activityData.LevelMin)
	local str = [[
		local lev = tonumber(CL.GetIntAttr(RoleAttr.RoleAttrLevel))
		if lev >= ]]..min_level..[[ then
			if ChatUI then
				ChatUI.SetChatScroll(false)
				ChatUI.WorldQuestion('唐王遇到一些难题，请得知答案的少侠发送在世界频道，唐王将会给予回答正确答案的玩家奖励。此次的题目是：<color=#ffffffff>]]..question..[[</color>')
			end
			GUI.OpenWnd("WorldQuestionUI","]]..question..[[")
			if WorldQuestionUI then
				WorldQuestionUI.Refresh("]]..question..[[","]]..tb['Answer1']..[[",]]..times..[[)
			end
		end
	]]
	sLuaApp:LuaDbg("发送题目表单")
	sLuaApp:ShowFormToAll("脚本表单", str)
	--sLuaApp:LuaDbg("showForm")

	sLuaTimerSystem:AddTimerEx(sSystem, Act_QuestionWord.Config['answer_time'] * 1000, 1, "Act_QuestionWord.close", tostring(activity_id))
	Act_QuestionWord.starting = true
end

function Act_QuestionWord.close(para, activity_id)
	sLuaApp:SetChannelInterval(channel_world, 0)
	sLuaApp:SetChannelVp(channel_world, 0)

	activity_id = tonumber(activity_id) or activityId
	sTriggerSystem:DelTrigger(sSystem, TRIGGER_ON_ANSWER_WORLD_QUESTION , "Act_QuestionWord", "on_answer_world_question")
	sQuestionSystem:StopQuestion(0);
	local answer = sVarSystem:GetString("QuestionWord_Answer")
	local str_tb = sLuaApp:StrSplit(answer, ",")
	local str = "唐王见无人知晓答案，挑灯夜读方知 <color=#ffffffff>"..str_tb[1].."</color> 为此题正解，果然人生有涯而学海无涯!"
	local rankList = sRanklistSystem:GetRanklist(Act_QuestionWord.rank_type, 1, Act_QuestionWord.Config['awardnum'])
	if #rankList > 0 then
		Act_QuestionWord.give_award(rankList, activity_id)
		str = "根据各位少侠的提醒方知 <color=#ffffffff>"..str_tb[1].."</color> 为此题的答案。第一名： <color=#ffffffff>"..sVarSystem:GetString("FirstQuestionWordAnswer").."</color> 以最快的速度解答了唐王心中的疑问，特此奖励！"
	end
	local activityData = ActivityConfig.GetById(activity_id)
	local min_level = activityData.LevelMin
	local form_str = [[
		local lev = tonumber(CL.GetIntAttr(RoleAttr.RoleAttrLevel))
		if lev >= ]]..min_level..[[ then
			ChatUI.WorldQuestion(']]..str..[[')
		end
	]]
	sLuaApp:ShowFormToAll("脚本表单", form_str)
	sVarSystem:SetString("FirstQuestionWordAnswer","")
	-- Act_QuestionWord.random_wait_time()*60*1000
	local time = Act_QuestionWord.random_wait_time() * 60 * 1000
	Act_QuestionWord.Times = sLuaTimerSystem:AddTimerEx(sSystem, time, 1, "Act_QuestionWord.start", "")
	sVarSystem:SetInt("World_Question_Times",tonumber(Act_QuestionWord.Times))
	Act_QuestionWord.starting = false
end


function Act_QuestionWord.on_answer_world_question(player, question_id, answer)
	answer = tostring(answer)
	if sVarSystem:GetString("FirstQuestionWordAnswer") == "" then
		sVarSystem:SetString("FirstQuestionWordAnswer",player:GetName())
	end

	sRanklistSystem:UpdateRanklist(Act_QuestionWord.rank_type, player:GetGUID(), 1, "", "")

	local ans = tostring(sVarSystem:GetString("QuestionWord_Answer"))
	local ans_tb = sLuaApp:StrSplit(ans, ",")
	for i = 1, #ans_tb do
		if ans_tb[i] == answer then
			local str = [[
				if WorldQuestionUI then
					WorldQuestionUI.ShowAnswerImg()
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			break
		end
	end

end

function Act_QuestionWord.random_wait_time()
	return math.random(Act_QuestionWord.Config['wait_time_min'] or 30,Act_QuestionWord.Config['wait_time_max'] or 60)
end

function Act_QuestionWord.give_award(rankList, activity_id)
	activity_id = tonumber(activity_id) or activityId

	if not Act_QuestionWord.give_award_first(rankList, activity_id) then
		sLuaApp:LuaDbg("Act_QuestionWord.give_award_first is fail")
	end

	if not Act_QuestionWord.give_award_lucky(rankList, activity_id) then
		sLuaApp:LuaDbg("Act_QuestionWord.give_award_lucky is fail")
	end

	if not Act_QuestionWord.give_award_all(rankList, activity_id) then
		sLuaApp:LuaDbg("Act_QuestionWord.give_award_all is fail")
	end
end

-- 发放第一名奖励
function Act_QuestionWord.give_award_first(rankList, activity_id)
	local activityData = ActivityConfig.GetById(tonumber(activity_id))
	local min_level = tonumber(activityData.LevelMin)
	local reward = Act_QuestionWord.Config['award']['first']

	local player_guid, player, count = nil, nil, nil
	local index = 0
	for k, v in pairs(rankList) do
		player_guid = v[1]
		player = sPlayerSystem:GetPlayerByGUID(player_guid)
		count = sVarSystem:GetDayInt(tostring(player_guid).."_count")
		local max_count = Act_QuestionWord.Config['max_count']
		if tonumber(count) < max_count then
			index = k
			table.remove(rankList, k)
			break
		end
	end

	if index ~= 0 then
		if player then
			local level = player:GetAttr(ROLE_ATTR_LEVEL)
			if tonumber(level) >= min_level then
				local str = "恭喜您在世界答题中获得第一名！"
				if not Lua_tools.AddItem(player, reward, "Act_QuestionWord", "Act_QuestionWord", str) then
					sLuaApp:LuaDbg("Act_QuestionWord.give_award_first AddItem is fail")
					return false
				end
			end
		else
			local level = sContactSystem:GetContactLevel(player_guid)
			if tonumber(level) >= min_level then
				local str = "恭喜您在世界答题中获得第一名！"
				local tb_goods = {
					['ItemList'] = { reward }
				}
				Lua_tools.SendItemMail(player_guid, tb_goods , "系统", "世界答题", str)
			end
		end
		sVarSystem:SetDayInt(tostring(player_guid).."_count", count + 1, 0)
	else
		sLuaApp:LuaDbg("所有参与答题的玩家的答题次数都已达到指定次数，不发放首次答题奖励")
		return false
	end
	return true
end

-- 发放幸运奖励
function Act_QuestionWord.give_award_lucky(rankList, activity_id)
	local activityData = ActivityConfig.GetById(tonumber(activity_id))
	local min_level = tonumber(activityData.LevelMin)
	local reward = Act_QuestionWord.Config['award']['lucky']

	local n = Act_QuestionWord.Config['lucky_count']

	for i = 1, n do
		if #rankList < 1 then
			break
		end
		local index = math.random(#rankList)
		local player_guid = rankList[index][1]
		local player = sPlayerSystem:GetPlayerByGUID(player_guid)

		local count = sVarSystem:GetDayInt(tostring(player_guid).."_count")
		local max_count = Act_QuestionWord.Config['max_count']
		if tonumber(count) >= tonumber(max_count) then
			local msg = "您太有才了，但是还是把机会留给别人吧。（每天仅可获得"..max_count.."次奖励）"
			sLuaApp:NotifyTipsMsg(player, msg)
		else
			if player_guid then
				if player then
					local level = player:GetAttr(ROLE_ATTR_LEVEL)
					if tonumber(level) >= min_level then
						local str = "恭喜您，成为本次答题的幸运玩家！"
						if not Lua_tools.AddItem(player, reward, "Act_QuestionWord", "Act_QuestionWord", str) then
							sLuaApp:LuaDbg("Act_QuestionWord.give_award_first AddItem is fail")
							return false
						end
					end
				else
					local level = sContactSystem:GetContactLevel(player_guid)
					if tonumber(level) >= min_level then
						local str = "恭喜您，成为本次答题的幸运玩家！"
						local tb_goods = {
							['ItemList'] = { reward }
						}
						Lua_tools.SendItemMail(player_guid, tb_goods , "系统", "世界答题", str)
					end
				end
			else
				sLuaApp:LuaDbg("所有参与答题的玩家的答题次数都已达到指定次数，不发放首次答题奖励")
				return false
			end
			sVarSystem:SetDayInt(tostring(player_guid).."_count", count + 1, 0)
		end

		table.remove(rankList, index)
	end

	return true
end

-- 发放普通奖励
function Act_QuestionWord.give_award_all(rankList, activity_id)
	local activityData = ActivityConfig.GetById(tonumber(activity_id))
	local min_level = tonumber(activityData.LevelMin)
	local reward = Act_QuestionWord.Config['award']['normal']
	for k,v in ipairs(rankList) do
		local player_guid = v[1]
		local player = sPlayerSystem:GetPlayerByGUID(player_guid)
		local max_count = Act_QuestionWord.Config['max_count']
		local count = sVarSystem:GetDayInt(tostring(player_guid).."_count")
		if count >= max_count then
			local msg = "您太有才了，但是还是把机会留给别人吧。（每天仅可获得"..max_count.."次奖励）"
			sLuaApp:NotifyTipsMsg(player, msg)
		else
			if player then
				local level = player:GetAttr(ROLE_ATTR_LEVEL)
				if tonumber(level) >= min_level then
					if not Lua_tools.AddItem(player, reward, "Act_QuestionWord", "Act_QuestionWord", str) then
						sLuaApp:LuaDbg("Act_QuestionWord.give_award_first AddItem is fail")
						return false
					end
				end
			else
				local level = sContactSystem:GetContactLevel(player_guid)
				if tonumber(level) >= min_level then
					local str = "恭喜您在世界答题中回答正确！"
					local tb_goods = {
						['ItemList'] = { reward }
					}
					Lua_tools.SendItemMail(player_guid, tb_goods , "系统", "世界答题", str)
				end

			end
			sVarSystem:SetDayInt(tostring(player_guid).."_count", count + 1, 0)
		end
	end
	return true
end



