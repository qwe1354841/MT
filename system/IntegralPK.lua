--战力大比拼
IntegralPK = {}

IntegralPK.Main = {
	--服务器开启后 不应该修改配置的整体顺序
	{
		--读取的排行榜名称 RankingListSystem.Config
		["RankName"] = "总战力榜",
		--结束后存战力榜
		["SaveRankName"] = "战力PK结果榜",
		--活动规则
		["Tips"] = "活动规则：活动结束时将按照总战力排行榜排名颁发奖励至邮箱。",
		--客户端排行榜显示人数
		["ShowNum"] = 50,
		
		--修改时间需要重启服务器
		--已发结束奖励后 不应该修改结束时间
		--开启时间段 --真实时间 {开启时间，结束时间}
		-- ["TimeLimitType"] = "RealTime",
		-- ["TimeLimitConfig"] = {"2021-09-22 09:00:10", "2021-09-24 14:44:59"},
		-- 开启时间段 --服务器时间
		["TimeLimitType"] = "ServerTime",
		["TimeLimitConfig"] = {"1 00:00:00", "14 00:00:00"},
		
		--结束后显示时间（秒）
		["CloseShowTime"] = 86400,
		--最低积分上榜
		["ShowMinIntegral"] = 0,
		--奖励 -- Ranking= {最高排名，最低排名}
		["Reward"] = {
			{Ranking = {1,1}, 		ItemList = {"85级宠物紫装礼包", 1,1,"极品宝石福袋", 3,1,"修炼丹",10,1,"大银币袋",5,1}, 	PetList = {"6星魔兽刑天",1,1}},
			{Ranking = {2,2}, 		ItemList = {"85级宠物蓝装礼包",1,1,"极品宝石福袋",1,1,"修炼丹",5,1,"大银币袋",3,1}, 	PetList = {"魔兽刑天",1,1}},
			{Ranking = {3,3}, 		ItemList = {"85级项圈蓝",1,1,"高级宝石福袋",3,1,"修炼丹",3,1,"大银币袋",1,1}, 			PetList = {"魔兽刑天",1,1}},
			{Ranking = {4,6}, 		ItemList = {"随机神兽碎片", 99,1,"高级宝石福袋",3,1,"修炼丹",3,1,"中银币袋", 8,1}}, 	
			{Ranking = {7,10}, 		ItemList = {"随机神兽碎片", 80,1,"高级宝石福袋",3,1,"修炼丹",2,1,"中银币袋", 6,1}}, 
			{Ranking = {11,15}, 	ItemList = {"随机神兽碎片", 50,1,"高级宝石福袋",2,1,"修炼丹",2,1,"中银币袋", 5,1}}, 		
			{Ranking = {16,25}, 	ItemList = {"随机神兽碎片",20,1,"高级宝石福袋",1,1,"修炼丹", 1,1,"中银币袋", 3,1}}, 	
			{Ranking = {26,50}, 	ItemList = {"随机神兽碎片",10,1,"宝石福袋",3,1,"小修炼丹", 2,1,"中银币袋", 1,1}}, 	
			{Ranking = {51,100},	ItemList = {"随机神兽碎片",5,1,"宝石福袋",2,1,"小修炼丹", 1,1,"小银币袋", 5,1}}, 	
			--{Ranking = {101,1000}, 	ItemList = {"随机神兽碎片",1,1,"宝石福袋",1,1,"小银币袋", 1,1}}, 
		},
	},
}


function IntegralPK.GetData(player)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['IntegralPK'] ~= "on" then
			return
		end
	end
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	for k,v in ipairs(IntegralPK.Config) do
		if now_sec >= v["CheckTime"][1] and now_sec < v["CheckTime"][3] then
			local str = [[
				if not GlobalProcessing.IntegralPK_SeverData then
					GlobalProcessing.IntegralPK_SeverData = {}
				end
				GlobalProcessing.IntegralPK_SeverData[]]..k..[[] = ]]..IntegralPK.ConfigStr[k].. [[
				if MainSysOpen then
					MainSysOpen.SetBtn(RoleAttr.RoleAttrLevel, CL.GetAttr(RoleAttr.RoleAttrLevel))
				end
			]]
			sLuaApp:ShowForm(player, "脚本表单", str)
			--sLuaApp:LuaErr(str)
		end
	end
end

function IntegralPK.OnServerStart()
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['IntegralPK'] ~= "on" then
			return
		end
	end
	--设置定时发奖励
	for k,v in ipairs(IntegralPK.Config) do
		sScheduleSystem:CreateSchedule(0, v["TimeLimit"][2], "IntegralPK","OnStop",""..k)
	end
end

--活动进行中 下线记录玩家战力
function IntegralPK.OnLogout(player)
	local now_sec = sLuaApp:SecondSinceEpoch(0)
	if IntegralPK.Config and IntegralPK.Config[1] and IntegralPK.Config[1]["CheckTime"] then
		local fight_check_time = IntegralPK.Config[1]["CheckTime"]
		if now_sec >= fight_check_time[1] and now_sec < fight_check_time[2] then
			player:SetInt("IntegralPK_RecordFightValue", player:GetAttr(ROLE_ATTR_TOTAL_FIGHT_VALUE))
		end
	end
end

function IntegralPK.OnStop(timer_id, params)
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['IntegralPK'] ~= "on" then
			return
		end
	end
	local config = IntegralPK.Main[tonumber(params)]
	local ranking_list_id = RankingListSystem.Config[config["RankName"]] or 1
	local nb_player_list = sRanklistSystem:GetRanklist(ranking_list_id, 1, config["LastRanking"] or 100)
	--sLuaApp:LuaErr(" nb_player_list "..Lua_tools.serialize(nb_player_list))
	
	--存档排行榜ID
	local save_list_id = RankingListSystem.Config[config["SaveRankName"]] or 108
	-- 最低上榜积分
	local rank_min_integral = config["ShowMinIntegral"] or 0
	
	--发奖励
	for k,v in ipairs(config["Reward"]) do
		local send_item_list = {}
		if v["ItemList"] then
			for a,b in ipairs(v["ItemList"]) do
				if type(b) == "string" then
					local item_data = ItemConfig.GetByKeyName(b)
					if not item_data then 
						sLuaApp:LuaErr("IntegralPK.OnStop  ItemConfig 不存在"..b)
						return 
					end
					table.insert(send_item_list, item_data.Id)
					table.insert(send_item_list, type(v["ItemList"][a+1]) == "number" and v["ItemList"][a+1] or 1)
					table.insert(send_item_list, type(v["ItemList"][a+2]) == "number" and v["ItemList"][a+2] or 1)
				end
			end
		end
		local send_pet_list = {}
		if v["PetList"] then
			for a,b in ipairs(v["PetList"]) do
				if type(b) == "string" then
					local pet_data = PetConfig.GetByKeyName(b)
					if not pet_data then 
						sLuaApp:LuaErr("IntegralPK.OnStop  PetConfig 不存在"..b)
						return 
					end
					table.insert(send_pet_list, pet_data.Id)
					table.insert(send_pet_list, type(v["PetList"][a+1]) == "number" and v["PetList"][a+1] or 1)
					table.insert(send_pet_list, type(v["PetList"][a+2]) == "number" and v["PetList"][a+2] or 1)
				end
			end
		end
		for i = v["Ranking"][1], v["Ranking"][2] do
			local player_data = nb_player_list[i]
			if player_data then
				if player_data[2] < rank_min_integral then
					break
				end
				local res = sMailSystem:SendMailEx( 0, "战力大比拼", player_data[1], 1, "战力大比拼奖励", "恭喜您在战力大比拼活动中获得了第"..i.."名，祝少侠神功盖世，再创新高！", {}, send_item_list, send_pet_list)
				if res == 0 then
					sLuaApp:LuaErr("IntegralPK.OnStop SendMailEx 错误  player_guid"..player_data[1])
				end
				
				--存一下当前排行榜
				if i <= config["ShowNum"] then
					local res = sRanklistSystem:UpdateRanklist(save_list_id, player_data[1], player_data[2], player_data[3], player_data[4])
					if res == 0 then
						sLuaApp:LuaErr("IntegralPK.OnStop  UpdateRanklist res == 0")
					end
				end
			end
		end
	end
	
	-- 记录全服玩家战力
	local all_players = sPlayerSystem:GetAllPlayers()
	for _,v in ipairs(all_players) do
		v:SetInt("IntegralPK_RecordFightValue", v:GetAttr(ROLE_ATTR_TOTAL_FIGHT_VALUE))
	end
end


function IntegralPK.Initialization()
	if FunctionSwitch and FunctionSwitch.AllFuncitonConfig then
		if FunctionSwitch.AllFuncitonConfig['IntegralPK'] ~= "on" then
			return
		end
	end
	if not RankingListSystem then
		require("system/RankingListSystem")
	end
	--发给客户端的表
	IntegralPK.ConfigStr = {}
	IntegralPK.Config = {}
	
	local server_time = ConstVarConfig["StartServerTime"].Value
	local server_time_sec = sLuaApp:Str2DateTime(server_time)
	
	for k,v in ipairs(IntegralPK.Main) do
		IntegralPK.Config[k] = {}
		local config = IntegralPK.Config[k]
		config["RankID"] = RankingListSystem.Config[v["RankName"]] or 1
		config["SaveRankID"] = RankingListSystem.Config[v["SaveRankName"]] or 108
		config["ShowNum"] = v["ShowNum"]
		config["ShowMinIntegral"] = v["ShowMinIntegral"]
		config["Tips"] = v["Tips"]
		
		--宠物星级显示
		config["ShowPetStar"] = {}
		--最后一名的排名
		v["LastRanking"] = 1
		config["Reward"] = {}
		for _,b in ipairs(v["Reward"]) do
			--if b["Ranking"][1] <= v["ShowNum"] then
			table.insert(config["Reward"], b)
			--end
			if b["Ranking"][2] > v["LastRanking"] then
				v["LastRanking"] = b["Ranking"][2]
			end
			if b["PetList"] then
				Lua_tools.RegisterPets(b["PetList"])
				for _,j in ipairs(b["PetList"]) do
					if type(j) == "string" then
						if PetUpStarConfig.BornStar[j] then
							config["ShowPetStar"][j] = PetUpStarConfig.BornStar[j]
						end
					end
				end
			end
		end
		-- 客户端获取排行榜最大排行
		config["MaxRanking"] = v["LastRanking"]
		
		config["TimeLimit"] = {}
		--开启时间 结束时间 结束显示时间
		if v["TimeLimitType"] == "ServerTime" then
			for a = 1,2 do
				local split_tb = sLuaApp:StrSplit(v["TimeLimitConfig"][a], " ")
				local add_days = tonumber(split_tb[1]) -- 服务器时间第几天
				if add_days >= 1 then
					add_days = add_days - 1
				end
				local new_day = sLuaApp:DateTime2Str(server_time_sec + add_days*24*3600)
				new_day = sLuaApp:StrSplit(new_day, " ")[1]
				config["TimeLimit"][a] = new_day.." "..split_tb[2]
			end
		
		elseif v["TimeLimitType"] == "RealTime" then
			config["TimeLimit"] = v["TimeLimitConfig"]
		else
			sLuaApp:LuaErr("IntegralPK.Main  "..k.." TimeLimitType 配置错误 ")
			return
		end
		config["TimeLimit"][3] = sLuaApp:DateTime2Str(sLuaApp:Str2DateTime(config["TimeLimit"][2]) + v["CloseShowTime"])
		--在该时间之内才发表单
		config["CheckTime"] = {}
		config["CheckTime"][1] = sLuaApp:Str2DateTime(config["TimeLimit"][1])
		config["CheckTime"][2] = sLuaApp:Str2DateTime(config["TimeLimit"][2])
		config["CheckTime"][3] = sLuaApp:Str2DateTime(config["TimeLimit"][3])
		
		IntegralPK.ConfigStr[k] = Lua_tools.serialize(config)
		--sLuaApp:LuaErr(IntegralPK.ConfigStr[k])
	end
end