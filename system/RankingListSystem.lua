--排行榜
RankingListSystem = {}

--用于控制每天刷新表单的时间(1~24, 24代表0点)
local Client_DailyRefreshtime = 24

--用于控制子榜单的刷新间隔时间(单位分钟，填0代表不刷新)
local Client_Refreshtime = 15

RankingListSystem.Config = {
	["总战力榜"] = 1,		--排序规则  总战力               	显示内容1  角色名            显示内容2   门派
	["角色战力榜"] = 2,		--排序规则  角色战力                显示内容1  角色名            显示内容2   门派
	["角色等级榜"] = 3,		--排序规则  角色等级                显示内容1  角色名            显示内容2   门派
	["宠物战力榜"] = 4,		--排序规则  宠物战力                显示内容1  宠物名            显示内容2   拥有者
	["侍从战力榜"] = 5,		--排序规则  侍从战力                显示内容1  侍从名            显示内容2   拥有者
	["花果山战力榜"] = 6,	--排序规则  总战力               	显示内容1  角色名            显示内容2   门派
	["西海龙宫战力榜"] = 7,
	["慈恩寺战力榜"] = 8,
	["流沙界战力榜"] = 9,
	["净坛禅院战力榜"] = 10,
	["酆都战力榜"] = 11,
	["帮派榜"] = 12,		--排序规则  帮派总战力          	显示内容1  帮派名            显示内容2   帮主
	["帮派等级"] = 13,		--排序规则  帮派等级               	显示内容1  帮派名            显示内容2   帮主
	--["天梯榜"] = 14,		--排序规则  天梯排名（需录入天梯假人）       显示内容1  角色名            显示内容2   门派           以33这个为准
	["水陆大会积分榜"] = 15,
	["竞技场榜"] = 16,
	
	["天下会武积分榜"] = 30,
	["水陆大会报名榜"] = 31,
	["天下第一积分榜"] = 32,
	["天梯榜"] = 33,
	['官职榜'] = 34,
	
	["帮派匹配榜"] = 40,
	["帮派排位榜_1"] = 41,
	["帮派排位榜_2"] = 42,
	["帮派排位榜_3"] = 43,
	["帮派排位榜_4"] = 44,
	["帮派排位榜_5"] = 45,
	["帮派报名榜"] = 46,
	
	["会试排行榜"] = 50,
	["殿试排行榜"] = 51,
	
	["无字真经榜"] = 55,
	["无尽的试炼榜"] = 56,
	
	['世界答题排行榜'] = 69,
	['帮战帮派排行榜'] = 70,
	['帮战个人排行榜'] = 71,
	['世界BOSS排行榜'] = 72,
	
	['大弟子排行榜1'] = 81,
	['大弟子排行榜2'] = 82,
	['大弟子排行榜3'] = 83,
	['大弟子排行榜4'] = 84,
	['大弟子排行榜5'] = 85,
	['大弟子排行榜6'] = 86,
	
	['吃鸡之王'] = 90,
	['鸡力伤害榜'] = 91,
	
	['西游对对碰'] = 95,
	
	['天道榜'] = 101,
	['魔道榜'] = 102,

	['相亲男榜'] = 105,
	['相亲女榜'] = 106,
	['相亲榜'] = 107, -- 男女混合相亲榜单
	
	['战力PK结果榜'] = 108,

	['师父榜'] = 109,
	['徒弟榜'] = 110,
	
	["地下迷途积分榜"] = 115,
	
	["积分爬塔榜"] = 1001,
}

--用于客户端显示title
RankingListSystem.ShowRank_Config = {
	[1] =   {Name = "总战力榜",		     TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"  },    --排序规则  总战力              
	[2] =   {Name = "角色战力榜",		 TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "角色战力"},    --排序规则  角色战力            
	[3] =   {Name = "角色等级榜",		 TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "等级"    },    --排序规则  角色等级            
	[4] =   {Name = "宠物战力榜",		 TXT_1 = "宠物名",    TXT_2 = "拥有者",    TXT_3 = "战力"    },    --排序规则  宠物战力            
	[5] =   {Name = "侍从战力榜",		 TXT_1 = "侍从名",    TXT_2 = "拥有者",    TXT_3 = "战力"    },    --排序规则  侍从战力            
	[6] =   {Name = "花果山战力榜",	     TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[7] =   {Name = "西海龙宫战力榜",    TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[8] =   {Name = "慈恩寺战力榜",      TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[9] =   {Name = "流沙界战力榜",      TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[10] =  {Name = "净坛禅院战力榜",    TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[11] =  {Name = "酆都战力榜",        TXT_1 = "角色名",    TXT_2 = "门派",      TXT_3 = "总战力"	 },    --排序规则  总战力              
	[12] =  {Name = "帮派榜",		     TXT_1 = "帮派名",    TXT_2 = "帮主",      TXT_3 = "帮派战力"},    --排序规则  帮派总战力          
	[13] =  {Name = "帮派等级",		     TXT_1 = "帮派名",    TXT_2 = "帮主",      TXT_3 = "帮派等级"},    --排序规则  帮派等级            
	--[14] =  {Name = "天梯榜",		                                                                 },    
	[15] =  {Name = "水陆大会积分榜",                                                                },    
	[16] =  {Name = "竞技场榜",                                                                      },    

	[30] =  {Name = "天下会武积分榜",    TXT_1 = "角色名",    TXT_2 = "角色战力",  TXT_3 = "活动积分"},
	[31] =  {Name = "水陆大会报名榜",                                                                },    
	[32] =  {Name = "天下第一积分榜",    TXT_1 = "角色名",    TXT_2 = "角色战力",  TXT_3 = "活动积分"},    
	[33] =  {Name = "天梯榜",            TXT_1 = "角色名",    TXT_2 = "总战力",    TXT_3 = "天梯排名"},    --排序规则  天梯排名（需录入天梯假人）
	[34] =  {Name = "官职榜",            TXT_1 = "角色名",    TXT_2 = "官职",      TXT_3 = "战功"    },    

	[40] =  {Name = "帮派匹配榜",        TXT_1 = "帮派名",    TXT_2 = "帮主",      TXT_3 = "帮战积分"},    
	[41] =  {Name = "帮派排位榜_1",                                                                  },    
	[42] =  {Name = "帮派排位榜_2",                                                                  },    
	[43] =  {Name = "帮派排位榜_3",                                                                  },    
	[44] =  {Name = "帮派排位榜_4",                                                                  },    
	[45] =  {Name = "帮派排位榜_5",                                                                  },    
	[46] =  {Name = "帮派报名榜",                                                                    },    

	[50] =  {Name = "会试排行榜",                                                                    },    
	[51] =  {Name = "殿试排行榜",                                                                    },
	
	[55] =  {Name = "无字真经榜",        TXT_1 = "角色名",    TXT_2 = "章节",      TXT_3 = ""    	 },  
	[56] =  {Name = "无尽的试炼榜",      TXT_1 = "角色名",    TXT_2 = "难度",      TXT_3 = ""	     },  

	[69] =  {Name = "世界答题排行榜",                                                                },    
	[70] =  {Name = "帮战帮派排行榜",                                                                },    
	[71] =  {Name = "帮战个人排行榜",                                                                },       

	[81] =  {Name = "大弟子排行榜1",                                                                 },    
	[82] =  {Name = "大弟子排行榜2",                                                                 },    
	[83] =  {Name = "大弟子排行榜3",                                                                 },    
	[84] =  {Name = "大弟子排行榜4",                                                                 },    
	[85] =  {Name = "大弟子排行榜5",                                                                 },    
	[86] =  {Name = "大弟子排行榜6",                                                                 },   

	[90] =  {Name = "吃鸡之王", 		 TXT_1 = "角色名",    TXT_2 = "吃鸡次数",      TXT_3 = ""	 },  
	[91] =  {Name = "鸡力伤害榜", 		 TXT_1 = "角色名",    TXT_2 = "总伤害值",      TXT_3 = ""	 },  
	
	[95] =  {Name = "西游对对碰", 		 TXT_1 = "角色名",    TXT_2 = "难度/次数",      TXT_3 = ""	 },  

	[101] = {Name = "天道榜",            TXT_1 = "角色名",    TXT_2 = "善恶值",    TXT_3 = ""		 },    
	[102] = {Name = "魔道榜",            TXT_1 = "角色名",    TXT_2 = "善恶值",    TXT_3 = ""		 },    
	
	[115] = {Name = "地下迷途积分榜",		 TXT_1 = "角色名",    TXT_2 = "通关层数",    TXT_3 = "积分"		 },    
	
	
}

--控制客户端显示子榜单类型
RankingListSystem.ShowRank = {
	{
		RankName = "综合榜",
		Ranks = {
			{Name = "总战力",   id = 1}, 
			{Name = "角色战力", id = 2},
			{Name = "角色等级", id = 3},
			{Name = "宠物战力", id = 4, tag = 1},      --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
			{Name = "侍从战力", id = 5, tag = 2},      --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
		},
	},
	{
		RankName = "门派榜",
		Ranks = {
			{Name = "花果山",   id = 6},
			{Name = "西海龙宫", id = 7},
			{Name = "慈恩寺",   id = 8},
			{Name = "流沙界",   id = 9},
			{Name = "净坛禅院", id = 10},
			{Name = "酆都",     id = 11},
		},
	},
	{
		RankName = "帮派榜",
		Ranks = {
			{Name = "帮派战力", id = 12, tag = 3},     --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
			{Name = "帮派等级", id = 13, tag = 3},     --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
		},
	},
	{
		RankName = "活动榜",
		Ranks = {
			{Name = "天梯榜",     id = 33},
			{Name = "无字真经",   id = 55},
			{Name = "无尽的试炼榜", id = 56},
			{Name = "吃鸡之王", id = 90},
			{Name = "鸡力伤害榜", id = 91},
			{Name = "西游对对碰", id = 95},
			{Name = "地下迷途积分榜", id = 115},
		},
	},
	{
		RankName = "竞技榜",
		Ranks = {
			{Name = "官职榜",       id = 34}, 
			{Name = "天下会武",     id = 30},
			{Name = "天下第一",     id = 32},
			{Name = "帮派竞技总榜", id = 40, tag = 3}, --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
			{Name = "帮派竞技胜率", id = 40, tag = 3}, --tag用于区分玩家、宠物、侍从(0或者不写为玩家, 1为宠物, 2为侍从, 3为帮主)
		},
	},
	{
		RankName = "善恶榜",
		Ranks = {
			{Name = "天道榜", id = 101}, 
			{Name = "魔道榜", id = 102},
		},
	},
}

--用于配置特定子表单刷新时间(id, 时间)
RankingListSystem.SpecificRefresh = {
	--[14] = {9:30, 19:30},
	
	}

-- 天道榜前十奖励 称号十大善人
RankingListSystem.JUSTICE_GIFT = {24302, 1, 1}
-- 魔道榜前十奖励 称号十大恶人
RankingListSystem.EVIL_GIFT = {24301, 1, 1}

function RankingListSystem.on_pk_value_change(player, pk_value, sender, reason, detail)
	if player:GetType() == GUID_ROBOT then
		return
	end
	local playerGUID = player:GetGUID()
	if pk_value > 0 then
		sRanklistSystem:UpdateRanklist(RankingListSystem.Config['天道榜'] or 101, playerGUID, pk_value, player:GetName(), ""..pk_value)
		local tb = sRanklistSystem:GetRank(RankingListSystem.Config['魔道榜'] or 102,playerGUID)
		if #tb>0 then
			sRanklistSystem:RemoveRank(RankingListSystem.Config['魔道榜'] or 102,playerGUID)
		end
	elseif pk_value < 0 then
		sRanklistSystem:UpdateRanklist(RankingListSystem.Config['魔道榜'] or 102, player:GetGUID(), 0-pk_value, player:GetName(), ""..pk_value)
		local tb = sRanklistSystem:GetRank(RankingListSystem.Config['天道榜'] or 101,playerGUID)
		if #tb>0 then
			sRanklistSystem:RemoveRank(RankingListSystem.Config['天道榜'] or 101,playerGUID)
		end
	end
	if pk_value == 0 then
		local tb = sRanklistSystem:GetRank(RankingListSystem.Config['魔道榜'] or 102,playerGUID)
		if #tb>0 then
			sRanklistSystem:RemoveRank(RankingListSystem.Config['魔道榜'] or 102,playerGUID)
		end
		tb = sRanklistSystem:GetRank(RankingListSystem.Config['天道榜'] or 101,playerGUID)
		if #tb>0 then
			sRanklistSystem:RemoveRank(RankingListSystem.Config['天道榜'] or 101,playerGUID)
		end
	end
end

function RankingListSystem.SortTable()
	Data.RankTypeNameList = {}
	for i = 1, #RankingListSystem.ShowRank do
		local TB = {}
		local T_Name = {name = RankingListSystem.ShowRank[i].RankName}
		table.insert(TB, T_Name)
		for j = 1, #RankingListSystem.ShowRank[i].Ranks do
			local id = RankingListSystem.ShowRank[i].Ranks[j]['id']
			local TBB = {}
			if RankingListSystem.ShowRank[i].Ranks[j]['tag'] then
				TBB = {name = RankingListSystem.ShowRank[i].Ranks[j]['Name'], TXT_1 = RankingListSystem.ShowRank_Config[id]['TXT_1'], TXT_2 = RankingListSystem.ShowRank_Config[id]['TXT_2'], TXT_3 = RankingListSystem.ShowRank_Config[id]['TXT_3'], enum = id, tag = RankingListSystem.ShowRank[i].Ranks[j]['tag']}
			else
				TBB = {name = RankingListSystem.ShowRank[i].Ranks[j]['Name'], TXT_1 = RankingListSystem.ShowRank_Config[id]['TXT_1'], TXT_2 = RankingListSystem.ShowRank_Config[id]['TXT_2'], TXT_3 = RankingListSystem.ShowRank_Config[id]['TXT_3'], enum = id, tag = 0}
			end
			if not RankingListSystem.ShowRank_Config[id]['TXT_3'] or RankingListSystem.ShowRank_Config[id]['TXT_3'] == "" then		--如果TXT_3填空字符或者不填，则通知客户端不显示第三项
				TBB.shownum = 0
			end
			table.insert(TB, TBB)
		end
		table.insert(Data.RankTypeNameList, TB)
	end
end

--每天固定时间刷新
function RankingListSystem.GetDailyRefreshTime()
	local Remaintime = sLuaApp:GetTodayRemain() 
	if 3600 * (24 - Client_DailyRefreshtime) > Remaintime then
		RankingListSystem.DailyRefreshtime = Client_DailyRefreshtime * 3600 + Remaintime
	elseif 3600 * (24 - Client_DailyRefreshtime) <= Remaintime then
		RankingListSystem.DailyRefreshtime = Remaintime - 3600 * (24 - Client_DailyRefreshtime)
	end
end

--一天之内多次刷新(每X分钟刷新一次)
function RankingListSystem.GetRefreshTime()
	local a = 0
	local Remaintime = sLuaApp:GetTodayRemain()
	local NowTime = sLuaApp:GetTimes()
	local b = Remaintime + NowTime - 86400			--当天开始时
	if Client_Refreshtime and type(Client_Refreshtime) == "number" and Client_Refreshtime ~= 0 then
		a = math.floor(1440/Client_Refreshtime)
	end
	
	local TB = {}			--通用刷新时间
	for i = 1, a do
		local c = b + i * Client_Refreshtime * 60
		if c > NowTime and c < Remaintime + NowTime then
			table.insert(TB, c)
		end
	end
	
	RankingListSystem.RefreshTimeTB = {}
	if RankingListSystem.ShowRank then
		for i = 1, #RankingListSystem.ShowRank do
			if RankingListSystem.ShowRank[i].Ranks then
				for j = 1, #RankingListSystem.ShowRank[i].Ranks do
					local id = RankingListSystem.ShowRank[i].Ranks[j]['id']
					if RankingListSystem.SpecificRefresh[id] then
						RankingListSystem.RefreshTimeTB[id] = {}
						for g = 1, #RankingListSystem.SpecificRefresh.id do
							local timeTB = sLuaApp:StrSplit(RankingListSystem.SpecificRefresh.id[g], ":")
							local hour = timeTB[1]
							local min = timeTB[2]
							local time = hour * 3600 + min * 60 + b
							if time > NowTime then
								table.insert(RankingListSystem.RefreshTimeTB[id], time)
							end
						end
					else
						RankingListSystem.RefreshTimeTB[id] = TB
					end
				end
			end
		end
	end
end

--获取数据
function RankingListSystem.GetData(player)
	RankingListSystem.SortTable()
	RankingListSystem.GetDailyRefreshTime()
	RankingListSystem.GetRefreshTime()
	if Lua_tools then
		local str = [[
				if RankUI then
					RankUI.RankTypeNameList = ]]..Lua_tools.serialize(Data.RankTypeNameList)..[[
					RankUI.UpdateSecondLeft = ]]..RankingListSystem.DailyRefreshtime..[[
					RankUI.UpdateSubRanksSecondLeft = ]]..Lua_tools.serialize(RankingListSystem.RefreshTimeTB)..[[
					RankUI.OnUpdateRankTitles()
				end
			]]
		--sLuaApp:LuaDbg(str)
		--sLuaApp:LuaDbg("Lua_tools.serialize(RankingListSystem.RefreshTimeTB) = "..Lua_tools.serialize(RankingListSystem.RefreshTimeTB))
		sLuaApp:ShowForm(player, "脚本表单", str)
	else
		sLuaApp:LuaErr("RankingListSystem    笑死，根本没有Lua_tools")
	end
	return ""
end

function RankingListSystem.Initialization()
	sLuaApp:LuaDbg("====开始Initialization====")
	if not RankingListSystem.Config then
		sLuaApp:LuaErr("缺少Config")
	end
	if Data then
		Data.RankTypeNameList = {}
	end
	if not RankingListSystem.DailyRefreshtime then
		RankingListSystem.DailyRefreshtime = 0
	end
end

RankingListSystem.Initialization()

-- 添加任务
function RankingListSystem.add_title_schedule()
	-- 创建任务，每天八点执行一次
	sScheduleSystem:CreateSchedule(1,"20:00:00","RankingListSystem","get_pk_title","")
end

-- 每日八点 善恶榜判断领取称号
function RankingListSystem.get_pk_title()
	-- 天道榜
		-- 获取天道榜前十的玩家数据
		-- {{guid, value, name, info}, ...{}}
	local rank_data = sRanklistSystem:GetRanklist(RankingListSystem.Config['天道榜'] or 101, 1, 10)
	for k, v in ipairs(rank_data) do
		local player_guid = v[1]
		-- 将称号物品通过邮件发送给玩家
        -- key_name: 称号十大善人 id: 24302
		if sMailSystem:SendMail(0,"天道榜前十",tonumber(player_guid),1,"天道榜前十奖励","您在天道榜中的排名在前十以内，特此奖励。", {}, RankingListSystem.JUSTICE_GIFT) == 0 then
			sLuaApp:LuaWrn("RankingListSystem.get_pk_title() 通过邮件发送天道榜前十奖励时,发送失败"..' 玩家的guid为：'..player_guid)
		end
	end

	-- 魔道榜
	rank_data = sRanklistSystem:GetRanklist(RankingListSystem.Config['魔道榜'] or 102, 1, 10)
	for k, v in ipairs(rank_data) do
		local player_guid = v[1]
		-- 将称号物品通过邮件发送给玩家
		-- key_name: 称号十大恶人 id: 24301
		if sMailSystem:SendMail(0,"魔道榜前十",tonumber(player_guid),1,"魔道榜前十奖励","您在魔道榜中的排名在前十以内，特此奖励。", {}, RankingListSystem.EVIL_GIFT) == 0 then
			sLuaApp:LuaWrn("RankingListSystem.get_pk_title() 通过邮件发送魔道榜前十奖励时,发送失败"..' 玩家的guid为：'..player_guid)
		end
	end

	return ''
end