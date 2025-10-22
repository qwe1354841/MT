--辅助功能
Assist = {}

--无法开始辅助的地图 --副本地图无法开始辅助（除帮派地图）
Assist.NoStartMap = {
	"兰秋广场",
	"鸡王争霸赛",
	"对战地图",
}
--机器人无法进入的地图 即无法发布快速招募的地图
Assist.NoRobotMap = {
	"帮派地图",
	"鸡王争霸赛",
}

--第一次进游戏免费送侠义值
Assist.FreeAssistPoint = 200
--侠义丹
Assist.Dan = "活动辅助丹"

--辅助设置
Assist.Setting = {
	{["Key"] = "UseCloud", ["Tips"] = "在任务中优先使用筋斗云"},
	{["Key"] = "BindIngotToBindGold", ["Tips"] = "银币不足时，使用银元宝兑换银币"},
	{["Key"] = "IngotToBindGold", ["Tips"] = "银币不足时，使用金元宝兑换银币"},
}

-- -key 标识符 -ShowName 客户端显示 -QuestID 任务id -PreQuestID 接取任务的id -ConsumePoint 每次消耗点数
-- -SelectJudgment 选择时判断 -TeamMembers 要求队伍人数 -TeamLevelImpose 0仅需求最低数量的队员等级满足条件 1要求全体队员等级满足条件 -RecruitID 招募时用的活动id  -NoCheckStuck 无需检查玩家卡死
-- SchoolQuestID /SchoolPreQuestID 门派id = 具体任务id配置
Assist.Config = {
	{["Key"]= "师门任务", ["ShowName"] = "师门任务", ["SchoolQuestID"] = {[31] = {33,34,35,37},[32] = {97,98,99,100},[33] = {83,84,85,101},[34] = {87,88,89,90},[35] = {164,165,166,167},[36] = {92,93,94,95},}, ["SchoolPreQuestID"] = {[31] = 31, [32] = 96, [33] = 82, [34] = 86, [35] = 163, [36] = 91},["ConsumePoint"] = 10,},
	{["Key"]= "修业试炼", ["ShowName"] = "修业试炼", ["QuestID"] = {23,24,25,26}, ["PreQuestID"] = 22, ["ConsumePoint"] = 10,},
	{["Key"]= "苦行任务", ["ShowName"] = "苦行任务", ["QuestID"] = {116,117,118,119}, ["PreQuestID"] = 115, ["ConsumePoint"] = 0,},
	{["Key"]= "攻守之道", ["ShowName"] = "攻守之道", ["QuestID"] = {121}, ["PreQuestID"] = 120,["ConsumePoint"] = 30,},
	{["Key"]= "帮派任务", ["ShowName"] = "帮派任务", ["QuestID"] = {74,75,76,77}, ["PreQuestID"] = 72,["ConsumePoint"] = 10, ["SelectJudgment"] = "Guild",},
	{["Key"]= "降妖任务", ["ShowName"] = "降妖任务", ["QuestID"] = {11,12,13,14,16}, ["PreQuestID"] = 10, ["ConsumePoint"] = 0, ["TeamMembers"] = {3,4,5}, ["TeamLevelImpose"] = 0, ["RecruitID"] = 17},
	{["Key"]= "抓鬼任务", ["ShowName"] = "抓鬼任务", ["QuestID"] = {45,46,47,48,49}, ["PreQuestID"] = 44, ["ConsumePoint"] = 0, ["TeamMembers"] = {3,4,5}, ["TeamLevelImpose"] = 0, ["RecruitID"] = 19},
	{["Key"]= "宝图任务", ["ShowName"] = "宝图任务", ["QuestID"] = {71}, ["PreQuestID"] = 70, ["ConsumePoint"] = 10,},
	{["Key"]= "西游奇缘", ["ShowName"] = "西游奇缘", ["ActivityID"] = 75,["ConsumePoint"] = 4, ["NoCheckStuck"] = 1},
}

-- 自动上交宠物星级上限
Assist.HandInPetMaxStar = 1
-- 自动上交宠物等级上限
Assist.HandInPetMaxLevel = 20

--作为队长参与活动获得侠义值 
--实际添加用 与活动表中活动名一致
Assist.ActivityPoint = {
	["挑战神兽"] = 3,
	["闹事的妖怪"] = 1,
	["小鬼任务"] = 3,
	["帮派强盗（午）"] = 1,
	["帮派强盗（晚）"] = 1,
	["十二星官"] = 2,
	["副本"] = {1,3},
	["修罗任务"] = 3,
	["门派历练"] = 3,
}
-- 只做显示用
Assist.ActivityPointShow = {
	["挑战神兽"] = "3",
	["闹事的妖怪"] = "1",
	["降妖"] = "3",
	["帮派强盗"] = "1",
	["十二星官"] = "2",
	["副本"] = "1-3",
	["伏魔"] = "3",
	["门派试炼"] = "3",
}


function Assist.GetData(player)
	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	local show_data = {}
	for _,v in ipairs(Assist.Config) do
		while v do
			--等级不足不显示
			local accept_level = v["AcceptLevel"]
			if player_level < accept_level then
				break
			end
			--没有帮派不显示
			local select_judgment = v["SelectJudgment"]
			if select_judgment then
				if select_judgment == "Guild" then
					if not player:GetGuild() then
						break
					end
				end
			end
			--任务没开始不显示
			local act_id = v["ActivityID"]
			if act_id then
				if not sLuaApp:IsActivityRunning(act_id) then
					break
				end
			end
		
			local show_config  = {}
			local quest_key = v["Key"]
			show_config["Key"] = quest_key
			show_config["ShowName"] = v["ShowName"]
			show_config["ConsumePoint"] = v["ConsumePoint"]
			show_config["IsSelect"] = player:GetInt("Assist_Selection_" .. quest_key)
			local selection_status = player:GetInt("Assist_SelectionStatus_"..quest_key)
			
			--已完成状态的任务 判断现在的状态  --中止的任务 不判断是否置为未开始状态 贺振坤说的
			if v["ActivityID"] then
					--sLuaApp:LuaErr("Assist.GetActivityIsFinish[quest_key](player) "..tostring(Assist.GetActivityIsFinish[quest_key](player)))
				if Assist.GetActivityIsFinish[quest_key](player) then
					selection_status = 2
				else
					selection_status = 1
				end
			else
				if selection_status == 1 or selection_status == 2 then
					local is_change = false
					--任务
					local quest_id_tb = v["QuestID"]
					if not quest_id_tb then
						local job = player:GetAttr(ROLE_ATTR_JOB_1)
						quest_id_tb = v["SchoolQuestID"][job]
					end
					
					for _,b in ipairs(quest_id_tb) do
						local quest_state = sQuestSystem:GetQuestState(player, b)
						if quest_state == 1 or quest_state == 2 or quest_state == 3 or quest_state == 4 then
							selection_status = 1
							is_change = true
							break
						end
					end
					--if selection_status == 2 then
					if not is_change then 
						local pre_quest_id = v["PreQuestID"]
						if v["SchoolPreQuestID"] then
							local job = player:GetAttr(ROLE_ATTR_JOB_1)
							pre_quest_id = v["SchoolPreQuestID"][job] and v["SchoolPreQuestID"][job] or -1
						end
						if pre_quest_id and pre_quest_id ~= -1 then
							local pre_quest_state = sQuestSystem:GetQuestState(player, pre_quest_id)
							if pre_quest_state == 1 or pre_quest_state == 2 or pre_quest_state == 3 or pre_quest_state == 4 then
								selection_status = 1
							else
								selection_status = 2
							end
						end
					end
					--end
					--sLuaApp:LuaErr("quest_key "..quest_key.." selection_status "..selection_status)
				end
			end
			
			if selection_status == 0 then
				selection_status = 1
			end
			player:SetInt("Assist_SelectionStatus_"..quest_key, selection_status)
			
			show_config["SelectionStatus"] = selection_status
			table.insert(show_data, show_config)
	
			break
		end
	end

	local str = [[
		if PlugSystemUI then
			PlugSystemUI.ActivityDataConfig = ]]..Lua_tools.serialize(show_data)..[[
			PlugSystemUI.ActivityPointConfig = ]]..Assist.ActivityPointShowStr..[[
			PlugSystemUI.Dan = "]]..Assist.Dan..[["
			PlugSystemUI.IsGoOn = ]]..player:GetInt("Assist_GoOn")..[[
			PlugSystemUI.RefreshActivityData()
		end
	]]
	
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr("str"..str)
end

--刷新单个任务状态
function Assist.RefreshSelectionStatus(player, quest_key)
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	for k,v in ipairs(Assist.Config) do
		if v["Key"] == quest_key then
			local str = [[
				if PlugSystemUI then
					PlugSystemUI.RefreshOnceStatus("]]..quest_key..[[",]]..player:GetInt("Assist_SelectionStatus_"..quest_key)..[[)
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			break
		end
	end
end

--辅助设置
function Assist.SetAssistSetting(player, setting_str)
	if not setting_str then return end
	local setting_tb = sLuaApp:StrSplit(setting_str,",")
	
	for _,b in ipairs(Assist.Setting) do
		local setting_key = b["Key"]
		player:SetInt("Assist_Setting_"..setting_key, 0)
		for _,v in ipairs(setting_tb) do	
			if v == setting_key then
				player:SetInt("Assist_Setting_"..setting_key, 1)
			end
		end
	end
	sLuaApp:NotifyTipsMsgEx(player, "辅助设置成功！")
	Assist.GetAssistSetting(player)
end
function Assist.GetAssistSetting(player)
	--发Assist.Setting -和已选哪几个
	local setting_tb = {}
	for _,v in ipairs(Assist.Setting) do
		if player:GetInt("Assist_Setting_"..v["Key"]) == 1 then
			table.insert(setting_tb, v["Key"])
		end
	end
	local str = [[
		if PlugSystemUI then
			PlugSystemUI.AssistSettingConfig = ]].. Assist.SettingStr..[[
			PlugSystemUI.SelectedSettingConfig = ]]..Lua_tools.serialize(setting_tb)..[[
			PlugSystemUI.RefreshSettingData()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	--sLuaApp:LuaErr("str"..str)
end


-- 活动获得辅助点
function Assist.ActivityGetPoint(player, act_keyname)
	local point_config = Assist.ActivityPoint[act_keyname]
	if not point_config then return end
	--判断是否队长
	if player:GetTeam() and not player:IsTeamLeader() then
		return	
	end
	if type(point_config) == "table" then
		Assist.AddPoint(player, sLuaApp:RandInteger(point_config[1], point_config[2]))
	else
		Assist.AddPoint(player, point_config)
	end
end

--第一次进游戏免费送侠义值
function Assist.SetFreePoint(player)
	Assist.AddPoint(player, Assist.FreeAssistPoint or 200)
end

--辅助点
function Assist.GetPoint(player)
	return player:GetInt("Assist_AssistPoint")
end
function Assist.SubPoint(player, num)
	local res_point = player:GetInt("Assist_AssistPoint") - tonumber(num)
	player:SetInt("Assist_AssistPoint", res_point >= 0 and res_point or 0)
end
function Assist.AddPoint(player, num)
	player:SetInt("Assist_AssistPoint", player:GetInt("Assist_AssistPoint") + tonumber(num))
end

--判断辅助点数是否够做任务
function Assist.CheckAssistPoint(player, quest_id)
	local need_point = Assist.QuestConsumePoint[quest_id]
	if not need_point then
		sLuaApp:LuaErr("Assist.QuestConsumePoint 不存在"..quest_id)
		return false
	end
	if need_point <= Assist.GetPoint(player) then
		return true
	end
	return false
end
--根据任务id扣除辅助点数
function Assist.SubQuestAssistPoint(player, quest_id)
	if Assist.CheckAssistPoint(player, quest_id) then
		local need_point = Assist.QuestConsumePoint[quest_id]
		Assist.SubPoint(player, need_point)
		return true
	else
		sLuaApp:LuaErr("Assist.SubQuestAssistPoint 扣除辅助点数失败")
	end
	Assist.SendLog(player, "侠义值不足，辅助结束")
	Assist.End(player)
	return false
end

--检查停止辅助
function Assist.CheckEnd(player)
	if player:GetInt("Assist_GoOn") == 1 then
		Assist.End(player)
	end
end

-- 状态
-- 1.未开始，无特殊标识
-- 2.已完成，有绿色完成标识
-- 3.进行中，有黄色进行中标识
-- 4.中止，有红色中止标识

--点击开始辅助  -select_tb_str 选择的任务key
function Assist.Start(player, select_tb_str)
	--sLuaApp:LuaErr("Assist.Start Assist.Start"..select_tb_str)
	local assist_is_go_on = player:GetInt("Assist_GoOn")
	if assist_is_go_on == 1 then
		sLuaApp:NotifyTipsMsgEx(player, "已在辅助中，无法开始辅助")
		return
	end
	
	if not select_tb_str or select_tb_str == "" then return end
	if not Assist.CheckStart(player) then return end
	local select_tb = sLuaApp:StrSplit(select_tb_str,",")
	if not select_tb or not next(select_tb) then return end 
	--清空所有选择状态
	for key in pairs(Assist.ConfigEx) do
		player:SetInt("Assist_Selection_"..key, 0)
		--player:SetInt("Assist_SelectionStatus_"..key, 0)
	end
	
	local player_level = player:GetAttr(ROLE_ATTR_LEVEL)
	local select_num = 0
	for _,v in ipairs(select_tb) do
		local assist_config = Assist.ConfigEx[v]
		while assist_config do
			local select_judgment = assist_config["SelectJudgment"]
			if select_judgment then
				if select_judgment == "Guild" then
					if not player:GetGuild() then
						sLuaApp:NotifyTipsMsg(player, "您未加入帮派，无法进行【" .. assist_config["ShowName"] .. "】")
						player:SetInt("Assist_Selection_"..v, 0)
						player:SetInt("Assist_SelectionStatus_"..v, 0)
						break
					end
				end
			end
			if player_level < assist_config["AcceptLevel"] then
				sLuaApp:NotifyTipsMsg(player, "您的等级不足"..assist_config["AcceptLevel"].."级，无法进行【" .. assist_config["ShowName"] .. "】")
				player:SetInt("Assist_Selection_"..v, 0)
				player:SetInt("Assist_SelectionStatus_"..v, 0)
				break
			end
			local selection_status = player:GetInt("Assist_SelectionStatus_"..v)
			--sLuaApp:LuaErr(v.. "selection_status "..selection_status)
			if selection_status ~= 2 then
				player:SetInt("Assist_Selection_"..v, 1)
				--只把中止状态的任务 转为 未开始
				if selection_status == 3 or selection_status == 4  then
					player:SetInt("Assist_SelectionStatus_"..v, 1)
				end
				select_num = select_num + 1
			end
			break
		end
	end
	if select_num == 0 then
		sLuaApp:NotifyTipsMsgEx(player, "没有符合辅助条件的任务")
		return
	end
	
	player:SetInt("Assist_GoOn", 1)			--设置正在挂机中
	player:SetAutoFight(true) 				--设置自动战斗
	--npc_talk触发  打开商店触发 战斗完触发
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_VISIT_NPC, "Assist", "OnVisitNPC")
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_OPEN_SHOP, "Assist", "OnOpenShop")
	sTriggerSystem:AddTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Assist", "OnFightResult")
	--设置挂机状态
	player:AutoGame(true)
	Assist.SendLog(player, "开始辅助")		--发送日志

	Assist.StartPathfinding(player, false)
	Assist.StartCheckStuck(player)
	
	Assist.GetData(player)
end

function Assist.End(player)
	--进行中状态 改为 不在进行中
	for _,v in ipairs(Assist.Config) do
		local quest_key = v["Key"]
		local selection_status =  player:GetInt("Assist_SelectionStatus_"..quest_key)
		if selection_status == 3 then
			player:SetInt("Assist_SelectionStatus_"..quest_key, 1)
		end
	end
	
	--发送并清空奖励记录
	Assist.SendAndDelRecordReward(player)
	player:SetInt("Assist_NowQuestReward_bmoney", 0)
	player:SetInt("Assist_NowQuestReward_exp", 0)
	
	--设置不在挂机中
	player:AutoGame(false)
	player:SetInt("Assist_GoOn", 0)			
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_VISIT_NPC, "Assist", "OnVisitNPC")
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_OPEN_SHOP, "Assist", "OnOpenShop")
	sTriggerSystem:DelTrigger(player, TRIGGER_ON_FIGHT_RESULT, "Assist", "OnFightResult")
	player:SetString("Assist_NowQuestKey", "")
	player:SetString("Assist_NowQuestShowName", "")
	
	--防卡死相关
	local stuck_timer = player:GetInt("Assist_CheckStuckTimer")
	if sLuaTimerSystem:HasTimer(stuck_timer) then
		if not sLuaTimerSystem:DisableTimer(stuck_timer) then
			sLuaApp:LuaErr("Assist.End  DisableTimer stuck_timer 错误 "..stuck_timer)
		end
	end
	player:SetInt("Assist_CheckStuckTimer", 0)
	player:SetInt("Assist_StuckNum", 0)
	player:SetInt("Assist_RecordPosX", 0)
	player:SetInt("Assist_RecordPosY", 0)
	player:SetInt("Assist_NoCheckStuck", 0)
	
	--定时器
	local fight_quest_timer = player:GetInt("Assist_FightQuestTimer")
	if fight_quest_timer ~= 0 then
		player:SetInt("Assist_FightQuestTimer", 0)
		if sLuaTimerSystem:HasTimer(fight_quest_timer) then
			if not sLuaTimerSystem:DisableTimer(fight_quest_timer) then
				sLuaApp:LuaErr("Assist.End  DisableTimer fight_quest_timer 错误 "..fight_quest_timer)
			end
		end
	end
	
	Assist.SendLog(player, "辅助结束")
	--sLuaApp:NotifyTipsMsgEx(player, "辅助结束")
	Assist.GetData(player)
	
	--停止移动
	local str = [[
		CL.StopMove()
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
end


function Assist.StartPathfinding(player, check_status) -- check_status 是否检查选择任务状态 --开始辅助不需要检查，辅助过程中需要
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	for _,v in ipairs(Assist.Config) do
		local quest_key = v["Key"]
		local is_select = player:GetInt("Assist_Selection_"..quest_key)
		while is_select == 1 do
			if check_status then
				local selection_status =  player:GetInt("Assist_SelectionStatus_"..quest_key)
				--sLuaApp:LuaErr(quest_key.." selection_status "..selection_status)
				if selection_status == 2 or selection_status == 4 then --已完成 or 中止
					break
				end
			end
			
			if player:GetString("Assist_NowQuestKey") ~= quest_key then
				player:SetString("Assist_NowQuestKey", quest_key)
				player:SetString("Assist_NowQuestShowName", v["ShowName"])
			end
			
			--判断SelectJudgment
			local select_judgment = v["SelectJudgment"]
			if select_judgment then
				if select_judgment == "Guild" then
					--帮派任务 没有帮派时不显示  -有队伍时，队伍里有玩家中止任务，否则退出队伍
					if not player:GetGuild() then
						sLuaApp:NotifyTipsMsg(player, "您未加入帮派，无法进行【" .. v["ShowName"] .. "】")
						player:SetInt("Assist_Selection_"..v, 0)
						player:SetInt("Assist_SelectionStatus_"..v, 0)
						Assist.GetData(player)
						break
					end
					local team = player:GetTeam()
					if team then
						local team_members = team:GetTeamMembers(true)
						if #team_members == 1 then
							if sTeamSystem:DestroyTeam(team) ~= 0 then
								sLuaApp:LuaErr("Assist.StartPathfinding DestroyTeam 错误")
							end
						else
							for i = 2, #team_members do
								if team_members[i]:GetType() == GUID_PLAYER then
									Assist.SendLog(player, "您在队伍中，$QuestName$辅助结束！")
									Assist.QuestStop(player)
									return
								end
							end
							if sTeamSystem:DestroyTeam(team) ~= 0 then
								sLuaApp:LuaErr("Assist.StartPathfinding DestroyTeam 错误")
							end
						end
					end
				end
			end
			
			--设置该任务无需检查卡死
			if v["NoCheckStuck"] and v["NoCheckStuck"] == 1 then
				player:SetInt("Assist_NoCheckStuck", 1)
			else
				player:SetInt("Assist_NoCheckStuck", 0)
			end
			
			if v["ActivityID"] then
				--活动辅助
				if Assist.ActivityFunc[quest_key] then
					Assist.ActivityFunc[quest_key](player)
				else
					player:SetInt("Assist_SelectionStatus_"..quest_key, 4)
					Assist.GetData(player)
					sLuaApp:LuaErr("Assist.ActivityFunc 不存在 "..quest_key)
					return
				end
				
			elseif v["QuestID"] or v["SchoolQuestID"] then
				--任务辅助
				local quest_id = -1
				local quest_state = -1
				local quest_id_tb = v["QuestID"]
				if not quest_id_tb then
					local job = player:GetAttr(ROLE_ATTR_JOB_1)
					quest_id_tb = v["SchoolQuestID"][job]
				end
				for _,b in ipairs(quest_id_tb) do
					quest_state = sQuestSystem:GetQuestState(player, b)
					if quest_state ~= 1 and quest_state ~= 8 then
						quest_id = b
						break
					end
				end
				
				local pre_quest_id = v["PreQuestID"] and v["PreQuestID"] or -1
				if v["SchoolPreQuestID"] then
					local job = player:GetAttr(ROLE_ATTR_JOB_1)
					pre_quest_id = v["SchoolPreQuestID"][job] and v["SchoolPreQuestID"][job] or -1
				end
				
				--sLuaApp:LuaErr(quest_id.."  quest_state  "..quest_state.. " pre_quest_id "..pre_quest_id)
				Assist.QuestStateFunc[quest_state](player, quest_key, quest_id, pre_quest_id)
			end

			return
		end
	end
	Assist.End(player)
end


--自动组队
function Assist.AutoTeam(player)
	local quest_key = player:GetString("Assist_NowQuestKey")
	local quest_config = Assist.ConfigEx[quest_key]
	if not quest_config then
		sLuaApp:LuaErr("Assist.AutoTeam  quest_config 不存在  "..quest_key)
		return false
	end
	
	local team_member_config = quest_config["TeamMembers"] 
	if not team_member_config then return true end
	local recruit_id = quest_config["RecruitID"] or 1

	--检查队伍人数是否满足要求
	local team = player:GetTeam()
	if not team then
		Assist.TeamApplyHost(player, recruit_id)--人数不足时 快速招募 + 发组队平台
		return false
	else
		local team_members = team:GetTeamMembers(false)
		local team_members_num = #team_members
		if team_members_num < team_member_config[1] then
			Assist.TeamApplyHost(player, recruit_id)--人数不足时 快速招募 + 发组队平台
			return false
		else
			local accept_level = quest_config["AcceptLevel"]
			if accept_level == 0 then return true end
			local team_level_impose = quest_config["TeamLevelImpose"] or 0
			--判断队伍等级
			--队伍等级不足 但不要求全队等级达标时 判断机器人是否到上限 没到上限快速招募 到上限中止任务
			--队伍等级不足 且需求全队等级达标时 中止任务
			local can_accept_num = 0 --等级达标的人数
			local robot_num = 0
			for _,v in ipairs(team_members) do
				local player_level = v:GetAttr(ROLE_ATTR_LEVEL)
				if player_level >= accept_level then
					can_accept_num = can_accept_num + 1
				end
				if v:GetType() == GUID_ROBOT then
					robot_num = robot_num + 1
				end
			end
			
			if can_accept_num >= team_member_config[1] then
				return true
			else
				if team_level_impose == 0 then
					if robot_num >= (TeamHostConfig.MaxNum or 2) then
						Assist.SendLog(player, "由于队员等级不足，"..quest_key.."已中止")
						player:SetInt("Assist_SelectionStatus_"..quest_key, 4)
						sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
					else
						Assist.TeamApplyHost(player, recruit_id)
					end
					return false
				elseif team_level_impose == 1 then
					Assist.SendLog(player, "由于队员等级不足，"..quest_key.."已中止")
					player:SetInt("Assist_SelectionStatus_"..quest_key, 4)
					sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
					return false
				end
			end	
		end
	end
end

function Assist.TeamApplyHost(player, act_id)
	local now_map = player:GetMap()
	for _,v in ipairs(Assist.NoRobotMap) do
		if now_map:GetKeyName() == v then
			local map = sMapSystem:GetMapByKey("长安城")
			sMapSystem:Jump(player,map,325,201,0)
			break
		end
	end
	
	local act_data = ActivityConfig.GetById(act_id)
	if not act_data then
		sLuaApp:LuaErr("Assist.TeamApplyHost ActivityConfig 不存在 "..act_id)
		return false
	end
	local level_min = act_data.LevelMin
	local level_max = act_data.LevelMax
	if not player:GetTeam() then
		local team = sTeamSystem:CreateTeam(player, act_id, 0, level_min, level_max)
		if not team then
			sLuaApp:LuaErr("Assist.TeamApplyHost CreateTeam 失败")
			return false
		end
	end
	local str = [[
		CL.SendNotify(NOTIFY.TeamOpeUpdate, 11, ]]..act_id..[[, ]]..level_min..[[, ]]..level_max..[[, 0)
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	FormTeam.ApplyHostTeamer(player)
	sLuaTimerSystem:AddTimerEx(player, 4000,1,"Assist.ToStartPathfinding", "")
end

--设置当前选择状态为中止 并重新进入开始任务判断
function Assist.QuestStop(player)
	Assist.SendAndDelRecordReward(player)
	local now_quest_key = player:GetString("Assist_NowQuestKey")
	if now_quest_key ~= "" then
		player:SetInt("Assist_SelectionStatus_"..now_quest_key, 4) --设置中止
		Assist.RefreshSelectionStatus(player, now_quest_key)
		Assist.SendLog(player, "$QuestName$的辅助已中止！")
	end
	sLuaTimerSystem:AddTimerEx(player, 1000,1,"Assist.ToStartPathfinding", "")
end

-- enum quest_state
-- {
    -- quest_state_init = 0,
    -- quest_state_cant_accept,1
    -- quest_state_can_accept,2
    -- quest_state_accepted,3
    -- quest_state_ready,4
    -- quest_state_finished,5
    -- quest_state_failed,6
    -- quest_state_abandoned,7
    -- quest_state_uninit,8
    -- quest_state_max,
-- };

Assist.QuestStateFunc = {
	[1] = function(player, quest_key, quest_id, pre_quest_id) -- 不可接取
		if pre_quest_id and pre_quest_id ~= -1 then
			if not Assist.AutoTeam(player) then return end --检查队伍
			local pre_quest_state = sQuestSystem:GetQuestState(player, pre_quest_id)
			Assist.QuestStateFunc[pre_quest_state](player, quest_key, pre_quest_id)
		else
			Assist.QuestFinsh(player, quest_key)
		end
	end,
	[2] = function(player, quest_key, quest_id, pre_quest_id) -- 可接取
		Assist.QuestStart(player, quest_key)
		if not Assist.AutoTeam(player) then return end --检查队伍
		player:SetString("Assist_PlayerState","AcceptQuest") -- 设置玩家正在接取任务中
		Assist.QuestTrack(player, quest_id, -1)
	end,
	[3] = function(player, quest_key, quest_id, pre_quest_id) -- 已接取 任务进行中
		Assist.QuestStart(player, quest_key)
		if not Assist.AutoTeam(player) then return end --检查队伍
		player:SetString("Assist_PlayerState","DoQuest") 	-- 设置玩家做任务中
		Assist.QuestTrack(player, quest_id, -1)
	end,
	[4] = function(player, quest_key, quest_id, pre_quest_id) -- 可完成
		Assist.QuestStart(player, quest_key)
		if not Assist.AutoTeam(player) then return end --检查队伍
		player:SetString("Assist_PlayerState","DoQuest") 	-- 设置玩家做任务中
		Assist.QuestTrack(player, quest_id, -1)
	end,
	[5] = function(player, quest_key, quest_id, pre_quest_id) -- 已完成
		Assist.QuestFinsh(player, quest_key)
	end,
	[6] = function(player, quest_key, quest_id, pre_quest_id) -- 失败 --不会出现
		Assist.QuestFinsh(player, quest_key)
	end,
	[7] = function(player, quest_key, quest_id, pre_quest_id) -- 已放弃 --不会出现
		Assist.QuestFinsh(player, quest_key)
	end,
	[8] = function(player, quest_key, quest_id, pre_quest_id) -- 不存在
		if pre_quest_id and pre_quest_id ~= -1 then
			if not Assist.AutoTeam(player) then return end --检查队伍
			local pre_quest_state = sQuestSystem:GetQuestState(player, pre_quest_id)
			Assist.QuestStateFunc[pre_quest_state](player, quest_key, pre_quest_id)
		else
			Assist.QuestFinsh(player, quest_key)
		end
	end,
}

--设置任务进行中
function Assist.QuestStart(player, quest_key)
	if player:GetInt("Assist_SelectionStatus_"..quest_key) ~= 3 then
		player:SetInt("Assist_SelectionStatus_"..quest_key, 3)
		Assist.RefreshSelectionStatus(player, quest_key)
		Assist.SendLog(player,"$QuestName$的辅助开始了！")	
	end
end
--设置任务完成
function Assist.QuestFinsh(player, quest_key)
	player:SetInt("Assist_SelectionStatus_"..quest_key, 2)
	Assist.RefreshSelectionStatus(player, quest_key)
	Assist.SendLog(player,"$QuestName$的辅助结束了！")
	Assist.SendAndDelRecordReward(player)
	sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
end

function Assist.QuestTrack(player, quest_id)
	--sLuaApp:LuaErr("Assist.QuestTrack quest_id"..quest_id)
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	--检查辅助点数
	if not Assist.CheckAssistPoint(player, quest_id) then
		Assist.SendLog(player, "侠义值不足！")
		Assist.QuestStop(player)
		return
	end
	player:SetInt("Assist_NowQuestID", quest_id)
	--筋斗云
	if player:GetInt("Assist_Setting_UseCloud") == 1 and sItemSystem:GetItemAmount(player, JinDouYun.Id or 31022, 3) > 0 then
		JinDouYun.Main(player,quest_id)
	else
		local str = [[
			TrackUI.OnManualClickQuest(]]..tonumber(quest_id)..[[)
		]]
		sLuaApp:ShowForm(player, "脚本表单", str)	
	end
end

-- enum quest_goal
-- {
    -- goal_null = 0,
    -- goal_visit_npc,1
    -- goal_kill_boss,2
    -- goal_commit_rand_item,3
    -- goal_commit_spec_item,4
    -- goal_commit_rand_pet,5
    -- goal_commit_spec_pet,6
    -- goal_escort_npc,
    -- goal_arrive_addr,
    -- goal_fight_map,
    -- goal_fight_map_count,
    -- goal_kill_monster,
    -- goal_kill_monster_count,
    -- goal_encounter_fight,
    -- goal_use_item,
    -- goal_capture_pet,
    -- goal_convoy,
    -- goal_pve,
    -- goal_max,
-- };
--打开npc对话
function Assist.OnVisitNPC(player, npc)
	--sLuaApp:LuaErr("Assist.OnVisitNPC "..npc:GetName())
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	if player:IsFightState() then
		sLuaApp:LuaErr("Assist.OnVisitNPC "..player:GetName().." 在战斗中打开npc对话 "..npc:GetKeyName())
		return
	end
	local npc_id = npc:GetId()
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	local player_state = player:GetString("Assist_PlayerState")
	if player_state == "AcceptQuest" then
		local accept_npc_id = sQuestSystem:GetAcceptNpc(player, now_quest_id)--判断该npc是任务追踪的npc
		if accept_npc_id ~= 0 and npc_id ~= accept_npc_id then return end
		local timer = sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.AcceptQuest", "")
		
	elseif player_state == "DoQuest" then
		--判断任务类型
		--区分 战斗 购物 对话
		
		local quest_goal_type = sQuestSystem:GetGoalType(now_quest_id)
		--sLuaApp:LuaErr("now_quest_id "..now_quest_id.. " quest_goal_type" .. quest_goal_type)
		if quest_goal_type == 0 or quest_goal_type == 1 then --拜访
			local commit_npc_id = sQuestSystem:GetCommitNpc(player, now_quest_id)--判断该npc是任务追踪的npc
			if commit_npc_id ~= 0 and npc_id ~= commit_npc_id then return end
			local timer = sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.FinshQuest", "")
			
		elseif quest_goal_type == 2 then --打怪
			local fight_npc_id = sQuestSystem:GetTargetNpc(player, now_quest_id)--判断该npc是任务追踪的npc
			if fight_npc_id ~= 0 and npc_id ~= fight_npc_id then return end
			local fight_quest_timer = sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.StartFightQuest", "")
			player:SetInt("Assist_FightQuestTimer", fight_quest_timer)
		elseif quest_goal_type == 3 or quest_goal_type == 4 then --物品
			local commit_npc_id = sQuestSystem:GetCommitNpc(player, now_quest_id)--判断该npc是任务追踪的npc
			if commit_npc_id ~= 0 and npc_id ~= commit_npc_id then return end
			local timer = sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.DelQuestItem", "")
			
		elseif quest_goal_type == 5 or quest_goal_type == 6 then --宠物
			local commit_npc_id = sQuestSystem:GetCommitNpc(player, now_quest_id)--判断该npc是任务追踪的npc
			if commit_npc_id ~= 0 and npc_id ~= commit_npc_id then return end
			local timer = sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.DelQuestPet", "")
			
		end
	end
	sLuaTimerSystem:AddTimerEx(player, 2300 ,1,"Assist.CloseNPCDialog", "")
end

--接受任务
function Assist.AcceptQuest(player, t_guid, p)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	local res = sQuestSystem:Accept(player, now_quest_id)
	if res ~= 0 then
		sLuaApp:LuaErr("Assist.AcceptQuest  res ~= 0 ")
		return 
	end
	sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
end
--直接完成任务
function Assist.FinshQuest(player, t_guid, p)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	local need_bind_gold = sQuestSystem:GetFinishCondition(now_quest_id, 10) -- 目前只判断任务需要bindgold数量
	if player:GetBindGold() < need_bind_gold then
		if player:GetInt("Assist_Setting_BindIngotToBindGold") == 1 then
			if Assist.BindIngotToBindGold(player, need_bind_gold) then
				Assist.FinshQuest(player, 0, "")
				return
			end
		elseif player:GetInt("Assist_Setting_IngotToBindGold") == 1 then
			if Assist.IngotToBindGold(player, need_bind_gold) then
				Assist.FinshQuest(player, 0, "")
				return
			end
		end
		Assist.SendLog(player, "银币不足，$QuestName$辅助结束！")
		Assist.QuestStop(player)
		return
	end
	
	if not Assist.SubQuestAssistPoint(player, now_quest_id) then return end
	Assist.GetQuestReward(player, now_quest_id)
	local res = sQuestSystem:Finish(player, now_quest_id)
	if res ~= 0 then
		Assist.SendLog(player, "任务无法完成，$QuestName$辅助结束！")
		Assist.QuestStop(player)
		sLuaApp:LuaErr("Assist.FinshQuest  res ~= 0 ")
		return
	end
	Assist.AddRecordReward(player)
	sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
end
--删除任务物品 完成任务
function Assist.DelQuestItem(player, t_guid, p)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	if not Assist.SubQuestAssistPoint(player, now_quest_id) then return end
	Assist.GetQuestReward(player, now_quest_id)
	local need_item_id = sQuestSystem:GetCommitItem(player, now_quest_id)
	if sItemSystem:ConsumeItemWithId(player, need_item_id, 1, 2, "system", "辅助", "") == 0 then
		local res = sQuestSystem:ForceFinish(player, now_quest_id)
		if res ~= 0 then
			Assist.SendLog(player, "任务无法完成，$QuestName$辅助结束！")
			Assist.QuestStop(player)
			sLuaApp:LuaErr("Assist.DelQuestItem  res ~= 0 ")
			return
		end
		Assist.AddRecordReward(player)
		sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
	else
		Assist.SendLog(player, "任务物品不足，$QuestName$辅助结束！")
		Assist.QuestStop(player)
		return 
	end
end

function Assist.DelQuestPet(player, t_guid, p)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	if not Assist.SubQuestAssistPoint(player, now_quest_id) then return end
	local need_pet_id = sQuestSystem:GetCommitPet(player, now_quest_id)
	
	local has_quest_pet = false
	local pet_con = player:GetPetContainer(PET_CONTAINER_PANEL)
	local pet_list = pet_con:GetPetList()
	for _,v in ipairs(pet_list) do
		if v:GetId() == need_pet_id then
			if v:GetInt("PetStarLevel") <= Assist.HandInPetMaxStar then
				if v:GetAttr(ROLE_ATTR_LEVEL) <= Assist.HandInPetMaxLevel then
					has_quest_pet = true
					Assist.GetQuestReward(player, now_quest_id)
					
					--判断锁定
					if v:IsLocked() then
						Assist.SendLog(player, "宠物"..v:GetName().."已锁定，$QuestName$辅助结束！")
						Assist.QuestStop(player)
						return
					end
					--退回宠物装备
					if not PetSystem.ReturnPetEquip(player, {v}) then 
						Assist.SendLog(player, "宠物装备无法退回，$QuestName$辅助结束！")
						Assist.QuestStop(player)
						return 
					end 
					
					if sPetSystem:DestroyPet(v, "system", "辅助", "") == 0 then
						local res = sQuestSystem:ForceFinish(player, now_quest_id)
						if res ~= 0 then
							Assist.SendLog(player, "任务无法完成，$QuestName$辅助结束！")
							Assist.QuestStop(player)
							sLuaApp:LuaErr("Assist.DelQuestPet  res ~= 0 ")
							return
						end
						Assist.AddRecordReward(player)
						sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
					else
						sLuaApp:LuaErr("Assist.DelQuestPet  DestroyPet ~= 0 ")
						return 
					end
					break
				end
			end
		end
	end
	
	if not has_quest_pet then
		Assist.SendLog(player, "任务宠物不足，$QuestName$辅助结束！")
		Assist.QuestStop(player)
		return 
	end
end


--打开商店
function Assist.OnOpenShop(player, npc, shop_id, goods_id)
	--sLuaApp:LuaErr("Assist.OnOpenShop "..npc:GetName().. " shop_id "..shop_id.. " goods_id"..goods_id)
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.Buy", ""..shop_id)
end

--购物
function Assist.Buy(player, t_guid, shop_id)
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	shop_id = tonumber(shop_id)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	local shop_data = ShopConfig.GetByShopId(shop_id)
	if not shop_data then
		sLuaApp:LuaErr("Assist.Buy ShopConfig 不存在 "..shop_id)
		return 
	end
	local shop_type = shop_data.Type
	if shop_type == 0 then
		--宠物商店
		local need_pet_id = sQuestSystem:GetCommitPet(player, now_quest_id)
		--sLuaApp:LuaErr("need_pet_id"..need_pet_id)
		
		local pet_data = PetConfig.GetById(need_pet_id)
		if not pet_data then
			sLuaApp:LuaErr("Assist.Buy PetConfig 不存在 "..need_pet_id)
			return
		end
		local pet_keyname = pet_data.KeyName
		local shop_item_data = ShopItemConfig.GetByShopIdItemKeyName(shop_id, pet_keyname)
		if not shop_item_data then
			sLuaApp:LuaErr("Assist.Buy ShopItemConfig 不存在 "..shop_id.." "..pet_keyname)
			return 
		end
		--扣钱
		if Lua_tools.GetPetBagFree(player) >= 1 then
			local price = shop_item_data.Price
			if not Assist.CheckSubMoney(player, price, shop_id) then
				return
			end
		else
			Assist.SendLog(player, "宠物格子不足，$QuestName$辅助结束")
			sLuaTimerSystem:AddTimerEx(player, 1000 ,1,"Assist.ClosePetShop", "")
			Assist.QuestStop(player)
			return
		end
		--发宠物
		local bind = shop_item_data.BindType == 1 and true or false
		sPetSystem:AddPetEx(player, need_pet_id, 1, bind, "system", "辅助", "")
		sLuaTimerSystem:AddTimerEx(player, 1000 ,1,"Assist.ClosePetShop", "")
		
	elseif shop_type == 1 then
		--物品商店
		local need_item_id = sQuestSystem:GetCommitItem(player, now_quest_id)
		--sLuaApp:LuaErr("need_item_id"..need_item_id)
		
		local item_data = ItemConfig.GetById(need_item_id)
		if not item_data then
			sLuaApp:LuaErr("Assist.Buy ItemConfig 不存在 "..need_item_id)
			return
		end
		local item_keyname = item_data.KeyName
		local shop_item_data = ShopItemConfig.GetByShopIdItemKeyName(shop_id, item_keyname)
		if not shop_item_data then
			sLuaApp:LuaErr("Assist.Buy ShopItemConfig 不存在 "..shop_id.." "..item_keyname)
			return 
		end
		--扣钱
		if Lua_tools.GetBagFree(player) >= 1 then
			local price = shop_item_data.Price
			if not Assist.CheckSubMoney(player, price, shop_id) then
				return
			end
		else
			Assist.SendLog(player, "包裹空间不足，$QuestName$辅助结束")
			sLuaTimerSystem:AddTimerEx(player, 1000 ,1,"Assist.CloseShop", "")
			Assist.QuestStop(player)
			return
		end
		--发物品
		local bind = shop_item_data.BindType
		Lua_tools.AddItem(player, {item_keyname,1,bind}, "system", "辅助", "")
		sLuaTimerSystem:AddTimerEx(player, 1000 ,1,"Assist.CloseShop", "")
	end

	sLuaTimerSystem:AddTimerEx(player, 1200 ,1,"Assist.ToStartPathfinding", "")
end

function Assist.CheckSubMoney(player, price, shop_id)
	if Lua_tools.IsMoneyEnough(player, 5, price) then
		Lua_tools.SubMoney(player, 5, price, "system", "辅助", "")
		return true
	else
		if player:GetInt("Assist_Setting_BindIngotToBindGold") == 1 then
			if Assist.BindIngotToBindGold(player, price) then
				Assist.Buy(player, 0, shop_id)
				return false
			end
		elseif player:GetInt("Assist_Setting_IngotToBindGold") == 1 then
			if Assist.IngotToBindGold(player, price) then
				Assist.Buy(player, 0, shop_id)
				return false
			end
		end
		Assist.SendLog(player, "银币不足，$QuestName$辅助结束")
		Assist.QuestStop(player)
		return false
	end
	return false
end

-- 银元宝转银币
function Assist.BindIngotToBindGold(player, price)
	local has_bind_gold = player:GetBindGold()
	local lack_bind_gold = price - has_bind_gold
	local ratio = 2000
	for _,v in ipairs(MoneyChange.Config["MoneyVal_5"]) do
		if v["ChangeFrom"] == 2 then
			ratio = v["ChangeRatio"]
		end
	end
	local need_bind_ingot = math.ceil(lack_bind_gold / ratio)
	local has_bind_ingot = player:GetBindIngot()	
	if need_bind_ingot <= has_bind_ingot then
		player:SubBindIngot(need_bind_ingot, "system", "辅助", "自动兑换")
		player:AddBindGold(need_bind_ingot * ratio, "system", "辅助", "自动兑换")
		return true
	else
		if player:GetInt("Assist_Setting_IngotToBindGold") == 1 then
			player:SubBindIngot(has_bind_ingot, "system", "辅助", "自动兑换")
			player:AddBindGold(has_bind_ingot * ratio, "system", "辅助", "自动兑换")
			return Assist.IngotToBindGold(player, price)
		else
			return false
		end
	end
end
-- 金元宝转银币
function Assist.IngotToBindGold(player, price)
	local has_bind_gold = player:GetBindGold()
	local lack_bind_gold = price - has_bind_gold
	local ratio = 10000
	for _,v in ipairs(MoneyChange.Config["MoneyVal_5"]) do
		if v["ChangeFrom"] == 1 then
			ratio = v["ChangeRatio"]
		end
	end
	local need_ingot = math.ceil(lack_bind_gold / ratio)
	local has_ingot = player:GetIngot()	
	if need_ingot <= has_ingot then
		player:SubIngot(need_ingot, "system", "辅助", "自动兑换")
		player:AddBindGold(need_ingot * ratio, "system", "辅助", "自动兑换")
		return true
	else
		return false
	end
end

--任务战斗
function Assist.StartFightQuest(player, t_guid, p)
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	player:SetInt("Assist_FightQuestTimer", 0)
	local now_quest_id = player:GetInt("Assist_NowQuestID")
	if not Assist.SubQuestAssistPoint(player, now_quest_id) then return end
	local res = sQuestSystem:Fight(player, now_quest_id)
	if res == 0 then
		Assist.GetQuestReward(player, now_quest_id)
		player:SetInt("Assist_IsQuestFight", 1)
	else
		sLuaApp:LuaErr("Assist.StartQuestFight  res ~= 0 ")
		return
	end
end
--战斗完回调
function Assist.OnFightResult(player, typ, victory, custom)
	local is_quest_fight = player:GetInt("Assist_IsQuestFight")
	if is_quest_fight == 1 then
		player:SetInt("Assist_IsQuestFight", 0)
		if victory == 2 then
			--sLuaApp:LuaErr("任务战斗成功")
			Assist.AddRecordReward(player)
			sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")
		else
			--sLuaApp:LuaErr("任务战斗失败")
			--Assist.SendAndDelRecordReward(player)
			Assist.SendLog(player,"战斗失败，$QuestName$辅助结束！")
			Assist.QuestStop(player)
		end
	--else 
		--sLuaTimerSystem:AddTimerEx(player, 2000 ,1,"Assist.ToStartPathfinding", "")--有概率导致，在npc对话过程中额外添加一个完成任务的定时器，重复完成任务
	end
end


--获取并暂存 任务奖励的银币和人物经验
function Assist.GetQuestReward(player, quest_id)
	local reward_json = sQuestSystem:GetQuestReward(player, quest_id)
	if reward_json and reward_json ~= "" then
		local reward_tb = json.decode(reward_json)
		--sLuaApp:LuaErr(Lua_tools.serialize(reward_tb))
		local bmoney = reward_tb["reward_bmoney_"]
		if bmoney then
			player:SetInt("Assist_NowQuestReward_bmoney", bmoney)
		end
		-- local player_exp =  reward_tb["reward_exp_"]
		-- if player_exp then
			-- player:SetInt("Assist_NowQuestReward_exp", player_exp)
		-- end
	end
end
--把暂存的 任务奖励 加入 记录奖励
function Assist.AddRecordReward(player)
	local bmoney = player:GetInt("Assist_RecordReward_bmoney") + player:GetInt("Assist_NowQuestReward_bmoney")
	player:SetInt("Assist_NowQuestReward_bmoney", 0)
	player:SetInt("Assist_RecordReward_bmoney", bmoney)
	-- local player_exp = player:GetInt("Assist_RecordReward_exp") + player:GetInt("Assist_NowQuestReward_exp")
	-- player:SetInt("Assist_NowQuestReward_exp", 0)
	-- player:SetInt("Assist_RecordReward_exp", player_exp)
end
--加的经验记录 会因为双倍经验和服务器等级改变
function Assist.AddRecordExp(player, player_exp)
	if player:GetType() ~= GUID_PLAYER then return end
	if player:GetInt("Assist_GoOn") ~= 1 then return end
	player:SetInt("Assist_RecordReward_exp", player:GetInt("Assist_RecordReward_exp") + player_exp)
end
--发送记录奖励 并清空记录奖励
function Assist.SendAndDelRecordReward(player)
	local record_bmoney = player:GetInt("Assist_RecordReward_bmoney")	
	player:SetInt("Assist_RecordReward_bmoney", 0)
	local record_exp = player:GetInt("Assist_RecordReward_exp")	
	player:SetInt("Assist_RecordReward_exp", 0)
	if record_bmoney > 0 or record_exp > 0 then
		local msg = "从$QuestName$中共获得了"
		if record_bmoney > 0 and record_exp > 0 then 
			msg = msg ..record_bmoney.."银币和"..record_exp.."经验"
		elseif record_bmoney > 0 then
			msg = msg ..record_bmoney.."银币"
		elseif record_exp > 0 then		
			msg = msg ..record_exp.."经验"
		end	
		Assist.SendLog(player, msg)
	end
end


-- =========== 活动 ==========
--返回活动是否已完成
Assist.GetActivityIsFinish = {
	["西游奇缘"] = function(player)
		local max_num = Act_XiYouQiYuan.Config['DayCount'] or 10 --最大答题数量
		local now_num = player:GetDayInt("XiYouQiYuan_DayCount") --当前答题数量
		if now_num >= max_num then
			return true
		end
		return false
	end,
}

Assist.ActivityFunc = {
	["西游奇缘"] = function(player)
		Assist.XiYouQiYuanStart(player)
	end,
}

function Assist.XiYouQiYuanStart(player)
	local now_quest_key = player:GetString("Assist_NowQuestKey")
	player:SetInt("Assist_SelectionStatus_"..now_quest_key, 3)
	Assist.SendLog(player,"$QuestName$的辅助开始了！")
	
	local max_num = Act_XiYouQiYuan.Config['DayCount'] or 10 --最大答题数量
	local now_num = player:GetDayInt("XiYouQiYuan_DayCount") --当前答题数量
	local surplus_num = max_num - now_num
	if surplus_num <= 0 then
		Assist.SendLog(player, "$QuestName$已完成，辅助结束！")
		player:SetInt("Assist_SelectionStatus_"..now_quest_key, 2) --设置完成
		sLuaTimerSystem:AddTimerEx(player, 1000,1,"Assist.ToStartPathfinding", "")
		return 
	end

	local str = [[
		GUI.OpenWnd("WestJourneyUI")
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local t_guid = sLuaTimerSystem:AddTimerEx(player, 5000,surplus_num * 3,"Assist.XiYouQiYuanAnswer", "")
	player:SetInt("Assist_XiYouQiYuanAnswerTimer", t_guid)
end

function Assist.XiYouQiYuanAnswer(player, t_guid, p)
	--每次答题前判断 剩余答题数量 和 消耗点数
	local now_quest_key = player:GetString("Assist_NowQuestKey")
	if now_quest_key ~= "西游奇缘" then
		if not sLuaTimerSystem:DisableTimer(t_guid) then
			sLuaApp:LuaErr("Assist.XiYouQiYuanAnswer DisableTimer 错误")
		end
		return
	end
	if not Assist.CheckAssistPoint(player, now_quest_key) then
		if not sLuaTimerSystem:DisableTimer(t_guid) then
			sLuaApp:LuaErr("Assist.XiYouQiYuanAnswer DisableTimer 错误")
		end
		--player:SetInt("Assist_SelectionStatus_"..now_quest_key, 4) --设置中止
		Assist.SendLog(player, "侠义值不足！")
		Assist.QuestStop(player)
		return
	end
	if not Assist.SubQuestAssistPoint(player, now_quest_key) then return end
	local str = [[
		if WestJourneyUI then
			WestJourneyUI.RandomAnswer()
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	
	local max_num = Act_XiYouQiYuan.Config['DayCount'] or 10 --最大答题数量
	local now_num = player:GetDayInt("XiYouQiYuan_DayCount") --当前答题数量
	if now_num >= max_num then
		sLuaTimerSystem:AddTimerEx(player, 2000,1,"Assist.XiYouQiYuanStop", "")
	end
end

function Assist.XiYouQiYuanStop(player, t_guid, p)
	local now_quest_key = player:GetString("Assist_NowQuestKey")
	if now_quest_key ~= "西游奇缘" then
		return
	end
	
	local answer_timer = player:GetInt("Assist_XiYouQiYuanAnswerTimer")
	if sLuaTimerSystem:HasTimer(answer_timer) then
		if not sLuaTimerSystem:DisableTimer(answer_timer) then
			sLuaApp:LuaErr("Assist.XiYouQiYuanStop DisableTimer 错误")
		end
	end
	player:SetInt("Assist_XiYouQiYuanAnswerTimer", 0)
	
	local max_num = Act_XiYouQiYuan.Config['DayCount'] or 10 --最大答题数量
	local now_num = player:GetDayInt("XiYouQiYuan_DayCount") --当前答题数量
	if now_num >= max_num then
		player:SetInt("Assist_SelectionStatus_"..now_quest_key, 2) --设置完成
		Assist.SendLog(player, "$QuestName$已完成，辅助结束！")		
		sLuaTimerSystem:AddTimerEx(player, 100,1,"Assist.ToStartPathfinding", "")
	else
		player:SetInt("Assist_SelectionStatus_"..now_quest_key, 4) --设置中止
		Assist.SendLog(player, "$QuestName$已中止！")
		Assist.End(player)
	end
end

-- =========== 活动 ==========


--判断玩家是否卡死
function Assist.StartCheckStuck(player)
	local t_guid = sLuaTimerSystem:AddTimerEx(player, 5000 ,-1,"Assist.CheckStuck", "")
	player:SetInt("Assist_CheckStuckTimer", t_guid)
end
function Assist.CheckStuck(player, t_guid, p)
	if player:GetInt("Assist_NoCheckStuck") == 1 then
		player:SetInt("Assist_StuckNum", 0)
		return
	end
	if player:IsFightState() then
		player:SetInt("Assist_StuckNum", 0)
		return
	end
	
	local record_x= player:GetInt("Assist_RecordPosX")
	local record_y= player:GetInt("Assist_RecordPosY")	
	local now_x = sMapSystem:GetPosX(player)
	local now_y = sMapSystem:GetPosY(player)
	if record_x == now_x and record_y == now_y then
		local stuck_num = player:GetInt("Assist_StuckNum") + 1
		if stuck_num == 3 then
			--重新开始检查任务
			Assist.StartPathfinding(player, true)
		end
		if stuck_num == 5 then
			--中止当前任务 重新开始检查任务
			player:SetInt("Assist_StuckNum", 0)
			Assist.SendLog(player, "由于无法移动，$QuestName$辅助结束！")
			Assist.QuestStop(player)
		end
		player:SetInt("Assist_StuckNum", stuck_num)
	else
		player:SetInt("Assist_StuckNum", 0)
		player:SetInt("Assist_RecordPosX", now_x)
		player:SetInt("Assist_RecordPosY", now_y)
	end
end

--发送日志 -开始 -结束 -某一任务开始 -战斗失败结束 -货币不足失败 -获得奖励
function Assist.SendLog(player, msg)
	local quest_show_name = player:GetString("Assist_NowQuestShowName")
	msg = string.gsub(msg, "%$QuestName$*", "<color=#009900ff>"..quest_show_name.."</color>")
	local str = [[
		if PlugSystemUI then
			PlugSystemUI.GetLogTxt(']].. msg ..[[')
		end
	]]
	sLuaApp:ShowForm(player, "脚本表单", str)
	sLuaApp:NotifyTipsMsgEx(player, msg)
end

function Assist.ToStartPathfinding(player, t_guid, p)
	if player:GetInt("Assist_GoOn") ~= 1 then
		return
	end	
	Assist.StartPathfinding(player, true)
end


--队长改变前
function Assist.OnLeaderChange(player)
	if player:GetInt("Assist_GoOn")	~= 1 then
		return
	end
	Assist.End(player)
	Assist.SendLog(player, "由于你不再是队长，辅助结束了！")
end

--检查能否开启辅助
function Assist.CheckStart(player)
	--sLuaApp:LuaErr("IsFightState" ..tostring(player:IsFightState()))
	if player:IsFightState() then
		sLuaApp:NotifyTipsMsg(player, "战斗中无法进行辅助！")
		return false
	end
	
	if player:GetTeam() then
		if not player:IsTeamLeader() then
			sLuaApp:NotifyTipsMsg(player, "组队中无法进行辅助！")
			return false
		end
	end
	
	local map = player:GetMap()
	local map_data = MapConfig.GetById(map:GetId())
	if map_data.Type ~= 1 then
		if map:GetKeyName() ~= "帮派地图" then
			sLuaApp:NotifyTipsMsg(player, "当前地图无法进行辅助！")
			return false
		end
	end
	local map_keyname = map:GetKeyName()
	for _,v in ipairs(Assist.NoStartMap) do
		if v == map_keyname then
			sLuaApp:NotifyTipsMsg(player, "当前地图无法进行辅助！")
			return false
		end
	end

	if PVPActivityMatch then
		if PVPActivityMatch.IsMatching(player) then
			sLuaApp:NotifyTipsMsg(player, "参与匹配中无法进行辅助！")
			return false
		end
	end

	return true
end
--关闭npc对话
function Assist.CloseNPCDialog(player, t_guid, p)
	local str =[[
		if NpcDialogUI then
			GUI.CloseWnd("NpcDialogUI")
		end
	]]
	for _,v in ipairs(Assist.GetTeamMember(player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
end
--关闭商店ui
function Assist.CloseShop(player, t_guid, p)
	local str =[[
		if ShopUI then
			GUI.DestroyWnd("ShopUI")
		end
		GlobalProcessing.EquipAutoUseState(0)
	]]
	for _,v in ipairs(Assist.GetTeamMember(player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
end
--关闭宠物商店ui
function Assist.ClosePetShop(player, t_guid, p)
	local str =[[
		if PetShopUI then
			GUI.DestroyWnd("PetShopUI")
		end
	]]
	for _,v in ipairs(Assist.GetTeamMember(player)) do
		sLuaApp:ShowForm(v, "脚本表单", str)
	end
end
function Assist.GetTeamMember(player)
	local team_member = {}
	local team = player:GetTeam()
	if team then
		team_member = team:GetTeamMembers(false)
	else
		team_member[1] = player
	end
	return team_member
end


function Assist.Initialization()
	Assist.ConfigEx = {}
	Assist.QuestConsumePoint = {} --任务id 对应 需要的辅助点数
	for _,v in ipairs(Assist.Config) do
		--任务最低接取等级
		local low_level = 0
		if v["PreQuestID"] then
			low_level = sQuestSystem:GetAcceptCondition(v["PreQuestID"], 0)
		end
		v["AcceptLevel"] = low_level
		
		-- Quest_Key = {}
		Assist.ConfigEx[v["Key"]] = Lua_tools.DupTable(v)
		Assist.ConfigEx[v["Key"]]["Key"] = nil

		 --任务id = 需要的辅助点数
		local consume_point = v["ConsumePoint"]
		if v["QuestID"] then
			for _,b in ipairs(v["QuestID"]) do
				Assist.QuestConsumePoint[b] = consume_point
			end
		elseif v["SchoolQuestID"] then
			for _,b in pairs(v["SchoolQuestID"]) do
				for _,j in ipairs(b) do
					Assist.QuestConsumePoint[j] = consume_point	
				end
			end
		end
		if v["PreQuestID"] then
			Assist.QuestConsumePoint[v["PreQuestID"]] = 0
		end
		if v["SchoolPreQuestID"] then
			for _,b in pairs(v["SchoolPreQuestID"]) do
				Assist.QuestConsumePoint[b] = 0
			end
		end
		if v["ActivityID"] then
			Assist.QuestConsumePoint[v["Key"]] = consume_point	
		end

	end
	--sLuaApp:LuaErr(Lua_tools.serialize(Assist.QuestConsumePoint))
	Assist.SettingStr = Lua_tools.serialize(Assist.Setting)
	Assist.ActivityPointShowStr = Lua_tools.serialize(Assist.ActivityPointShow)
end
Assist.Initialization()


--奖励
-- {
-- ["reward_pet_exp_"]=40800,
-- ["reward_bmoney_"]=4080,
-- ["reward_exp_"]=40800,
-- }

--任务需求
-- enum ConditionType
-- {
    -- ConditionTypeLevelLow = 0,
    -- ConditionTypeLevelTop,
    -- ConditionTypeVipLow,
    -- ConditionTypeVipTop,
    -- ConditionTypeIngotLow,
    -- ConditionTypeIngotTop,
    -- ConditionTypeBindIngotLow,
    -- ConditionTypeBindIngotTop,
    -- ConditionTypeGoldLow,
    -- ConditionTypeGoldTop,
    -- ConditionTypeBindGoldLow,
    -- ConditionTypeBindGoldTop,
    -- ConditionTypePKLow,
    -- ConditionTypePKTop,
    -- ConditionTypeMarriage,
    -- ConditionTypeMaster,
    -- ConditionTypeGuild,
    -- ConditionTypeJob,
    -- ConditionTypeRace,
    -- ConditionTypeGender,
    -- ConditionTypeRole,
    -- ConditionTypePet,
    -- ConditionTypeNoPet,
    -- ConditionTypeItem,
    -- ConditionTypeNoItem,
    -- ConditionTypeTitle,
    -- ConditionTypeNoTitle,
    -- ConditionTypeBuff,
    -- ConditionTypeNoBuff,
    -- ConditionTypeQuestFailure,
    -- ConditionTypeQuestCompletion,
    -- ConditionTypeQuestRing,
    -- ConditionTypeQuestCycle,
    -- ConditionTypeReincarnationLow,
    -- ConditionTypeReincarnationTop,
    -- ConditionTypeGuildAchievementLow,
    -- ConditionTypeGuildAchievementTop,
    -- ConditionTypeGuildFightScoreLow,
    -- ConditionTypeGuildFightScoreTop,
    -- ConditionTypeMax
-- };