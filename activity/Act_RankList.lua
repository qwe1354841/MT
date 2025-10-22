--开服冲榜功能
Act_RankList = {}

--不要动
Act_RankList.RankType_2_Fun = {
	[1] = "player",
	[2] = "player",
	[3] = "player",
	[4] = "pet",
	[5] = "guard",
	[55] = "player",
}
--不要动
Act_RankList.ServerTyper_2_ClientType = {
	[1] = 11,
	[2] = 12,
	[3] = 13,
	[4] = 14,
	[5] = 15,
	[55] = 42,
}

--配置不支持rs，所有内容在服务器启动时生效，后续需要更改要重启服务器。
Act_RankList.Config = {
	--界面上方显示文字，标题
	['Title_Name'] = "开服冲榜",
	--活动列表配置
	['RankList'] = {
		--从这里开始复制,名字是唯一标识，不能重复，复制必须修改
		['33242124302'] = {
			--唯一标识，和外面必须一样
			['ActKeyName'] = "33242124302",
			--页签名字
			['Name'] = "最强主角",
			--开启时间
			--['Start_Time'] = "2022-01-15 23:59:59",    --绝对时间
            ['Start_Time'] = "0 00:00:00",               --相对时间，以服务器常量表StartServerTime当天为第0天
			--结束时间
			--['End_Time'] = "2022-1-16 23:59:59",       --绝对时间
            ['End_Time'] = "13 23:59:59",                --相对时间
			--保留时间（排名公示期）
			--['Retain_Time'] = "2022-02-15 23:59:59",   --绝对时间
            ['Retain_Time'] = "14 23:59:59",             --相对时间
			--没开启提示
			['Not_Open_TXT'] = "活动尚未开启！",
			--我的排名前半部分文字显示
			['My_Rank_TXT'] = "我的排名:",
			--[[对应排行榜：
				["总战力榜"] = 1,		
				["角色战力榜"] = 2,		
				["角色等级榜"] = 3,		
				["宠物战力榜"] = 4,		
				["侍从战力榜"] = 5,		
				["无字真经榜"] = 55,
			]]--
			['Rank_Type'] = 2,
			--奖励相关
			['Reward'] = {
				['Reward_List'] = {
					{	
						--文字显示
						['Inf'] = "主角战力",
						--上限
						['Up'] = 1,
						--下限
						['Lower'] = 1,
						--奖励道具
						['Item_list'] = {5406,1,1,5406,1,1,5406,1,1,5406,1,1,5406,1,1},
					},
					{	
						['Inf'] = "主角战力",
						['Up'] = 2,
						['Lower'] = 3,
						['Item_list'] = {5406,1,1,5406,1,1,5406,1,1,5406,1,1},
					},
					{	
						['Inf'] = "主角战力",
						['Up'] = 4,
						['Lower'] = 10,
						['Item_list'] = {5406,1,1,5406,1,1,5406,1,1},
					},
					{	
						['Inf'] = "主角战力",
						['Up'] = 11,
						['Lower'] = 100,
						['Item_list'] = {5406,1,1,5406,1,1},
					},
					{	
						['Inf'] = "主角战力",
						['Up'] = 101,
						['Lower'] = 500,
						['Item_list'] = {5406,1,1},
					},
				},
			},
			--活动规则
			['Inf'] = "请及时清理邮箱，超过最大邮件数量后无法正常获取冲榜奖励！",
		},
		--到这里复制结束
	},
}

function Act_RankList.Initialization()
	if FunctionSwitch.AllFuncitonConfig['Act_RankList'] ~= "on" then
		return
	end
	Act_RankList.ergodic_act_ranklist(0)
end

function Act_RankList.ergodic_act_ranklist(mode)
	local tb = {}
	local now_time_sec = sLuaApp:SecondSinceEpoch(0) 
	tb['Title_Name'] = Act_RankList.Config['Title_Name']
	tb['RankList'] = {}
	for k,v in pairs(Act_RankList.Config['RankList']) do
		local act_start_time_sec = Act_RankList.time_str_2_sec(v['Start_Time'])
		local act_end_time_sec = Act_RankList.time_str_2_sec(v['End_Time'])
		local act_retain_time_sec = Act_RankList.time_str_2_sec(v['Retain_Time'])
		if now_time_sec < act_retain_time_sec then
			if now_time_sec >= act_end_time_sec then
				if mode == 0 then
					sScheduleSystem:CreateSchedule(0, sLuaApp:DateTime2Str(act_retain_time_sec), "Act_RankList", "act_ranklist_over", "")
				end
				if sDBVarSystem:GetInt("Act_RankList"..v['ActKeyName']) ~= 1 then
					sLuaTimerSystem:AddTimer(6000*3, 1, "Act_RankList.send_reward_on_system_start", ""..v['ActKeyName'])
				end
			else
				if mode == 0 then
					sDBVarSystem:SetInt("Act_RankList"..v['ActKeyName'],0,0)
					sScheduleSystem:CreateSchedule(0, sLuaApp:DateTime2Str(act_end_time_sec), "Act_RankList", "act_ranklist_end_and_send_reward", ""..v['ActKeyName'])					
				end
			end
			local tb_1 = {}
			tb_1['Start_Time'] = act_start_time_sec
			tb_1['End_Time'] = act_end_time_sec
			tb_1['Retain_Time'] = act_retain_time_sec
			tb_1['Name'] = v['Name']
			tb_1['ActKeyName'] = v['ActKeyName']
			tb_1['Not_Open_TXT'] = v['Not_Open_TXT']
			table.insert(tb['RankList'],tb_1)
		end
	end
	sVarSystem:SetString("Act_RankList", Lua_tools.serialize(tb))
	--sLuaApp:LuaWrn("                    "..Lua_tools.serialize(tb))
end

function Act_RankList.send_reward_on_system_start(timer,act_keyname)
	--sLuaApp:LuaWrn("Act_RankList.send_reward_on_system_start =========================")
	Act_RankList.send_reward(act_keyname)
end

function Act_RankList.act_ranklist_end_and_send_reward(time_id, act_keyname)
	--这里可能需要一个刷新排行榜的方法
	--sLuaApp:LuaWrn("Act_RankList.act_ranklist_end_and_send_reward =========================")
	Act_RankList.send_reward(act_keyname)
	local act_retain_time_sec = Act_RankList.time_str_2_sec(Act_RankList.Config['RankList'][''..act_keyname]['Retain_Time'])
	sScheduleSystem:CreateSchedule(0, sLuaApp:DateTime2Str(act_retain_time_sec), "Act_RankList","act_ranklist_over","")					
end

function Act_RankList.act_ranklist_over(time_id,p)
	Act_RankList.ergodic_act_ranklist(1)
	local tb = assert(load("return "..sVarSystem:GetString("Act_RankList")))()
	if not tb then
		tb = {}
	end
	if #tb['RankList'] > 0 then
		local str = [[----unfilter
				if GlobalProcessing then
					GlobalProcessing.ServerRushRankData(]]..Lua_tools.serialize(tb)..[[)
				end
			]]
		sLuaApp:ShowFormToAll("脚本表单", str)
	end
end

function Act_RankList.time_str_2_sec(str)
	local time_sec = 0
	local tb = sLuaApp:StrSplit(str," ")
	if tonumber(tb[1]) then
		str = sLuaApp:StrSplit(sLuaApp:DateTime2Str(sLuaApp:Str2DateTime(ConstVarConfig["StartServerTime"].Value) + tb[1]*24*3600), " ")[1].." "..tb[2]
	end
	time_sec = sLuaApp:Str2DateTime(str)
	return time_sec
end

function Act_RankList.get_act_ranklist_when_player_login(player)
	if FunctionSwitch.AllFuncitonConfig['Act_RankList'] ~= "on" then
		return
	end
	local tb = assert(load("return "..sVarSystem:GetString("Act_RankList")))()
	if not tb then
		tb = {}
	end
	if #tb['RankList'] > 0 then
		local form_str = [[----unfilter
				if GlobalProcessing then
					GlobalProcessing.ServerRushRankData(]]..Lua_tools.serialize(tb)..[[)
				end
				if MainSysOpen then
					MainSysOpen.SetBtn(RoleAttr.RoleAttrLevel, CL.GetAttr(RoleAttr.RoleAttrLevel))
				end
			]]
		sLuaApp:ShowForm(player,"脚本表单", form_str)
	end
end

function Act_RankList.get_act_ranklist_info_by_key(player,act_keyname)
	if FunctionSwitch.AllFuncitonConfig['Act_RankList'] ~= "on" then
		return
	end
	if not act_keyname then
		sLuaApp:LuaWrn("Act_RankList.get_act_ranklist_info_by_key is err , act_keyname is nil")
		return
	end
	if not Act_RankList.Config['RankList'][''..act_keyname] then
		sLuaApp:LuaWrn("Act_RankList.get_act_ranklist_info_by_key is err , Act_RankList.Config[RankList]["..act_keyname.."] is nil")
		return
	end
	local tb = {}
	local my_rank = ""
	my_rank = ""..Act_RankList.get_my_rank_by_player_guid(player,act_keyname)
	tb['My_Rank_TXT'] = Act_RankList.Config['RankList'][''..act_keyname]['My_Rank_TXT']..my_rank
	tb['First'] = Act_RankList.get_player_name_by_rank(player,1,act_keyname)
	tb['Second'] = Act_RankList.get_player_name_by_rank(player,2,act_keyname)
	tb['Third'] = Act_RankList.get_player_name_by_rank(player,3,act_keyname)
	tb['Reward_List'] = Act_RankList.Config['RankList'][''..act_keyname]['Reward']['Reward_List']
	tb['On_List_TXT'] = Act_RankList.Config['RankList'][''..act_keyname]['On_List_TXT']
	tb['Inf'] = Act_RankList.Config['RankList'][''..act_keyname]['Inf']
	tb['Rank_Type'] = Act_RankList.ServerTyper_2_ClientType[Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type']]
	local form_str = [[
			if RushRankUI then
				RushRankUI.ServerRankData(]]..Lua_tools.serialize(tb)..[[)
			end
		]]
	sLuaApp:ShowForm(player,"脚本表单", form_str)
end

function Act_RankList.send_reward(act_keyname)
	if sDBVarSystem:GetInt("Act_RankList"..act_keyname) == 1 then
		return
	end
	sDBVarSystem:SetInt("Act_RankList"..act_keyname,1,0)
	local tb = Act_RankList.Config['RankList'][''..act_keyname]
	for k,v in pairs(tb['Reward']['Reward_List']) do
		local player_guid_list = Act_RankList.get_player_guid_list(v['Up'],v['Lower'],tb['Rank_Type'],act_keyname)
		--sLuaApp:LuaWrn("Act_RankList:send_reward is err act_keyname = "..act_keyname.." ,  Up = ".. v['Up'] .."      Lower = ".. v['Lower'])
		for a,b in pairs(player_guid_list) do
			if sMailSystem:SendMail(0,"系统",b,1,""..Act_RankList.Config['Title_Name'],"您在"..tb['Name'].."中有不错的表现，获得了第"..a.."名，以下是您的参与奖励",{},tb['Reward']['Reward_List'][k]['Item_list']) == 0 then
				sLuaApp:LuaWrn("Act_RankList:send_reward is err act_keyname = "..act_keyname.." ,player_guid = "..b.." ,name = "..sContactSystem:GetContactName(b).." ,a = "..a)
			else
				sLuaApp:LuaWrn("Act_RankList:send_reward success act_keyname = "..act_keyname.." ,player_guid = "..b.." ,name = "..sContactSystem:GetContactName(b).." a = "..a)
				--lualib:LogDetailWithId(b, 1032, "", "", 0, 0, "开服冲榜", "发奖励", "玩家guid："..b.."，名次："..a.."，排行榜类型："..tb['Rank_Type'])
			end
		end
	end
end
function Act_RankList.get_player_name_by_rank(player,num,act_keyname)
	local player_name = "未上榜"
	local tb = sRanklistSystem:GetRanklist(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],num,num)
	if #tb == 1 then
		if Act_RankList.RankType_2_Fun[Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type']] == "player" then
			player_name = tb[1][3]
		else
			player_name = tb[1][4]
		end
	end
	return player_name
end

function Act_RankList.get_my_rank_by_player_guid(player,act_keyname)
	local player_guid = player:GetGUID()
	local rank = "未上榜"
	if Act_RankList.RankType_2_Fun[Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type']] == "player" then
		local tb = sRanklistSystem:GetRank(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],player_guid)
		if not tb or not next(tb) then 
			return rank
		end
		if tb[1] then
			rank = ""..tb[1]
		end
	elseif Act_RankList.RankType_2_Fun[Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type']] == "pet" then
		local tb1 = player:GetPetContainer(1):GetPetList()
		local max_fight_value_pet1 = nil
		local max_fight_value1 = 0
		local tb2 = player:GetPetContainer(1):GetPetList()
		local max_fight_value_pet2 = nil
		local max_fight_value2 = 0
		if tb1 and next(tb1) then
			for k,v in ipairs(tb1) do 
				if v:GetAttr(ROLE_ATTR_FIGHT_VALUE) > max_fight_value1 then
					max_fight_value_pet1 = v
					max_fight_value1 = v:GetAttr(ROLE_ATTR_FIGHT_VALUE)
				end
			end
		end
		if tb2 and next(tb2) then
			for k,v in ipairs(tb2) do 
				if v:GetAttr(ROLE_ATTR_FIGHT_VALUE) > max_fight_value2 then
					max_fight_value_pet2 = v
					max_fight_value2 = v:GetAttr(ROLE_ATTR_FIGHT_VALUE)
				end
			end
		end
		if max_fight_value1 > 0 or max_fight_value2 > 0 then
			if max_fight_value1 > max_fight_value2 then
				if max_fight_value_pet1 then
					local guid = max_fight_value_pet1:GetGUID()
					local tb = sRanklistSystem:GetRank(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],guid)
					if not tb or not next(tb) then 
						return rank
					end
					if tb[1] then
						rank = ""..tb[1]
					end
				end
			else
				if max_fight_value_pet2 then
					local guid = max_fight_value_pet2:GetGUID()
					local tb = sRanklistSystem:GetRank(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],guid)
					if not tb or not next(tb) then 
						return rank
					end
					if tb[1] then
						rank = ""..tb[1]
					end
				end
			end
		end
	elseif Act_RankList.RankType_2_Fun[Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type']] == "guard" then
		local guard_tb = player:GetGuardContainer():GetGuards()
		if guard_tb and next(guard_tb) then
			local max_fight_value_guard = nil
			local max_fight_value = 0
			for k,v in ipairs(guard_tb) do 
				if v:GetAttr(ROLE_ATTR_FIGHT_VALUE) > max_fight_value then
					max_fight_value_guard = v
					max_fight_value = v:GetAttr(ROLE_ATTR_FIGHT_VALUE)
				end
			end
			local guid = max_fight_value_guard:GetGUID()
			local tb = sRanklistSystem:GetRank(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],guid)
			if not tb or not next(tb) then 
				return rank
			end
			if tb[1] then
				rank = ""..tb[1]
			end
		end
	end
	return rank
end

function Act_RankList.get_player_guid_list(num_bed,num_end,list_type,act_keyname)
	local player_guid_list = {}
	local tb = sRanklistSystem:GetRanklist(Act_RankList.Config['RankList'][''..act_keyname]['Rank_Type'],num_bed,num_end)
	for k,v in ipairs(tb) do
		if Act_RankList.RankType_2_Fun[list_type] == "player" then
			player_guid_list[tonumber(num_bed+k-1)] = v[1]
		elseif Act_RankList.RankType_2_Fun[list_type]  == "pet" then
			player_guid_list[tonumber(num_bed+k-1)] = sContactSystem:GetContactGUID(v[4])
		elseif Act_RankList.RankType_2_Fun[list_type]  == "guard" then 
			player_guid_list[tonumber(num_bed+k-1)] = sContactSystem:GetContactGUID(v[4])
		end
	end
	return player_guid_list
end